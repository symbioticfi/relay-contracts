// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EpochCapture} from "../../modules/capture-timestamps/EpochCapture.sol";
import {NetworkManager} from "../../base/NetworkManager.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";

import {ISigVerifier} from "../../../interfaces/other/ISigVerifier.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";

abstract contract SettlementManager is NetworkManager, EpochCapture, EIP712Upgradeable {
    using Checkpoints for Checkpoints.Trace208;

    uint64 public constant SettlementManager_VERSION = 1;

    error SettlementManager_InvalidPhase();
    error SettlementManager_InvalidVersion();
    error SettlementManager_Duplicate();
    error SettlementManager_VerificationFailed();
    error SettlementManager_EpochDurationTooShort();

    enum ValSetPhase {
        IDLE,
        COMMIT,
        FAIL
    }

    struct Key {
        uint8 tag;
        bytes payload;
    }

    struct ValSetHeader {
        uint8 version;
        Key[] activeAggregatedKeys;
        uint256 totalActiveVotingPower;
        bytes32 validatorsSszMRoot;
        bytes extraData;
    }

    struct SettlementManagerStorage {
        Checkpoints.Trace208 _requiredKeyTag;
        Checkpoints.Trace208 _commitDuration;
        mapping(uint8 => Checkpoints.Trace208) _quorumThreshold;
        Checkpoints.Trace208 _sigVerifier;
        mapping(uint48 epoch => ValSetHeaderStorage) _valSetHeader;
    }

    struct ActiveAggregatedKeysStorage {
        uint8[] keyTags;
        mapping(uint8 => bytes) keyByTag;
    }

    struct ValSetHeaderStorage {
        uint8 version;
        uint8 valSetKeyTag;
        ActiveAggregatedKeysStorage activeAggregatedKeys;
        uint256 totalActiveVotingPower;
        bytes32 validatorsSszMRoot;
        bytes extraData;
    }

    struct QuorumThreshold {
        uint8 keyTag;
        uint208 threshold;
    }

    uint8 public constant VALIDATOR_SET_VERSION = 1;

    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash)");

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.SettlementManagerManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SettlementManagerStorageLocation =
        0xcee92923a0c63eca6fc0402d78c9efde9f9f3dc73e6f9e14501bf734ed77f100;

    function _getSettlementManagerStorage() internal pure returns (SettlementManagerStorage storage $) {
        bytes32 location = SettlementManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __SettlementManager_init(
        address network,
        uint96 subnetworkID,
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        string memory name,
        QuorumThreshold[] memory quorumThresholds,
        uint48 commitDuration,
        uint8 requiredKeyTag,
        address sigVerifier
    ) internal virtual onlyInitializing {
        __NetworkManager_init(network, subnetworkID);
        __EpochCapture_init(epochDuration, epochDurationTimestamp);
        __EIP712_init(name, "1");

        SettlementManagerStorage storage $ = _getSettlementManagerStorage();

        if (epochDuration <= commitDuration) {
            revert SettlementManager_EpochDurationTooShort();
        }
        for (uint256 i; i < quorumThresholds.length; ++i) {
            $._quorumThreshold[quorumThresholds[i].keyTag].push(0, quorumThresholds[i].threshold);
        }
        $._commitDuration.push(0, commitDuration);
        $._requiredKeyTag.push(0, requiredKeyTag);
        $._sigVerifier.push(0, uint160(sigVerifier));
    }

    function getCurrentValSetTimestamp() public view returns (uint256) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.IDLE || currentPhase == ValSetPhase.FAIL) {
            return getCurrentEpochStart();
        }
        return getEpochStart(getCurrentEpoch() - 1, new bytes(0));
    }

    function getQuorumThresholdAt(uint8 keyTag, uint48 epoch, bytes memory hint) public view returns (uint208) {
        return _getSettlementManagerStorage()._quorumThreshold[keyTag].upperLookupRecent(epoch, hint);
    }

    function getQuorumThreshold(
        uint8 keyTag
    ) public view returns (uint208) {
        return _getCurrentValue(_getSettlementManagerStorage()._quorumThreshold[keyTag], getCurrentEpoch());
    }

    function getCommitDurationAt(uint48 epoch, bytes memory hint) public view returns (uint48) {
        return uint48(_getSettlementManagerStorage()._commitDuration.upperLookupRecent(epoch, hint));
    }

    function getCommitDuration() public view returns (uint48) {
        return uint48(_getCurrentValue(_getSettlementManagerStorage()._commitDuration, getCurrentEpoch()));
    }

    function getRequiredKeyTagAt(uint48 epoch, bytes memory hint) public view returns (uint8) {
        return uint8(_getSettlementManagerStorage()._requiredKeyTag.upperLookupRecent(epoch, hint));
    }

    function getRequiredKeyTag() public view returns (uint8) {
        return uint8(_getCurrentValue(_getSettlementManagerStorage()._requiredKeyTag, getCurrentEpoch()));
    }

    function getSigVerifierAt(uint48 epoch, bytes memory hint) public view returns (address) {
        return address(uint160(_getSettlementManagerStorage()._sigVerifier.upperLookupRecent(epoch, hint)));
    }

    function getSigVerifier() public view returns (address) {
        return address(uint160(_getCurrentValue(_getSettlementManagerStorage()._sigVerifier, getCurrentEpoch())));
    }

    function isValSetHeaderSubmittedAt(
        uint48 epoch
    ) public view returns (bool) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].version > 0;
    }

    function isValSetHeaderSubmitted() public view returns (bool) {
        return isValSetHeaderSubmittedAt(getCurrentEpoch());
    }

    function getCurrentPhase() public view returns (ValSetPhase) {
        uint48 currentEpoch = getCurrentEpoch();
        if (currentEpoch == 0 || !isValSetHeaderSubmittedAt(currentEpoch - 1)) {
            return isValSetHeaderSubmittedAt(currentEpoch) ? ValSetPhase.IDLE : ValSetPhase.FAIL;
        }
        uint48 commitPhaseDeadline = getCurrentEpochStart() + getCommitDuration();
        if (Time.timestamp() < commitPhaseDeadline) {
            return ValSetPhase.COMMIT;
        }
        if (isValSetHeaderSubmittedAt(currentEpoch)) {
            return ValSetPhase.IDLE;
        }
        return ValSetPhase.FAIL;
    }

    function getValSetHeaderAt(
        uint48 epoch
    ) public view returns (ValSetHeader memory) {
        SettlementManagerStorage storage $ = _getSettlementManagerStorage();

        ValSetHeaderStorage storage headerStorage = $._valSetHeader[epoch];

        Key[] memory activeAggregatedKeys = new Key[](headerStorage.activeAggregatedKeys.keyTags.length);
        for (uint256 i; i < headerStorage.activeAggregatedKeys.keyTags.length; ++i) {
            activeAggregatedKeys[i] = Key({
                tag: headerStorage.activeAggregatedKeys.keyTags[i],
                payload: headerStorage.activeAggregatedKeys.keyByTag[headerStorage.activeAggregatedKeys.keyTags[i]]
            });
        }
        return ValSetHeader({
            version: headerStorage.version,
            activeAggregatedKeys: activeAggregatedKeys,
            totalActiveVotingPower: headerStorage.totalActiveVotingPower,
            validatorsSszMRoot: headerStorage.validatorsSszMRoot,
            extraData: headerStorage.extraData
        });
    }

    function getValSetHeader() public view returns (ValSetHeader memory header) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return header;
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getValSetHeaderAt(currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1);
    }

    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint8) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].version;
    }

    function getVersionFromValSetHeader() public view returns (uint8) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return 0;
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getVersionFromValSetHeaderAt(currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1);
    }

    function getActiveAggregatedKeyFromValSetHeaderAt(uint48 epoch, uint8 keyTag) public view returns (bytes memory) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].activeAggregatedKeys.keyByTag[keyTag];
    }

    function getActiveAggregatedKeyFromValSetHeader(
        uint8 keyTag
    ) public view returns (bytes memory) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return new bytes(0);
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getActiveAggregatedKeyFromValSetHeaderAt(
            currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1, keyTag
        );
    }

    function getTotalActiveVotingPowerFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint256) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].totalActiveVotingPower;
    }

    function getTotalActiveVotingPowerFromValSetHeader() public view returns (uint256) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return 0;
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getTotalActiveVotingPowerFromValSetHeaderAt(
            currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1
        );
    }

    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (bytes32) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].validatorsSszMRoot;
    }

    function getValidatorsSszMRootFromValSetHeader() public view returns (bytes32) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return bytes32(0);
        }
        uint48 currentEpoch = getCurrentEpoch();
        return
            getValidatorsSszMRootFromValSetHeaderAt(currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1);
    }

    function getExtraDataFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (bytes memory) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].extraData;
    }

    function getExtraDataFromValSetHeader() public view returns (bytes memory) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return new bytes(0);
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getExtraDataFromValSetHeaderAt(currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1);
    }

    function verifyQuorumSig(
        bytes memory message,
        uint8 keyTag,
        uint208 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        return ISigVerifier(getSigVerifier()).verifyQuorumSig(address(this), message, keyTag, quorumThreshold, proof);
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public override {
        if (epochDuration <= _getSettlementManagerStorage()._commitDuration.latest()) {
            revert SettlementManager_EpochDurationTooShort();
        }
        super.setEpochDuration(epochDuration);
    }

    function setQuorumThreshold(uint8 keyTag, uint208 quorumThreshold) public {
        _getSettlementManagerStorage()._quorumThreshold[keyTag].push(_getNextEpoch(), quorumThreshold);
    }

    function setCommitDuration(
        uint48 commitDuration
    ) public {
        _getSettlementManagerStorage()._commitDuration.push(_getNextEpoch(), commitDuration);
    }

    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public {
        _getSettlementManagerStorage()._requiredKeyTag.push(_getNextEpoch(), requiredKeyTag);
    }

    function setSigVerifier(
        address sigVerifier
    ) public {
        _getSettlementManagerStorage()._sigVerifier.push(_getNextEpoch(), uint160(sigVerifier));
    }

    function setGenesis(
        ValSetHeader memory valSetHeader
    ) public checkAccess {
        if (getCurrentPhase() != ValSetPhase.FAIL) {
            revert SettlementManager_InvalidPhase();
        }

        _setValSetHeader(valSetHeader);
    }

    function commitValSetHeader(ValSetHeader memory header, bytes calldata proof) public {
        if (getCurrentPhase() != ValSetPhase.COMMIT) {
            revert SettlementManager_InvalidPhase();
        }
        uint8 requiredKeyTag = getRequiredKeyTag();
        if (
            !verifyQuorumSig(
                abi.encode(
                    _hashTypedDataV4(
                        keccak256(
                            abi.encode(
                                VALSET_HEADER_COMMIT_TYPEHASH,
                                SUBNETWORK(),
                                getCurrentEpoch(),
                                keccak256(abi.encode(header))
                            )
                        )
                    )
                ),
                requiredKeyTag,
                getQuorumThreshold(requiredKeyTag),
                proof
            )
        ) {
            revert SettlementManager_VerificationFailed();
        }

        _setValSetHeader(header);
    }

    function _setValSetHeader(
        ValSetHeader memory header
    ) internal {
        if (header.version != VALIDATOR_SET_VERSION) {
            revert SettlementManager_InvalidVersion();
        }

        SettlementManagerStorage storage $ = _getSettlementManagerStorage();
        uint48 currentEpoch = getCurrentEpoch();

        ValSetHeaderStorage storage headerStorage = $._valSetHeader[currentEpoch];

        if (isValSetHeaderSubmittedAt(currentEpoch)) {
            ActiveAggregatedKeysStorage storage activeAggregatedKeysStorage = headerStorage.activeAggregatedKeys;
            for (uint256 i; i < activeAggregatedKeysStorage.keyTags.length; ++i) {
                delete activeAggregatedKeysStorage.keyByTag[activeAggregatedKeysStorage.keyTags[i]];
            }
            delete $._valSetHeader[currentEpoch];
        }

        headerStorage.version = header.version;
        uint128 activeAggregatedKeysInputtedTags;
        for (uint256 i; i < header.activeAggregatedKeys.length; ++i) {
            if ((activeAggregatedKeysInputtedTags >> header.activeAggregatedKeys[i].tag) & 1 == 1) {
                revert SettlementManager_Duplicate();
            }
            headerStorage.activeAggregatedKeys.keyTags.push(header.activeAggregatedKeys[i].tag);
            headerStorage.activeAggregatedKeys.keyByTag[header.activeAggregatedKeys[i].tag] =
                header.activeAggregatedKeys[i].payload;

            activeAggregatedKeysInputtedTags |= uint128(1 << header.activeAggregatedKeys[i].tag);
        }
        headerStorage.totalActiveVotingPower = header.totalActiveVotingPower;
        headerStorage.validatorsSszMRoot = header.validatorsSszMRoot;
        headerStorage.extraData = header.extraData;
    }
}
