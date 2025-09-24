// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseDeployScript} from "./base/BaseDeploy.s.sol";
import {MyKeyRegistry} from "../../examples/MyKeyRegistry.sol";
import {IKeyRegistry} from "../../src/interfaces/modules/key-registry/IKeyRegistry.sol";
import {IOzEIP712} from "../../src/interfaces/modules/base/IOzEIP712.sol";

contract DeployMyKeyRegistryScript is BaseDeployScript {
    bytes32 public constant NETWORK_SALT = keccak256("MyKeyRegistry");
    string public constant NAME = "KeyRegistry";
    string public constant VERSION = "1";

    function run() public {
        bytes memory initCode = type(MyKeyRegistry).creationCode;
        bytes memory data = abi.encodeCall(
            MyKeyRegistry.initialize,
            (
                IKeyRegistry.KeyRegistryInitParams({
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: NAME, version: VERSION})
                })
            )
        );
        runDeployCreate3(NETWORK_SALT, initCode, data);
    }
}
