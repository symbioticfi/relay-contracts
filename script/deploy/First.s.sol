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

import {InitScript} from "./Init.s.sol";

// forge script script/deploy/First.s.sol:FirstScript 25235 --sig "run(uint256)" --rpc-url $ETH_RPC_URL_MASTER

contract FirstScript is SymbioticCoreInit {
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
    uint48 public constant DEPLOYMENT_BUFFER = 10 * 60;

    struct Addresses {
        SelfRegisterVotingPowerProvider masterVotingPowerProvider;
        SelfRegisterVotingPowerProvider secondaryVotingPowerProvider;
        Replica replica;
        Master master;
        KeyRegistry keyRegistry;
    }

    struct ChainSetup {
        uint256 chainId;
        SymbioticCoreConstants.Core core;
        address[] tokens;
        address[] vaults;
    }

    struct InitParams {
        ChainSetup master_chain;
        uint256 networkPrivateKey;
        uint256[] operatorPrivateKeys;
        ChainSetup secondary_chain;
        uint256[] stakerPrivateKeys;
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

        SYMBIOTIC_CORE_USE_EXISTING_DEPLOYMENT = true;

        SYMBIOTIC_CORE_DELEGATOR_TYPES = [0];

        SymbioticInit.run(seed);

        string memory obj = "data";
        string memory finalJson;
        (InitParams memory initParams, InitScript.InitVars memory vars) = loadInitParams();
        Addresses memory addresses;

        vars.ZERO_TIMESTAMP = uint48(vm.getBlockTimestamp()) + DEPLOYMENT_BUFFER;
        vm.serializeUint(obj, "init_timestamp", vars.ZERO_TIMESTAMP);

        vm.startBroadcast(vars.PRIVATE_KEY_WALLET.privateKey);

        addresses.masterVotingPowerProvider = new SelfRegisterVotingPowerProvider(
            address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
        );
        {
            addresses.masterVotingPowerProvider.initialize(
                INetworkManager.NetworkManagerInitParams({network: vars.network, subnetworkID: IDENTIFIER}),
                IVaultManager.VaultManagerInitParams({slashingWindow: 6 * 60 * 60}),
                IOzEIP712.OzEIP712InitParams({name: "SelfRegisterVotingPowerProvider", version: "1"}),
                IOzOwnable.OzOwnableInitParams({owner: vars.network})
            );
            vm.stopBroadcast();
            _networkSetMiddleware_SymbioticCore(vars.network, address(addresses.masterVotingPowerProvider));
        }
        finalJson =
            vm.serializeAddress(obj, "master_voting_power_provider", address(addresses.masterVotingPowerProvider));

        {
            vm.startBroadcast(vars.PRIVATE_KEY_WALLET.privateKey);

            for (uint256 i; i < vars.tokens.length; ++i) {
                addresses.masterVotingPowerProvider.registerToken(vars.tokens[i]);
            }
            for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++i) {
                addresses.masterVotingPowerProvider.registerSharedVault(vars.masterVaults[i]);
            }

            vm.stopBroadcast();
        }

        vm.writeJson(finalJson, "script/deploy/data/first_params.json");
    }

    function loadInitParams() public returns (InitParams memory initParams, InitScript.InitVars memory vars) {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/deploy/data/init_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            initParams = abi.decode(data, (InitParams));
        }

        vars.PRIVATE_KEY_WALLET = vm.createWallet(initParams.networkPrivateKey);

        {
            vars.network = vars.PRIVATE_KEY_WALLET.addr;
            vm.rememberKey(vars.PRIVATE_KEY_WALLET.privateKey);
        }

        vars.operators = new Vm.Wallet[](SYMBIOTIC_CORE_NUMBER_OF_OPERATORS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            vars.operators[i] = vm.createWallet(initParams.operatorPrivateKeys[i]);
            vm.rememberKey(vars.operators[i].privateKey);
        }

        vars.stakers = new Vm.Wallet[](SYMBIOTIC_CORE_NUMBER_OF_STAKERS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            vars.stakers[i] = vm.createWallet(initParams.stakerPrivateKeys[i]);
            vm.rememberKey(vars.stakers[i].privateKey);
        }

        vars.masterVaults = initParams.master_chain.vaults;
        vars.secondaryVaults = initParams.secondary_chain.vaults;

        vars.tokens = initParams.master_chain.tokens;

        symbioticCore = initParams.master_chain.core;
    }
}
