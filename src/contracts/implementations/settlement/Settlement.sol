// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EpochManager} from "../../base/EpochManager.sol";
import {NetworkManager} from "../../base/NetworkManager.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {EpochManagerLogic} from "../../base/logic/EpochManagerLogic.sol";
import {SettlementLogic} from "./logic/SettlementLogic.sol";

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";
import {IBaseKeyManager} from "../../../interfaces/base/IBaseKeyManager.sol";
import {ISettlement} from "../../../interfaces/implementations/settlement/ISettlement.sol";
import {IEpochManager} from "../../../interfaces/base/IEpochManager.sol";
import {OzEIP712} from "../../base/common/OzEIP712.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

abstract contract Settlement is NetworkManager, EpochManager, OzEIP712, MulticallUpgradeable, ISettlement {
    /**
     * @inheritdoc ISettlement
     */
    function Settlement_VERSION() public pure returns (uint64) {
        return SettlementLogic.Settlement_VERSION;
    }

    /**
     * @inheritdoc ISettlement
     */
    function VALIDATOR_SET_VERSION() public pure returns (uint8) {
        return SettlementLogic.VALIDATOR_SET_VERSION;
    }

    function __Settlement_init(
        SettlementInitParams memory settlementInitParams
    ) internal virtual onlyInitializing {
        SettlementLogic.initialize(settlementInitParams);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentValSetTimestamp() public view virtual returns (uint48) {
        return SettlementLogic.getCurrentValSetTimestamp();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentValSetEpoch() public view virtual returns (uint48) {
        return SettlementLogic.getCurrentValSetEpoch();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getProlongDuration() public view virtual returns (uint48) {
        return SettlementLogic.getProlongDuration();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCommitDurationAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint48) {
        return SettlementLogic.getCommitDurationAt(timestamp, hint);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCommitDuration() public view virtual returns (uint48) {
        return SettlementLogic.getCommitDuration();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTagAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint8) {
        return SettlementLogic.getRequiredKeyTagAt(timestamp, hint);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTag() public view virtual returns (uint8) {
        return SettlementLogic.getRequiredKeyTag();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getSigVerifierAt(uint48 timestamp, bytes memory hint) public view virtual returns (address) {
        return SettlementLogic.getSigVerifierAt(timestamp, hint);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getSigVerifier() public view virtual returns (address) {
        return SettlementLogic.getSigVerifier();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getLastCommittedHeaderCaptureTimestamp() public view virtual returns (uint48) {
        return SettlementLogic.getLastCommittedHeaderCaptureTimestamp();
    }

    /**
     * @inheritdoc ISettlement
     */
    function isValSetHeaderCommittedAt(
        uint48 epoch
    ) public view virtual returns (bool) {
        return SettlementLogic.isValSetHeaderCommittedAt(epoch);
    }

    /**
     * @inheritdoc ISettlement
     */
    function isValSetHeaderCommitted() public view virtual returns (bool) {
        return SettlementLogic.isValSetHeaderCommitted();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentPhase() public view virtual returns (ValSetPhase) {
        return SettlementLogic.getCurrentPhase();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (ValSetHeader memory) {
        return SettlementLogic.getValSetHeaderAt(epoch);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValSetHeader() public view virtual returns (ValSetHeader memory header) {
        return SettlementLogic.getValSetHeader();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint8) {
        return SettlementLogic.getVersionFromValSetHeaderAt(epoch);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getVersionFromValSetHeader() public view virtual returns (uint8) {
        return SettlementLogic.getVersionFromValSetHeader();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTagFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint8) {
        return SettlementLogic.getRequiredKeyTagFromValSetHeaderAt(epoch);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTagFromValSetHeader() public view virtual returns (uint8) {
        return SettlementLogic.getRequiredKeyTagFromValSetHeader();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCaptureTimestampFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint48) {
        return SettlementLogic.getCaptureTimestampFromValSetHeaderAt(epoch);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCaptureTimestampFromValSetHeader() public view virtual returns (uint48) {
        return SettlementLogic.getCaptureTimestampFromValSetHeader();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getQuorumThresholdFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint256) {
        return SettlementLogic.getQuorumThresholdFromValSetHeaderAt(epoch);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getQuorumThresholdFromValSetHeader() public view virtual returns (uint256) {
        return SettlementLogic.getQuorumThresholdFromValSetHeader();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (bytes32) {
        return SettlementLogic.getValidatorsSszMRootFromValSetHeaderAt(epoch);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValidatorsSszMRootFromValSetHeader() public view virtual returns (bytes32) {
        return SettlementLogic.getValidatorsSszMRootFromValSetHeader();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getPreviousHeaderHashFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (bytes32) {
        return SettlementLogic.getPreviousHeaderHashFromValSetHeaderAt(epoch);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getPreviousHeaderHashFromValSetHeader() public view virtual returns (bytes32) {
        return SettlementLogic.getPreviousHeaderHashFromValSetHeader();
    }

    /**
     * @inheritdoc ISettlement
     */
    function getExtraDataAt(uint48 epoch, bytes32 key) public view virtual returns (bytes32) {
        return SettlementLogic.getExtraDataAt(epoch, key);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getExtraData(
        bytes32 key
    ) public view virtual returns (bytes32) {
        return SettlementLogic.getExtraData(key);
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
        return SettlementLogic.verifyQuorumSig(epoch, message, keyTag, quorumThreshold, proof, hint);
    }

    /**
     * @inheritdoc IEpochManager
     */
    function setEpochDuration(
        uint48 epochDuration
    ) public virtual override {
        return SettlementLogic.setEpochDuration(epochDuration);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setCommitDuration(
        uint48 commitDuration
    ) public virtual checkPermission {
        SettlementLogic.setCommitDuration(commitDuration);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public virtual checkPermission {
        SettlementLogic.setRequiredKeyTag(requiredKeyTag);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setSigVerifier(
        address sigVerifier
    ) public virtual checkPermission {
        SettlementLogic.setSigVerifier(sigVerifier);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setGenesis(
        ValSetHeader calldata valSetHeader,
        ExtraData[] calldata extraData
    ) public virtual checkPermission {
        SettlementLogic.setGenesis(valSetHeader, extraData);
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
        SettlementLogic.commitValSetHeader(header, extraData, proof, hint);
    }
}
