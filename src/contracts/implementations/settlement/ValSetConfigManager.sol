// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {KeyManagerLogic} from "../../base/logic/KeyManagerLogic.sol";

import {IValSetConfigManager} from "../../../interfaces/implementations/settlement/IValSetConfigManager.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

abstract contract ValSetConfigManager is PermissionManager, IValSetConfigManager {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace208;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    /**
     * @inheritdoc IValSetConfigManager
     */
    uint64 public constant ValSetConfigManager_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ValSetConfigManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ValSetConfigManagerStorageLocation =
        0x2be14a33b071030ab99526637d9f2b2ad585c7927239b34bb97f4a55a4085300;

    function _getValSetConfigManagerStorage() internal pure returns (ValSetConfigManagerStorage storage $) {
        bytes32 location = ValSetConfigManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __ValSetConfigManager_init(
        ValSetConfigManagerInitParams memory valSetConfigManagerInitParams
    ) internal virtual onlyInitializing {
        _setMaxVotingPower(valSetConfigManagerInitParams.maxVotingPower);
        _setMinInclusionVotingPower(valSetConfigManagerInitParams.minInclusionVotingPower);
        _setMaxValidatorsCount(valSetConfigManagerInitParams.maxValidatorsCount);
        _setRequiredKeyTags(valSetConfigManagerInitParams.requiredKeyTags);
    }

    // /**
    //  * @inheritdoc IValSetConfigManager
    //  */
    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) internal view virtual returns (uint256) {
        return _getValSetConfigManagerStorage()._maxVotingPower.upperLookupRecent(timestamp, hint);
    }

    // /**
    //  * @inheritdoc IValSetConfigManager
    //  */
    function getMaxVotingPower() internal view virtual returns (uint256) {
        return _getValSetConfigManagerStorage()._maxVotingPower.latest();
    }

    // /**
    //  * @inheritdoc IValSetConfigManager
    //  */
    function getMinInclusionVotingPowerAt(
        uint48 timestamp,
        bytes memory hint
    ) internal view virtual returns (uint256) {
        return _getValSetConfigManagerStorage()._minInclusionVotingPower.upperLookupRecent(timestamp, hint);
    }

    // /**
    //  * @inheritdoc IValSetConfigManager
    //  */
    function getMinInclusionVotingPower() internal view virtual returns (uint256) {
        return _getValSetConfigManagerStorage()._minInclusionVotingPower.latest();
    }

    // /**
    //  * @inheritdoc IValSetConfigManager
    //  */
    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) internal view virtual returns (uint256) {
        return _getValSetConfigManagerStorage()._maxValidatorsCount.upperLookupRecent(timestamp, hint);
    }

    // /**
    //  * @inheritdoc IValSetConfigManager
    //  */
    function getMaxValidatorsCount() internal view virtual returns (uint256) {
        return _getValSetConfigManagerStorage()._maxValidatorsCount.latest();
    }

    // /**
    //  * @inheritdoc IValSetConfigManager
    //  */
    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.deserializeKeyTags(
            _getValSetConfigManagerStorage()._requiredKeyTags.upperLookupRecent(timestamp, hint)
        );
    }

    // /**
    //  * @inheritdoc IValSetConfigManager
    //  */
    function getRequiredKeyTags() internal view returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.deserializeKeyTags(_getValSetConfigManagerStorage()._requiredKeyTags.latest());
    }

    /**
     * @inheritdoc IValSetConfigManager
     */
    function getValSetConfigAt(
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (ValSetConfig memory) {
        ValSetConfigHints memory valSetConfigHints;
        if (hints.length > 0) {
            valSetConfigHints = abi.decode(hints, (ValSetConfigHints));
        }

        return ValSetConfig({
            maxVotingPower: getMaxVotingPowerAt(timestamp, valSetConfigHints.maxVotingPowerHint),
            minInclusionVotingPower: getMinInclusionVotingPowerAt(timestamp, valSetConfigHints.minInclusionVotingPowerHint),
            maxValidatorsCount: getMaxValidatorsCountAt(timestamp, valSetConfigHints.maxValidatorsCountHint),
            requiredKeyTags: getRequiredKeyTagsAt(timestamp, valSetConfigHints.requiredKeyTagsHint)
        });
    }

    /**
     * @inheritdoc IValSetConfigManager
     */
    function getValSetConfig() public view virtual returns (ValSetConfig memory) {
        return ValSetConfig({
            maxVotingPower: getMaxVotingPower(),
            minInclusionVotingPower: getMinInclusionVotingPower(),
            maxValidatorsCount: getMaxValidatorsCount(),
            requiredKeyTags: getRequiredKeyTags()
        });
    }

    /**
     * @inheritdoc IValSetConfigManager
     */
    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public virtual checkPermission {
        _setMaxVotingPower(maxVotingPower);
    }

    /**
     * @inheritdoc IValSetConfigManager
     */
    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public virtual checkPermission {
        _setMinInclusionVotingPower(minInclusionVotingPower);
    }

    /**
     * @inheritdoc IValSetConfigManager
     */
    function setMaxValidatorsCount(
        uint256 maxValidatorsCount
    ) public virtual checkPermission {
        _setMaxValidatorsCount(maxValidatorsCount);
    }

    /**
     * @inheritdoc IValSetConfigManager
     */
    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public virtual checkPermission {
        _setRequiredKeyTags(requiredKeyTags);
    }

    function _setMaxVotingPower(
        uint256 maxVotingPower
    ) internal virtual {
        _getValSetConfigManagerStorage()._maxVotingPower.push(Time.timestamp(), maxVotingPower);
    }

    function _setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) internal virtual {
        _getValSetConfigManagerStorage()._minInclusionVotingPower.push(Time.timestamp(), minInclusionVotingPower);
    }

    function _setMaxValidatorsCount(
        uint256 maxValidatorsCount
    ) internal virtual {
        _getValSetConfigManagerStorage()._maxValidatorsCount.push(Time.timestamp(), maxValidatorsCount);
    }

    function _setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal virtual {
        _getValSetConfigManagerStorage()._requiredKeyTags.push(
            Time.timestamp(), KeyManagerLogic.serializeKeyTags(requiredKeyTags)
        );
    }
}
