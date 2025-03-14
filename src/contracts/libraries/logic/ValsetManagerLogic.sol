// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ValSetManager} from "../../ValSetManager.sol";
import {VaultManager} from "../../VaultManager.sol";
import {OperatorManager} from "../../OperatorManager.sol";
import {NetworkConfig} from "../../NetworkConfig.sol";
import {VaultManagerLogic} from "./VaultManagerLogic.sol";
import {OperatorManagerLogic} from "./OperatorManagerLogic.sol";
import {NetworkConfigLogic} from "./NetworkConfigLogic.sol";
import {Updatable} from "../utils/Updatable.sol";

import {ISoftVerifier} from "../../../interfaces/ISoftVerifier.sol";
import {IForceVerifier} from "../../../interfaces/IForceVerifier.sol";

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

library ValSetManagerLogic {
    using Updatable for Updatable.Uint104Value;
    using Updatable for Updatable.Uint208Value;
    using Updatable for Updatable.Bytes32Value;
    using EnumerableSet for EnumerableSet.AddressSet;

    function getCommitDuration(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint48) {
        return self._commit_duration;
    }

    function getAcceptDuration(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint48) {
        return self._accept_duration;
    }

    function getCurrentPhase(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (ValSetManager.ValSetPhase) {
        return ValSetManager.ValSetPhase.IDLE;
    }

    function getValSetCommitQuorumThreshold(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint104) {
        return self._quorumThreshold.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function getRequiredKeyTag(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint8) {
        return self._requiredKeyTag;
    }

    function getValSet(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint8 validatorVersion,
        uint8 validatorSetVersion
    ) public view returns (ValSetManager.ValidatorSet memory) {
        address[] memory operators = OperatorManagerLogic.getOperators(operatorManagerStorage, networkConfigStorage);

        uint256 totalActiveVotingPower;
        ValSetManager.Validator[] memory validators = new ValSetManager.Validator[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            (uint256 votingPower, ValSetManager.Vault[] memory vaults) =
                _getVaults(self, vaultManagerStorage, operatorManagerStorage, networkConfigStorage, operators[i]);
            validators[i] = ValSetManager.Validator({
                version: validatorVersion,
                operator: operators[i],
                votingPower: votingPower,
                isActive: OperatorManagerLogic.isUnpaused(operatorManagerStorage, networkConfigStorage, operators[i]),
                keys: _getKeys(self, vaultManagerStorage, operatorManagerStorage, networkConfigStorage, operators[i]),
                vaults: vaults
            });
            if (validators[i].isActive) {
                totalActiveVotingPower += votingPower;
            }
        }
        return ValSetManager.ValidatorSet({
            version: validatorSetVersion,
            totalActiveVotingPower: totalActiveVotingPower,
            validators: validators
        });
    }

    function _getKeys(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) internal view returns (ValSetManager.Key[] memory keys) {
        uint8[] memory requiredKeyTags =
            OperatorManagerLogic.getRequiredKeyTags(operatorManagerStorage, networkConfigStorage);
        keys = new ValSetManager.Key[](requiredKeyTags.length);
        for (uint256 j; j < requiredKeyTags.length; ++j) {
            keys[j] = ValSetManager.Key({
                tag: requiredKeyTags[j],
                payload: OperatorManagerLogic.getKey(
                    operatorManagerStorage, networkConfigStorage, operator, requiredKeyTags[j]
                )
            });
        }
    }

    function _getVaults(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) internal view returns (uint256, ValSetManager.Vault[] memory) {
        (uint256 votingPower, address[] memory vaults, uint256[] memory votingPowers) = VaultManagerLogic
            .getVotingPowerWithVaults(vaultManagerStorage, operatorManagerStorage, networkConfigStorage, operator);
        ValSetManager.Vault[] memory vaults_ = new ValSetManager.Vault[](vaults.length);
        for (uint256 i; i < vaults.length; ++i) {
            vaults_[i] = ValSetManager.Vault({vault: vaults[i], votingPower: votingPowers[i]});
        }
        return (votingPower, vaults_);
    }

    function getValSetHeader(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (bytes32) {
        return self._valSetHeader.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function getForceCommitVerifier(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (address) {
        return address(uint160(self._forceCommitVerifier.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage))));
    }

    function getCommitVerifier(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (address) {
        return address(uint160(self._commitVerifier.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage))));
    }

    function verifyQuorumSig(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        bytes32 digest,
        uint8 keyTag,
        uint104 quorumThreshold,
        ValSetManager.Proof calldata proof
    ) public view returns (bool) {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        address commitVerifier = address(uint160(self._commitVerifier.get(currentEpoch)));
        return ISoftVerifier(commitVerifier).verifyQuorumSig(
            self._valSetHeader.get(currentEpoch), digest, keyTag, quorumThreshold, proof
        );
    }

    function getMinInclusionPower(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint256) {
        return uint256(self._minInclusionPower.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage)));
    }

    function getMaxValidatorsCount(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint104) {
        return self._maxValidatorsCount.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function initialize(
        ValSetManager.ValSetManagerStorage storage self,
        ValSetManager.ValSetManagerInitParams memory initParams
    ) public {
        if (initParams.valSetHeader == bytes32(0)) {
            revert("Header is required");
        }
        if (initParams.quorumThreshold == 0) {
            revert("Quorum threshold is required");
        }
        if (initParams.commit_duration == 0) {
            revert("Commit duration is required");
        }
        if (initParams.accept_duration == 0) {
            revert("Accept duration is required");
        }
        if (initParams.maxValidatorsCount == 0) {
            revert("Max validators count is required");
        }
        if (initParams.commitVerifier == address(0)) {
            revert("Commit verifier is required");
        }
        self._valSetHeader.value = initParams.valSetHeader;
        self._quorumThreshold.value = initParams.quorumThreshold;
        self._requiredKeyTag = initParams.requiredKeyTag;
        self._commit_duration = initParams.commit_duration;
        self._accept_duration = initParams.accept_duration;
        self._minInclusionPower.value = bytes32(initParams.minInclusionPower);
        self._maxValidatorsCount.value = initParams.maxValidatorsCount;
        self._forceCommitVerifier.value = uint160(initParams.forceCommitVerifier);
        self._commitVerifier.value = uint160(initParams.commitVerifier);
    }

    function setValSetCommitQuorumThreshold(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint104 quorumThreshold
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._quorumThreshold.set(currentEpoch, currentEpoch + 1, quorumThreshold)) {
            revert("Failed to set quorum threshold");
        }
    }

    function commitValSetHeader(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        bytes32 header,
        ValSetManager.Proof calldata proof
    ) public {
        bytes32 digest = keccak256(
            abi.encode(
                "ValSet:",
                NetworkConfigLogic.getSubnetwork(networkConfigStorage),
                NetworkConfigLogic.getCurrentEpoch(networkConfigStorage),
                header
            )
        );
        if (
            !verifyQuorumSig(
                self,
                vaultManagerStorage,
                operatorManagerStorage,
                networkConfigStorage,
                digest,
                self._requiredKeyTag,
                getValSetCommitQuorumThreshold(self, vaultManagerStorage, operatorManagerStorage, networkConfigStorage),
                proof
            )
        ) {
            revert("Failed to verify quorum sig");
        }

        if (
            !self._valSetHeader.set(
                Time.timestamp(),
                NetworkConfigLogic.getCurrentEpochStartTs(networkConfigStorage) + self._commit_duration
                    + self._accept_duration,
                header
            )
        ) {
            revert("Failed to set valSet header");
        }
    }

    function forceCommitValSetHeader(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        bytes32 header,
        bytes calldata proof
    ) public {
        address forceCommitVerifier =
            address(uint160(self._forceCommitVerifier.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage))));
        if (!IForceVerifier(forceCommitVerifier).verifyForceCommit(address(this), header, proof)) {
            revert("Failed to verify force commit");
        }

        if (
            !self._valSetHeader.set(
                Time.timestamp(),
                NetworkConfigLogic.getCurrentEpochStartTs(networkConfigStorage) + self._commit_duration
                    + self._accept_duration,
                header
            )
        ) {
            revert("Failed to set valSet header");
        }
    }

    function setForceCommitVerifier(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address verifier
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._forceCommitVerifier.set(currentEpoch, currentEpoch + 1, uint160(verifier))) {
            revert("Failed to set force commit verifier");
        }
    }

    function setCommitVerifier(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address verifier
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._commitVerifier.set(currentEpoch, currentEpoch + 1, uint160(verifier))) {
            revert("Failed to set commit verifier");
        }
    }

    function setMinInclusionPower(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint256 minInclusionPower
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._minInclusionPower.set(currentEpoch, currentEpoch + 1, bytes32(minInclusionPower))) {
            revert("Failed to set min inclusion power");
        }
    }

    function setMaxValidatorsCount(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint104 maxValidatorsCount
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._maxValidatorsCount.set(currentEpoch, currentEpoch + 1, maxValidatorsCount)) {
            revert("Failed to set max validators count");
        }
    }
}
