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
import {QuickSorts} from "../utils/QuickSorts.sol";

import {ISigVerifier} from "../../../interfaces/ISigVerifier.sol";
import {IForceCommitVerifier} from "../../../interfaces/IForceCommitVerifier.sol";

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

library ValSetManagerLogic {
    using Updatable for Updatable.Uint104Value;
    using Updatable for Updatable.Uint208Value;
    using Updatable for Updatable.Bytes32Value;
    using EnumerableSet for EnumerableSet.AddressSet;

    function getCommitDuration(
        ValSetManager.ValSetManagerStorage storage self
    ) public view returns (uint48) {
        return self._commit_duration;
    }

    function getAcceptDuration(
        ValSetManager.ValSetManagerStorage storage self
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
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint104) {
        return self._quorumThreshold.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function getRequiredKeyTag(
        ValSetManager.ValSetManagerStorage storage self
    ) public view returns (uint8) {
        return self._requiredKeyTag;
    }

    function getValSet(
        ValSetManager.ValSetManagerStorage storage self,
        VaultManager.VaultManagerStorage storage vaultManagerStorage,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (ValSetManager.ValidatorSet memory) {
        address[] memory operators = OperatorManagerLogic.getOperators(operatorManagerStorage, networkConfigStorage);

        uint256 totalActiveVotingPower;
        ValSetManager.Validator[] memory validators = new ValSetManager.Validator[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            (uint256 votingPower, ValSetManager.Vault[] memory vaults) =
                _getVaults(vaultManagerStorage, operatorManagerStorage, networkConfigStorage, operators[i]);
            validators[i] = ValSetManager.Validator({
                operator: operators[i],
                votingPower: votingPower,
                isActive: false,
                keys: _getKeys(operatorManagerStorage, networkConfigStorage, operators[i]),
                vaults: vaults
            });
        }

        QuickSorts.sortValidatorsByVotingPowerDesc(validators);

        uint256 minInclusionPower = getMinInclusionPower(self, networkConfigStorage);
        uint104 maxValidatorsCount = getMaxValidatorsCount(self, networkConfigStorage);
        uint104 activeValidatorsCount;
        for (uint256 i; i < validators.length; ++i) {
            if (validators[i].votingPower >= minInclusionPower) {
                validators[i].isActive = true;
                totalActiveVotingPower += validators[i].votingPower;

                if (++activeValidatorsCount >= maxValidatorsCount) {
                    break;
                }
            }
        }

        QuickSorts.sortValidatorsByAddressAsc(validators);

        return ValSetManager.ValidatorSet({totalActiveVotingPower: totalActiveVotingPower, validators: validators});
    }

    function _getKeys(
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
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (ValSetManager.ValidatorSetHeader memory) {
        ValSetManager.ValidatorSetHeaderStorage storage headerStorage =
            self._valSetHeader[NetworkConfigLogic.getCurrentEpoch(networkConfigStorage)];
        ValSetManager.Key[] memory activeAggregatedKeys = new ValSetManager.Key[](headerStorage.keyTags.length);
        for (uint256 i; i < headerStorage.keyTags.length; ++i) {
            activeAggregatedKeys[i] = ValSetManager.Key({
                tag: headerStorage.keyTags[i],
                payload: headerStorage.activeAggregatedKeysByTag[headerStorage.keyTags[i]]
            });
        }
        return ValSetManager.ValidatorSetHeader({
            version: headerStorage.version,
            totalActiveVotingPower: headerStorage.totalActiveVotingPower,
            valSetKeyTag: headerStorage.valSetKeyTag,
            activeAggregatedKeys: activeAggregatedKeys,
            validatorsSszMRoot: headerStorage.validatorsSszMRoot,
            extraData: headerStorage.extraData
        });
    }

    function getForceCommitVerifier(
        ValSetManager.ValSetManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (address) {
        return address(uint160(self._forceCommitVerifier.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage))));
    }

    function getCommitVerifier(
        ValSetManager.ValSetManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (address) {
        return address(uint160(self._commitVerifier.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage))));
    }

    function verifyQuorumSig(
        ValSetManager.ValSetManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        bytes32 digest,
        uint8 keyTag,
        uint104 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        address commitVerifier = address(uint160(self._commitVerifier.get(currentEpoch)));
        return ISigVerifier(commitVerifier).verifyQuorumSig(address(this), digest, keyTag, quorumThreshold, proof);
    }

    function getMinInclusionPower(
        ValSetManager.ValSetManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint256) {
        return uint256(self._minInclusionPower.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage)));
    }

    function getMaxValidatorsCount(
        ValSetManager.ValSetManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint104) {
        return self._maxValidatorsCount.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function initialize(
        ValSetManager.ValSetManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        ValSetManager.ValSetManagerInitParams memory initParams,
        uint8 valSetVersion
    ) public {
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
        self._quorumThreshold.value = initParams.quorumThreshold;
        self._requiredKeyTag = initParams.requiredKeyTag;
        self._commit_duration = initParams.commit_duration;
        self._accept_duration = initParams.accept_duration;
        self._minInclusionPower.value = bytes32(initParams.minInclusionPower);
        self._maxValidatorsCount.value = initParams.maxValidatorsCount;
        self._forceCommitVerifier.value = uint160(initParams.forceCommitVerifier);
        self._commitVerifier.value = uint160(initParams.commitVerifier);
        _setValSetHeader(self, networkConfigStorage, initParams.valSetHeader, valSetVersion);
    }

    function setValSetCommitQuorumThreshold(
        ValSetManager.ValSetManagerStorage storage self,
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
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint8 valSetVersion,
        ValSetManager.ValidatorSetHeader memory header,
        bytes calldata proof
    ) public {
        bytes32 digest = keccak256(
            abi.encode(
                "ValSet:",
                NetworkConfigLogic.getSubnetwork(networkConfigStorage),
                NetworkConfigLogic.getCurrentEpoch(networkConfigStorage),
                keccak256(abi.encode(header))
            )
        );
        if (
            !verifyQuorumSig(
                self,
                networkConfigStorage,
                digest,
                getRequiredKeyTag(self),
                getValSetCommitQuorumThreshold(self, networkConfigStorage),
                proof
            )
        ) {
            revert("Failed to verify quorum sig");
        }

        _setValSetHeader(self, networkConfigStorage, header, valSetVersion);
    }

    function forceCommitValSetHeader(
        ValSetManager.ValSetManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint8 valSetVersion,
        ValSetManager.ValidatorSetHeader memory header,
        bytes calldata proof
    ) public {
        address forceCommitVerifier =
            address(uint160(self._forceCommitVerifier.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage))));
        if (!IForceCommitVerifier(forceCommitVerifier).verifyForceCommit(address(this), header, proof)) {
            revert("Failed to verify force commit");
        }

        _setValSetHeader(self, networkConfigStorage, header, valSetVersion);
    }

    function setForceCommitVerifier(
        ValSetManager.ValSetManagerStorage storage self,
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
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint104 maxValidatorsCount
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._maxValidatorsCount.set(currentEpoch, currentEpoch + 1, maxValidatorsCount)) {
            revert("Failed to set max validators count");
        }
    }

    function _setValSetHeader(
        ValSetManager.ValSetManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        ValSetManager.ValidatorSetHeader memory header,
        uint8 valSetVersion
    ) internal {
        if (header.validatorsSszMRoot == bytes32(0)) {
            revert("Validators SszMRoot is required");
        }
        if (header.version != valSetVersion) {
            revert("Invalid valSet version");
        }
        if (header.valSetKeyTag != getRequiredKeyTag(self)) {
            revert("Invalid valSet key tag");
        }

        ValSetManager.ValidatorSetHeaderStorage storage headerStorage =
            self._valSetHeader[NetworkConfigLogic.getCurrentEpoch(networkConfigStorage)];
        if (headerStorage.version != 0) {
            revert("ValSet header already set");
        }

        headerStorage.version = header.version;
        headerStorage.totalActiveVotingPower = header.totalActiveVotingPower;
        headerStorage.valSetKeyTag = header.valSetKeyTag;
        for (uint256 i; i < header.activeAggregatedKeys.length; ++i) {
            headerStorage.keyTags.push(header.activeAggregatedKeys[i].tag);
            headerStorage.activeAggregatedKeysByTag[header.activeAggregatedKeys[i].tag] =
                header.activeAggregatedKeys[i].payload;
        }
        headerStorage.validatorsSszMRoot = header.validatorsSszMRoot;
        headerStorage.extraData = header.extraData;
    }
}
