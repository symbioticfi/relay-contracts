// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";

import "./integration/SymbioticCoreInit.sol";

import {Token} from "@symbioticfi/core/test/mocks/Token.sol";

import {Master} from "../src/contracts/implementations/settlement/Master.sol";
import {Replica} from "../src/contracts/implementations/settlement/Replica.sol";
import {KeyRegistry} from "../src/contracts/implementations/key-registries/KeyRegistry.sol";
import {SelfRegisterVotingPowerProvider} from
    "../src/contracts/implementations/voting-power-providers/SelfRegisterVotingPowerProvider.sol";

contract InitSetup is SymbioticCoreInit {
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
        ChainSetup secondaryChain;
        uint48 slashingWindow;
        uint256[] stakerPrivateKeys;
        uint96 subnetworkID;
        uint48 zeroTimestamp;
    }

    InitSetupParams public initSetupParams;
    Vars public vars;

    function setUp() public virtual override {
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

        // _skipBlocks_Symbiotic(2_000_000);
        // vm.warp(1_747_116_234);

        SymbioticInit.setUp();

        loadInitSetupParamsAndVars();
    }

    // function loadInitSetupParamsAndVars() public returns (InitSetupParams memory initSetupParams, Vars memory vars) {
    //     vars.deployer = _getAccount_Symbiotic();

    //     vars.network = vars.deployer;

    //     uint256[] memory operatorPrivateKeys = new uint256[](SYMBIOTIC_CORE_NUMBER_OF_OPERATORS);
    //     vars.operators = new Vm.Wallet[](operatorPrivateKeys.length);
    //     for (uint256 i; i < operatorPrivateKeys.length; ++i) {
    //         vars.operators[i] = _getAccount_Symbiotic();
    //         operatorPrivateKeys[i] = vars.operators[i].privateKey;
    //     }

    //     uint256[] memory stakerPrivateKeys = new uint256[](SYMBIOTIC_CORE_NUMBER_OF_STAKERS);
    //     vars.stakers = new Vm.Wallet[](stakerPrivateKeys.length);
    //     for (uint256 i; i < stakerPrivateKeys.length; ++i) {
    //         vars.stakers[i] = _getAccount_Symbiotic();
    //         stakerPrivateKeys[i] = vars.stakers[i].privateKey;
    //     }

    //     _initCore_SymbioticCore(false);

    //     uint48 zeroTimestamp = uint48(vm.getBlockTimestamp() + vm.envUint("DEPLOYMENT_BUFFER"));

    //     vm.startPrank(vars.deployer.addr);

    //     initSetupParams.masterChain.tokens = new address[](1);
    //     initSetupParams.masterChain.tokens[0] = address(new Token("Test"));

    //     vm.stopPrank();

    //     for (uint256 i; i < vars.stakers.length; ++i) {
    //         for (uint256 j; j < initSetupParams.masterChain.tokens.length; ++j) {
    //             _deal_Symbiotic(
    //                 initSetupParams.masterChain.tokens[j],
    //                 vars.stakers[i].addr,
    //                 _normalizeForToken_Symbiotic(
    //                     SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18, initSetupParams.masterChain.tokens[j]
    //                 ),
    //                 true
    //             );
    //         }
    //     }

    //     if (!symbioticCore.networkRegistry.isEntity(vars.network.addr)) {
    //         _networkRegister_SymbioticCore(vars.network.addr);
    //     }

    //     for (uint256 i; i < vars.operators.length; ++i) {
    //         _operatorRegister_SymbioticCore(vars.operators[i].addr);
    //     }

    //     initSetupParams.masterChain.vaults = new address[](SYMBIOTIC_CORE_NUMBER_OF_VAULTS);
    //     for (uint256 i; i < initSetupParams.masterChain.vaults.length; ++i) {
    //         initSetupParams.masterChain.vaults[i] = _getVaultRandom_SymbioticCore(
    //             _vmWalletsToAddresses_Symbiotic(vars.operators),
    //             _randomPick_Symbiotic(initSetupParams.masterChain.tokens)
    //         );
    //     }

    //     for (uint256 i; i < vars.stakers.length; ++i) {
    //         for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
    //             _stakerDepositRandom_SymbioticCore(vars.stakers[i].addr, initSetupParams.masterChain.vaults[j]);
    //         }
    //     }

    //     initSetupParams.epochDuration = 300;
    //     initSetupParams.commitDuration = 120;
    //     initSetupParams.slashingWindow = zeroTimestamp;
    //     initSetupParams.subnetworkID = IDENTIFIER;
    //     initSetupParams.slashingWindow = 1200;
    // }

    function loadInitSetupParamsAndVars() public {
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

        for (uint256 i; i < initSetupParams.operatorPrivateKeys.length; ++i) {
            vars.operators.push(vm.createWallet(initSetupParams.operatorPrivateKeys[i]));
            vm.rememberKey(vars.operators[i].privateKey);
        }

        for (uint256 i; i < initSetupParams.stakerPrivateKeys.length; ++i) {
            vars.stakers.push(vm.createWallet(initSetupParams.stakerPrivateKeys[i]));
            vm.rememberKey(vars.stakers[i].privateKey);
        }
    }
}
