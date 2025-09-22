// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseDeployScript} from "./base/BaseDeploy.s.sol";
import {MyVotingPowerProvider} from "../../examples/MyVotingPowerProvider.sol";
import {IVotingPowerProvider} from "../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {INetworkManager} from "../../src/interfaces/modules/base/INetworkManager.sol";
import {IOzEIP712} from "../../src/interfaces/modules/base/IOzEIP712.sol";
import {IOzOwnable} from "../../src/interfaces/modules/common/permissions/IOzOwnable.sol";

contract VotingPowerProviderScript is BaseDeployScript {
    bytes11 public constant NETWORK_SALT = "VotingPower";
    string public constant NAME = "MyVotingPowerProvider";
    string public constant VERSION = "1";

    address public constant NETWORK_ADDRESS = address(0);
    uint96 public constant SUBNETWORK_ID = 1;
    bool public constant REQUIRE_SLASHER = false;
    uint48 public constant MIN_VAULT_EPOCH_DURATION = 86_400;
    address public constant TOKEN_ADDRESS = address(0);

    // Constructor parameters
    address public constant OPERATOR_REGISTRY_ADDRESS = address(0);
    address public constant VAULT_FACTORY_ADDRESS = address(0);

    function run() public {
        (,, address deployer) = vm.readCallers();

        bytes memory initCode = abi.encodePacked(
            type(MyVotingPowerProvider).creationCode, abi.encode(OPERATOR_REGISTRY_ADDRESS, VAULT_FACTORY_ADDRESS)
        );

        bytes memory data = abi.encodeCall(
            MyVotingPowerProvider.initialize,
            (
                IVotingPowerProvider.VotingPowerProviderInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: NETWORK_ADDRESS,
                        subnetworkId: SUBNETWORK_ID
                    }),
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: NAME, version: VERSION}),
                    requireSlasher: REQUIRE_SLASHER,
                    minVaultEpochDuration: MIN_VAULT_EPOCH_DURATION,
                    token: TOKEN_ADDRESS
                }),
                IOzOwnable.OzOwnableInitParams({owner: deployer})
            )
        );
        runDeploy(deployer, NETWORK_SALT, initCode, data);
    }
}
