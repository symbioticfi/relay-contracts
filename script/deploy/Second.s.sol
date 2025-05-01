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
import {FirstScript} from "./First.s.sol";

// forge script script/deploy/Second.s.sol:SecondScript 25235 --sig "run(uint256)" --rpc-url $ETH_RPC_URL_SECONDARY

contract SecondScript is SymbioticCoreInit {
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

    struct ChainSetup {
        uint256 chainId;
        SymbioticCoreConstants.Core core;
        address[] tokens;
        address[] vaults;
    }

    struct FirstParams {
        uint256 init_timestamp;
        address master_voting_power_provider;
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
        (FirstScript.InitParams memory initParams, InitScript.InitVars memory vars) = loadInitParams();
        FirstParams memory firstParams;
        FirstScript.Addresses memory addresses;
        (firstParams, vars, addresses) = loadFirstParams(vars);

        vm.startBroadcast(vars.PRIVATE_KEY_WALLET.privateKey);

        addresses.secondaryVotingPowerProvider = new SelfRegisterVotingPowerProvider(
            address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
        );
        {
            addresses.secondaryVotingPowerProvider.initialize(
                INetworkManager.NetworkManagerInitParams({network: vars.network, subnetworkID: IDENTIFIER}),
                IVaultManager.VaultManagerInitParams({slashingWindow: 6 * 60 * 60}),
                IOzEIP712.OzEIP712InitParams({name: "SelfRegisterVotingPowerProvider", version: "1"}),
                IOzOwnable.OzOwnableInitParams({owner: vars.network})
            );
            vm.stopBroadcast();
            _networkSetMiddleware_SymbioticCore(vars.network, address(addresses.secondaryVotingPowerProvider));
        }
        vm.serializeAddress(obj, "secondary_voting_power_provider", address(addresses.secondaryVotingPowerProvider));

        {
            vm.startBroadcast(vars.PRIVATE_KEY_WALLET.privateKey);

            for (uint256 i; i < vars.tokens.length; ++i) {
                addresses.secondaryVotingPowerProvider.registerToken(vars.tokens[i]);
            }
            for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++i) {
                addresses.secondaryVotingPowerProvider.registerSharedVault(vars.secondaryVaults[i]);
            }
        }

        addresses.replica = new Replica();
        {
            ISettlementManager.QuorumThreshold[] memory quorumThresholds = new ISettlementManager.QuorumThreshold[](1);
            quorumThresholds[0] = ISettlementManager.QuorumThreshold({
                keyTag: uint8(IKeyManager.KeyType.BLS_BN254).keyTag(15),
                threshold: 0.66 * 1e18
            });
            uint8[] memory requiredKeyTags = new uint8[](2);
            requiredKeyTags[0] = uint8(IKeyManager.KeyType.BLS_BN254).keyTag(15);
            requiredKeyTags[1] = uint8(IKeyManager.KeyType.ECDSA_SECP256K1).keyTag(0);
            addresses.replica.initialize(
                ISettlementManager.SettlementManagerInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: vars.network,
                        subnetworkID: IDENTIFIER
                    }),
                    epochManagerInitParams: IEpochManager.EpochManagerInitParams({
                        epochDuration: 3 * 60 * 60,
                        epochDurationTimestamp: vars.ZERO_TIMESTAMP
                    }),
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "Middleware", version: "1"}),
                    quorumThresholds: quorumThresholds,
                    commitDuration: 45 * 60,
                    requiredKeyTag: uint8(IKeyManager.KeyType.BLS_BN254).keyTag(15),
                    sigVerifier: address(new SigVerifierMock())
                }),
                vars.network
            );
        }
        finalJson = vm.serializeAddress(obj, "replica", address(addresses.replica));

        vm.stopBroadcast();

        console2.log("Sepolia - VotingPowerProvider: ", address(addresses.secondaryVotingPowerProvider));
        console2.log("Sepolia - Replica: ", address(addresses.replica));

        vm.writeJson(finalJson, "script/deploy/data/second_params.json");
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
            FirstParams memory firstParams,
            InitScript.InitVars memory vars,
            FirstScript.Addresses memory addresses
        )
    {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/deploy/data/first_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            firstParams = abi.decode(data, (FirstParams));
        }

        vars_.ZERO_TIMESTAMP = uint48(firstParams.init_timestamp);

        addresses.masterVotingPowerProvider = SelfRegisterVotingPowerProvider(firstParams.master_voting_power_provider);

        return (firstParams, vars_, addresses);
    }
}
