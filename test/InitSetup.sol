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

    uint48 public constant DEPLOYMENT_BUFFER = 600;
    uint48 public constant EPOCH_DURATION = 300;
    uint48 public constant COMMIT_DURATION = 120;
    uint48 public constant SLASHING_WINDOW = 1200;

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

    function loadInitSetupParamsAndVars() public {
        initSetupParams.networkPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

        initSetupParams.operatorPrivateKeys.push(
            87_191_036_493_798_670_866_484_781_455_694_320_176_667_203_290_824_056_510_541_300_741_498_740_913_410
        );
        initSetupParams.operatorPrivateKeys.push(
            11_008_377_096_554_045_051_122_023_680_185_802_911_050_337_017_631_086_444_859_313_200_352_654_461_863
        );
        initSetupParams.operatorPrivateKeys.push(
            26_972_876_870_930_381_973_856_869_753_776_124_637_336_739_336_929_668_162_870_464_864_826_929_175_089
        );

        initSetupParams.stakerPrivateKeys.push(
            3_435_247_162_038_210_587_610_369_479_936_427_564_209_354_959_133_959_739_970_868_048_138_458_127_204
        );

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

        vm.startPrank(vars.deployer.addr);
        _initCore_SymbioticCore(false);
        initSetupParams.masterChain.core = symbioticCore;
        vm.stopPrank();

        console2.logBytes(abi.encode(symbioticCore));

        vm.startPrank(vars.deployer.addr);

        initSetupParams.masterChain.tokens = new address[](1);
        initSetupParams.masterChain.tokens[0] = address(new Token("Test"));

        vm.stopPrank();

        uint48 zeroTimestamp = uint48(vm.getBlockTimestamp() + DEPLOYMENT_BUFFER);

        for (uint256 i; i < vars.stakers.length; ++i) {
            for (uint256 j; j < initSetupParams.masterChain.tokens.length; ++j) {
                _deal_Symbiotic(
                    initSetupParams.masterChain.tokens[j],
                    vars.stakers[i].addr,
                    _normalizeForToken_Symbiotic(
                        SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18, initSetupParams.masterChain.tokens[j]
                    ),
                    true
                );
            }
        }

        if (!symbioticCore.networkRegistry.isEntity(vars.network.addr)) {
            _networkRegister_SymbioticCore(vars.network.addr);
        }

        for (uint256 i; i < vars.operators.length; ++i) {
            _operatorRegister_SymbioticCore(vars.operators[i].addr);
        }

        initSetupParams.masterChain.vaults = new address[](SYMBIOTIC_CORE_NUMBER_OF_VAULTS);
        for (uint256 i; i < initSetupParams.masterChain.vaults.length; ++i) {
            initSetupParams.masterChain.vaults[i] = _getVault_SymbioticCore(
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
        }

        for (uint256 i; i < vars.stakers.length; ++i) {
            for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
                _stakerDeposit_SymbioticCore(
                    vars.stakers[i].addr,
                    initSetupParams.masterChain.vaults[j],
                    _normalizeForToken_Symbiotic(
                        SYMBIOTIC_CORE_MIN_TOKENS_TO_DEPOSIT_TIMES_1e18, initSetupParams.masterChain.tokens[0]
                    ) * (i + 1) + j
                );
            }
        }

        initSetupParams.epochDuration = EPOCH_DURATION;
        initSetupParams.commitDuration = COMMIT_DURATION;
        initSetupParams.slashingWindow = SLASHING_WINDOW;
        initSetupParams.subnetworkID = IDENTIFIER;
        initSetupParams.zeroTimestamp = zeroTimestamp;
    }

    // function loadInitSetupParamsAndVars() public {
    //     {
    //         string memory root = vm.projectRoot();
    //         string memory path = string.concat(root, "/script/test/data/init_setup_params.json");
    //         string memory json = vm.readFile(path);
    //         bytes memory data = vm.parseJson(json);
    //         initSetupParams = abi.decode(data, (InitSetupParams));
    //     }

    //     initSetupParams.networkPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

    //     initSetupParams.operatorPrivateKeys.push(87191036493798670866484781455694320176667203290824056510541300741498740913410);
    //     initSetupParams.operatorPrivateKeys.push(11008377096554045051122023680185802911050337017631086444859313200352654461863);
    //     initSetupParams.operatorPrivateKeys.push(26972876870930381973856869753776124637336739336929668162870464864826929175089);

    //     initSetupParams.stakerPrivateKeys.push(3435247162038210587610369479936427564209354959133959739970868048138458127204);

    //     vars.deployer = vm.createWallet(initSetupParams.networkPrivateKey);

    //     vars.network = vars.deployer;
    //     vm.rememberKey(vars.deployer.privateKey);

    //     for (uint256 i; i < initSetupParams.operatorPrivateKeys.length; ++i) {
    //         vars.operators.push(vm.createWallet(initSetupParams.operatorPrivateKeys[i]));
    //         vm.rememberKey(vars.operators[i].privateKey);
    //     }

    //     for (uint256 i; i < initSetupParams.stakerPrivateKeys.length; ++i) {
    //         vars.stakers.push(vm.createWallet(initSetupParams.stakerPrivateKeys[i]));
    //         vm.rememberKey(vars.stakers[i].privateKey);
    //     }
    // }
}
