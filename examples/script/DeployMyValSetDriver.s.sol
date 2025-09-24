// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseDeployScript} from "./base/BaseDeploy.s.sol";
import {MyValSetDriver} from "../../examples/MyValSetDriver.sol";
import {IValSetDriver} from "../../src/interfaces/modules/valset-driver/IValSetDriver.sol";
import {INetworkManager} from "../../src/interfaces/modules/base/INetworkManager.sol";
import {IEpochManager} from "../../src/interfaces/modules/valset-driver/IEpochManager.sol";

// usage: forge script script/DeployMyValSetDriver.s.sol:DeployMyValSetDriverScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast 
contract DeployMyValSetDriverScript is BaseDeployScript {
    bytes32 public constant NETWORK_SALT = keccak256("MyValSetDriver");
    string public constant NAME = "MyValSetDriver";
    string public constant VERSION = "1";

    address public constant NETWORK_ADDRESS = address(0);
    uint96 public constant SUBNETWORK_ID = 1;
    uint48 public constant EPOCH_DURATION = 86_400;

    uint208 public constant NUM_AGGREGATORS = 3;
    uint208 public constant NUM_COMMITTERS = 2;
    uint256 public constant MAX_VOTING_POWER = 1_000_000 * 10 ** 18;
    uint256 public constant MIN_INCLUSION_VOTING_POWER = 1000 * 10 ** 18;
    uint208 public constant MAX_VALIDATORS_COUNT = 100;
    uint8 public constant REQUIRED_HEADER_KEY_TAG = 1;
    uint32 public constant VERIFICATION_TYPE = 0;

    uint248 public constant QUORUM_THRESHOLD = 6667;
    uint64 public constant CHAIN_ID = 1;
    address public constant PROVIDER_ADDRESS = address(0);

    function run() public {
        (,, address deployer) = vm.readCallers();
        bytes memory initCode = type(MyValSetDriver).creationCode;

        IValSetDriver.CrossChainAddress[] memory votingPowerProviders = new IValSetDriver.CrossChainAddress[](1);
        votingPowerProviders[0] = IValSetDriver.CrossChainAddress({chainId: CHAIN_ID, addr: PROVIDER_ADDRESS});

        IValSetDriver.CrossChainAddress memory keysProvider =
            IValSetDriver.CrossChainAddress({chainId: CHAIN_ID, addr: PROVIDER_ADDRESS});

        IValSetDriver.CrossChainAddress[] memory settlements = new IValSetDriver.CrossChainAddress[](1);
        settlements[0] = IValSetDriver.CrossChainAddress({chainId: CHAIN_ID, addr: PROVIDER_ADDRESS});

        uint8[] memory requiredKeyTags = new uint8[](1);
        requiredKeyTags[0] = REQUIRED_HEADER_KEY_TAG;

        IValSetDriver.QuorumThreshold[] memory quorumThresholds = new IValSetDriver.QuorumThreshold[](1);
        quorumThresholds[0] =
            IValSetDriver.QuorumThreshold({keyTag: REQUIRED_HEADER_KEY_TAG, quorumThreshold: QUORUM_THRESHOLD});

        bytes memory data = abi.encodeCall(
            MyValSetDriver.initialize,
            (
                IValSetDriver.ValSetDriverInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: NETWORK_ADDRESS,
                        subnetworkId: SUBNETWORK_ID
                    }),
                    epochManagerInitParams: IEpochManager.EpochManagerInitParams({
                        epochDuration: EPOCH_DURATION,
                        epochDurationTimestamp: uint48(block.timestamp)
                    }),
                    numAggregators: NUM_AGGREGATORS,
                    numCommitters: NUM_COMMITTERS,
                    votingPowerProviders: votingPowerProviders,
                    keysProvider: keysProvider,
                    settlements: settlements,
                    maxVotingPower: MAX_VOTING_POWER,
                    minInclusionVotingPower: MIN_INCLUSION_VOTING_POWER,
                    maxValidatorsCount: MAX_VALIDATORS_COUNT,
                    requiredKeyTags: requiredKeyTags,
                    quorumThresholds: quorumThresholds,
                    requiredHeaderKeyTag: REQUIRED_HEADER_KEY_TAG,
                    verificationType: VERIFICATION_TYPE
                }),
                deployer
            )
        );
        runDeployCreate3(NETWORK_SALT, initCode, data);
    }
}
