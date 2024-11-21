// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {BaseMiddleware} from "../../BaseMiddleware.sol";

abstract contract EpochCapture is BaseMiddleware {
    bool public constant EpochCaptureEnabled = true;

    struct EpochCaptureStorage {
        uint48 startTimestamp;
        uint48 epochDuration;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.EpochCapture")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant EpochCaptureStorageLocation =
        0x4e241e104e7ef4df0fc8eb6aad7b0f201c6126c722652f1bd1305b6b75c86d00;

    function _getEpochCaptureStorage() private pure returns (EpochCaptureStorage storage $) {
        bytes32 location = EpochCaptureStorageLocation;
        assembly {
            $.slot := location
        }
    }

    /* 
     * @notice initalizer of the Epochs contract.
     * @param epochDuration The duration of each epoch.
     */
    function __EpochCapture_init(
        uint48 epochDuration
    ) internal onlyInitializing {
        EpochCaptureStorage storage $ = _getEpochCaptureStorage();
        $.epochDuration = epochDuration;
        $.startTimestamp = Time.timestamp();
    }

    /* 
     * @notice Returns the start timestamp for a given epoch.
     * @param epoch The epoch number.
     * @return The start timestamp.
     */
    function getEpochStart(
        uint48 epoch
    ) public view returns (uint48) {
        EpochCaptureStorage storage $ = _getEpochCaptureStorage();
        return $.startTimestamp + epoch * $.epochDuration;
    }

    /* 
     * @notice Returns the current epoch.
     * @return The current epoch.
     */
    function getCurrentEpoch() public view returns (uint48) {
        EpochCaptureStorage storage $ = _getEpochCaptureStorage();
        return (Time.timestamp() - $.startTimestamp) / $.epochDuration;
    }

    /* 
     * @notice Returns the capture timestamp for the current epoch.
     * @return The capture timestamp.
     */
    function getCaptureTimestamp() public view override returns (uint48 timestamp) {
        return getEpochStart(getCurrentEpoch());
    }
}
