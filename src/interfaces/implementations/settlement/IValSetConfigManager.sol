// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Checkpoints} from "../../../contracts/libraries/structs/Checkpoints.sol";

interface IValSetConfigManager {
    /// @custom:storage-location erc7201:symbiotic.storage.ValSetConfigManager
    struct ValSetConfigManagerStorage {
        Checkpoints.Trace256 _maxVotingPower;
        Checkpoints.Trace256 _minInclusionVotingPower;
        Checkpoints.Trace256 _maxValidatorsCount;
        Checkpoints.Trace208 _requiredKeyTags;
    }

    struct ValSetConfigManagerInitParams {
        uint256 maxVotingPower;
        uint256 minInclusionVotingPower;
        uint256 maxValidatorsCount;
        uint8[] requiredKeyTags;
    }

    struct ValSetConfig {
        uint256 maxVotingPower;
        uint256 minInclusionVotingPower;
        uint256 maxValidatorsCount;
        uint8[] requiredKeyTags;
    }

    struct ValSetConfigHints {
        bytes maxVotingPowerHint;
        bytes minInclusionVotingPowerHint;
        bytes maxValidatorsCountHint;
        bytes requiredKeyTagsHint;
    }

    function ValSetConfigManager_VERSION() external pure returns (uint64);

    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function getMaxVotingPower() external view returns (uint256);

    function getMinInclusionVotingPowerAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function getMinInclusionVotingPower() external view returns (uint256);

    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function getMaxValidatorsCount() external view returns (uint256);

    function getRequiredKeyTagsAt(uint48 timestamp, bytes memory hint) external view returns (uint8[] memory);

    function getRequiredKeyTags() external view returns (uint8[] memory);

    function getValSetConfigAt(uint48 timestamp, bytes memory hints) external view returns (ValSetConfig memory);

    function getValSetConfig() external view returns (ValSetConfig memory);

    function setMaxVotingPower(
        uint256 maxVotingPower
    ) external;

    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) external;

    function setMaxValidatorsCount(
        uint256 maxValidatorsCount
    ) external;

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) external;
}
