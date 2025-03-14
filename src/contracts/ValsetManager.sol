// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "./VaultManager.sol";
import {OperatorManager} from "./OperatorManager.sol";
import {NetworkConfig} from "./NetworkConfig.sol";
import {Updatable} from "./libraries/utils/Updatable.sol";
import {ValSetManagerLogic} from "./libraries/logic/ValSetManagerLogic.sol";

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract ValSetManager is VaultManager {
    struct ValSetManagerInitParams {
        VaultManager.VaultManagerInitParams baseParams;
        bytes32 valSetHeader;
        uint104 quorumThreshold;
        uint8 requiredKeyTag;
        uint48 commit_duration;
        uint48 accept_duration;
        uint256 minInclusionPower;
        uint104 maxValidatorsCount;
        address forceCommitVerifier;
        address commitVerifier;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.ValSetManager
    struct ValSetManagerStorage {
        Updatable.Bytes32Value _valSetHeader;
        Updatable.Uint104Value _quorumThreshold;
        uint8 _requiredKeyTag;
        uint48 _commit_duration;
        uint48 _accept_duration;
        Updatable.Bytes32Value _minInclusionPower;
        Updatable.Uint104Value _maxValidatorsCount;
        Updatable.Uint208Value _forceCommitVerifier;
        Updatable.Uint208Value _commitVerifier;
    }

    struct Key32 {
        uint8 tag;
        bytes32 payload;
    }

    struct Key64 {
        uint8 tag;
        bytes32 payload_p1;
        bytes32 payload_p2;
    }

    struct Vault {
        address vault;
        uint96 votingPower;
    }

    struct Validator {
        uint8 version;
        address operator;
        uint96 votingPower;
        bool isActive;
        Key32[] keys32;
        Key64[] keys64;
        Vault[] vaults;
    }

    struct ValidatorSet {
        uint8 version;
        uint96 totalActiveVotingPower;
        Validator[] validators;
    }

    enum ValSetPhase {
        IDLE,
        COMMIT,
        ACCEPT,
        FAIL
    }

    struct Proof {
        bytes signature;
        bytes[] quorum;
        bytes zk_proof;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ValSetManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ValSetManagerStorageLocation =
        0xfd87879bc98f37af7578af722aecfbe5843e5ad354da2d1e70cb5157c4ec8800;

    bytes32 public constant VALSET_COMMIT_QUORUM_THRESHOLD_SET_ROLE =
        keccak256("VALSET_COMMIT_QUORUM_THRESHOLD_SET_ROLE");
    bytes32 public constant FORCE_COMMIT_VERIFIER_SET_ROLE = keccak256("FORCE_COMMIT_VERIFIER_SET_ROLE");
    bytes32 public constant COMMIT_VERIFIER_SET_ROLE = keccak256("COMMIT_VERIFIER_SET_ROLE");
    bytes32 public constant MIN_INCLUSION_POWER_SET_ROLE = keccak256("MIN_INCLUSION_POWER_SET_ROLE");
    bytes32 public constant MAX_VALIDATORS_COUNT_SET_ROLE = keccak256("MAX_VALIDATORS_COUNT_SET_ROLE");

    uint8 public constant VALSET_VERSION = 1;

    constructor(address factory, address vaultFactory) VaultManager(factory, vaultFactory) {}

    function getCommitDuration() public view returns (uint48) {
        return ValSetManagerLogic.getCommitDuration(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getAcceptDuration() public view returns (uint48) {
        return ValSetManagerLogic.getAcceptDuration(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getCurrentPhase() public view returns (ValSetPhase) {
        return ValSetManagerLogic.getCurrentPhase(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getValSetCommitQuorumThreshold() public view returns (uint104) {
        return ValSetManagerLogic.getValSetCommitQuorumThreshold(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getRequiredKeyTag() public view returns (uint8) {
        return ValSetManagerLogic.getRequiredKeyTag(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getValSet() public view returns (ValidatorSet memory) {
        return ValSetManagerLogic.getValSet(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            VALSET_VERSION
        );
    }

    function getValSetHeader() public view returns (bytes32) {
        return ValSetManagerLogic.getValSetHeader(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getForceCommitVerifier() public view returns (address) {
        return ValSetManagerLogic.getForceCommitVerifier(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getCommitVerifier() public view returns (address) {
        return ValSetManagerLogic.getCommitVerifier(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function verifyQuorumSig(
        bytes32 digest,
        uint8 keyTag,
        uint104 quorumThreshold,
        Proof calldata proof
    ) public view returns (bool) {
        return ValSetManagerLogic.verifyQuorumSig(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            digest,
            keyTag,
            quorumThreshold,
            proof
        );
    }

    function getMinInclusionPower() public view returns (uint256) {
        return ValSetManagerLogic.getMinInclusionPower(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getMaxValidatorsCount() public view returns (uint104) {
        return ValSetManagerLogic.getMaxValidatorsCount(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function setValSetCommitQuorumThreshold(
        uint104 quorumThreshold
    ) public onlyRole(VALSET_COMMIT_QUORUM_THRESHOLD_SET_ROLE) {
        ValSetManagerLogic.setValSetCommitQuorumThreshold(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            quorumThreshold
        );
    }

    function commitValSetHeader(bytes32 header, Proof calldata proof) public {
        ValSetManagerLogic.commitValSetHeader(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            header,
            proof
        );
    }

    function forceCommitValSetHeader(bytes32 header, bytes calldata proof) public {
        ValSetManagerLogic.forceCommitValSetHeader(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            header,
            proof
        );
    }

    function setForceCommitVerifier(
        address verifier
    ) public onlyRole(FORCE_COMMIT_VERIFIER_SET_ROLE) {
        ValSetManagerLogic.setForceCommitVerifier(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            verifier
        );
    }

    function setCommitVerifier(
        address verifier
    ) public onlyRole(COMMIT_VERIFIER_SET_ROLE) {
        ValSetManagerLogic.setCommitVerifier(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            verifier
        );
    }

    function setMinInclusionPower(
        uint256 minInclusionPower
    ) public onlyRole(MIN_INCLUSION_POWER_SET_ROLE) {
        ValSetManagerLogic.setMinInclusionPower(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            minInclusionPower
        );
    }

    function setMaxValidatorsCount(
        uint104 maxValidatorsCount
    ) public onlyRole(MAX_VALIDATORS_COUNT_SET_ROLE) {
        ValSetManagerLogic.setMaxValidatorsCount(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage(),
            maxValidatorsCount
        );
    }

    function _getValSetManagerStorage() internal pure returns (ValSetManagerStorage storage $) {
        assembly {
            $.slot := ValSetManagerStorageLocation
        }
    }

    function _initialize(uint64 initialVersion, address owner, bytes memory data) internal virtual override {
        ValSetManagerInitParams memory initParams = abi.decode(data, (ValSetManagerInitParams));
        super._initialize(initialVersion, owner, abi.encode(initParams.baseParams));

        ValSetManagerLogic.initialize(_getValSetManagerStorage(), initParams);
    }
}
