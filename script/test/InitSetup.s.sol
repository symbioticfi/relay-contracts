// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";

import "../../script/integration/SymbioticCoreInit.sol";

import {Token} from "@symbioticfi/core/test/mocks/Token.sol";

import {KeyTags} from "../../src/libraries/utils/KeyTags.sol";
import {MyKeyRegistry} from "../../examples/MyKeyRegistry.sol";
import {MyVotingPowerProvider} from "../../examples/MyVotingPowerProvider.sol";
import {VotingPowerProviderSemiFull} from "../../test/mocks/VotingPowerProviderSemiFull.sol";
import {MySettlement} from "../../examples/MySettlement.sol";
import {Network} from "../../src/modules/network/Network.sol";
import {MyValSetDriver} from "../../examples/MyValSetDriver.sol";
import {KeyEcdsaSecp256k1} from "../../src/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../../src/libraries/keys/KeyBlsBn254.sol";
import {
    KEY_TYPE_BLS_BN254, KEY_TYPE_ECDSA_SECP256K1
} from "../../src/interfaces/modules/key-registry/IKeyRegistry.sol";
import {BN254G2} from "../../test/helpers/BN254G2.sol";
import {IOzEIP712} from "../../src/interfaces/modules/base/IOzEIP712.sol";
import {IKeyRegistry} from "../../src/interfaces/modules/key-registry/IKeyRegistry.sol";

// forge script script/test/InitSetup.s.sol:InitSetupScript 25235 --sig "run(uint256)"

contract InitSetupScript is SymbioticCoreInit {
    using KeyTags for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using SymbioticSubnetwork for address;

    bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    uint256 public OPERATOR_PRIVATE_KEY_OFFSET = 1e18;
    uint256 public STAKER_PRIVATE_KEY_OFFSET = 2e18;
    uint256 public SYMBIOTIC_CORE_NUMBER_OF_VAULTS = 3;
    uint256 public SYMBIOTIC_CORE_NUMBER_OF_OPERATORS = 5;
    uint256 public SYMBIOTIC_CORE_NUMBER_OF_STAKERS = 1;

    uint96 public constant IDENTIFIER = 0;

    struct Vars {
        Vm.Wallet deployer;
        Vm.Wallet network;
    }

    struct ChainSetup {
        uint256 chainId;
        SymbioticCoreConstants.Core core;
        address[] tokens;
        address[] vaults;
    }

    struct InitSetupParams {
        address keyRegistry;
        ChainSetup masterChain;
        uint256 networkPrivateKey;
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

        vars.deployer = getDeployer();
        vars.network = getNetwork();

        vm.deal(vars.deployer.addr, 1000 ether);
        vm.deal(vars.network.addr, 1000 ether);

        console2.log("Deployer address:", vars.deployer.addr, "private key:", vars.deployer.privateKey);
        console2.log("Network address:", vars.network.addr, "private key:", vars.network.privateKey);

        vm.serializeUint(obj, "networkPrivateKey", vars.network.privateKey);

        console2.log("Initializing core");
        _initCore_SymbioticCore(false);
        console2.log("Core initialized");

        vm.startBroadcast(vars.deployer.privateKey);
        initSetupParams.masterChain.tokens = new address[](1);
        initSetupParams.masterChain.tokens[0] = address(new Token("Test"));
        console2.log("Staking token created", address(initSetupParams.masterChain.tokens[0]));
        vm.stopBroadcast();

        vm.startBroadcast(vars.deployer.privateKey);
        MyKeyRegistry keyRegistry = new MyKeyRegistry();
        keyRegistry.initialize(
            IKeyRegistry.KeyRegistryInitParams({
                ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "KeyRegistry", version: "1"})
            })
        );
        vm.stopBroadcast();
        console2.log("KeyRegistry deployed", address(keyRegistry));

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            Vm.Wallet memory staker = getStaker(i);

            for (uint256 j; j < initSetupParams.masterChain.tokens.length; ++j) {
                _deal_Symbiotic(
                    initSetupParams.masterChain.tokens[j],
                    staker.addr,
                    _normalizeForToken_Symbiotic(
                        SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18, initSetupParams.masterChain.tokens[j]
                    )
                );
            }
            _deal_Symbiotic(staker.addr, 10 ether);
            console2.log("Staker initialized", staker.addr);
        }

        if (!symbioticCore.networkRegistry.isEntity(vars.network.addr)) {
            _networkRegister_SymbioticCore(vars.network.addr);
            console2.log("Network registered in symbiotic core", vars.network.addr);
        }

        initSetupParams.keyRegistry = address(keyRegistry);
        vm.serializeAddress(obj, "keyRegistry", initSetupParams.keyRegistry);

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

            _setMaxNetworkLimit_SymbioticCore(
                vars.network.addr, initSetupParams.masterChain.vaults[i], IDENTIFIER, type(uint256).max
            );
            _setNetworkLimit_SymbioticCore(
                vars.deployer.addr,
                initSetupParams.masterChain.vaults[i],
                vars.network.addr.subnetwork(IDENTIFIER),
                type(uint256).max
            );
            for (uint256 j; j < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++j) {
                Vm.Wallet memory operator = getOperator(j);
                _setOperatorNetworkShares_SymbioticCore(
                    vars.deployer.addr,
                    initSetupParams.masterChain.vaults[i],
                    vars.network.addr.subnetwork(IDENTIFIER),
                    operator.addr,
                    1e18
                );
            }
            console2.log("Vault initialized", initSetupParams.masterChain.vaults[i]);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            Vm.Wallet memory operator = getOperator(i);
            _deal_Symbiotic(operator.addr, 10 ether);
            _operatorRegister_SymbioticCore(operator.addr);

            _operatorOptInWeak_SymbioticCore(operator.addr, vars.network.addr);
            console2.log("Operator ", operator.addr, " opted in to network ", vars.network.addr);

            for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
                _operatorOptInWeak_SymbioticCore(operator.addr, initSetupParams.masterChain.vaults[j]);
                console2.log("Operator ", operator.addr, " opted in to vault ", initSetupParams.masterChain.vaults[j]);
            }

            {
                vm.startBroadcast(operator.privateKey);
                BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(operator.privateKey);
                BN254.G2Point memory keyG2 = getG2Key(operator.privateKey);
                bytes memory key0Bytes = KeyBlsBn254.wrap(keyG1).toBytes();
                bytes32 messageHash0 = keyRegistry.hashTypedDataV4(
                    keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, operator.addr, keccak256(key0Bytes)))
                );
                BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash0);
                BN254.G1Point memory sigG1 = messageG1.scalar_mul(operator.privateKey);
                keyRegistry.setKey(KEY_TYPE_BLS_BN254.getKeyTag(15), key0Bytes, abi.encode(sigG1), abi.encode(keyG2));
                vm.stopBroadcast();
            }
            console2.log("Operator initialized", operator.addr);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            Vm.Wallet memory staker = getStaker(i);
            for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
                _stakerDeposit_SymbioticCore(
                    staker.addr,
                    initSetupParams.masterChain.vaults[j],
                    _normalizeForToken_Symbiotic(
                        SYMBIOTIC_CORE_MIN_TOKENS_TO_DEPOSIT_TIMES_1e18 * SYMBIOTIC_CORE_NUMBER_OF_OPERATORS,
                        initSetupParams.masterChain.tokens[0]
                    ) * (i + 1) + j
                );
                console2.log("Staker ", staker.addr, " deposited to vault ", initSetupParams.masterChain.vaults[j]);
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

        vm.writeJson(finalJson, "script/test/data/init_setup_params.json");
    }

    function getOperator(
        uint256 index
    ) public returns (Vm.Wallet memory operator) {
        // deterministic operator private key
        operator = vm.createWallet(1e18 + index);
        vm.rememberKey(operator.privateKey);
        return operator;
    }

    function getStaker(
        uint256 index
    ) public returns (Vm.Wallet memory staker) {
        // deterministic operator private key
        staker = vm.createWallet(STAKER_PRIVATE_KEY_OFFSET + index);
        vm.rememberKey(staker.privateKey);
        return staker;
    }

    function getNetwork() public returns (Vm.Wallet memory network) {
        network = vm.createWallet(vm.envOr("PRIVATE_KEY", uint256(101)));
        vm.rememberKey(network.privateKey);
        return network;
    }

    function getDeployer() public returns (Vm.Wallet memory deployer) {
        deployer = vm.createWallet(vm.envOr("PRIVATE_KEY", uint256(101)));
        vm.rememberKey(deployer.privateKey);
        return deployer;
    }

    function getG2Key(
        uint256 privateKey
    ) public view returns (BN254.G2Point memory) {
        BN254.G2Point memory G2 = BN254.generatorG2();
        (uint256 x1, uint256 x2, uint256 y1, uint256 y2) =
            BN254G2.ECTwistMul(privateKey, G2.X[1], G2.X[0], G2.Y[1], G2.Y[0]);
        return BN254.G2Point([x2, x1], [y2, y1]);
    }

    function loadInitSetupParamsAndVars() public returns (InitSetupParams memory initSetupParams, Vars memory vars) {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/test/data/init_setup_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            initSetupParams = abi.decode(data, (InitSetupParams));
        }

        vars.deployer = getDeployer();
        vars.network = getNetwork();
    }
}
