// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManagerLogic} from "./VaultManagerLogic.sol";
import {OperatorManagerLogic} from "./OperatorManagerLogic.sol";
import {NetworkConfigLogic} from "./NetworkConfigLogic.sol";
import {Updatable} from "../utils/Updatable.sol";
import {QuickSorts} from "../utils/QuickSorts.sol";

import {ISigVerifier} from "../../../interfaces/ISigVerifier.sol";
import {IForceCommitVerifier} from "../../../interfaces/IForceCommitVerifier.sol";
import {IValSetManager} from "../../../interfaces/IValSetManager.sol";
import {IVaultManager} from "../../../interfaces/IVaultManager.sol";
import {IOperatorManager} from "../../../interfaces/IOperatorManager.sol";
import {INetworkConfig} from "../../../interfaces/INetworkConfig.sol";

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";

library ValSetManagerLogic {
    using Updatable for Updatable.Uint104Value;
    using Updatable for Updatable.Uint208Value;
    using Updatable for Updatable.Bytes32Value;
    using EnumerableSet for EnumerableSet.AddressSet;

    string private constant EIP712Name = "ValSet";
    string private constant EIP712Version = "1";

    bytes32 private constant TYPE_HASH =
        keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)");
    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash)");

    function getCommitDuration(
        IValSetManager.ValSetManagerStorage storage self
    ) public view returns (uint48) {
        return self._commit_duration;
    }

    function getAcceptDuration(
        IValSetManager.ValSetManagerStorage storage self
    ) public view returns (uint48) {
        return self._accept_duration;
    }

    function isValSetHeaderSubmitted(
        IValSetManager.ValSetManagerStorage storage self,
        uint48 epoch
    ) public view returns (bool) {
        return self._valSetHeader[epoch].version != 0;
    }

    function isValSetHeaderSubmitted(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (bool) {
        return isValSetHeaderSubmitted(self, NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function getCurrentPhase(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (IValSetManager.ValSetPhase) {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (currentEpoch > 0 && !isValSetHeaderSubmitted(self, currentEpoch - 1)) {
            return IValSetManager.ValSetPhase.FAIL;
        }
        uint48 commitPhaseDeadline =
            NetworkConfigLogic.getCurrentEpochStartTs(networkConfigStorage) + getCommitDuration(self);
        if (Time.timestamp() < commitPhaseDeadline) {
            return IValSetManager.ValSetPhase.COMMIT;
        }
        if (Time.timestamp() < commitPhaseDeadline + getAcceptDuration(self)) {
            return IValSetManager.ValSetPhase.ACCEPT;
        }
        if (isValSetHeaderSubmitted(self, currentEpoch)) {
            return IValSetManager.ValSetPhase.IDLE;
        }
        return IValSetManager.ValSetPhase.FAIL;
    }

    function getValSetCommitQuorumThreshold(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint104) {
        return self._quorumThreshold.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function getRequiredKeyTag(
        IValSetManager.ValSetManagerStorage storage self
    ) public view returns (uint8) {
        return self._requiredKeyTag;
    }

    function getValSet(
        IValSetManager.ValSetManagerStorage storage self,
        IVaultManager.VaultManagerStorage storage vaultManagerStorage,
        IOperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (IValSetManager.ValidatorSet memory) {
        address[] memory operators = OperatorManagerLogic.getOperators(operatorManagerStorage, networkConfigStorage);

        uint256 totalActiveVotingPower;
        IValSetManager.Validator[] memory validators = new IValSetManager.Validator[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            (uint256 votingPower, IValSetManager.Vault[] memory vaults) =
                _getVaults(vaultManagerStorage, networkConfigStorage, operators[i]);
            validators[i] = IValSetManager.Validator({
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

        return IValSetManager.ValidatorSet({totalActiveVotingPower: totalActiveVotingPower, validators: validators});
    }

    function _getKeys(
        IOperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) internal view returns (IValSetManager.Key[] memory keys) {
        uint8[] memory requiredKeyTags =
            OperatorManagerLogic.getRequiredKeyTags(operatorManagerStorage, networkConfigStorage);
        keys = new IValSetManager.Key[](requiredKeyTags.length);
        for (uint256 j; j < requiredKeyTags.length; ++j) {
            keys[j] = IValSetManager.Key({
                tag: requiredKeyTags[j],
                payload: OperatorManagerLogic.getKey(
                    operatorManagerStorage, networkConfigStorage, operator, requiredKeyTags[j]
                )
            });
        }
    }

    function _getVaults(
        IVaultManager.VaultManagerStorage storage vaultManagerStorage,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) internal view returns (uint256, IValSetManager.Vault[] memory) {
        (uint256 votingPower, address[] memory vaults, uint256[] memory votingPowers) =
            VaultManagerLogic.getVotingPowerWithVaults(vaultManagerStorage, networkConfigStorage, operator);
        IValSetManager.Vault[] memory vaults_ = new IValSetManager.Vault[](vaults.length);
        for (uint256 i; i < vaults.length; ++i) {
            vaults_[i] = IValSetManager.Vault({vault: vaults[i], votingPower: votingPowers[i]});
        }
        return (votingPower, vaults_);
    }

    function getValSetHeader(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (IValSetManager.ValidatorSetHeader memory) {
        IValSetManager.ValidatorSetHeaderStorage storage headerStorage =
            self._valSetHeader[NetworkConfigLogic.getCurrentEpoch(networkConfigStorage)];
        IValSetManager.Key[] memory activeAggregatedKeys = new IValSetManager.Key[](headerStorage.keyTags.length);
        for (uint256 i; i < headerStorage.keyTags.length; ++i) {
            activeAggregatedKeys[i] = IValSetManager.Key({
                tag: headerStorage.keyTags[i],
                payload: headerStorage.activeAggregatedKeysByTag[headerStorage.keyTags[i]]
            });
        }
        return IValSetManager.ValidatorSetHeader({
            version: headerStorage.version,
            totalActiveVotingPower: headerStorage.totalActiveVotingPower,
            valSetKeyTag: headerStorage.valSetKeyTag,
            activeAggregatedKeys: activeAggregatedKeys,
            validatorsSszMRoot: headerStorage.validatorsSszMRoot,
            extraData: headerStorage.extraData
        });
    }

    function getForceCommitVerifier(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (address) {
        return address(uint160(self._forceCommitVerifier.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage))));
    }

    function getCommitVerifier(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (address) {
        return address(uint160(self._commitVerifier.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage))));
    }

    function verifyQuorumSig(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        bytes32 digest,
        uint8 keyTag,
        uint104 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        return ISigVerifier(getCommitVerifier(self, networkConfigStorage)).verifyQuorumSig(
            address(this), digest, keyTag, quorumThreshold, proof
        );
    }

    function getMinInclusionPower(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint256) {
        return uint256(self._minInclusionPower.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage)));
    }

    function getMaxValidatorsCount(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint104) {
        return self._maxValidatorsCount.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function initialize(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        IValSetManager.ValSetManagerInitParams memory initParams,
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
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint104 quorumThreshold
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._quorumThreshold.set(currentEpoch, currentEpoch + 1, quorumThreshold)) {
            revert("Failed to set quorum threshold");
        }
    }

    function commitValSetHeader(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint8 valSetVersion,
        IValSetManager.ValidatorSetHeader memory header,
        bytes calldata proof
    ) public {
        if (getCurrentPhase(self, networkConfigStorage) != IValSetManager.ValSetPhase.COMMIT) {
            revert("Invalid valSet phase");
        }
        if (
            !verifyQuorumSig(
                self,
                networkConfigStorage,
                _hashTypedDataV4(
                    keccak256(
                        abi.encode(
                            VALSET_HEADER_COMMIT_TYPEHASH,
                            NetworkConfigLogic.getSubnetwork(networkConfigStorage),
                            NetworkConfigLogic.getCurrentEpoch(networkConfigStorage),
                            keccak256(abi.encode(header))
                        )
                    )
                ),
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
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint8 valSetVersion,
        IValSetManager.ValidatorSetHeader memory header,
        bytes calldata proof
    ) public {
        IValSetManager.ValSetPhase currentPhase = getCurrentPhase(self, networkConfigStorage);
        if (currentPhase != IValSetManager.ValSetPhase.ACCEPT && currentPhase != IValSetManager.ValSetPhase.FAIL) {
            revert("Invalid valSet phase");
        }
        if (
            !IForceCommitVerifier(getForceCommitVerifier(self, networkConfigStorage)).verifyForceCommit(
                address(this), header, proof
            )
        ) {
            revert("Failed to verify force commit");
        }

        _setValSetHeader(self, networkConfigStorage, header, valSetVersion);
    }

    function setForceCommitVerifier(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address verifier
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._forceCommitVerifier.set(currentEpoch, currentEpoch + 1, uint160(verifier))) {
            revert("Failed to set force commit verifier");
        }
    }

    function setCommitVerifier(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address verifier
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._commitVerifier.set(currentEpoch, currentEpoch + 1, uint160(verifier))) {
            revert("Failed to set commit verifier");
        }
    }

    function setMinInclusionPower(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint256 minInclusionPower
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._minInclusionPower.set(currentEpoch, currentEpoch + 1, bytes32(minInclusionPower))) {
            revert("Failed to set min inclusion power");
        }
    }

    function setMaxValidatorsCount(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint104 maxValidatorsCount
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._maxValidatorsCount.set(currentEpoch, currentEpoch + 1, maxValidatorsCount)) {
            revert("Failed to set max validators count");
        }
    }

    function _setValSetHeader(
        IValSetManager.ValSetManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        IValSetManager.ValidatorSetHeader memory header,
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
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (isValSetHeaderSubmitted(self, currentEpoch)) {
            revert("ValSet header already set");
        }

        IValSetManager.ValidatorSetHeaderStorage storage headerStorage = self._valSetHeader[currentEpoch];

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

    // ############ EIP712 ############

    function _domainSeparatorV4() internal view returns (bytes32) {
        return _buildDomainSeparator();
    }

    function _buildDomainSeparator() private view returns (bytes32) {
        return keccak256(abi.encode(TYPE_HASH, _EIP712NameHash(), _EIP712VersionHash(), block.chainid, address(this)));
    }

    function _hashTypedDataV4(
        bytes32 structHash
    ) internal view returns (bytes32) {
        return MessageHashUtils.toTypedDataHash(_domainSeparatorV4(), structHash);
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
        return (hex"0f", _EIP712Name(), _EIP712Version(), block.chainid, address(this), bytes32(0), new uint256[](0));
    }

    function _EIP712Name() internal view returns (string memory) {
        return EIP712Name;
    }

    function _EIP712Version() internal view returns (string memory) {
        return EIP712Version;
    }

    function _EIP712NameHash() internal view returns (bytes32) {
        return keccak256(bytes(_EIP712Name()));
    }

    function _EIP712VersionHash() internal view returns (bytes32) {
        return keccak256(bytes(_EIP712Version()));
    }
}
