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

import "@symbioticfi/core/script/integration/SymbioticCoreInit.sol";

import {InitScript} from "./Init.s.sol";
import {FirstScript} from "./First.s.sol";
import {SecondScript} from "./Second.s.sol";
import {ThirdScript} from "./Third.s.sol";

// forge script script/deploy/Fifth.s.sol:FifthScript 25235 --sig "run(uint256)" --rpc-url $ETH_RPC_URL_MASTER

contract FifthScript is SymbioticCoreInit {
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

    struct ThirdParams {
        address key_registry;
        address master;
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

        (FirstScript.InitParams memory initParams, InitScript.InitVars memory vars) = loadInitParams();
        SecondScript.FirstParams memory firstParams;
        FirstScript.Addresses memory addresses;
        (firstParams, vars, addresses) = loadFirstParams(vars);
        ThirdScript.SecondParams memory secondParams;
        (secondParams, addresses) = loadSecondParams(addresses);
        ThirdParams memory thirdParams;
        (thirdParams, addresses) = loadThirdParams(addresses);

        symbioticCore = initParams.master_chain.core;
        vars.tokens = initParams.master_chain.tokens;

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            vm.startBroadcast(vars.operators[i].privateKey);

            addresses.masterVotingPowerProvider.registerOperator(address(0));

            {
                bytes memory key1Bytes = KeyEcdsaSecp256k1.wrap(vars.operators[i].addr).toBytes();
                bytes32 messageHash1 = addresses.keyRegistry.hashTypedDataV4(
                    keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, vars.operators[i].addr, keccak256(key1Bytes)))
                );
                (uint8 v, bytes32 r, bytes32 s) = vm.sign(vars.operators[i].privateKey, messageHash1);
                bytes memory signature1 = abi.encodePacked(r, s, v);
                addresses.keyRegistry.setKey(
                    uint8(IKeyManager.KeyType.ECDSA_SECP256K1).keyTag(0), key1Bytes, signature1, new bytes(0)
                );
            }

            {
                BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(vars.operators[i].privateKey);
                BN254.G2Point memory keyG2 = getG2Key(vars.operators[i].privateKey);
                bytes memory key0Bytes = KeyBlsBn254.wrap(keyG1).toBytes();
                bytes32 messageHash0 = addresses.keyRegistry.hashTypedDataV4(
                    keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, vars.operators[i].addr, keccak256(key0Bytes)))
                );
                BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash0);
                BN254.G1Point memory sigG1 = messageG1.scalar_mul(vars.operators[i].privateKey);
                addresses.keyRegistry.setKey(
                    uint8(IKeyManager.KeyType.BLS_BN254).keyTag(15), key0Bytes, abi.encode(sigG1), abi.encode(keyG2)
                );
            }

            vm.stopBroadcast();
        }
    }

    function getG2Key(
        uint256 privateKey
    ) public view returns (BN254.G2Point memory) {
        BN254.G2Point memory G2 = BN254.generatorG2();
        (uint256 x1, uint256 x2, uint256 y1, uint256 y2) =
            BN254G2.ECTwistMul(privateKey, G2.X[1], G2.X[0], G2.Y[1], G2.Y[0]);
        return BN254.G2Point([x2, x1], [y2, y1]);
    }

    function loadInitParams()
        public
        returns (FirstScript.InitParams memory initParams, InitScript.InitVars memory vars)
    {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/deploy/data/init_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            initParams = abi.decode(data, (FirstScript.InitParams));
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

    function loadFirstParams(
        InitScript.InitVars memory vars_
    )
        public
        returns (
            SecondScript.FirstParams memory firstParams,
            InitScript.InitVars memory vars,
            FirstScript.Addresses memory addresses
        )
    {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/deploy/data/first_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            firstParams = abi.decode(data, (SecondScript.FirstParams));
        }

        vars_.ZERO_TIMESTAMP = uint48(firstParams.init_timestamp);

        addresses.masterVotingPowerProvider = SelfRegisterVotingPowerProvider(firstParams.master_voting_power_provider);

        return (firstParams, vars_, addresses);
    }

    function loadSecondParams(
        FirstScript.Addresses memory addresses_
    ) public returns (ThirdScript.SecondParams memory secondParams, FirstScript.Addresses memory addresses) {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/deploy/data/second_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            secondParams = abi.decode(data, (ThirdScript.SecondParams));
        }

        addresses_.secondaryVotingPowerProvider =
            SelfRegisterVotingPowerProvider(secondParams.secondary_voting_power_provider);
        addresses_.replica = Replica(secondParams.replica);

        return (secondParams, addresses_);
    }

    function loadThirdParams(
        FirstScript.Addresses memory addresses_
    ) public returns (ThirdParams memory thirdParams, FirstScript.Addresses memory addresses) {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/deploy/data/third_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            thirdParams = abi.decode(data, (ThirdParams));
        }

        addresses_.master = Master(thirdParams.master);
        addresses_.keyRegistry = KeyRegistry(thirdParams.key_registry);

        return (thirdParams, addresses_);
    }
}
