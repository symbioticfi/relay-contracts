// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.25;

// import {ValSetManager} from "./ValSetManager.sol";

// import {QuorumManagerLogic} from "./libraries/logic/QuorumManagerLogic.sol";

// import {IQuorumManager} from "../interfaces/IQuorumManager.sol";

// contract QuorumManager is ValSetManager, IQuorumManager {
//     address internal immutable SIG_VERIFIER_REGISTRY;

//     constructor(
//         address factory,
//         address networkRegistry,
//         address operatorRegistry,
//         address vaultFactory,
//         address sigVerifierRegistry
//     ) ValSetManager(factory, networkRegistry, operatorRegistry, vaultFactory) {
//         SIG_VERIFIER_REGISTRY = sigVerifierRegistry;
//     }

//     function GENESIS_SET_ROLE() external pure returns (bytes32) {
//         return QuorumManagerLogic.GENESIS_SET_ROLE;
//     }

//     function VALSET_COMMIT_QUORUM_THRESHOLD_SET_ROLE() external pure returns (bytes32) {
//         return QuorumManagerLogic.VALSET_COMMIT_QUORUM_THRESHOLD_SET_ROLE;
//     }

//     function COMMIT_DURATION_SET_ROLE() external pure returns (bytes32) {
//         return QuorumManagerLogic.COMMIT_DURATION_SET_ROLE;
//     }

//     function REQUIRED_KEY_TAG_SET_ROLE() external pure returns (bytes32) {
//         return QuorumManagerLogic.REQUIRED_KEY_TAG_SET_ROLE;
//     }

//     function SIG_VERIFIER_SET_ROLE() external pure returns (bytes32) {
//         return QuorumManagerLogic.SIG_VERIFIER_SET_ROLE;
//     }

//     function getCurrentValSetBlockNumber() external view override returns (uint256) {
//         return QuorumManagerLogic.getCurrentValSetBlockNumber();
//     }

//     function getCommitDuration() external view returns (uint48) {
//         return QuorumManagerLogic.getCommitDuration();
//     }

//     function isValSetHeaderSubmitted(
//         uint48 epoch
//     ) external view returns (bool) {
//         return QuorumManagerLogic.isValSetHeaderSubmitted(epoch);
//     }

//     function isValSetHeaderSubmitted() external view returns (bool) {
//         return QuorumManagerLogic.isValSetHeaderSubmitted();
//     }

//     function getCurrentPhase() external view returns (ValSetPhase) {
//         return QuorumManagerLogic.getCurrentPhase();
//     }

//     function getQuorumThreshold(
//         uint8 keyTag
//     ) external view returns (uint104) {
//         return QuorumManagerLogic.getQuorumThreshold(keyTag);
//     }

//     function getRequiredKeyTag() external view returns (uint8) {
//         return QuorumManagerLogic.getRequiredKeyTag();
//     }

//     function getValSetHeader(
//         uint48 epoch
//     ) external view returns (ValidatorSetHeader memory) {
//         return QuorumManagerLogic.getValSetHeader(epoch);
//     }

//     function getValSetHeader() external view returns (ValidatorSetHeader memory) {
//         return QuorumManagerLogic.getValSetHeader();
//     }

//     function getSigVerifier() external view returns (address) {
//         return QuorumManagerLogic.getSigVerifier();
//     }

//     function getVersionFromValSetHeader(
//         uint48 epoch
//     ) external view returns (uint8) {
//         return QuorumManagerLogic.getVersionFromValSetHeader(epoch);
//     }

//     function getActiveAggregatedKeyFromValSetHeader(uint48 epoch, uint8 keyTag) external view returns (bytes memory) {
//         return QuorumManagerLogic.getActiveAggregatedKeyFromValSetHeader(epoch, keyTag);
//     }

//     function getTotalActiveVotingPowerFromValSetHeader(
//         uint48 epoch
//     ) external view returns (uint256) {
//         return QuorumManagerLogic.getTotalActiveVotingPowerFromValSetHeader(epoch);
//     }

//     function getValidatorsSszMRootFromValSetHeader(
//         uint48 epoch
//     ) external view returns (bytes32) {
//         return QuorumManagerLogic.getValidatorsSszMRootFromValSetHeader(epoch);
//     }

//     function getExtraDataFromValSetHeader(
//         uint48 epoch
//     ) external view returns (bytes memory) {
//         return QuorumManagerLogic.getExtraDataFromValSetHeader(epoch);
//     }

//     function verifyQuorumSig(
//         bytes memory message,
//         uint8 keyTag,
//         uint104 quorumThreshold,
//         bytes calldata proof
//     ) external view returns (bool) {
//         return QuorumManagerLogic.verifyQuorumSig(message, keyTag, quorumThreshold, proof);
//     }

//     function setEpochDuration(
//         uint48 epochDuration
//     ) external override {
//         QuorumManagerLogic.setEpochDuration(epochDuration);
//     }

//     function setRequiredKeyTag(
//         uint8 requiredKeyTag
//     ) external {
//         QuorumManagerLogic.setRequiredKeyTag(requiredKeyTag);
//     }

//     function setGenesis(
//         ValidatorSetHeader memory valSetHeader
//     ) external {
//         QuorumManagerLogic.setGenesis(valSetHeader);
//     }

//     function setQuorumThreshold(uint8 keyTag, uint104 quorumThreshold) external {
//         QuorumManagerLogic.setQuorumThreshold(keyTag, quorumThreshold);
//     }

//     function commitValSetHeader(ValidatorSetHeader memory header, bytes calldata proof) external {
//         QuorumManagerLogic.commitValSetHeader(header, proof);
//     }

//     function setSigVerifier(
//         address verifier
//     ) external {
//         QuorumManagerLogic.setSigVerifier(SIG_VERIFIER_REGISTRY, verifier);
//     }

//     function _initialize(
//         uint64, /* initialVersion */
//         address, /* owner */
//         bytes memory data
//     ) internal virtual override {
//         QuorumManagerInitParams memory initParams = abi.decode(data, (QuorumManagerInitParams));
//         super._initialize(initialVersion, owner, initParams.baseParams);

//         for (uint256 i; i < initParams.settlementConfig.stakeProviders.length; ++i) {
//             bytes32 compressedStakeProvider = _serializeCrossChainAddress(initParams.settlementConfig.stakeProviders[i]);
//             if (!_stakeProviders.add(compressedStakeProvider)) {
//                 revert Duplicate();
//             }
//             _stakeProviderStatuses[compressedStakeProvider].set(0, 1);
//         }

//         _keysProvider.set(0, _serializeCrossChainAddress(initParams.settlementConfig.keysProvider));

//         for (uint256 i; i < initParams.settlementConfig.replicas.length; ++i) {
//             bytes32 compressedReplica = _serializeCrossChainAddress(initParams.settlementConfig.replicas[i]);
//             if (!_replicas.add(compressedReplica)) {
//                 revert Duplicate();
//             }
//             _replicaStatuses[compressedReplica].set(0, 1);
//         }
//     }
// }
