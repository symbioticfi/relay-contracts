// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";

import {Create3, ICreateX} from "@symbioticfi/core/script/utils/Create3.sol";
import {Logs} from "@symbioticfi/core/script/utils/Logs.sol";

contract BaseDeployScript is Script, Create3 {
    /**
     * @notice Deploys a contract using Create3 and calls an initialization function
     * @param deployer The address of the deployer
     * @param salt An 11-byte salt value for deterministic address generation
     * @param initCode The contract bytecode to deploy
     * @param data The calldata for the initialization function call
     */
    function runDeploy(
        address deployer,
        bytes11 salt,
        bytes memory initCode,
        bytes memory data
    ) public returns (address) {
        vm.startBroadcast(deployer);
        address keyRegistry = deployCreate3AndInit(
            deployer, salt, initCode, data, ICreateX.Values({constructorAmount: 0, initCallAmount: 0})
        );
        vm.stopBroadcast();

        Logs.log(string.concat("Contract deployed to: ", vm.toString(keyRegistry), "\n    salt:", vm.toString(salt)));
        return keyRegistry;
    }
}
