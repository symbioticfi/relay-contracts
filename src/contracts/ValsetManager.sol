// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "./VaultManager.sol";

import {ValSetManagerLogic} from "./libraries/logic/ValSetManagerLogic.sol";

import {IValSetManager} from "../interfaces/IValSetManager.sol";

contract ValSetManager is VaultManager, IValSetManager {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ValSetManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ValSetManagerStorageLocation =
        0xfd87879bc98f37af7578af722aecfbe5843e5ad354da2d1e70cb5157c4ec8800;

    bytes32 internal constant VALSET_COMMIT_QUORUM_THRESHOLD_SET_ROLE =
        keccak256("VALSET_COMMIT_QUORUM_THRESHOLD_SET_ROLE");
    bytes32 internal constant FORCE_COMMIT_VERIFIER_SET_ROLE = keccak256("FORCE_COMMIT_VERIFIER_SET_ROLE");
    bytes32 internal constant COMMIT_VERIFIER_SET_ROLE = keccak256("COMMIT_VERIFIER_SET_ROLE");
    bytes32 internal constant MIN_INCLUSION_POWER_SET_ROLE = keccak256("MIN_INCLUSION_POWER_SET_ROLE");
    bytes32 internal constant MAX_VALIDATORS_COUNT_SET_ROLE = keccak256("MAX_VALIDATORS_COUNT_SET_ROLE");

    uint8 public constant VALIDATOR_SET_VERSION = 1;

    constructor(address factory, address vaultFactory) VaultManager(factory, vaultFactory) {}

    function getCommitDuration() public view returns (uint48) {
        return ValSetManagerLogic.getCommitDuration(_getValSetManagerStorage());
    }

    function getAcceptDuration() public view returns (uint48) {
        return ValSetManagerLogic.getAcceptDuration(_getValSetManagerStorage());
    }

    function getCurrentPhase() public view returns (ValSetPhase) {
        return ValSetManagerLogic.getCurrentPhase(_getValSetManagerStorage(), _getNetworkConfigStorage());
    }

    function getValSetCommitQuorumThreshold() public view returns (uint104) {
        return ValSetManagerLogic.getValSetCommitQuorumThreshold(_getValSetManagerStorage(), _getNetworkConfigStorage());
    }

    function getRequiredKeyTag() public view returns (uint8) {
        return ValSetManagerLogic.getRequiredKeyTag(_getValSetManagerStorage());
    }

    function getValSet() public view returns (ValidatorSet memory) {
        return ValSetManagerLogic.getValSet(
            _getValSetManagerStorage(),
            _getVaultManagerStorage(),
            _getOperatorManagerStorage(),
            _getNetworkConfigStorage()
        );
    }

    function getValSetHeader() public view returns (ValidatorSetHeader memory) {
        return ValSetManagerLogic.getValSetHeader(_getValSetManagerStorage(), _getNetworkConfigStorage());
    }

    function getForceCommitVerifier() public view returns (address) {
        return ValSetManagerLogic.getForceCommitVerifier(_getValSetManagerStorage(), _getNetworkConfigStorage());
    }

    function getCommitVerifier() public view returns (address) {
        return ValSetManagerLogic.getCommitVerifier(_getValSetManagerStorage(), _getNetworkConfigStorage());
    }

    function eip712Domain()
        public
        view
        returns (
            bytes1 fields,
            string memory name,
            string memory version,
            uint256 chainId,
            address verifyingContract,
            bytes32 salt,
            uint256[] memory extensions
        )
    {
        return ValSetManagerLogic.eip712Domain();
    }

    function verifyQuorumSig(
        bytes32 digest,
        uint8 keyTag,
        uint104 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        return ValSetManagerLogic.verifyQuorumSig(
            _getValSetManagerStorage(), _getNetworkConfigStorage(), digest, keyTag, quorumThreshold, proof
        );
    }

    function getMinInclusionPower() public view returns (uint256) {
        return ValSetManagerLogic.getMinInclusionPower(_getValSetManagerStorage(), _getNetworkConfigStorage());
    }

    function getMaxValidatorsCount() public view returns (uint104) {
        return ValSetManagerLogic.getMaxValidatorsCount(_getValSetManagerStorage(), _getNetworkConfigStorage());
    }

    function setValSetCommitQuorumThreshold(
        uint104 quorumThreshold
    ) public onlyRole(VALSET_COMMIT_QUORUM_THRESHOLD_SET_ROLE) {
        ValSetManagerLogic.setValSetCommitQuorumThreshold(
            _getValSetManagerStorage(), _getNetworkConfigStorage(), quorumThreshold
        );
    }

    function commitValSetHeader(ValidatorSetHeader memory header, bytes calldata proof) public {
        ValSetManagerLogic.commitValSetHeader(
            _getValSetManagerStorage(), _getNetworkConfigStorage(), VALIDATOR_SET_VERSION, header, proof
        );
    }

    function forceCommitValSetHeader(ValidatorSetHeader memory header, bytes calldata proof) public {
        ValSetManagerLogic.forceCommitValSetHeader(
            _getValSetManagerStorage(), _getNetworkConfigStorage(), VALIDATOR_SET_VERSION, header, proof
        );
    }

    function setForceCommitVerifier(
        address verifier
    ) public onlyRole(FORCE_COMMIT_VERIFIER_SET_ROLE) {
        ValSetManagerLogic.setForceCommitVerifier(_getValSetManagerStorage(), _getNetworkConfigStorage(), verifier);
    }

    function setCommitVerifier(
        address verifier
    ) public onlyRole(COMMIT_VERIFIER_SET_ROLE) {
        ValSetManagerLogic.setCommitVerifier(_getValSetManagerStorage(), _getNetworkConfigStorage(), verifier);
    }

    function setMinInclusionPower(
        uint256 minInclusionPower
    ) public onlyRole(MIN_INCLUSION_POWER_SET_ROLE) {
        ValSetManagerLogic.setMinInclusionPower(
            _getValSetManagerStorage(), _getNetworkConfigStorage(), minInclusionPower
        );
    }

    function setMaxValidatorsCount(
        uint104 maxValidatorsCount
    ) public onlyRole(MAX_VALIDATORS_COUNT_SET_ROLE) {
        ValSetManagerLogic.setMaxValidatorsCount(
            _getValSetManagerStorage(), _getNetworkConfigStorage(), maxValidatorsCount
        );
    }

    function _getValSetManagerStorage() internal pure returns (ValSetManagerStorage storage $) {
        assembly ("memory-safe") {
            $.slot := ValSetManagerStorageLocation
        }
    }

    function _initialize(uint64 initialVersion, address owner, bytes memory data) internal virtual override {
        ValSetManagerInitParams memory initParams = abi.decode(data, (ValSetManagerInitParams));
        super._initialize(initialVersion, owner, abi.encode(initParams.baseParams));

        ValSetManagerLogic.initialize(
            _getValSetManagerStorage(), _getNetworkConfigStorage(), initParams, VALIDATOR_SET_VERSION
        );
    }
}
