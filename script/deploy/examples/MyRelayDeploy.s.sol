// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Network} from "@symbioticfi/network/src/Network.sol";

import {SigVerifierBlsBn254Simple} from "../../../src/modules/settlement/sig-verifiers/SigVerifierBlsBn254Simple.sol";
import {RelayDeploy} from "../RelayDeploy.sol";
import {IVotingPowerProvider} from "../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {INetworkManager} from "../../../src/interfaces/modules/base/INetworkManager.sol";
import {IOzEIP712} from "../../../src/interfaces/modules/base/IOzEIP712.sol";
import {IOzOwnable} from "../../../src/interfaces/modules/common/permissions/IOzOwnable.sol";
import {MyVotingPowerProvider} from "../../../examples/MyVotingPowerProvider.sol";
import {MyKeyRegistry} from "../../../examples/MyKeyRegistry.sol";
import {IKeyRegistry} from "../../../src/interfaces/modules/key-registry/IKeyRegistry.sol";
import {MyValSetDriver} from "../../../examples/MyValSetDriver.sol";
import {IValSetDriver} from "../../../src/interfaces/modules/valset-driver/IValSetDriver.sol";
import {IEpochManager} from "../../../src/interfaces/modules/valset-driver/IEpochManager.sol";
import {MySettlement} from "../../../examples/MySettlement.sol";
import {ISettlement} from "../../../src/interfaces/modules/settlement/ISettlement.sol";

/**
 * @notice Example script to deploy the relay contracts.
 * @dev First deploy the voting power provider, key registry, settlement using run() function.
 * Settlement and VotingPowerProvider can be deployed multiple times on different chains.
 * Contract addresses along with the chain id are saved to the relay_contracts.json file.
 * The driver is deployed using runDeployDriver() function last utilizing the addresses from the file.
 */
contract MyRelayDeploy is RelayDeploy {
    address public constant OWNER = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    // Voting power provider parameters
    string public constant VOTING_POWER_PROVIDER_NAME = "MyVotingPowerProvider";
    string public constant VOTING_POWER_PROVIDER_VERSION = "1";
    address public constant NETWORK_ADDRESS = 0xEa0F2EA61998346aD39dddeF7513ae90915AFb3c;
    uint96 public constant SUBNETWORK_ID = 1;
    bool public constant REQUIRE_SLASHER = false;
    uint48 public constant MIN_VAULT_EPOCH_DURATION = 86_400;
    address public constant TOKEN_ADDRESS = 0x8c1BEd5b9a0928467c9B1341Da1D7BD5e10b6549;
    address public constant OPERATOR_REGISTRY_ADDRESS = 0xAd817a6Bc954F678451A71363f04150FDD81Af9F;
    address public constant VAULT_FACTORY_ADDRESS = 0xAEb6bdd95c502390db8f52c8909F703E9Af6a346;

    // Key registry parameters
    string public constant KEY_REGISTRY_NAME = "MyKeyRegistry";
    string public constant KEY_REGISTRY_VERSION = "1";

    // ValSet driver parameters
    string public constant VALSET_DRIVER_NAME = "MyValSetDriver";
    string public constant VALSET_DRIVER_VERSION = "1";
    uint48 public constant EPOCH_DURATION = 86_400;
    uint208 public constant NUM_AGGREGATORS = 3;
    uint208 public constant NUM_COMMITTERS = 2;
    uint256 public constant MAX_VOTING_POWER = 1_000_000 * 10 ** 18;
    uint256 public constant MIN_INCLUSION_VOTING_POWER = 1000 * 10 ** 18;
    uint208 public constant MAX_VALIDATORS_COUNT = 100;
    uint8 public constant REQUIRED_HEADER_KEY_TAG = 15;
    uint32 public constant VERIFICATION_TYPE = 0;
    uint248 public constant QUORUM_THRESHOLD = 6667;
    uint64 public constant CHAIN_ID = 1;

    // Settlement parameters
    string public constant SETTLEMENT_NAME = "MySettlement";
    string public constant SETTLEMENT_VERSION = "1";

    function runDeploySettlement() public {
        deploySettlement({proxyOwner: OWNER, isDeployerGuarded: true});
    }

    function runDeployVotingPowerProvider() public {
        deployVotingPowerProvider({proxyOwner: OWNER, isDeployerGuarded: true});
    }

    function runDeployKeyRegistry() public {
        deployKeyRegistry({proxyOwner: OWNER, isDeployerGuarded: true});
    }

    function runDeployValSetDriver(
        IValSetDriver.CrossChainAddress memory keyRegistry,
        IValSetDriver.CrossChainAddress[] memory settlements,
        IValSetDriver.CrossChainAddress[] memory votingPowerProviders
    ) public {
        deployValSetDriver({
            proxyOwner: OWNER,
            isDeployerGuarded: true,
            keyRegistry: keyRegistry,
            settlements: settlements,
            votingPowerProviders: votingPowerProviders
        });
    }

    function _votingPowerProviderParams() internal override returns (address implementation, bytes memory initData) {
        implementation = address(new MyVotingPowerProvider(OPERATOR_REGISTRY_ADDRESS, VAULT_FACTORY_ADDRESS));

        initData = abi.encodeCall(
            MyVotingPowerProvider.initialize,
            (
                IVotingPowerProvider.VotingPowerProviderInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: NETWORK_ADDRESS,
                        subnetworkId: SUBNETWORK_ID
                    }),
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({
                        name: VOTING_POWER_PROVIDER_NAME,
                        version: VOTING_POWER_PROVIDER_VERSION
                    }),
                    requireSlasher: REQUIRE_SLASHER,
                    minVaultEpochDuration: MIN_VAULT_EPOCH_DURATION,
                    token: TOKEN_ADDRESS
                }),
                IOzOwnable.OzOwnableInitParams({owner: OWNER})
            )
        );
    }

    function _keyRegistryParams() internal override returns (address implementation, bytes memory initData) {
        implementation = address(new MyKeyRegistry());

        initData = abi.encodeCall(
            MyKeyRegistry.initialize,
            (
                IKeyRegistry.KeyRegistryInitParams({
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({
                        name: KEY_REGISTRY_NAME,
                        version: KEY_REGISTRY_VERSION
                    })
                })
            )
        );
    }

    function _valSetDriverParams(
        IValSetDriver.CrossChainAddress memory keyRegistry,
        IValSetDriver.CrossChainAddress[] memory settlements,
        IValSetDriver.CrossChainAddress[] memory votingPowerProviders
    ) internal override returns (address implementation, bytes memory initData) {
        implementation = address(new MyValSetDriver());

        uint8[] memory requiredKeyTags = new uint8[](1);
        requiredKeyTags[0] = REQUIRED_HEADER_KEY_TAG;

        IValSetDriver.QuorumThreshold[] memory quorumThresholds = new IValSetDriver.QuorumThreshold[](1);
        quorumThresholds[0] =
            IValSetDriver.QuorumThreshold({keyTag: REQUIRED_HEADER_KEY_TAG, quorumThreshold: QUORUM_THRESHOLD});

        initData = abi.encodeCall(
            MyValSetDriver.initialize,
            (
                IValSetDriver.ValSetDriverInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: NETWORK_ADDRESS,
                        subnetworkId: SUBNETWORK_ID
                    }),
                    epochManagerInitParams: IEpochManager.EpochManagerInitParams({
                        epochDuration: EPOCH_DURATION,
                        epochDurationTimestamp: 0
                    }),
                    numAggregators: NUM_AGGREGATORS,
                    numCommitters: NUM_COMMITTERS,
                    votingPowerProviders: votingPowerProviders,
                    keysProvider: keyRegistry,
                    settlements: settlements,
                    maxVotingPower: MAX_VOTING_POWER,
                    minInclusionVotingPower: MIN_INCLUSION_VOTING_POWER,
                    maxValidatorsCount: MAX_VALIDATORS_COUNT,
                    requiredKeyTags: requiredKeyTags,
                    quorumThresholds: quorumThresholds,
                    requiredHeaderKeyTag: REQUIRED_HEADER_KEY_TAG,
                    verificationType: VERIFICATION_TYPE
                }),
                OWNER
            )
        );
    }

    function _settlementParams() internal override returns (address implementation, bytes memory initData) {
        implementation = address(new MySettlement());

        initData = abi.encodeCall(
            MySettlement.initialize,
            (
                ISettlement.SettlementInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: NETWORK_ADDRESS,
                        subnetworkId: SUBNETWORK_ID
                    }),
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: SETTLEMENT_NAME, version: SETTLEMENT_VERSION}),
                    sigVerifier: address(new SigVerifierBlsBn254Simple())
                }),
                OWNER
            )
        );
    }
}
