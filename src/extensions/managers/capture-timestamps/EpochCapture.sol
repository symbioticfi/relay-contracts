// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {CaptureTimestampManager} from "../../../managers/extendable/CaptureTimestampManager.sol";
import {IEpochCapture} from "../../../interfaces/extensions/managers/capture-timestamps/IEpochCapture.sol";

/**
 * @title EpochCapture
 * @notice A middleware extension that captures timestamps based on epochs
 * @dev Implements CaptureTimestampManager with epoch-based timestamp capture
 * @dev Epochs are fixed time periods starting from a base timestamp
 */
abstract contract EpochCapture is CaptureTimestampManager, IEpochCapture {
    uint64 public constant EpochCapture_VERSION = 1;

    struct EpochCaptureStorage {
        uint48 startTimestamp;
        uint48 epochDuration;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.EpochCapture")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant EpochCaptureStorageLocation =
        0x4e241e104e7ef4df0fc8eb6aad7b0f201c6126c722652f1bd1305b6b75c86d00;

    function _getEpochCaptureStorage() internal pure returns (EpochCaptureStorage storage $) {
        bytes32 location = EpochCaptureStorageLocation;
        assembly {
            $.slot := location
        }
    }

    /* 
     * @notice initializer of the Epochs contract.
     * @param epochDuration The duration of each epoch.
     */
    function __EpochCapture_init(
        uint48 epochDuration
    ) internal onlyInitializing {
        EpochCaptureStorage storage $ = _getEpochCaptureStorage();
        $.epochDuration = epochDuration;
        $.startTimestamp = _now();
    }

    /**
     * @inheritdoc IEpochCapture
     */
    function getEpochStart(
        uint48 epoch
    ) public view returns (uint48) {
        EpochCaptureStorage storage $ = _getEpochCaptureStorage();
        return $.startTimestamp + epoch * $.epochDuration;
    }

    /**
     * @inheritdoc IEpochCapture
     */
    function getCurrentEpoch() public view returns (uint48) {
        EpochCaptureStorage storage $ = _getEpochCaptureStorage();
        if (_now() == $.startTimestamp) {
            return 0;
        }

        return (_now() - $.startTimestamp - 1) / $.epochDuration;
    }

    /* 
     * @notice Returns the capture timestamp for the current epoch.
     * @return The capture timestamp.
     */
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return getEpochStart(getCurrentEpoch());
    }

    /**
     * @inheritdoc IEpochCapture
     */
    function getEpochDuration() public view returns (uint48) {
        EpochCaptureStorage storage $ = _getEpochCaptureStorage();
        return $.epochDuration;
    }
}
