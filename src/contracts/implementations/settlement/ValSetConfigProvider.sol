// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {KeyManagerLogic} from "../../base/logic/KeyManagerLogic.sol";

import {IValSetConfigProvider} from "../../../interfaces/implementations/settlement/IValSetConfigProvider.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

abstract contract ValSetConfigProvider is PermissionManager, IValSetConfigProvider {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace208;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    /**
     * @inheritdoc IValSetConfigProvider
     */
    uint64 public constant ValSetConfigProvider_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ValSetConfigProvider")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ValSetConfigProviderStorageLocation =
        0x2be14a33b071030ab99526637d9f2b2ad585c7927239b34bb97f4a55a4085300;

    function _getValSetConfigProviderStorage() internal pure returns (ValSetConfigProviderStorage storage $) {
        bytes32 location = ValSetConfigProviderStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __ValSetConfigProvider_init(
        ValSetConfigProviderInitParams memory valSetConfigProviderInitParams
    ) internal virtual onlyInitializing {
        _setMaxVotingPower(valSetConfigProviderInitParams.maxVotingPower);
        _setMinInclusionVotingPower(valSetConfigProviderInitParams.minInclusionVotingPower);
        _setMaxValidatorsCount(valSetConfigProviderInitParams.maxValidatorsCount);
        _setRequiredKeyTags(valSetConfigProviderInitParams.requiredKeyTags);
    }

    // /**
    //  * @inheritdoc IValSetConfigProvider
    //  */
    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) internal view virtual returns (uint256) {
        return _getValSetConfigProviderStorage()._maxVotingPower.upperLookupRecent(timestamp, hint);
    }

    // /**
    //  * @inheritdoc IValSetConfigProvider
    //  */
    function getMaxVotingPower() internal view virtual returns (uint256) {
        return _getValSetConfigProviderStorage()._maxVotingPower.latest();
    }

    // /**
    //  * @inheritdoc IValSetConfigProvider
    //  */
    function getMinInclusionVotingPowerAt(
        uint48 timestamp,
        bytes memory hint
    ) internal view virtual returns (uint256) {
        return _getValSetConfigProviderStorage()._minInclusionVotingPower.upperLookupRecent(timestamp, hint);
    }

    // /**
    //  * @inheritdoc IValSetConfigProvider
    //  */
    function getMinInclusionVotingPower() internal view virtual returns (uint256) {
        return _getValSetConfigProviderStorage()._minInclusionVotingPower.latest();
    }

    // /**
    //  * @inheritdoc IValSetConfigProvider
    //  */
    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) internal view virtual returns (uint256) {
        return _getValSetConfigProviderStorage()._maxValidatorsCount.upperLookupRecent(timestamp, hint);
    }

    // /**
    //  * @inheritdoc IValSetConfigProvider
    //  */
    function getMaxValidatorsCount() internal view virtual returns (uint256) {
        return _getValSetConfigProviderStorage()._maxValidatorsCount.latest();
    }

    // /**
    //  * @inheritdoc IValSetConfigProvider
    //  */
    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.deserializeKeyTags(
            _getValSetConfigProviderStorage()._requiredKeyTags.upperLookupRecent(timestamp, hint)
        );
    }

    // /**
    //  * @inheritdoc IValSetConfigProvider
    //  */
    function getRequiredKeyTags() internal view returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.deserializeKeyTags(_getValSetConfigProviderStorage()._requiredKeyTags.latest());
    }

    /**
     * @inheritdoc IValSetConfigProvider
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
     * @inheritdoc IValSetConfigProvider
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
     * @inheritdoc IValSetConfigProvider
     */
    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public virtual checkPermission {
        _setMaxVotingPower(maxVotingPower);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public virtual checkPermission {
        _setMinInclusionVotingPower(minInclusionVotingPower);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function setMaxValidatorsCount(
        uint256 maxValidatorsCount
    ) public virtual checkPermission {
        _setMaxValidatorsCount(maxValidatorsCount);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public virtual checkPermission {
        _setRequiredKeyTags(requiredKeyTags);
    }

    function _setMaxVotingPower(
        uint256 maxVotingPower
    ) internal virtual {
        _getValSetConfigProviderStorage()._maxVotingPower.push(Time.timestamp(), maxVotingPower);
    }

    function _setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) internal virtual {
        _getValSetConfigProviderStorage()._minInclusionVotingPower.push(Time.timestamp(), minInclusionVotingPower);
    }

    function _setMaxValidatorsCount(
        uint256 maxValidatorsCount
    ) internal virtual {
        _getValSetConfigProviderStorage()._maxValidatorsCount.push(Time.timestamp(), maxValidatorsCount);
    }

    function _setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal virtual {
        _getValSetConfigProviderStorage()._requiredKeyTags.push(
            Time.timestamp(), KeyManagerLogic.serializeKeyTags(requiredKeyTags)
        );
    }
}
