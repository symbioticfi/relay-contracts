// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {Updatable} from "../libraries/utils/Updatable.sol";

contract EpochManager {
    using Updatable for Updatable.Uint208Value;

    error InvalidEpochDuration();

    /// @custom:storage-location erc7201:symbiotic.storage.EpochManager
    struct EpochManagerStorage {
        Updatable.Uint208Value _epochDurationData; // 8 empty bytes + 6 bytes for epochDurationIndex + 6 bytes for epochDurationTimestamp + 6 bytes for epochDuration
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.EpochManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant EpochManagerStorageLocation =
        0xab930e9b836b4d72502da14061937ab080936446173403910135ea983863d400;

    function _getEpochManagerStorage() internal pure returns (EpochManagerStorage storage $) {
        assembly ("memory-safe") {
            $.slot := EpochManagerStorageLocation
        }
    }

    function _getEpochDurationData(
        uint48 timestamp
    ) internal view returns (uint48, uint48, uint48) {
        (uint48 epochDurationTimestamp, uint208 epochDurationData) = _getEpochManagerStorage()._epochDurationData.getWithTimepoint(timestamp);

        return (uint48(epochDurationData), epochDurationTimestamp, uint48(epochDurationData >> 48));
    }

    function _getEpochDurationData() internal view returns (uint48, uint48, uint48) {
        return _getEpochDurationData(Time.timestamp());
    }

    function _getEpochDuration(
        uint48 timestamp
    ) internal view returns (uint48 epochDuration) {
        (epochDuration,,) = _getEpochDurationData(timestamp);
    }

    function _getEpochDuration() internal view returns (uint48) {
        return _getEpochDuration(Time.timestamp());
    }

    function _getCurrentEpoch() internal view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) = _getEpochDurationData();
        return epochDurationIndex + (Time.timestamp() - epochDurationTimestamp) / epochDuration;
    }

    function _getCurrentEpochStart() internal view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) = _getEpochDurationData();
        return epochDurationTimestamp + (_getCurrentEpoch() - epochDurationIndex) * epochDuration;
    }

    function _getNextEpochDuration() internal view returns (uint48) {
        return _getEpochDuration(_getNextEpochStart());
    }

    function _getNextEpochStart() internal view returns (uint48) {
        return _getCurrentEpochStart() + _getEpochDuration();
    }

    function _getPreviousEpochDuration() internal view returns (uint48) {
        return _getEpochDuration(_getCurrentEpochStart() - 1);
    }

    function _getPreviousEpochStart() internal view returns (uint48) {
        return _getCurrentEpochStart() - _getPreviousEpochDuration();
    }

    function __EpochManager_init(uint48 epochDuration, uint48 epochDurationTimestamp) public {
        _setEpochDuration(epochDuration, epochDurationTimestamp, 0);
    }

    function _setEpochDuration(
        uint48 epochDuration
    ) internal {
        uint48 nextEpochDurationTimepoint = _getCurrentEpochStart() + _getEpochDuration();
        _getEpochManagerStorage()._epochDurationData.set(
            Time.timestamp(),
            nextEpochDurationTimepoint,
            _compressEpochDurationData(epochDuration, _getCurrentEpoch() + 1)
        );
    }

    function _setEpochDuration(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal {
        _getEpochManagerStorage()._epochDurationData.set(
            epochDurationTimestamp, _compressEpochDurationData(epochDuration, epochDurationIndex)
        );
    }

    function _compressEpochDurationData(
        uint48 epochDuration,
        uint48 epochDurationIndex
    ) internal pure returns (uint208) {
        if (epochDuration == 0) {
            revert InvalidEpochDuration();
        }
        return (uint208(epochDurationIndex) << 48) | epochDuration;
    }
}
