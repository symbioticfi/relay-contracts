// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";
import {EpochManagerLogic} from "../../../base/logic/EpochManagerLogic.sol";
import {OzEIP712Logic} from "../../../base/common/logic/OzEIP712Logic.sol";
import {NetworkManagerLogic} from "../../../base/logic/NetworkManagerLogic.sol";

import {ISigVerifier} from "../../../../interfaces/base/ISigVerifier.sol";
import {IBaseKeyManager} from "../../../../interfaces/base/IBaseKeyManager.sol";
import {ISettlement} from "../../../../interfaces/implementations/settlement/ISettlement.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

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
        $._commitDuration.push(Time.timestamp(), settlementInitParams.commitDuration);
        $._requiredKeyTag.push(Time.timestamp(), settlementInitParams.requiredKeyTag);
        $._sigVerifier.push(Time.timestamp(), uint160(settlementInitParams.sigVerifier));
        $._verificationType.push(Time.timestamp(), settlementInitParams.verificationType);
    }

    function getCurrentValSetTimestamp() public view returns (uint48) {
        ISettlement.ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ISettlement.ValSetPhase.IDLE || currentPhase == ISettlement.ValSetPhase.FAIL) {
            return EpochManagerLogic.getCurrentEpochStart();
        }
        return EpochManagerLogic.getEpochStart(EpochManagerLogic.getCurrentEpoch() - 1, new bytes(0));
    }

    function getCurrentValSetEpoch() public view returns (uint48) {
        ISettlement.ValSetPhase currentPhase = getCurrentPhase();
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();
        if (currentPhase == ISettlement.ValSetPhase.IDLE || currentPhase == ISettlement.ValSetPhase.FAIL) {
            return currentEpoch;
        }
        return currentEpoch - 1;
    }

    function getCommitDurationAt(uint48 epoch, bytes memory hint) public view returns (uint48) {
        return uint48(_getSettlementStorage()._commitDuration.upperLookupRecent(epoch, hint));
    }

    function getCommitDuration() public view returns (uint48) {
        return uint48(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._commitDuration, Time.timestamp()));
    }

    function getRequiredKeyTagAt(uint48 epoch, bytes memory hint) public view returns (uint8) {
        return uint8(_getSettlementStorage()._requiredKeyTag.upperLookupRecent(epoch, hint));
    }

    function getRequiredKeyTag() public view returns (uint8) {
        return uint8(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._requiredKeyTag, Time.timestamp()));
    }

    function getSigVerifierAt(uint48 epoch, bytes memory hint) public view returns (address) {
        return address(uint160(_getSettlementStorage()._sigVerifier.upperLookupRecent(epoch, hint)));
    }

    function getSigVerifier() public view returns (address) {
        return
            address(uint160(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._sigVerifier, Time.timestamp())));
    }

    function getVerificationTypeAt(uint48 epoch, bytes memory hint) public view returns (uint128) {
        return uint128(_getSettlementStorage()._verificationType.upperLookupRecent(epoch, hint));
    }

    function getVerificationType() public view returns (uint128) {
        return uint128(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._verificationType, Time.timestamp()));
    }

    function isValSetHeaderSubmittedAt(
        uint48 epoch
    ) public view returns (bool) {
        return _getSettlementStorage()._valSetHeader[epoch].version > 0;
    }

    function isValSetHeaderSubmitted() public view returns (bool) {
        return isValSetHeaderSubmittedAt(EpochManagerLogic.getCurrentEpoch());
    }

    function getCurrentPhase() public view returns (ISettlement.ValSetPhase) {
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();
        if (currentEpoch == 0 || !isValSetHeaderSubmittedAt(currentEpoch - 1)) {
            return isValSetHeaderSubmittedAt(currentEpoch) ? ISettlement.ValSetPhase.IDLE : ISettlement.ValSetPhase.FAIL;
        }
        uint48 commitPhaseDeadline = EpochManagerLogic.getCurrentEpochStart() + getCommitDuration();
        if (Time.timestamp() < commitPhaseDeadline) {
            return ISettlement.ValSetPhase.COMMIT;
        }
        if (isValSetHeaderSubmittedAt(currentEpoch)) {
            return ISettlement.ValSetPhase.IDLE;
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

    function getEpochStartFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint48) {
        return _getSettlementStorage()._valSetHeader[epoch].epochStart;
    }

    function getEpochStartFromValSetHeader() public view returns (uint48) {
        return getEpochStartFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getVerificationTypeFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint128) {
        return _getSettlementStorage()._valSetHeader[epoch].verificationType;
    }

    function getVerificationTypeFromValSetHeader() public view returns (uint128) {
        return getVerificationTypeFromValSetHeaderAt(getCurrentValSetEpoch());
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
        bytes calldata proof
    ) public view returns (bool) {
        return ISigVerifier(getSigVerifier()).verifyQuorumSig(
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

    function setCommitDuration(
        uint48 commitDuration
    ) public {
        _getSettlementStorage()._commitDuration.push(EpochManagerLogic.getNextEpochStart(), commitDuration);
    }

    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public {
        _getSettlementStorage()._requiredKeyTag.push(EpochManagerLogic.getNextEpochStart(), requiredKeyTag);
    }

    function setSigVerifier(address sigVerifier, uint128 verificationType) public {
        uint48 nextEpochStart = EpochManagerLogic.getNextEpochStart();
        _getSettlementStorage()._sigVerifier.push(nextEpochStart, uint160(sigVerifier));
        _getSettlementStorage()._verificationType.push(nextEpochStart, verificationType);
    }

    function setGenesis(
        ISettlement.ValSetHeader calldata valSetHeader,
        ISettlement.ExtraData[] calldata extraData
    ) public {
        if (getCurrentPhase() != ISettlement.ValSetPhase.FAIL) {
            revert ISettlement.Settlement_InvalidPhase();
        }

        setValSetHeader(valSetHeader, extraData);
    }

    function commitValSetHeader(
        ISettlement.ValSetHeader calldata header,
        ISettlement.ExtraData[] calldata extraData,
        bytes calldata proof
    ) public {
        if (getCurrentPhase() != ISettlement.ValSetPhase.COMMIT) {
            revert ISettlement.Settlement_InvalidPhase();
        }
        uint48 valSetEpoch = getCurrentValSetEpoch();
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
                proof
            )
        ) {
            revert ISettlement.Settlement_VerificationFailed();
        }

        setValSetHeader(header, extraData);
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

        if (header.epochStart != EpochManagerLogic.getCurrentEpochStart()) {
            revert ISettlement.Settlement_InvalidEpochStart();
        }

        ISettlement.SettlementStorage storage $ = _getSettlementStorage();
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();

        if (isValSetHeaderSubmittedAt(currentEpoch)) {
            revert ISettlement.Settlement_ValSetHeaderAlreadySubmitted();
        }

        ISettlement.ValSetHeader storage headerStorage = $._valSetHeader[currentEpoch];

        headerStorage.version = header.version;
        headerStorage.requiredKeyTag = header.requiredKeyTag;
        headerStorage.epoch = header.epoch;
        headerStorage.epochStart = header.epochStart;
        headerStorage.verificationType = header.verificationType;
        headerStorage.quorumThreshold = header.quorumThreshold;
        headerStorage.validatorsSszMRoot = header.validatorsSszMRoot;
        headerStorage.previousHeaderHash = header.previousHeaderHash;

        mapping(bytes32 key => bytes32 value) storage extraDataStorage = $._extraData[currentEpoch];
        uint256 extraDataLength = extraData.length;
        for (uint256 i; i < extraDataLength; ++i) {
            extraDataStorage[extraData[i].key] = extraData[i].value;
        }
    }
}
