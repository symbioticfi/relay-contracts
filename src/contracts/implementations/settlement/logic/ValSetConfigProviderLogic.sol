// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PersistentSet} from "../../../libraries/structs/PersistentSet.sol";
import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";
import {KeyManagerLogic} from "../../../base/logic/KeyManagerLogic.sol";

import {IValSetConfigProvider} from "../../../../interfaces/implementations/settlement/IValSetConfigProvider.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

library ValSetConfigProviderLogic {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using Checkpoints for Checkpoints.Trace208;
    using Checkpoints for Checkpoints.Trace256;
    using PersistentSet for PersistentSet.Bytes32Set;

    uint64 public constant ValSetConfigProvider_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ValSetConfigProvider")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ValSetConfigProviderStorageLocation =
        0x0e26c25c7769fd2876414d74c7d7fb400553bc4a9e17cd87546c1439a6ebe100;

    function _getValSetConfigProviderStorage()
        internal
        pure
        returns (IValSetConfigProvider.ValSetConfigProviderStorage storage $)
    {
        bytes32 location = ValSetConfigProviderStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function initialize(
        IValSetConfigProvider.ValSetConfigProviderInitParams memory valSetConfigProviderInitParams
    ) public {
        setMaxVotingPower(valSetConfigProviderInitParams.maxVotingPower);
        setMinInclusionVotingPower(valSetConfigProviderInitParams.minInclusionVotingPower);
        setMaxValidatorsCount(valSetConfigProviderInitParams.maxValidatorsCount);
        setRequiredKeyTags(valSetConfigProviderInitParams.requiredKeyTags);
    }

    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getValSetConfigProviderStorage()._maxVotingPower.upperLookupRecent(timestamp, hint);
    }

    function getMaxVotingPower() public view returns (uint256) {
        return _getValSetConfigProviderStorage()._maxVotingPower.latest();
    }

    function getMinInclusionVotingPowerAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getValSetConfigProviderStorage()._minInclusionVotingPower.upperLookupRecent(timestamp, hint);
    }

    function getMinInclusionVotingPower() public view returns (uint256) {
        return _getValSetConfigProviderStorage()._minInclusionVotingPower.latest();
    }

    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getValSetConfigProviderStorage()._maxValidatorsCount.upperLookupRecent(timestamp, hint);
    }

    function getMaxValidatorsCount() public view returns (uint256) {
        return _getValSetConfigProviderStorage()._maxValidatorsCount.latest();
    }

    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.deserializeKeyTags(
            _getValSetConfigProviderStorage()._requiredKeyTags.upperLookupRecent(timestamp, hint)
        );
    }

    function getRequiredKeyTags() public view returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.deserializeKeyTags(_getValSetConfigProviderStorage()._requiredKeyTags.latest());
    }

    function getValSetConfigAt(
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IValSetConfigProvider.ValSetConfig memory) {
        IValSetConfigProvider.ValSetConfigHints memory valSetConfigHints;
        if (hints.length > 0) {
            valSetConfigHints = abi.decode(hints, (IValSetConfigProvider.ValSetConfigHints));
        }

        return IValSetConfigProvider.ValSetConfig({
            maxVotingPower: getMaxVotingPowerAt(timestamp, valSetConfigHints.maxVotingPowerHint),
            minInclusionVotingPower: getMinInclusionVotingPowerAt(timestamp, valSetConfigHints.minInclusionVotingPowerHint),
            maxValidatorsCount: getMaxValidatorsCountAt(timestamp, valSetConfigHints.maxValidatorsCountHint),
            requiredKeyTags: getRequiredKeyTagsAt(timestamp, valSetConfigHints.requiredKeyTagsHint)
        });
    }

    function getValSetConfig() public view returns (IValSetConfigProvider.ValSetConfig memory) {
        return IValSetConfigProvider.ValSetConfig({
            maxVotingPower: getMaxVotingPower(),
            minInclusionVotingPower: getMinInclusionVotingPower(),
            maxValidatorsCount: getMaxValidatorsCount(),
            requiredKeyTags: getRequiredKeyTags()
        });
    }

    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public {
        _getValSetConfigProviderStorage()._maxVotingPower.push(Time.timestamp(), maxVotingPower);
    }

    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public {
        _getValSetConfigProviderStorage()._minInclusionVotingPower.push(Time.timestamp(), minInclusionVotingPower);
    }

    function setMaxValidatorsCount(
        uint256 maxValidatorsCount
    ) public {
        _getValSetConfigProviderStorage()._maxValidatorsCount.push(Time.timestamp(), maxValidatorsCount);
    }

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public {
        _getValSetConfigProviderStorage()._requiredKeyTags.push(
            Time.timestamp(), KeyManagerLogic.serializeKeyTags(requiredKeyTags)
        );
    }
}
