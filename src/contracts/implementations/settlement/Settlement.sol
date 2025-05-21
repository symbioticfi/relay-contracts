// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EpochManager} from "../../base/EpochManager.sol";
import {NetworkManager} from "../../base/NetworkManager.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {EpochManagerLogic} from "../../base/logic/EpochManagerLogic.sol";

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";
import {IBaseKeyManager} from "../../../interfaces/base/IBaseKeyManager.sol";
import {ISettlement} from "../../../interfaces/implementations/settlement/ISettlement.sol";
import {IEpochManager} from "../../../interfaces/base/IEpochManager.sol";
import {OzEIP712} from "../../base/common/OzEIP712.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

abstract contract Settlement is NetworkManager, EpochManager, OzEIP712, MulticallUpgradeable, ISettlement {
    using Checkpoints for Checkpoints.Trace208;

    /**
     * @inheritdoc ISettlement
     */
    uint64 public constant Settlement_VERSION = 1;

    /**
     * @inheritdoc ISettlement
     */
    uint8 public constant VALIDATOR_SET_VERSION = 1;

    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash)");

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.Settlement")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SettlementStorageLocation =
        0x696945070a29c8b9c8effe4aeb461fa71d29f3854ab751c939157f3af408a700;

    function _getSettlementStorage() internal pure returns (SettlementStorage storage $) {
        bytes32 location = SettlementStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __Settlement_init(
        SettlementInitParams memory settlementInitParams
    ) internal virtual onlyInitializing {
        __NetworkManager_init(settlementInitParams.networkManagerInitParams);
        __EpochManager_init(settlementInitParams.epochManagerInitParams);
        __OzEIP712_init(settlementInitParams.ozEip712InitParams);

        SettlementStorage storage $ = _getSettlementStorage();

        if (settlementInitParams.epochManagerInitParams.epochDuration <= settlementInitParams.commitDuration) {
            revert Settlement_EpochDurationTooShort();
        }
        for (uint256 i; i < settlementInitParams.quorumThresholds.length; ++i) {
            $._quorumThreshold[settlementInitParams.quorumThresholds[i].keyTag].push(
                Time.timestamp(), settlementInitParams.quorumThresholds[i].threshold
            );
        }
        $._commitDuration.push(Time.timestamp(), settlementInitParams.commitDuration);
        $._requiredKeyTag.push(Time.timestamp(), settlementInitParams.requiredKeyTag);
        $._sigVerifier.push(Time.timestamp(), uint160(settlementInitParams.sigVerifier));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentValSetTimestamp() public view virtual returns (uint48) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.IDLE || currentPhase == ValSetPhase.FAIL) {
            return EpochManagerLogic.getCurrentEpochStart();
        }
        return EpochManagerLogic.getEpochStart(getCurrentEpoch() - 1, new bytes(0));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentValSetEpoch() public view virtual returns (uint48) {
        ValSetPhase currentPhase = getCurrentPhase();
        uint48 currentEpoch = getCurrentEpoch();
        if (currentPhase == ValSetPhase.IDLE || currentPhase == ValSetPhase.FAIL) {
            return currentEpoch;
        }
        return currentEpoch - 1;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getQuorumThresholdAt(
        uint8 keyTag,
        uint48 epoch,
        bytes memory hint
    ) public view virtual returns (uint208) {
        return _getSettlementStorage()._quorumThreshold[keyTag].upperLookupRecent(epoch, hint);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getQuorumThreshold(
        uint8 keyTag
    ) public view virtual returns (uint208) {
        return _getCurrentValue(_getSettlementStorage()._quorumThreshold[keyTag], Time.timestamp());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCommitDurationAt(uint48 epoch, bytes memory hint) public view virtual returns (uint48) {
        return uint48(_getSettlementStorage()._commitDuration.upperLookupRecent(epoch, hint));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCommitDuration() public view virtual returns (uint48) {
        return uint48(_getCurrentValue(_getSettlementStorage()._commitDuration, Time.timestamp()));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTagAt(uint48 epoch, bytes memory hint) public view virtual returns (uint8) {
        return uint8(_getSettlementStorage()._requiredKeyTag.upperLookupRecent(epoch, hint));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getRequiredKeyTag() public view virtual returns (uint8) {
        return uint8(_getCurrentValue(_getSettlementStorage()._requiredKeyTag, Time.timestamp()));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getSigVerifierAt(uint48 epoch, bytes memory hint) public view virtual returns (address) {
        return address(uint160(_getSettlementStorage()._sigVerifier.upperLookupRecent(epoch, hint)));
    }

    /**
     * @inheritdoc ISettlement
     */
    function getSigVerifier() public view virtual returns (address) {
        return address(uint160(_getCurrentValue(_getSettlementStorage()._sigVerifier, Time.timestamp())));
    }

    /**
     * @inheritdoc ISettlement
     */
    function isValSetHeaderSubmittedAt(
        uint48 epoch
    ) public view virtual returns (bool) {
        return _getSettlementStorage()._valSetHeader[epoch].version > 0;
    }

    /**
     * @inheritdoc ISettlement
     */
    function isValSetHeaderSubmitted() public view virtual returns (bool) {
        return isValSetHeaderSubmittedAt(getCurrentEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getCurrentPhase() public view virtual returns (ValSetPhase) {
        uint48 currentEpoch = getCurrentEpoch();
        if (currentEpoch == 0 || !isValSetHeaderSubmittedAt(currentEpoch - 1)) {
            return isValSetHeaderSubmittedAt(currentEpoch) ? ValSetPhase.IDLE : ValSetPhase.FAIL;
        }
        uint48 commitPhaseDeadline = getCurrentEpochStart() + getCommitDuration();
        if (Time.timestamp() < commitPhaseDeadline) {
            return ValSetPhase.COMMIT;
        }
        if (isValSetHeaderSubmittedAt(currentEpoch)) {
            return ValSetPhase.IDLE;
        }
        return ValSetPhase.FAIL;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (ValSetHeader memory) {
        SettlementStorage storage $ = _getSettlementStorage();

        ValSetHeaderStorage storage headerStorage = $._valSetHeader[epoch];

        IBaseKeyManager.Key[] memory activeAggregatedKeys =
            new IBaseKeyManager.Key[](headerStorage.activeAggregatedKeys.keyTags.length);
        for (uint256 i; i < headerStorage.activeAggregatedKeys.keyTags.length; ++i) {
            activeAggregatedKeys[i] = IBaseKeyManager.Key({
                tag: headerStorage.activeAggregatedKeys.keyTags[i],
                payload: headerStorage.activeAggregatedKeys.keyByTag[headerStorage.activeAggregatedKeys.keyTags[i]]
            });
        }
        return ValSetHeader({
            version: headerStorage.version,
            activeAggregatedKeys: activeAggregatedKeys,
            totalActiveVotingPower: headerStorage.totalActiveVotingPower,
            validatorsSszMRoot: headerStorage.validatorsSszMRoot,
            extraData: headerStorage.extraData
        });
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValSetHeader() public view virtual returns (ValSetHeader memory header) {
        return getValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint8) {
        return _getSettlementStorage()._valSetHeader[epoch].version;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getVersionFromValSetHeader() public view virtual returns (uint8) {
        return getVersionFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getActiveAggregatedKeyFromValSetHeaderAt(
        uint48 epoch,
        uint8 keyTag
    ) public view virtual returns (bytes memory) {
        return _getSettlementStorage()._valSetHeader[epoch].activeAggregatedKeys.keyByTag[keyTag];
    }

    /**
     * @inheritdoc ISettlement
     */
    function getActiveAggregatedKeyFromValSetHeader(
        uint8 keyTag
    ) public view virtual returns (bytes memory) {
        return getActiveAggregatedKeyFromValSetHeaderAt(getCurrentValSetEpoch(), keyTag);
    }

    /**
     * @inheritdoc ISettlement
     */
    function getTotalActiveVotingPowerFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint256) {
        return _getSettlementStorage()._valSetHeader[epoch].totalActiveVotingPower;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getTotalActiveVotingPowerFromValSetHeader() public view virtual returns (uint256) {
        return getTotalActiveVotingPowerFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (bytes32) {
        return _getSettlementStorage()._valSetHeader[epoch].validatorsSszMRoot;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getValidatorsSszMRootFromValSetHeader() public view virtual returns (bytes32) {
        return getValidatorsSszMRootFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function getExtraDataFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (bytes memory) {
        return _getSettlementStorage()._valSetHeader[epoch].extraData;
    }

    /**
     * @inheritdoc ISettlement
     */
    function getExtraDataFromValSetHeader() public view virtual returns (bytes memory) {
        return getExtraDataFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    /**
     * @inheritdoc ISettlement
     */
    function verifyQuorumSig(
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint208 quorumThreshold,
        bytes calldata proof
    ) public view virtual returns (bool) {
        return ISigVerifier(getSigVerifier()).verifyQuorumSig(
            address(this), epoch, message, keyTag, quorumThreshold, proof
        );
    }

    /**
     * @inheritdoc IEpochManager
     */
    function setEpochDuration(
        uint48 epochDuration
    ) public virtual override {
        if (epochDuration <= _getSettlementStorage()._commitDuration.latest()) {
            revert Settlement_EpochDurationTooShort();
        }
        super.setEpochDuration(epochDuration);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setQuorumThreshold(uint8 keyTag, uint208 quorumThreshold) public virtual checkPermission {
        _setQuorumThreshold(keyTag, quorumThreshold);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setCommitDuration(
        uint48 commitDuration
    ) public virtual checkPermission {
        _setCommitDuration(commitDuration);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public virtual checkPermission {
        _setRequiredKeyTag(requiredKeyTag);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setSigVerifier(
        address sigVerifier
    ) public virtual checkPermission {
        _setSigVerifier(sigVerifier);
    }

    /**
     * @inheritdoc ISettlement
     */
    function setGenesis(
        ValSetHeader memory valSetHeader
    ) public virtual checkPermission {
        _setGenesis(valSetHeader);
    }

    /**
     * @inheritdoc ISettlement
     */
    function commitValSetHeader(ValSetHeader memory header, bytes calldata proof) public virtual {
        _commitValSetHeader(header, proof);
    }

    function _setQuorumThreshold(uint8 keyTag, uint208 quorumThreshold) internal virtual {
        _getSettlementStorage()._quorumThreshold[keyTag].push(getNextEpochStart(), quorumThreshold);
    }

    function _setCommitDuration(
        uint48 commitDuration
    ) internal virtual {
        _getSettlementStorage()._commitDuration.push(getNextEpochStart(), commitDuration);
    }

    function _setRequiredKeyTag(
        uint8 requiredKeyTag
    ) internal virtual {
        _getSettlementStorage()._requiredKeyTag.push(getNextEpochStart(), requiredKeyTag);
    }

    function _setSigVerifier(
        address sigVerifier
    ) internal virtual {
        _getSettlementStorage()._sigVerifier.push(getNextEpochStart(), uint160(sigVerifier));
    }

    function _setGenesis(
        ValSetHeader memory valSetHeader
    ) internal virtual {
        if (getCurrentPhase() != ValSetPhase.FAIL) {
            revert Settlement_InvalidPhase();
        }

        _setValSetHeader(valSetHeader);
    }

    function _commitValSetHeader(ValSetHeader memory header, bytes calldata proof) internal virtual {
        if (getCurrentPhase() != ValSetPhase.COMMIT) {
            revert Settlement_InvalidPhase();
        }
        uint8 requiredKeyTag = getRequiredKeyTag();
        if (
            !verifyQuorumSig(
                getCurrentValSetEpoch(),
                abi.encode(
                    hashTypedDataV4CrossChain(
                        keccak256(
                            abi.encode(
                                VALSET_HEADER_COMMIT_TYPEHASH,
                                SUBNETWORK(),
                                getCurrentEpoch(),
                                keccak256(abi.encode(header))
                            )
                        )
                    )
                ),
                requiredKeyTag,
                getQuorumThreshold(requiredKeyTag),
                proof
            )
        ) {
            revert Settlement_VerificationFailed();
        }

        _setValSetHeader(header);
    }

    function _setValSetHeader(
        ValSetHeader memory header
    ) internal virtual {
        if (header.version != VALIDATOR_SET_VERSION) {
            revert Settlement_InvalidVersion();
        }

        SettlementStorage storage $ = _getSettlementStorage();
        uint48 currentEpoch = getCurrentEpoch();

        ValSetHeaderStorage storage headerStorage = $._valSetHeader[currentEpoch];

        if (isValSetHeaderSubmittedAt(currentEpoch)) {
            ActiveAggregatedKeysStorage storage activeAggregatedKeysStorage = headerStorage.activeAggregatedKeys;
            for (uint256 i; i < activeAggregatedKeysStorage.keyTags.length; ++i) {
                delete activeAggregatedKeysStorage.keyByTag[activeAggregatedKeysStorage.keyTags[i]];
            }
            delete $._valSetHeader[currentEpoch];
        }

        headerStorage.version = header.version;
        for (uint256 i; i < header.activeAggregatedKeys.length; ++i) {
            if (header.activeAggregatedKeys[i].payload.length == 0) {
                revert Settlement_InvalidKey();
            }
            if (headerStorage.activeAggregatedKeys.keyByTag[header.activeAggregatedKeys[i].tag].length > 0) {
                revert Settlement_Duplicate();
            }
            headerStorage.activeAggregatedKeys.keyTags.push(header.activeAggregatedKeys[i].tag);
            headerStorage.activeAggregatedKeys.keyByTag[header.activeAggregatedKeys[i].tag] =
                header.activeAggregatedKeys[i].payload;
        }
        headerStorage.totalActiveVotingPower = header.totalActiveVotingPower;
        headerStorage.validatorsSszMRoot = header.validatorsSszMRoot;
        headerStorage.extraData = header.extraData;
    }
}
