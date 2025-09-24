// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";

import "@symbioticfi/core/script/utils/CreateXWrapper.sol";
import {Logs} from "@symbioticfi/core/script/utils/Logs.sol";

contract BaseDeployScript is Script, CreateXWrapper {
    /**
     * @notice Deploys a contract using Create3 and calls an initialization function
     * @param salt An 11-byte salt value for deterministic address generation
     * @param initCode The contract bytecode to deploy
     * @param data The calldata for the initialization function call
     */
    function runDeployCreate3(
        bytes32 salt,
        bytes memory initCode,
        bytes memory data
    ) public returns (address) {
        vm.startBroadcast();
        address keyRegistry = deployCreate3AndInit(
            salt, initCode, data, ICreateX.Values({constructorAmount: 0, initCallAmount: 0})
        );
        vm.stopBroadcast();

        Logs.log(string.concat("Contract deployed to: ", vm.toString(keyRegistry), "\n    salt:", vm.toString(salt)));
        return keyRegistry;
    }

    /**
     * @notice Deploys a contract using Create and calls an initialization function
     * @param initCode The contract bytecode to deploy
     * @param data The calldata for the initialization function call
     */
    function runDeploy(
        bytes memory initCode,
        bytes memory data
    ) public returns (address) {
        vm.startBroadcast();
        address keyRegistry = deployCreateAndInit(
            initCode, data, ICreateX.Values({constructorAmount: 0, initCallAmount: 0})
        );
        vm.stopBroadcast();

        Logs.log(string.concat("Contract deployed to: ", vm.toString(keyRegistry)));
        return keyRegistry;
    }
}
