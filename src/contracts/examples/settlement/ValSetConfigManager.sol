// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

abstract contract ValSetConfigManager is PermissionManager {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    uint64 public constant ValSetConfigManager_VERSION = 1;

    struct ValSetConfig {
        uint256 maxVotingPower;
        uint256 minInclusionVotingPower;
        uint256 maxValidatorsCount;
    }

    struct ValSetConfigHints {
        bytes maxVotingPowerHint;
        bytes minInclusionVotingPowerHint;
        bytes maxValidatorsCountHint;
    }

    struct ValSetConfigManagerStorage {
        Checkpoints.Trace256 _maxVotingPower;
        Checkpoints.Trace256 _minInclusionVotingPower;
        Checkpoints.Trace256 _maxValidatorsCount;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ValSetConfigManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ValSetConfigManagerStorageLocation =
        0xcee92923a0c63eca6fc0402d78c9efde9f9f3dc73e6f9e14501bf734ed77f100;

    function _getValSetConfigManagerStorage() internal pure returns (ValSetConfigManagerStorage storage $) {
        bytes32 location = ValSetConfigManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __ValSetConfigManager_init(
        ValSetConfig memory valSetConfig
    ) internal virtual onlyInitializing {
        ValSetConfigManagerStorage storage $ = _getValSetConfigManagerStorage();

        $._maxVotingPower.push(Time.timestamp(), valSetConfig.maxVotingPower);
        $._minInclusionVotingPower.push(Time.timestamp(), valSetConfig.minInclusionVotingPower);
        $._maxValidatorsCount.push(Time.timestamp(), valSetConfig.maxValidatorsCount);
    }

    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getValSetConfigManagerStorage()._maxVotingPower.upperLookupRecent(timestamp, hint);
    }

    function getMaxVotingPower() public view returns (uint256) {
        return _getValSetConfigManagerStorage()._maxVotingPower.latest();
    }

    function getMinInclusionVotingPowerAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getValSetConfigManagerStorage()._minInclusionVotingPower.upperLookupRecent(timestamp, hint);
    }

    function getMinInclusionVotingPower() public view returns (uint256) {
        return _getValSetConfigManagerStorage()._minInclusionVotingPower.latest();
    }

    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getValSetConfigManagerStorage()._maxValidatorsCount.upperLookupRecent(timestamp, hint);
    }

    function getMaxValidatorsCount() public view returns (uint256) {
        return _getValSetConfigManagerStorage()._maxValidatorsCount.latest();
    }

    function getValSetConfigAt(uint48 timestamp, bytes memory hints) public view returns (ValSetConfig memory) {
        ValSetConfigHints memory valSetConfigHints;
        if (hints.length > 0) {
            valSetConfigHints = abi.decode(hints, (ValSetConfigHints));
        }

        return ValSetConfig({
            maxVotingPower: getMaxVotingPowerAt(timestamp, valSetConfigHints.maxVotingPowerHint),
            minInclusionVotingPower: getMinInclusionVotingPowerAt(timestamp, valSetConfigHints.minInclusionVotingPowerHint),
            maxValidatorsCount: getMaxValidatorsCountAt(timestamp, valSetConfigHints.maxValidatorsCountHint)
        });
    }

    function getValSetConfig() public view returns (ValSetConfig memory) {
        return ValSetConfig({
            maxVotingPower: getMaxVotingPower(),
            minInclusionVotingPower: getMinInclusionVotingPower(),
            maxValidatorsCount: getMaxValidatorsCount()
        });
    }

    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public checkPermission {
        _getValSetConfigManagerStorage()._maxVotingPower.push(Time.timestamp(), maxVotingPower);
    }

    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public checkPermission {
        _getValSetConfigManagerStorage()._minInclusionVotingPower.push(Time.timestamp(), minInclusionVotingPower);
    }

    function setMaxValidatorsCount(
        uint256 maxValidatorsCount
    ) public checkPermission {
        _getValSetConfigManagerStorage()._maxValidatorsCount.push(Time.timestamp(), maxValidatorsCount);
    }
}
