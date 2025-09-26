// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";

import {CreateXWrapper} from "@symbioticfi/core/script/utils/CreateXWrapper.sol";

import {TransparentUpgradeableProxy} from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

abstract contract RelayDeploy is Script, CreateXWrapper {
    // CREATE3 salts
    bytes32 public VOTING_POWERS_SALT = keccak256("VotingPowers");
    bytes32 public KEY_REGISTRY_SALT = keccak256("KeyRegistry");
    bytes32 public SETTLEMENT_SALT = keccak256("Settlement");
    bytes32 public DRIVER_SALT = keccak256("Driver");

    function _settlementParams() internal virtual returns (address implementation, bytes memory initData);
    function _votingPowerParams() internal virtual returns (address implementation, bytes memory initData);
    function _keyRegistryParams() internal virtual returns (address implementation, bytes memory initData);
    function _driverParams() internal virtual returns (address implementation, bytes memory initData);

    function run() public virtual {
        deploySettlement();
        deployVotingPower();
        deployKeyRegistry();
        deployDriver();
    }

    function deployVotingPower() public virtual returns (address) {
        vm.startBroadcast();
        (address implementation, bytes memory initData) = _votingPowerParams();
        address newContract = _deployContract(VOTING_POWERS_SALT, implementation, initData);
        vm.stopBroadcast();
        return newContract;
    }

    function deployKeyRegistry() public virtual returns (address) {
        vm.startBroadcast();
        (address implementation, bytes memory initData) = _keyRegistryParams();
        address newContract = _deployContract(KEY_REGISTRY_SALT, implementation, initData);
        vm.stopBroadcast();
        return newContract;
    }

    function deployDriver() public virtual returns (address) {
        vm.startBroadcast();
        (address implementation, bytes memory initData) = _driverParams();
        address newContract = _deployContract(DRIVER_SALT, implementation, initData);
        vm.stopBroadcast();
        return newContract;
    }

    function deploySettlement() public virtual returns (address) {
        vm.startBroadcast();
        (address implementation, bytes memory initData) = _settlementParams();
        address newContract = _deployContract(SETTLEMENT_SALT, implementation, initData);
        vm.stopBroadcast();
        return newContract;
    }

    function _getInitialOwner() internal virtual returns (address) {
        (,, address deployer) = vm.readCallers();
        return deployer;
    }

    function _deployContract(
        bytes32 salt,
        address implementation,
        bytes memory initData
    ) internal virtual returns (address) {
        address initialOwner = _getInitialOwner();

        bytes memory emptyData;
        bytes memory proxyInitCode = abi.encodePacked(
            type(TransparentUpgradeableProxy).creationCode, abi.encode(implementation, initialOwner, emptyData)
        );

        if (initData.length > 0) {
            return deployCreate3AndInit(salt, proxyInitCode, initData);
        } else {
            return deployCreate3(salt, proxyInitCode);
        }
    }
}
