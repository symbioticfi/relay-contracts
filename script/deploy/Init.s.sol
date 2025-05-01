// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";

import {Master} from "../../src/contracts/implementations/settlement/Master.sol";
import {Replica} from "../../src/contracts/implementations/settlement/Replica.sol";
import {KeyRegistry} from "../../src/contracts/implementations/key-registries/KeyRegistry.sol";
import {SelfRegisterVotingPowerProvider} from
    "../../src/contracts/implementations/voting-power-providers/SelfRegisterVotingPowerProvider.sol";

import {ISettlementManager} from "../../src/interfaces/implementations/settlement/ISettlementManager.sol";
import {IValSetConfigManager} from "../../src/interfaces/implementations/settlement/IValSetConfigManager.sol";
import {IMasterConfigManager} from "../../src/interfaces/implementations/settlement/IMasterConfigManager.sol";
import {IOzOwnable} from "../../src/interfaces/features/permissions/IOzOwnable.sol";
import {INetworkManager} from "../../src/interfaces/base/INetworkManager.sol";
import {IEpochManager} from "../../src/interfaces/base/IEpochManager.sol";
import {IOzEIP712} from "../../src/interfaces/base/common/IOzEIP712.sol";
import {IKeyManager} from "../../src/interfaces/base/IKeyManager.sol";
import {IOzAccessControl} from "../../src/interfaces/features/permissions/IOzAccessControl.sol";
import {IVaultManager} from "../../src/interfaces/base/IVaultManager.sol";

import {KeyTag} from "../../src/contracts/libraries/utils/KeyTag.sol";
import {KeyEcdsaSecp256k1} from "../../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../../src/contracts/libraries/keys/KeyBlsBn254.sol";

import {SigVerifierMock} from "../../test/mocks/SigVerifierMock.sol";
import {BN254G2} from "../../test/libraries/BN254G2.sol";

import "../../script/integration/SymbioticCoreInit.sol";

import {Token} from "@symbioticfi/core/test/mocks/Token.sol";

// forge script script/deploy/Init.s.sol:InitScript 25235 --sig "run(uint256)"

contract InitScript is SymbioticCoreInit {
    using KeyTag for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    uint256 public constant SYMBIOTIC_CORE_NUMBER_OF_VAULTS = 3;
    uint256 public constant SYMBIOTIC_CORE_NUMBER_OF_OPERATORS = 3;
    uint256 public constant SYMBIOTIC_CORE_NUMBER_OF_STAKERS = 1;

    uint96 public constant IDENTIFIER = 0;

    struct InitVars {
        Vm.Wallet PRIVATE_KEY_WALLET;
        uint48 ZERO_TIMESTAMP;
        address[] tokens;
        address network;
        Vm.Wallet[] stakers;
        Vm.Wallet[] operators;
        address[] masterVaults;
        address[] secondaryVaults;
    }

    function run(
        uint256 seed
    ) public override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";

        SYMBIOTIC_CORE_MIN_EPOCH_DURATION = 5 hours;
        SYMBIOTIC_CORE_MAX_EPOCH_DURATION = 21 days;
        SYMBIOTIC_CORE_MIN_VETO_DURATION = 5 minutes;
        SYMBIOTIC_CORE_MAX_VETO_DURATION = 60 minutes;

        SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18 = 0.03 * 1e18;
        SYMBIOTIC_CORE_MIN_TOKENS_TO_DEPOSIT_TIMES_1e18 = 0.00001 * 1e18;
        SYMBIOTIC_CORE_MAX_TOKENS_TO_DEPOSIT_TIMES_1e18 = 0.001 * 1e18;

        SYMBIOTIC_CORE_MIN_MAX_NETWORK_LIMIT_TIMES_1e18 = 0.0001 * 1e18;
        SYMBIOTIC_CORE_MAX_MAX_NETWORK_LIMIT_TIMES_1e18 = 0.001 * 1e18;
        SYMBIOTIC_CORE_MIN_NETWORK_LIMIT_TIMES_1e18 = 0.00001 * 1e18;
        SYMBIOTIC_CORE_MAX_NETWORK_LIMIT_TIMES_1e18 = 0.001 * 1e18;
        SYMBIOTIC_CORE_MIN_OPERATOR_NETWORK_LIMIT_TIMES_1e18 = 0.00001 * 1e18;
        SYMBIOTIC_CORE_MAX_OPERATOR_NETWORK_LIMIT_TIMES_1e18 = 0.001 * 1e18;

        SYMBIOTIC_CORE_DELEGATOR_TYPES = [0];

        SYMBIOTIC_CORE_USE_EXISTING_DEPLOYMENT = false;

        SymbioticInit.run(seed);

        string memory obj = "data";
        string memory finalJson;
        InitVars memory vars;

        vars.PRIVATE_KEY_WALLET = vm.createWallet(vm.envUint("PRIVATE_KEY"));

        {
            vars.network = vars.PRIVATE_KEY_WALLET.addr;
            vm.rememberKey(vars.PRIVATE_KEY_WALLET.privateKey);
            console2.log("Network -", vars.network, vars.PRIVATE_KEY_WALLET.privateKey);
            vm.serializeUint(obj, "networkPrivateKey", vars.PRIVATE_KEY_WALLET.privateKey);
        }

        uint256[] memory operatorPrivateKeys = new uint256[](SYMBIOTIC_CORE_NUMBER_OF_OPERATORS);
        vars.operators = new Vm.Wallet[](SYMBIOTIC_CORE_NUMBER_OF_OPERATORS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            vars.operators[i] = _getAccount_Symbiotic();
            vm.rememberKey(vars.operators[i].privateKey);
            console2.log("Operator -", vars.operators[i].addr, vars.operators[i].privateKey);
            operatorPrivateKeys[i] = vars.operators[i].privateKey;
        }
        vm.serializeUint(obj, "operatorPrivateKeys", operatorPrivateKeys);

        uint256[] memory stakerPrivateKeys = new uint256[](SYMBIOTIC_CORE_NUMBER_OF_STAKERS);
        vars.stakers = new Vm.Wallet[](SYMBIOTIC_CORE_NUMBER_OF_STAKERS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            vars.stakers[i] = _getAccount_Symbiotic();
            vm.rememberKey(vars.stakers[i].privateKey);
            console2.log("Staker -", vars.stakers[i].addr, vars.stakers[i].privateKey);
            stakerPrivateKeys[i] = vars.stakers[i].privateKey;
        }
        vm.serializeUint(obj, "stakerPrivateKeys", stakerPrivateKeys);

        vm.createSelectFork(vm.rpcUrl("master_chain"));
        _initCore_SymbioticCore(SYMBIOTIC_CORE_USE_EXISTING_DEPLOYMENT);

        vm.startBroadcast(vars.PRIVATE_KEY_WALLET.privateKey);

        vars.tokens = new address[](1);
        vars.tokens[0] = address(new Token("Test"));

        vm.stopBroadcast();

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            for (uint256 j; j < vars.tokens.length; ++j) {
                _deal_Symbiotic(
                    vars.tokens[j],
                    vars.stakers[i].addr,
                    _normalizeForToken_Symbiotic(SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18, vars.tokens[j])
                );
            }
            _deal_Symbiotic(vars.stakers[i].addr, 10 ether);
        }

        {
            if (!symbioticCore.networkRegistry.isEntity(vars.network)) {
                _networkRegister_SymbioticCore(vars.network);
            }
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            _deal_Symbiotic(vars.operators[i].addr, 10 ether);
            _operatorRegister_SymbioticCore(vars.operators[i].addr);
        }

        vars.masterVaults = new address[](SYMBIOTIC_CORE_NUMBER_OF_VAULTS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++i) {
            vars.masterVaults[i] = _getVaultRandom_SymbioticCore(
                _vmWalletsToAddresses_Symbiotic(vars.operators), _randomPick_Symbiotic(vars.tokens)
            );
            console2.log("Vault -", vars.masterVaults[i]);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            for (uint256 j; j < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++j) {
                _stakerDepositRandom_SymbioticCore(vars.stakers[i].addr, vars.masterVaults[j]);
            }
        }

        string memory coreData;
        string memory chainData;

        vm.serializeAddress("masterCoreData", "delegatorFactory", address(symbioticCore.delegatorFactory));
        vm.serializeAddress("masterCoreData", "networkMetadataService", address(symbioticCore.networkMetadataService));
        vm.serializeAddress(
            "masterCoreData", "networkMiddlewareService", address(symbioticCore.networkMiddlewareService)
        );
        vm.serializeAddress("masterCoreData", "networkRegistry", address(symbioticCore.networkRegistry));
        vm.serializeAddress("masterCoreData", "operatorMetadataService", address(symbioticCore.operatorMetadataService));
        vm.serializeAddress(
            "masterCoreData", "operatorNetworkOptInService", address(symbioticCore.operatorNetworkOptInService)
        );
        vm.serializeAddress("masterCoreData", "operatorRegistry", address(symbioticCore.operatorRegistry));
        vm.serializeAddress(
            "masterCoreData", "operatorVaultOptInService", address(symbioticCore.operatorVaultOptInService)
        );
        vm.serializeAddress("masterCoreData", "slasherFactory", address(symbioticCore.slasherFactory));
        vm.serializeAddress("masterCoreData", "vaultConfigurator", address(symbioticCore.vaultConfigurator));
        coreData = vm.serializeAddress("masterCoreData", "vaultFactory", address(symbioticCore.vaultFactory));
        vm.serializeString("masterData", "core", coreData);
        vm.serializeAddress("masterData", "tokens", vars.tokens);
        vm.serializeUint("masterData", "chainId", block.chainid);
        chainData = vm.serializeAddress("masterData", "vaults", vars.masterVaults);
        finalJson = vm.serializeString(obj, "master_chain", chainData);

        vm.createSelectFork(vm.rpcUrl("secondary_chain"));
        _initCore_SymbioticCore(SYMBIOTIC_CORE_USE_EXISTING_DEPLOYMENT);

        vm.startBroadcast(vars.PRIVATE_KEY_WALLET.privateKey);

        vars.tokens = new address[](1);
        vars.tokens[0] = address(new Token("Test"));

        vm.stopBroadcast();

        {
            if (!symbioticCore.networkRegistry.isEntity(vars.network)) {
                _networkRegister_SymbioticCore(vars.network);
            }
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            for (uint256 j; j < vars.tokens.length; ++j) {
                _deal_Symbiotic(
                    vars.tokens[j],
                    vars.stakers[i].addr,
                    _normalizeForToken_Symbiotic(SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18, vars.tokens[j])
                );
            }
            _deal_Symbiotic(vars.stakers[i].addr, 10 ether);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            _deal_Symbiotic(vars.operators[i].addr, 10 ether);
            _operatorRegister_SymbioticCore(vars.operators[i].addr);
        }

        vars.secondaryVaults = new address[](SYMBIOTIC_CORE_NUMBER_OF_VAULTS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++i) {
            vars.secondaryVaults[i] = _getVaultRandom_SymbioticCore(
                _vmWalletsToAddresses_Symbiotic(vars.operators), _randomPick_Symbiotic(vars.tokens)
            );
            console2.log("Vault -", vars.secondaryVaults[i]);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            for (uint256 j; j < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++j) {
                _stakerDepositRandom_SymbioticCore(vars.stakers[i].addr, vars.secondaryVaults[j]);
            }
        }

        vm.serializeAddress("secondaryCoreData", "vaultFactory", address(symbioticCore.vaultFactory));
        vm.serializeAddress("secondaryCoreData", "delegatorFactory", address(symbioticCore.delegatorFactory));
        vm.serializeAddress("secondaryCoreData", "slasherFactory", address(symbioticCore.slasherFactory));
        vm.serializeAddress("secondaryCoreData", "networkRegistry", address(symbioticCore.networkRegistry));
        vm.serializeAddress(
            "secondaryCoreData", "networkMetadataService", address(symbioticCore.networkMetadataService)
        );
        vm.serializeAddress(
            "secondaryCoreData", "networkMiddlewareService", address(symbioticCore.networkMiddlewareService)
        );
        vm.serializeAddress("secondaryCoreData", "operatorRegistry", address(symbioticCore.operatorRegistry));
        vm.serializeAddress(
            "secondaryCoreData", "operatorMetadataService", address(symbioticCore.operatorMetadataService)
        );
        vm.serializeAddress(
            "secondaryCoreData", "operatorVaultOptInService", address(symbioticCore.operatorVaultOptInService)
        );
        vm.serializeAddress(
            "secondaryCoreData", "operatorNetworkOptInService", address(symbioticCore.operatorNetworkOptInService)
        );
        coreData =
            vm.serializeAddress("secondaryCoreData", "vaultConfigurator", address(symbioticCore.vaultConfigurator));
        vm.serializeString("secondaryData", "core", coreData);
        vm.serializeAddress("secondaryData", "tokens", vars.tokens);
        vm.serializeUint("secondaryData", "chainId", block.chainid);
        chainData = vm.serializeAddress("secondaryData", "vaults", vars.secondaryVaults);
        finalJson = vm.serializeString(obj, "secondary_chain", chainData);

        vm.writeJson(finalJson, "script/deploy/data/init_params.json");
    }
}
