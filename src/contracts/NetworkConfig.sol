// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {MigratableEntity} from "./MigratableEntity.sol";

import {Updatable} from "./libraries/utils/Updatable.sol";
import {NetworkConfigLogic} from "./libraries/logic/NetworkConfigLogic.sol";

import {INetworkConfig} from "../interfaces/INetworkConfig.sol";

import {AccessControlUpgradeable} from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

contract NetworkConfig is MigratableEntity, AccessControlUpgradeable, INetworkConfig {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.NetworkConfig")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant NetworkConfigStorageLocation =
        0xfd87879bc98f37af7578af722aecfbe5843e5ad354da2d1e70cb5157c4ec8800;

    bytes32 internal constant EPOCH_DURATION_SET_ROLE = keccak256("EPOCH_DURATION_SET_ROLE");
    bytes32 internal constant HOOK_RECEIVER_SET_ROLE = keccak256("HOOK_RECEIVER_SET_ROLE");

    constructor(
        address factory
    ) MigratableEntity(factory) {}

    function getNetwork() public view returns (address) {
        return NetworkConfigLogic.getNetwork(_getNetworkConfigStorage());
    }

    function getSubnetworkIdentifier() public view returns (uint96) {
        return NetworkConfigLogic.getSubnetworkID(_getNetworkConfigStorage());
    }

    function getSubnetwork() public view returns (bytes32) {
        return NetworkConfigLogic.getSubnetwork(_getNetworkConfigStorage());
    }

    function getEpochDuration() public view returns (uint48) {
        return NetworkConfigLogic.getEpochDuration(_getNetworkConfigStorage());
    }

    function getCurrentEpoch() public view returns (uint48) {
        return NetworkConfigLogic.getCurrentEpoch(_getNetworkConfigStorage());
    }

    function getCurrentEpochStartTs() public view returns (uint48) {
        return NetworkConfigLogic.getCurrentEpochStartTs(_getNetworkConfigStorage());
    }

    function getHookReceiver() public view returns (address) {
        return NetworkConfigLogic.getHookReceiver(_getNetworkConfigStorage());
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public onlyRole(EPOCH_DURATION_SET_ROLE) {
        NetworkConfigLogic.setEpochDuration(_getNetworkConfigStorage(), epochDuration);
    }

    function setHookReceiver(
        address hookReceiver
    ) public onlyRole(HOOK_RECEIVER_SET_ROLE) {
        NetworkConfigLogic.setHookReceiver(_getNetworkConfigStorage(), hookReceiver);
    }

    function _getNetworkConfigStorage() internal pure returns (NetworkConfigStorage storage $) {
        assembly ("memory-safe") {
            $.slot := NetworkConfigStorageLocation
        }
    }

    function _initialize(
        uint64, /* initialVersion */
        address, /* owner */
        bytes memory data
    ) internal virtual override {
        NetworkConfigInitParams memory initParams = abi.decode(data, (NetworkConfigInitParams));
        _grantRole(DEFAULT_ADMIN_ROLE, initParams.defaultAdminRoleHolder);

        NetworkConfigLogic.initialize(_getNetworkConfigStorage(), initParams);
    }
}
