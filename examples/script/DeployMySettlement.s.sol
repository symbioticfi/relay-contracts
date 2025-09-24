// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseDeployScript} from "./base/BaseDeploy.s.sol";
import {MySettlement} from "../../examples/MySettlement.sol";
import {ISettlement} from "../../src/interfaces/modules/settlement/ISettlement.sol";
import {INetworkManager} from "../../src/interfaces/modules/base/INetworkManager.sol";
import {IOzEIP712} from "../../src/interfaces/modules/base/IOzEIP712.sol";

// usage: forge script script/DeployMySettlement.s.sol:DeployMySettlementScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast 
contract DeployMySettlementScript is BaseDeployScript {
    bytes32 public constant NETWORK_SALT = keccak256("MySettlement");
    string public constant NAME = "MySettlement";
    string public constant VERSION = "1";
    address public constant NETWORK_ADDRESS = address(0);
    uint96 public constant SUBNETWORK_ID = 1;
    address public constant SIG_VERIFIER_ADDRESS = address(0);

    function run() public {
        (,, address deployer) = vm.readCallers();
        bytes memory initCode = type(MySettlement).creationCode;
        bytes memory data = abi.encodeCall(
            MySettlement.initialize,
            (
                ISettlement.SettlementInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: NETWORK_ADDRESS,
                        subnetworkId: SUBNETWORK_ID
                    }),
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: NAME, version: VERSION}),
                    sigVerifier: SIG_VERIFIER_ADDRESS
                }),
                deployer
            )
        );
        runDeployCreate3(NETWORK_SALT, initCode, data);
    }
}
