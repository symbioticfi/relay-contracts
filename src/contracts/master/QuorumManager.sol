// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SettlementConfigManager} from "./SettlementConfigManager.sol";

import {EpochCapture} from "../SDK/extensions/managers/capture-timestamps/EpochCapture.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";


contract QuorumManager is EpochCapture {
    address internal immutable SIG_VERIFIER_REGISTRY;

    enum ValSetPhase {
        IDLE,
        COMMIT,
        FAIL
    }

    struct Key {
        uint8 tag;
        bytes payload;
    }

    struct ValidatorSetHeader {
        uint8 version;
        Key[] activeAggregatedKeys;
        uint256 totalActiveVotingPower;
        bytes32 validatorsSszMRoot;
        bytes extraData;
    }

    struct QuorumManagerStorage {
        Checkpoints.Trace208 _requiredKeyTag;
        Checkpoints.Trace208 _commitDuration;
        mapping(uint8 => Checkpoints.Trace208) _quorumThreshold;
        Checkpoints.Trace208 _sigVerifier;
        mapping(uint48 epoch => ValidatorSetHeaderStorage) _valSetHeader;
    }

    struct ActiveAggregatedKeysStorage {
        uint8[] keyTags;
        mapping(uint8 => bytes) keyByTag;
    }

    struct ValidatorSetHeaderStorage {
        uint8 version;
        uint8 valSetKeyTag;
        ActiveAggregatedKeysStorage activeAggregatedKeys;
        uint256 totalActiveVotingPower;
        bytes32 validatorsSszMRoot;
        bytes extraData;
    }

    struct QuorumThreshold {
        uint8 keyTag;
        uint104 threshold;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.SettlementConfigManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant QuorumManagerStorageLocation =
        0xcee92923a0c63eca6fc0402d78c9efde9f9f3dc73e6f9e14501bf734ed77f100;

    function _getQuorumManagerStorage() internal pure returns (QuorumManagerStorage storage $) {
        bytes32 location = QuorumManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __QuorumManager_init(
        uint48 epochDuration,
        uint48 epochDurationTimestamp,
        QuorumThreshold[] quorumThresholds,
        uint48 commitDuration,
        uint8 requiredKeyTag,
        address sigVerifier

    ) internal virtual onlyInitializing {
        __EpochCapture_init(epochDuration, epochDurationTimestamp);

        QuorumManagerStorage storage $ = _getQuorumManagerStorage();

        if (epochDuration <= commitDuration) {
            revert("Epoch duration is too short");
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

    function getCommitDurationAt(uint48 epoch) public view returns (uint48) {
        return uint48(_getCurrentValue(_getQuorumManagerStorage()._commitDuration, epoch));
    }

    function getCommitDuration() public view returns (uint48) {
        return getCommitDurationAt(getCurrentEpoch());
    }

    function isValSetHeaderSubmitted(
        uint48 epoch
    ) public view returns (bool) {
        return QuorumManagerLogic.isValSetHeaderSubmitted(epoch);
    }

    function isValSetHeaderSubmitted() public view returns (bool) {
        return QuorumManagerLogic.isValSetHeaderSubmitted();
    }

    function getCurrentPhase() public view returns (ValSetPhase) {
        return QuorumManagerLogic.getCurrentPhase();
    }

    function getQuorumThreshold(
        uint8 keyTag
    ) public view returns (uint104) {
        return QuorumManagerLogic.getQuorumThreshold(keyTag);
    }

    function getRequiredKeyTag() public view returns (uint8) {
        return QuorumManagerLogic.getRequiredKeyTag();
    }

    function getValSetHeader(
        uint48 epoch
    ) public view returns (ValidatorSetHeader memory) {
        return QuorumManagerLogic.getValSetHeader(epoch);
    }

    function getValSetHeader() public view returns (ValidatorSetHeader memory) {
        return QuorumManagerLogic.getValSetHeader();
    }

    function getSigVerifier() public view returns (address) {
        return QuorumManagerLogic.getSigVerifier();
    }

    function getVersionFromValSetHeader(
        uint48 epoch
    ) public view returns (uint8) {
        return QuorumManagerLogic.getVersionFromValSetHeader(epoch);
    }

    function getActiveAggregatedKeyFromValSetHeader(uint48 epoch, uint8 keyTag) public view returns (bytes memory) {
        return QuorumManagerLogic.getActiveAggregatedKeyFromValSetHeader(epoch, keyTag);
    }

    function getTotalActiveVotingPowerFromValSetHeader(
        uint48 epoch
    ) public view returns (uint256) {
        return QuorumManagerLogic.getTotalActiveVotingPowerFromValSetHeader(epoch);
    }

    function getValidatorsSszMRootFromValSetHeader(
        uint48 epoch
    ) public view returns (bytes32) {
        return QuorumManagerLogic.getValidatorsSszMRootFromValSetHeader(epoch);
    }

    function getExtraDataFromValSetHeader(
        uint48 epoch
    ) public view returns (bytes memory) {
        return QuorumManagerLogic.getExtraDataFromValSetHeader(epoch);
    }

    function verifyQuorumSig(
        bytes memory message,
        uint8 keyTag,
        uint104 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        return QuorumManagerLogic.verifyQuorumSig(message, keyTag, quorumThreshold, proof);
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public override {
        QuorumManagerLogic.setEpochDuration(epochDuration);
    }

    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public {
        QuorumManagerLogic.setRequiredKeyTag(requiredKeyTag);
    }

    function setGenesis(
        ValidatorSetHeader memory valSetHeader
    ) public {
        QuorumManagerLogic.setGenesis(valSetHeader);
    }

    function setQuorumThreshold(uint8 keyTag, uint104 quorumThreshold) public {
        QuorumManagerLogic.setQuorumThreshold(keyTag, quorumThreshold);
    }

    function commitValSetHeader(ValidatorSetHeader memory header, bytes calldata proof) public {
        QuorumManagerLogic.commitValSetHeader(header, proof);
    }

    function setSigVerifier(
        address verifier
    ) public {
        QuorumManagerLogic.setSigVerifier(SIG_VERIFIER_REGISTRY, verifier);
    }

    function _initialize(
        uint64, /* initialVersion */
        address, /* owner */
        bytes memory data
    ) internal virtual override {
        QuorumManagerInitParams memory initParams = abi.decode(data, (QuorumManagerInitParams));
        super._initialize(initialVersion, owner, initParams.baseParams);

        for (uint256 i; i < initParams.settlementConfig.stakeProviders.length; ++i) {
            bytes32 compressedStakeProvider = _serializeCrossChainAddress(initParams.settlementConfig.stakeProviders[i]);
            if (!_stakeProviders.add(compressedStakeProvider)) {
                revert Duplicate();
            }
            _stakeProviderStatuses[compressedStakeProvider].set(0, 1);
        }

        _keysProvider.set(0, _serializeCrossChainAddress(initParams.settlementConfig.keysProvider));

        for (uint256 i; i < initParams.settlementConfig.replicas.length; ++i) {
            bytes32 compressedReplica = _serializeCrossChainAddress(initParams.settlementConfig.replicas[i]);
            if (!_replicas.add(compressedReplica)) {
                revert Duplicate();
            }
            _replicaStatuses[compressedReplica].set(0, 1);
        }
    }
}
