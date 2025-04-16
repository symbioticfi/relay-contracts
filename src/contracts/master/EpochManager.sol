// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {MigratableEntity} from "./common/MigratableEntity.sol";
import {NetworkManager} from "../SDK/managers/NetworkManager.sol";

import {Updatable} from "../libraries/structs/Updatable.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

contract EpochManager is MigratableEntity, NetworkManager {
    using Updatable for Updatable.Uint208Value;

    error InvalidEpochDuration();
    error TooOldTimestamp();

    struct EpochManagerInitParams {
        uint48 epochDuration;
        uint48 epochDurationTimestamp;
    }

    Updatable.Uint208Value _epochDurationData; // 14 empty bytes + 6 bytes for epochDurationIndex + 6 bytes for epochDuration

    constructor(
        address factory
    ) MigratableEntity(factory) {}

    function getCurrentEpoch() public view returns (uint48) {
        return _getEpoch(Time.timestamp());
    }

    function getCurrentEpochDuration() public view returns (uint48) {
        return _getEpochDuration(Time.timestamp());
    }

    function getCurrentEpochStart() public view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) = _getEpochDurationData();
        return epochDurationTimestamp + (getCurrentEpoch() - epochDurationIndex) * epochDuration;
    }

    function getNextEpochDuration() public view returns (uint48) {
        return _getEpochDuration(getNextEpochStart());
    }

    function getNextEpochStart() public view returns (uint48) {
        return getCurrentEpochStart() + getCurrentEpochDuration();
    }

    function getPreviousEpochDuration() public view returns (uint48) {
        return _getEpochDuration(getCurrentEpochStart() - 1);
    }

    function getPreviousEpochStart() public view returns (uint48) {
        return getCurrentEpochStart() - getPreviousEpochDuration();
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public {
        _epochDurationData.set(
            Time.timestamp(),
            getCurrentEpochStart() + getCurrentEpochDuration(),
            _serializeEpochDurationData(epochDuration, getCurrentEpoch() + 1)
        );
    }

    function _setEpochDuration(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        uint48 epochDurationIndex
    ) internal {
        _epochDurationData.set(epochDurationTimestamp, _serializeEpochDurationData(epochDuration, epochDurationIndex));
    }

    function _initialize(
        uint64, /* initialVersion */
        address, /* owner */
        bytes memory data
    ) internal virtual override {
        EpochManagerInitParams memory initParams = abi.decode(data, (EpochManagerInitParams));

        _setEpochDuration(initParams.epochDuration, initParams.epochDurationTimestamp, 0);
    }

    function _migrate(
        uint64, /* oldVersion */
        uint64, /* newVersion */
        bytes calldata /* data */
    ) internal virtual override {
        revert();
    }

    function _getEpochDurationData(
        uint48 timestamp
    ) internal view returns (uint48, uint48, uint48) {
        (uint48 epochDurationTimestamp, uint208 epochDurationData) = _epochDurationData.getWithTimepoint(timestamp);
        (uint48 epochDuration, uint48 epochDurationIndex) = _deserializeEpochDurationData(epochDurationData);
        return (epochDuration, epochDurationTimestamp, epochDurationIndex);
    }

    function _getEpochDurationData() internal view returns (uint48, uint48, uint48) {
        return _getEpochDurationData(Time.timestamp());
    }

    function _getEpoch(
        uint48 timestamp
    ) internal view returns (uint48) {
        (uint48 epochDuration, uint48 epochDurationTimestamp, uint48 epochDurationIndex) =
            _getEpochDurationData(timestamp);

        if (epochDurationTimestamp == 0) {
            (, uint48 currentEpochDurationTimestamp, uint48 currentEpochDurationIndex) =
                _getEpochDurationData(Time.timestamp());
            if (timestamp < currentEpochDurationTimestamp - epochDuration) {
                revert TooOldTimestamp();
            }
            return currentEpochDurationIndex - 1;
        }

        return epochDurationIndex + (timestamp - epochDurationTimestamp) / epochDuration;
    }

    function _getEpochDuration(
        uint48 timestamp
    ) internal view returns (uint48 epochDuration) {
        (epochDuration,,) = _getEpochDurationData(timestamp);
    }

    function _getNextEpoch() internal view returns (uint48) {
        return getCurrentEpoch() + 1;
    }

    function _deserializeEpochDurationData(
        uint208 epochDurationData
    ) internal pure returns (uint48 epochDuration, uint48 epochDurationIndex) {
        epochDuration = uint48(epochDurationData);
        epochDurationIndex = uint48(epochDurationData >> 48);
    }

    function _serializeEpochDurationData(
        uint48 epochDuration,
        uint48 epochDurationIndex
    ) internal pure returns (uint208) {
        if (epochDuration == 0) {
            revert InvalidEpochDuration();
        }
        return (uint208(epochDurationIndex) << 48) | epochDuration;
    }
}
