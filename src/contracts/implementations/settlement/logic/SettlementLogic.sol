// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";
import {EpochManagerLogic} from "../../../base/logic/EpochManagerLogic.sol";
import {OzEIP712Logic} from "../../../base/common/logic/OzEIP712Logic.sol";
import {NetworkManagerLogic} from "../../../base/logic/NetworkManagerLogic.sol";

import {ISigVerifier} from "../../../../interfaces/base/ISigVerifier.sol";
import {ISettlement} from "../../../../interfaces/implementations/settlement/ISettlement.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library SettlementLogic {
    using Checkpoints for Checkpoints.Trace208;

    uint64 public constant Settlement_VERSION = 1;

    uint8 public constant VALIDATOR_SET_VERSION = 1;

    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash,bytes32 extraDataHash)");

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.Settlement")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SettlementStorageLocation =
        0xad58d27706f0faa4634000571d7d9c19a0123d182a06ad775cbe8a9c22f64400;

    function _getSettlementStorage() internal pure returns (ISettlement.SettlementStorage storage $) {
        bytes32 location = SettlementStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function initialize(
        ISettlement.SettlementInitParams memory settlementInitParams
    ) public {
        EpochManagerLogic.initialize(settlementInitParams.epochManagerInitParams);
        OzEIP712Logic.initialize(settlementInitParams.ozEip712InitParams);
        NetworkManagerLogic.initialize(settlementInitParams.networkManagerInitParams);

        ISettlement.SettlementStorage storage $ = _getSettlementStorage();

        if (settlementInitParams.epochManagerInitParams.epochDuration <= settlementInitParams.commitDuration) {
            revert ISettlement.Settlement_EpochDurationTooShort();
        }
        $._prolongDuration.push(Time.timestamp(), settlementInitParams.prolongDuration);
        emit ISettlement.InitProlongDuration(settlementInitParams.prolongDuration);
        $._commitDuration.push(Time.timestamp(), settlementInitParams.commitDuration);
        emit ISettlement.InitCommitDuration(settlementInitParams.commitDuration);
        $._requiredKeyTag.push(Time.timestamp(), settlementInitParams.requiredKeyTag);
        emit ISettlement.InitRequiredKeyTag(settlementInitParams.requiredKeyTag);
        $._sigVerifier.push(Time.timestamp(), uint160(settlementInitParams.sigVerifier));
        emit ISettlement.InitSigVerifier(settlementInitParams.sigVerifier);
    }

    function getCurrentValSetTimestamp() public view returns (uint48) {
        return EpochManagerLogic.getEpochStart(getCurrentValSetEpoch(), new bytes(0));
    }

    function getCurrentValSetEpoch() public view returns (uint48) {
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();
        if (currentEpoch == 0) {
            return currentEpoch;
        }
        if (
            isValSetHeaderCommittedAt(currentEpoch - 1)
                && Time.timestamp() < EpochManagerLogic.getCurrentEpochStart() + getCommitDuration()
        ) {
            return currentEpoch - 1;
        }
        if (isValSetHeaderCommittedAt(currentEpoch)) {
            return currentEpoch;
        }
        uint48 lastCommittedHeaderNextCaptureTimestamp =
            EpochManagerLogic.getEpochStart(getLastCommittedHeaderEpoch() + 1, new bytes(0));
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

    function getProlongDurationAt(uint48 timestamp, bytes memory hint) public view returns (uint48) {
        return uint48(_getSettlementStorage()._prolongDuration.upperLookupRecent(timestamp, hint));
    }

    function getProlongDuration() public view returns (uint48) {
        return uint48(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._prolongDuration, Time.timestamp()));
    }

    function getCommitDurationAt(uint48 timestamp, bytes memory hint) public view returns (uint48) {
        return uint48(_getSettlementStorage()._commitDuration.upperLookupRecent(timestamp, hint));
    }

    function getCommitDuration() public view returns (uint48) {
        return uint48(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._commitDuration, Time.timestamp()));
    }

    function getRequiredKeyTagAt(uint48 timestamp, bytes memory hint) public view returns (uint8) {
        return uint8(_getSettlementStorage()._requiredKeyTag.upperLookupRecent(timestamp, hint));
    }

    function getRequiredKeyTag() public view returns (uint8) {
        return uint8(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._requiredKeyTag, Time.timestamp()));
    }

    function getSigVerifierAt(uint48 timestamp, bytes memory hint) public view returns (address) {
        return address(uint160(_getSettlementStorage()._sigVerifier.upperLookupRecent(timestamp, hint)));
    }

    function getSigVerifier() public view returns (address) {
        return
            address(uint160(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._sigVerifier, Time.timestamp())));
    }

    function getLastCommittedHeaderEpoch() public view returns (uint48) {
        return _getSettlementStorage()._lastCommittedHeaderEpoch;
    }

    function isValSetHeaderCommittedAt(
        uint48 epoch
    ) public view returns (bool) {
        return _getSettlementStorage()._valSetHeader[epoch].version > 0;
    }

    function isValSetHeaderCommitted() public view returns (bool) {
        return isValSetHeaderCommittedAt(EpochManagerLogic.getCurrentEpoch());
    }

    function getCurrentPhase() public view returns (ISettlement.ValSetPhase) {
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();
        bool isCurrentValSetHeaderCommitted = isValSetHeaderCommittedAt(currentEpoch);
        if (currentEpoch == 0) {
            return isCurrentValSetHeaderCommitted ? ISettlement.ValSetPhase.IDLE : ISettlement.ValSetPhase.FAIL;
        }
        uint48 commitDuration = getCommitDuration();
        if (
            isValSetHeaderCommittedAt(currentEpoch - 1)
                && Time.timestamp() < EpochManagerLogic.getCurrentEpochStart() + commitDuration
        ) {
            return ISettlement.ValSetPhase.COMMIT;
        }
        if (isCurrentValSetHeaderCommitted) {
            return ISettlement.ValSetPhase.IDLE;
        }
        uint48 lastCommittedHeaderNextCaptureTimestamp =
            EpochManagerLogic.getEpochStart(getLastCommittedHeaderEpoch() + 1, new bytes(0));
        if (
            Time.timestamp()
                < lastCommittedHeaderNextCaptureTimestamp
                    + getCommitDurationAt(lastCommittedHeaderNextCaptureTimestamp, new bytes(0))
                    + getProlongDurationAt(lastCommittedHeaderNextCaptureTimestamp, new bytes(0))
        ) {
            return ISettlement.ValSetPhase.PROLONG;
        }
        return ISettlement.ValSetPhase.FAIL;
    }

    function getValSetHeaderAt(
        uint48 epoch
    ) public view returns (ISettlement.ValSetHeader memory) {
        return _getSettlementStorage()._valSetHeader[epoch];
    }

    function getValSetHeader() public view returns (ISettlement.ValSetHeader memory header) {
        return getValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint8) {
        return _getSettlementStorage()._valSetHeader[epoch].version;
    }

    function getVersionFromValSetHeader() public view returns (uint8) {
        return getVersionFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getRequiredKeyTagFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint8) {
        return _getSettlementStorage()._valSetHeader[epoch].requiredKeyTag;
    }

    function getRequiredKeyTagFromValSetHeader() public view returns (uint8) {
        return getRequiredKeyTagFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getCaptureTimestampFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint48) {
        return _getSettlementStorage()._valSetHeader[epoch].captureTimestamp;
    }

    function getCaptureTimestampFromValSetHeader() public view returns (uint48) {
        return getCaptureTimestampFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getQuorumThresholdFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint256) {
        return _getSettlementStorage()._valSetHeader[epoch].quorumThreshold;
    }

    function getQuorumThresholdFromValSetHeader() public view returns (uint256) {
        return getQuorumThresholdFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (bytes32) {
        return _getSettlementStorage()._valSetHeader[epoch].validatorsSszMRoot;
    }

    function getValidatorsSszMRootFromValSetHeader() public view returns (bytes32) {
        return getValidatorsSszMRootFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getPreviousHeaderHashFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (bytes32) {
        return _getSettlementStorage()._valSetHeader[epoch].previousHeaderHash;
    }

    function getPreviousHeaderHashFromValSetHeader() public view returns (bytes32) {
        return getPreviousHeaderHashFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getExtraDataAt(uint48 epoch, bytes32 key) public view returns (bytes32) {
        return _getSettlementStorage()._extraData[epoch][key];
    }

    function getExtraData(
        bytes32 key
    ) public view returns (bytes32) {
        return getExtraDataAt(getCurrentValSetEpoch(), key);
    }

    function verifyQuorumSig(
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint256 quorumThreshold,
        bytes calldata proof,
        bytes memory hint
    ) public view returns (bool) {
        return ISigVerifier(getSigVerifierAt(getCaptureTimestampFromValSetHeaderAt(epoch), hint)).verifyQuorumSig(
            address(this), epoch, message, keyTag, quorumThreshold, proof
        );
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public {
        if (epochDuration <= _getSettlementStorage()._commitDuration.latest()) {
            revert ISettlement.Settlement_EpochDurationTooShort();
        }
        EpochManagerLogic.setEpochDuration(epochDuration);
    }

    function setProlongDuration(
        uint48 prolongDuration
    ) public {
        _getSettlementStorage()._prolongDuration.push(EpochManagerLogic.getNextEpochStart(), prolongDuration);
        emit ISettlement.SetProlongDuration(prolongDuration);
    }

    function setCommitDuration(
        uint48 commitDuration
    ) public {
        if (commitDuration >= EpochManagerLogic.getNextEpochDuration()) {
            revert ISettlement.Settlement_CommitDurationTooLong();
        }
        _getSettlementStorage()._commitDuration.push(EpochManagerLogic.getNextEpochStart(), commitDuration);
        emit ISettlement.SetCommitDuration(commitDuration);
    }

    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public {
        _getSettlementStorage()._requiredKeyTag.push(EpochManagerLogic.getNextEpochStart(), requiredKeyTag);
        emit ISettlement.SetRequiredKeyTag(requiredKeyTag);
    }

    function setSigVerifier(
        address sigVerifier
    ) public {
        _getSettlementStorage()._sigVerifier.push(EpochManagerLogic.getNextEpochStart(), uint160(sigVerifier));
        emit ISettlement.SetSigVerifier(sigVerifier);
    }

    function setGenesis(
        ISettlement.ValSetHeader calldata valSetHeader,
        ISettlement.ExtraData[] calldata extraData
    ) public {
        if (getCurrentPhase() != ISettlement.ValSetPhase.FAIL) {
            revert ISettlement.Settlement_InvalidPhase();
        }

        setValSetHeader(valSetHeader, extraData);

        emit ISettlement.SetGenesis(valSetHeader, extraData);
    }

    function commitValSetHeader(
        ISettlement.ValSetHeader calldata header,
        ISettlement.ExtraData[] calldata extraData,
        bytes calldata proof,
        bytes memory hint
    ) public {
        ISettlement.ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase != ISettlement.ValSetPhase.COMMIT && currentPhase != ISettlement.ValSetPhase.PROLONG) {
            revert ISettlement.Settlement_InvalidPhase();
        }
        uint48 valSetEpoch = currentPhase == ISettlement.ValSetPhase.COMMIT
            ? EpochManagerLogic.getCurrentEpoch() - 1
            : getLastCommittedHeaderEpoch();
        if (
            !verifyQuorumSig(
                valSetEpoch,
                abi.encode(
                    OzEIP712Logic.hashTypedDataV4CrossChain(
                        keccak256(
                            abi.encode(
                                VALSET_HEADER_COMMIT_TYPEHASH,
                                NetworkManagerLogic.SUBNETWORK(),
                                EpochManagerLogic.getCurrentEpoch(),
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
            revert ISettlement.Settlement_VerificationFailed();
        }

        setValSetHeader(header, extraData);

        emit ISettlement.CommitValSetHeader(header, extraData);
    }

    function setValSetHeader(
        ISettlement.ValSetHeader calldata header,
        ISettlement.ExtraData[] calldata extraData
    ) public {
        if (header.version != VALIDATOR_SET_VERSION) {
            revert ISettlement.Settlement_InvalidVersion();
        }

        if (header.epoch != EpochManagerLogic.getCurrentEpoch()) {
            revert ISettlement.Settlement_InvalidEpoch();
        }

        if (header.captureTimestamp != EpochManagerLogic.getCurrentEpochStart()) {
            revert ISettlement.Settlement_InvalidCaptureTimestamp();
        }

        ISettlement.SettlementStorage storage $ = _getSettlementStorage();
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();

        if (isValSetHeaderCommittedAt(currentEpoch)) {
            revert ISettlement.Settlement_ValSetHeaderAlreadySubmitted();
        }

        ISettlement.ValSetHeader storage headerStorage = $._valSetHeader[currentEpoch];

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
