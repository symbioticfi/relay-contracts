// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EpochManager} from "../../base/EpochManager.sol";
import {NetworkManager} from "../../base/NetworkManager.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";
import {ISettlement} from "../../../interfaces/modules/settlement/ISettlement.sol";
import {IEpochManager} from "../../../interfaces/base/IEpochManager.sol";
import {OzEIP712} from "../../base/common/OzEIP712.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

abstract contract Settlement is NetworkManager, EpochManager, OzEIP712, MulticallUpgradeable, ISettlement {
    using Checkpoints for Checkpoints.Trace208;

    /**
     * @inheritdoc ISettlement
     */
    uint64 public constant Settlement_VERSION = 1;

    /**
     * @inheritdoc ISettlement
     */
    uint8 public constant VALIDATOR_SET_VERSION = 1;

    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash,bytes32 extraDataHash)");

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.Settlement")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SettlementStorageLocation =
        0xad58d27706f0faa4634000571d7d9c19a0123d182a06ad775cbe8a9c22f64400;

    function _getSettlementStorage() internal pure returns (SettlementStorage storage $) {
        bytes32 location = SettlementStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __Settlement_init(
        SettlementInitParams memory settlementInitParams
    ) internal virtual onlyInitializing {
        __NetworkManager_init(settlementInitParams.networkManagerInitParams);
        __EpochManager_init(settlementInitParams.epochManagerInitParams);
        __OzEIP712_init(settlementInitParams.ozEip712InitParams);

        SettlementStorage storage $ = _getSettlementStorage();

        if (settlementInitParams.epochManagerInitParams.epochDuration <= settlementInitParams.commitDuration) {
            revert Settlement_CommitDurationTooLong();
        }
        if (settlementInitParams.commitDuration == 0) {
            revert Settlement_CommitDurationTooShort();
        }
        if (settlementInitParams.sigVerifier == address(0)) {
            revert Settlement_InvalidSigVerifier();
        }

        $._prolongDuration.push(Time.timestamp(), settlementInitParams.prolongDuration);
        emit InitProlongDuration(settlementInitParams.prolongDuration);
        $._commitDuration.push(Time.timestamp(), settlementInitParams.commitDuration);
        emit InitCommitDuration(settlementInitParams.commitDuration);
        $._requiredKeyTag.push(Time.timestamp(), settlementInitParams.requiredKeyTag);
        emit InitRequiredKeyTag(settlementInitParams.requiredKeyTag);
        $._sigVerifier.push(Time.timestamp(), uint160(settlementInitParams.sigVerifier));
        emit InitSigVerifier(settlementInitParams.sigVerifier);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentValSetTimestamp() public view virtual returns (uint48) {
        return getEpochStart(getCurrentValSetEpoch(), new bytes(0));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentValSetEpoch() public view virtual returns (uint48) {
        uint48 currentEpoch = getCurrentEpoch();
        if (currentEpoch == 0) {
            return currentEpoch;
        }
        if (
            isValSetHeaderCommittedAt(currentEpoch - 1)
                && Time.timestamp() < getCurrentEpochStart() + getCommitDuration()
        ) {
            return currentEpoch - 1;
        }
        if (isValSetHeaderCommittedAt(currentEpoch)) {
            return currentEpoch;
        }
        uint48 lastCommittedHeaderNextCaptureTimestamp = getEpochStart(getLastCommittedHeaderEpoch() + 1, new bytes(0));
        if (
            Time.timestamp()
                < lastCommittedHeaderNextCaptureTimestamp
                    + getCommitDurationAt(lastCommittedHeaderNextCaptureTimestamp, new bytes(0))
                    + getProlongDurationAt(lastCommittedHeaderNextCaptureTimestamp, new bytes(0))
        ) {
            return getLastCommittedHeaderEpoch();
        }
        return currentEpoch;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getProlongDurationAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint48) {
        return uint48(_getSettlementStorage()._prolongDuration.upperLookupRecent(timestamp, hint));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getProlongDuration() public view virtual returns (uint48) {
        return uint48(_getCurrentValue(_getSettlementStorage()._prolongDuration, Time.timestamp()));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCommitDurationAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint48) {
        return uint48(_getSettlementStorage()._commitDuration.upperLookupRecent(timestamp, hint));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCommitDuration() public view virtual returns (uint48) {
        return uint48(_getCurrentValue(_getSettlementStorage()._commitDuration, Time.timestamp()));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTagAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint8) {
        return uint8(_getSettlementStorage()._requiredKeyTag.upperLookupRecent(timestamp, hint));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTag() public view virtual returns (uint8) {
        return uint8(_getCurrentValue(_getSettlementStorage()._requiredKeyTag, Time.timestamp()));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getSigVerifierAt(uint48 timestamp, bytes memory hint) public view virtual returns (address) {
        return address(uint160(_getSettlementStorage()._sigVerifier.upperLookupRecent(timestamp, hint)));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getSigVerifier() public view virtual returns (address) {
        return address(uint160(_getCurrentValue(_getSettlementStorage()._sigVerifier, Time.timestamp())));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getLastCommittedHeaderEpoch() public view virtual returns (uint48) {
        return _getSettlementStorage()._lastCommittedHeaderEpoch;
    }

    /**
     * @inheritdoc ISettlement
     */
    function isValSetHeaderCommittedAt(
        uint48 epoch
    ) public view virtual returns (bool) {
        return _getSettlementStorage()._valSetHeader[epoch].version > 0;
    }

    /**
     * @inheritdoc ISettlement
     */
    function isValSetHeaderCommitted() public view virtual returns (bool) {
        return isValSetHeaderCommittedAt(getCurrentEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentPhase() public view virtual returns (ValSetPhase) {
        uint48 currentEpoch = getCurrentEpoch();
        bool isCurrentValSetHeaderCommitted = isValSetHeaderCommittedAt(currentEpoch);
        if (currentEpoch == 0) {
            return isCurrentValSetHeaderCommitted ? ValSetPhase.IDLE : ValSetPhase.FAIL;
        }
        uint48 commitDuration = getCommitDuration();
        if (isValSetHeaderCommittedAt(currentEpoch - 1) && Time.timestamp() < getCurrentEpochStart() + commitDuration) {
            return ValSetPhase.COMMIT;
        }
        if (isCurrentValSetHeaderCommitted) {
            return ValSetPhase.IDLE;
        }
        uint48 lastCommittedHeaderNextCaptureTimestamp = getEpochStart(getLastCommittedHeaderEpoch() + 1, new bytes(0));
        if (
            Time.timestamp()
                < lastCommittedHeaderNextCaptureTimestamp
                    + getCommitDurationAt(lastCommittedHeaderNextCaptureTimestamp, new bytes(0))
                    + getProlongDurationAt(lastCommittedHeaderNextCaptureTimestamp, new bytes(0))
        ) {
            return ValSetPhase.PROLONG;
        }
        return ValSetPhase.FAIL;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (ValSetHeader memory) {
        return _getSettlementStorage()._valSetHeader[epoch];
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValSetHeader() public view virtual returns (ValSetHeader memory header) {
        return getValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint8) {
        return _getSettlementStorage()._valSetHeader[epoch].version;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getVersionFromValSetHeader() public view virtual returns (uint8) {
        return getVersionFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTagFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint8) {
        return _getSettlementStorage()._valSetHeader[epoch].requiredKeyTag;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTagFromValSetHeader() public view virtual returns (uint8) {
        return getRequiredKeyTagFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCaptureTimestampFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint48) {
        return _getSettlementStorage()._valSetHeader[epoch].captureTimestamp;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCaptureTimestampFromValSetHeader() public view virtual returns (uint48) {
        return getCaptureTimestampFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getQuorumThresholdFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint256) {
        return _getSettlementStorage()._valSetHeader[epoch].quorumThreshold;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getQuorumThresholdFromValSetHeader() public view virtual returns (uint256) {
        return getQuorumThresholdFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (bytes32) {
        return _getSettlementStorage()._valSetHeader[epoch].validatorsSszMRoot;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValidatorsSszMRootFromValSetHeader() public view virtual returns (bytes32) {
        return getValidatorsSszMRootFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getPreviousHeaderHashFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (bytes32) {
        return _getSettlementStorage()._valSetHeader[epoch].previousHeaderHash;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getPreviousHeaderHashFromValSetHeader() public view virtual returns (bytes32) {
        return getPreviousHeaderHashFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getExtraDataAt(uint48 epoch, bytes32 key) public view virtual returns (bytes32) {
        return _getSettlementStorage()._extraData[epoch][key];
    }

    /**
     * @inheritdoc ISettlement
     */
    function getExtraData(
        bytes32 key
    ) public view virtual returns (bytes32) {
        return getExtraDataAt(getCurrentValSetEpoch(), key);
    }

    /**
     * @inheritdoc ISettlement
     */
    function verifyQuorumSig(
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint256 quorumThreshold,
        bytes calldata proof,
        bytes memory hint
    ) public view virtual returns (bool) {
        return ISigVerifier(getSigVerifierAt(getCaptureTimestampFromValSetHeaderAt(epoch), hint)).verifyQuorumSig(
            address(this), epoch, message, keyTag, quorumThreshold, proof
        );
    }

    /**
     * @inheritdoc IEpochManager
     */
    function setEpochDuration(
        uint48 epochDuration
    ) public virtual override {
        if (epochDuration <= _getSettlementStorage()._commitDuration.latest()) {
            revert Settlement_EpochDurationTooShort();
        }
        super.setEpochDuration(epochDuration);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setProlongDuration(
        uint48 prolongDuration
    ) public virtual checkPermission {
        _getSettlementStorage()._prolongDuration.push(getNextEpochStart(), prolongDuration);
        emit SetProlongDuration(prolongDuration);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setCommitDuration(
        uint48 commitDuration
    ) public virtual checkPermission {
        if (commitDuration >= getNextEpochDuration()) {
            revert Settlement_CommitDurationTooLong();
        }
        if (commitDuration == 0) {
            revert Settlement_CommitDurationTooShort();
        }
        _getSettlementStorage()._commitDuration.push(getNextEpochStart(), commitDuration);
        emit SetCommitDuration(commitDuration);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public virtual checkPermission {
        _getSettlementStorage()._requiredKeyTag.push(getNextEpochStart(), requiredKeyTag);
        emit SetRequiredKeyTag(requiredKeyTag);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setSigVerifier(
        address sigVerifier
    ) public virtual checkPermission {
        if (sigVerifier == address(0)) {
            revert Settlement_InvalidSigVerifier();
        }
        _getSettlementStorage()._sigVerifier.push(getNextEpochStart(), uint160(sigVerifier));
        emit SetSigVerifier(sigVerifier);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setGenesis(
        ValSetHeader calldata valSetHeader,
        ExtraData[] calldata extraData
    ) public virtual checkPermission {
        if (getCurrentPhase() != ValSetPhase.FAIL) {
            revert Settlement_InvalidPhase();
        }

        _setValSetHeader(valSetHeader, extraData);

        emit SetGenesis(valSetHeader, extraData);
    }

    /**
     * @inheritdoc ISettlement
     */
    function commitValSetHeader(
        ValSetHeader calldata header,
        ExtraData[] calldata extraData,
        bytes calldata proof,
        bytes memory hint
    ) public virtual {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase != ValSetPhase.COMMIT && currentPhase != ValSetPhase.PROLONG) {
            revert Settlement_InvalidPhase();
        }
        uint48 currentEpoch = getCurrentEpoch();
        if (isValSetHeaderCommittedAt(currentEpoch)) {
            revert Settlement_ValSetHeaderAlreadySubmitted();
        }
        uint48 valSetEpoch = getLastCommittedHeaderEpoch();
        if (
            !verifyQuorumSig(
                valSetEpoch,
                abi.encode(
                    hashTypedDataV4CrossChain(
                        keccak256(
                            abi.encode(
                                VALSET_HEADER_COMMIT_TYPEHASH,
                                SUBNETWORK(),
                                currentEpoch,
                                keccak256(abi.encode(header)),
                                keccak256(abi.encode(extraData))
                            )
                        )
                    )
                ),
                getRequiredKeyTagFromValSetHeaderAt(valSetEpoch),
                getQuorumThresholdFromValSetHeaderAt(valSetEpoch),
                proof,
                hint
            )
        ) {
            revert Settlement_VerificationFailed();
        }

        _setValSetHeader(header, extraData);

        emit CommitValSetHeader(header, extraData);
    }

    function _setValSetHeader(ValSetHeader calldata header, ExtraData[] calldata extraData) internal virtual {
        if (header.version != VALIDATOR_SET_VERSION) {
            revert Settlement_InvalidVersion();
        }

        uint48 currentEpoch = getCurrentEpoch();
        if (header.epoch != currentEpoch) {
            revert Settlement_InvalidEpoch();
        }

        if (header.captureTimestamp != getCurrentEpochStart()) {
            revert Settlement_InvalidCaptureTimestamp();
        }

        SettlementStorage storage $ = _getSettlementStorage();

        ValSetHeader storage headerStorage = $._valSetHeader[currentEpoch];
        headerStorage.version = header.version;
        headerStorage.requiredKeyTag = header.requiredKeyTag;
        headerStorage.epoch = header.epoch;
        headerStorage.captureTimestamp = header.captureTimestamp;
        headerStorage.quorumThreshold = header.quorumThreshold;
        headerStorage.validatorsSszMRoot = header.validatorsSszMRoot;
        headerStorage.previousHeaderHash = header.previousHeaderHash;

        mapping(bytes32 key => bytes32 value) storage extraDataStorage = $._extraData[currentEpoch];
        uint256 extraDataLength = extraData.length;
        for (uint256 i; i < extraDataLength; ++i) {
            extraDataStorage[extraData[i].key] = extraData[i].value;
        }

        $._lastCommittedHeaderEpoch = currentEpoch;
    }
}
