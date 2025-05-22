// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";

import "../../script/integration/SymbioticCoreInit.sol";

import {Token} from "@symbioticfi/core/test/mocks/Token.sol";

import {Master} from "../../src/contracts/implementations/settlement/Master.sol";
import {Replica} from "../../src/contracts/implementations/settlement/Replica.sol";
import {KeyRegistry} from "../../src/contracts/implementations/key-registries/KeyRegistry.sol";
import {SelfRegisterVotingPowerProvider} from
    "../../src/contracts/implementations/voting-power-providers/SelfRegisterVotingPowerProvider.sol";

// forge script script/test/InitSetup.s.sol:InitSetupScript 25235 --sig "run(uint256)"

contract InitSetupScript is SymbioticCoreInit {
    uint256 public constant SYMBIOTIC_CORE_NUMBER_OF_VAULTS = 3;
    uint256 public constant SYMBIOTIC_CORE_NUMBER_OF_OPERATORS = 3;
    uint256 public constant SYMBIOTIC_CORE_NUMBER_OF_STAKERS = 1;

    uint96 public constant IDENTIFIER = 0;

    struct Vars {
        Vm.Wallet deployer;
        Vm.Wallet network;
        Vm.Wallet[] stakers;
        Vm.Wallet[] operators;
    }

    struct ChainSetup {
        uint256 chainId;
        SymbioticCoreConstants.Core core;
        address[] tokens;
        address[] vaults;
    }

    struct InitSetupParams {
        uint48 commitDuration;
        uint48 epochDuration;
        ChainSetup masterChain;
        uint256 networkPrivateKey;
        uint256[] operatorPrivateKeys;
        uint48 prolongDuration;
        bool random;
        ChainSetup secondaryChain;
        uint48 slashingWindow;
        uint256[] stakerPrivateKeys;
        uint96 subnetworkID;
        uint48 zeroTimestamp;
    }

    function run(
        uint256 seed
    ) public virtual override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";

        SYMBIOTIC_CORE_MIN_EPOCH_DURATION = 1 days;
        SYMBIOTIC_CORE_MAX_EPOCH_DURATION = 21 days;
        SYMBIOTIC_CORE_MIN_VETO_DURATION = 1 hours;
        SYMBIOTIC_CORE_MAX_VETO_DURATION = 3 hours;

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

        SymbioticInit.run(seed);

        string memory obj = "data";
        string memory finalJson;
        Vars memory vars;
        InitSetupParams memory initSetupParams;
        initSetupParams.random = vm.envBool("RANDOM");
        vars.deployer = vm.createWallet(vm.envUint("PRIVATE_KEY"));

        vars.network = vars.deployer;
        vm.rememberKey(vars.network.privateKey);
        console2.log("Network -", vars.network.addr, vars.network.privateKey);
        vm.serializeUint(obj, "networkPrivateKey", vars.network.privateKey);

        uint256[] memory operatorPrivateKeys = new uint256[](SYMBIOTIC_CORE_NUMBER_OF_OPERATORS);
        vars.operators = new Vm.Wallet[](operatorPrivateKeys.length);
        for (uint256 i; i < operatorPrivateKeys.length; ++i) {
            vars.operators[i] = _getAccount_Symbiotic();
            vm.rememberKey(vars.operators[i].privateKey);
            console2.log("Operator -", vars.operators[i].addr, vars.operators[i].privateKey);
            operatorPrivateKeys[i] = vars.operators[i].privateKey;
        }
        vm.serializeUint(obj, "operatorPrivateKeys", operatorPrivateKeys);

        uint256[] memory stakerPrivateKeys = new uint256[](SYMBIOTIC_CORE_NUMBER_OF_STAKERS);
        vars.stakers = new Vm.Wallet[](stakerPrivateKeys.length);
        for (uint256 i; i < stakerPrivateKeys.length; ++i) {
            vars.stakers[i] = _getAccount_Symbiotic();
            vm.rememberKey(vars.stakers[i].privateKey);
            console2.log("Staker -", vars.stakers[i].addr, vars.stakers[i].privateKey);
            stakerPrivateKeys[i] = vars.stakers[i].privateKey;
        }
        vm.serializeUint(obj, "stakerPrivateKeys", stakerPrivateKeys);

        vm.createSelectFork(vm.rpcUrl("master_chain"));
        _initCore_SymbioticCore(false);

        console2.logBytes(abi.encode(symbioticCore));

        vm.startBroadcast(vars.deployer.privateKey);

        initSetupParams.masterChain.tokens = new address[](1);
        // console2.log("Token nonce", vm.getNonce(vars.deployer.addr));
        initSetupParams.masterChain.tokens[0] = address(new Token("Test"));

        vm.stopBroadcast();

        uint48 zeroTimestamp = uint48(vm.getBlockTimestamp() + vm.envUint("DEPLOYMENT_BUFFER"));

        for (uint256 i; i < vars.stakers.length; ++i) {
            for (uint256 j; j < initSetupParams.masterChain.tokens.length; ++j) {
                _deal_Symbiotic(
                    initSetupParams.masterChain.tokens[j],
                    vars.stakers[i].addr,
                    _normalizeForToken_Symbiotic(
                        SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18, initSetupParams.masterChain.tokens[j]
                    )
                );
            }
            _deal_Symbiotic(vars.stakers[i].addr, 10 ether);
        }

        if (!symbioticCore.networkRegistry.isEntity(vars.network.addr)) {
            _networkRegister_SymbioticCore(vars.network.addr);
        }

        for (uint256 i; i < vars.operators.length; ++i) {
            _deal_Symbiotic(vars.operators[i].addr, 10 ether);
            _operatorRegister_SymbioticCore(vars.operators[i].addr);
        }

        initSetupParams.masterChain.vaults = new address[](SYMBIOTIC_CORE_NUMBER_OF_VAULTS);
        for (uint256 i; i < initSetupParams.masterChain.vaults.length; ++i) {
            initSetupParams.masterChain.vaults[i] = initSetupParams.random
                ? _getVaultRandom_SymbioticCore(
                    _vmWalletsToAddresses_Symbiotic(vars.operators),
                    _randomPick_Symbiotic(initSetupParams.masterChain.tokens)
                )
                : _getVault_SymbioticCore(
                    VaultParams({
                        owner: vars.deployer.addr,
                        collateral: initSetupParams.masterChain.tokens[0],
                        burner: 0x000000000000000000000000000000000000dEaD,
                        epochDuration: uint48(SYMBIOTIC_CORE_MIN_EPOCH_DURATION * (i + 1)),
                        whitelistedDepositors: new address[](0),
                        depositLimit: 0,
                        delegatorIndex: 0,
                        hook: address(0),
                        network: address(0),
                        withSlasher: true,
                        slasherIndex: 0,
                        vetoDuration: uint48(SYMBIOTIC_CORE_MIN_VETO_DURATION * (i + 1))
                    })
                );
            console2.log("Vault -", initSetupParams.masterChain.vaults[i]);
        }

        for (uint256 i; i < vars.stakers.length; ++i) {
            for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
                initSetupParams.random
                    ? _stakerDepositRandom_SymbioticCore(vars.stakers[i].addr, initSetupParams.masterChain.vaults[j])
                    : _stakerDeposit_SymbioticCore(
                        vars.stakers[i].addr,
                        initSetupParams.masterChain.vaults[j],
                        _normalizeForToken_Symbiotic(
                            SYMBIOTIC_CORE_MIN_TOKENS_TO_DEPOSIT_TIMES_1e18, initSetupParams.masterChain.tokens[0]
                        ) * (i + 1) + j
                    );
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
        vm.serializeAddress("masterData", "tokens", initSetupParams.masterChain.tokens);
        vm.serializeUint("masterData", "chainId", block.chainid);
        chainData = vm.serializeAddress("masterData", "vaults", initSetupParams.masterChain.vaults);
        finalJson = vm.serializeString(obj, "masterChain", chainData);

        vm.createSelectFork(vm.rpcUrl("secondary_chain"));
        _initCore_SymbioticCore(false);

        vm.startBroadcast(vars.deployer.privateKey);

        initSetupParams.secondaryChain.tokens = new address[](1);
        initSetupParams.secondaryChain.tokens[0] = address(new Token("Test"));

        vm.stopBroadcast();

        {
            if (!symbioticCore.networkRegistry.isEntity(vars.network.addr)) {
                _networkRegister_SymbioticCore(vars.network.addr);
            }
        }

        for (uint256 i; i < vars.stakers.length; ++i) {
            for (uint256 j; j < initSetupParams.secondaryChain.tokens.length; ++j) {
                _deal_Symbiotic(
                    initSetupParams.secondaryChain.tokens[j],
                    vars.stakers[i].addr,
                    _normalizeForToken_Symbiotic(
                        SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18, initSetupParams.secondaryChain.tokens[j]
                    )
                );
            }
            _deal_Symbiotic(vars.stakers[i].addr, 10 ether);
        }

        for (uint256 i; i < vars.operators.length; ++i) {
            _deal_Symbiotic(vars.operators[i].addr, 10 ether);
            _operatorRegister_SymbioticCore(vars.operators[i].addr);
        }

        initSetupParams.secondaryChain.vaults = new address[](SYMBIOTIC_CORE_NUMBER_OF_VAULTS);
        for (uint256 i; i < initSetupParams.secondaryChain.vaults.length; ++i) {
            initSetupParams.secondaryChain.vaults[i] = initSetupParams.random
                ? _getVaultRandom_SymbioticCore(
                    _vmWalletsToAddresses_Symbiotic(vars.operators),
                    _randomPick_Symbiotic(initSetupParams.secondaryChain.tokens)
                )
                : _getVault_SymbioticCore(
                    VaultParams({
                        owner: vars.deployer.addr,
                        collateral: initSetupParams.secondaryChain.tokens[0],
                        burner: 0x000000000000000000000000000000000000dEaD,
                        epochDuration: uint48(SYMBIOTIC_CORE_MIN_EPOCH_DURATION * (i + 1)),
                        whitelistedDepositors: new address[](0),
                        depositLimit: 0,
                        delegatorIndex: 0,
                        hook: address(0),
                        network: address(0),
                        withSlasher: true,
                        slasherIndex: 0,
                        vetoDuration: uint48(SYMBIOTIC_CORE_MIN_VETO_DURATION * (i + 1))
                    })
                );
            console2.log("Vault -", initSetupParams.secondaryChain.vaults[i]);
        }

        for (uint256 i; i < vars.stakers.length; ++i) {
            for (uint256 j; j < initSetupParams.secondaryChain.vaults.length; ++j) {
                initSetupParams.random
                    ? _stakerDepositRandom_SymbioticCore(vars.stakers[i].addr, initSetupParams.secondaryChain.vaults[j])
                    : _stakerDeposit_SymbioticCore(
                        vars.stakers[i].addr,
                        initSetupParams.secondaryChain.vaults[j],
                        _normalizeForToken_Symbiotic(
                            SYMBIOTIC_CORE_MIN_TOKENS_TO_DEPOSIT_TIMES_1e18, initSetupParams.masterChain.tokens[0]
                        ) * (i + 1) + j
                    );
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
        vm.serializeAddress("secondaryData", "tokens", initSetupParams.secondaryChain.tokens);
        vm.serializeUint("secondaryData", "chainId", block.chainid);
        chainData = vm.serializeAddress("secondaryData", "vaults", initSetupParams.secondaryChain.vaults);
        vm.serializeString(obj, "secondaryChain", chainData);

        vm.serializeUint(obj, "epochDuration", vm.envUint("EPOCH_DURATION"));
        vm.serializeUint(obj, "commitDuration", vm.envUint("COMMIT_DURATION"));
        vm.serializeUint(obj, "prolongDuration", vm.envUint("PROLONG_DURATION"));
        vm.serializeUint(obj, "zeroTimestamp", zeroTimestamp);
        vm.serializeUint(obj, "subnetworkID", IDENTIFIER);
        vm.serializeUint(obj, "slashingWindow", vm.envUint("SLASHING_WINDOW"));
        finalJson = vm.serializeBool(obj, "random", initSetupParams.random);

        vm.writeJson(finalJson, "script/test/data/init_setup_params.json");
    }

    function loadInitSetupParamsAndVars() public returns (InitSetupParams memory initSetupParams, Vars memory vars) {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/test/data/init_setup_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            initSetupParams = abi.decode(data, (InitSetupParams));
        }

        vars.deployer = vm.createWallet(initSetupParams.networkPrivateKey);

        vars.network = vars.deployer;
        vm.rememberKey(vars.deployer.privateKey);

        vars.operators = new Vm.Wallet[](initSetupParams.operatorPrivateKeys.length);
        for (uint256 i; i < initSetupParams.operatorPrivateKeys.length; ++i) {
            vars.operators[i] = vm.createWallet(initSetupParams.operatorPrivateKeys[i]);
            vm.rememberKey(vars.operators[i].privateKey);
        }

        vars.stakers = new Vm.Wallet[](initSetupParams.stakerPrivateKeys.length);
        for (uint256 i; i < initSetupParams.stakerPrivateKeys.length; ++i) {
            vars.stakers[i] = vm.createWallet(initSetupParams.stakerPrivateKeys[i]);
            vm.rememberKey(vars.stakers[i].privateKey);
        }
    }
}
