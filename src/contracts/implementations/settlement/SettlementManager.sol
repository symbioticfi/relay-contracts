// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EpochManager} from "../../base/EpochManager.sol";
import {NetworkManager} from "../../base/NetworkManager.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {EpochManagerLogic} from "../../base/logic/EpochManagerLogic.sol";

import {ISigVerifier} from "../../../interfaces/other/ISigVerifier.sol";
import {IBaseKeyManager} from "../../../interfaces/base/IBaseKeyManager.sol";
import {ISettlementManager} from "../../../interfaces/implementations/settlement/ISettlementManager.sol";
import {IEpochManager} from "../../../interfaces/base/IEpochManager.sol";
import {OzEIP712} from "../../base/common/OzEIP712.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

abstract contract SettlementManager is
    NetworkManager,
    EpochManager,
    OzEIP712,
    MulticallUpgradeable,
    ISettlementManager
{
    using Checkpoints for Checkpoints.Trace208;

    /**
     * @inheritdoc ISettlementManager
     */
    uint64 public constant SettlementManager_VERSION = 1;

    /**
     * @inheritdoc ISettlementManager
     */
    uint8 public constant VALIDATOR_SET_VERSION = 1;

    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash)");

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.SettlementManagerManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SettlementManagerStorageLocation =
        0x696945070a29c8b9c8effe4aeb461fa71d29f3854ab751c939157f3af408a700;

    function _getSettlementManagerStorage() internal pure returns (SettlementManagerStorage storage $) {
        bytes32 location = SettlementManagerStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __SettlementManager_init(
        SettlementManagerInitParams memory settlementManagerInitParams
    ) internal virtual onlyInitializing {
        __NetworkManager_init(settlementManagerInitParams.networkManagerInitParams);
        __EpochManager_init(settlementManagerInitParams.epochManagerInitParams);
        __OzEIP712_init(settlementManagerInitParams.ozEip712InitParams);

        SettlementManagerStorage storage $ = _getSettlementManagerStorage();

        if (
            settlementManagerInitParams.epochManagerInitParams.epochDuration
                <= settlementManagerInitParams.commitDuration
        ) {
            revert SettlementManager_EpochDurationTooShort();
        }
        for (uint256 i; i < settlementManagerInitParams.quorumThresholds.length; ++i) {
            $._quorumThreshold[settlementManagerInitParams.quorumThresholds[i].keyTag].push(
                Time.timestamp(), settlementManagerInitParams.quorumThresholds[i].threshold
            );
        }
        $._commitDuration.push(Time.timestamp(), settlementManagerInitParams.commitDuration);
        $._requiredKeyTag.push(Time.timestamp(), settlementManagerInitParams.requiredKeyTag);
        $._sigVerifier.push(Time.timestamp(), uint160(settlementManagerInitParams.sigVerifier));
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getCurrentValSetTimestamp() public view virtual returns (uint48) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.IDLE || currentPhase == ValSetPhase.FAIL) {
            return EpochManagerLogic.getCurrentEpochStart();
        }
        return EpochManagerLogic.getEpochStart(getCurrentEpoch() - 1, new bytes(0));
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getQuorumThresholdAt(
        uint8 keyTag,
        uint48 epoch,
        bytes memory hint
    ) public view virtual returns (uint208) {
        return _getSettlementManagerStorage()._quorumThreshold[keyTag].upperLookupRecent(epoch, hint);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getQuorumThreshold(
        uint8 keyTag
    ) public view virtual returns (uint208) {
        return _getCurrentValue(_getSettlementManagerStorage()._quorumThreshold[keyTag], Time.timestamp());
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getCommitDurationAt(uint48 epoch, bytes memory hint) public view virtual returns (uint48) {
        return uint48(_getSettlementManagerStorage()._commitDuration.upperLookupRecent(epoch, hint));
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getCommitDuration() public view virtual returns (uint48) {
        return uint48(_getCurrentValue(_getSettlementManagerStorage()._commitDuration, Time.timestamp()));
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getRequiredKeyTagAt(uint48 epoch, bytes memory hint) public view virtual returns (uint8) {
        return uint8(_getSettlementManagerStorage()._requiredKeyTag.upperLookupRecent(epoch, hint));
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getRequiredKeyTag() public view virtual returns (uint8) {
        return uint8(_getCurrentValue(_getSettlementManagerStorage()._requiredKeyTag, Time.timestamp()));
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getSigVerifierAt(uint48 epoch, bytes memory hint) public view virtual returns (address) {
        return address(uint160(_getSettlementManagerStorage()._sigVerifier.upperLookupRecent(epoch, hint)));
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getSigVerifier() public view virtual returns (address) {
        return address(uint160(_getCurrentValue(_getSettlementManagerStorage()._sigVerifier, Time.timestamp())));
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function isValSetHeaderSubmittedAt(
        uint48 epoch
    ) public view virtual returns (bool) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].version > 0;
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function isValSetHeaderSubmitted() public view virtual returns (bool) {
        return isValSetHeaderSubmittedAt(getCurrentEpoch());
    }

    /**
     * @inheritdoc ISettlementManager
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
     * @inheritdoc ISettlementManager
     */
    function getValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (ValSetHeader memory) {
        SettlementManagerStorage storage $ = _getSettlementManagerStorage();

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
     * @inheritdoc ISettlementManager
     */
    function getValSetHeader() public view virtual returns (ValSetHeader memory header) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return header;
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getValSetHeaderAt(currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint8) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].version;
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getVersionFromValSetHeader() public view virtual returns (uint8) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return 0;
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getVersionFromValSetHeaderAt(currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getActiveAggregatedKeyFromValSetHeaderAt(
        uint48 epoch,
        uint8 keyTag
    ) public view virtual returns (bytes memory) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].activeAggregatedKeys.keyByTag[keyTag];
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getActiveAggregatedKeyFromValSetHeader(
        uint8 keyTag
    ) public view virtual returns (bytes memory) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return new bytes(0);
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getActiveAggregatedKeyFromValSetHeaderAt(
            currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1, keyTag
        );
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getTotalActiveVotingPowerFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (uint256) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].totalActiveVotingPower;
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getTotalActiveVotingPowerFromValSetHeader() public view virtual returns (uint256) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return 0;
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getTotalActiveVotingPowerFromValSetHeaderAt(
            currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1
        );
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (bytes32) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].validatorsSszMRoot;
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getValidatorsSszMRootFromValSetHeader() public view virtual returns (bytes32) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return bytes32(0);
        }
        uint48 currentEpoch = getCurrentEpoch();
        return
            getValidatorsSszMRootFromValSetHeaderAt(currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getExtraDataFromValSetHeaderAt(
        uint48 epoch
    ) public view virtual returns (bytes memory) {
        return _getSettlementManagerStorage()._valSetHeader[epoch].extraData;
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function getExtraDataFromValSetHeader() public view virtual returns (bytes memory) {
        ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ValSetPhase.FAIL) {
            return new bytes(0);
        }
        uint48 currentEpoch = getCurrentEpoch();
        return getExtraDataFromValSetHeaderAt(currentPhase == ValSetPhase.IDLE ? currentEpoch : currentEpoch - 1);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function verifyQuorumSig(
        bytes memory message,
        uint8 keyTag,
        uint208 quorumThreshold,
        bytes calldata proof
    ) public view virtual returns (bool) {
        return ISigVerifier(getSigVerifier()).verifyQuorumSig(address(this), message, keyTag, quorumThreshold, proof);
    }

    /**
     * @inheritdoc IEpochManager
     */
    function setEpochDuration(
        uint48 epochDuration
    ) public virtual override {
        if (epochDuration <= _getSettlementManagerStorage()._commitDuration.latest()) {
            revert SettlementManager_EpochDurationTooShort();
        }
        super.setEpochDuration(epochDuration);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function setQuorumThreshold(uint8 keyTag, uint208 quorumThreshold) public virtual checkPermission {
        _setQuorumThreshold(keyTag, quorumThreshold);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function setCommitDuration(
        uint48 commitDuration
    ) public virtual checkPermission {
        _setCommitDuration(commitDuration);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public virtual checkPermission {
        _setRequiredKeyTag(requiredKeyTag);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function setSigVerifier(
        address sigVerifier
    ) public virtual checkPermission {
        _setSigVerifier(sigVerifier);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function setGenesis(
        ValSetHeader memory valSetHeader
    ) public virtual checkPermission {
        _setGenesis(valSetHeader);
    }

    /**
     * @inheritdoc ISettlementManager
     */
    function commitValSetHeader(ValSetHeader memory header, bytes calldata proof) public virtual {
        _commitValSetHeader(header, proof);
    }

    function _setQuorumThreshold(uint8 keyTag, uint208 quorumThreshold) internal virtual {
        _getSettlementManagerStorage()._quorumThreshold[keyTag].push(getNextEpochStart(), quorumThreshold);
    }

    function _setCommitDuration(
        uint48 commitDuration
    ) internal virtual {
        _getSettlementManagerStorage()._commitDuration.push(getNextEpochStart(), commitDuration);
    }

    function _setRequiredKeyTag(
        uint8 requiredKeyTag
    ) internal virtual {
        _getSettlementManagerStorage()._requiredKeyTag.push(getNextEpochStart(), requiredKeyTag);
    }

    function _setSigVerifier(
        address sigVerifier
    ) internal virtual {
        _getSettlementManagerStorage()._sigVerifier.push(getNextEpochStart(), uint160(sigVerifier));
    }

    function _setGenesis(
        ValSetHeader memory valSetHeader
    ) internal virtual {
        if (getCurrentPhase() != ValSetPhase.FAIL) {
            revert SettlementManager_InvalidPhase();
        }

        _setValSetHeader(valSetHeader);
    }

    function _commitValSetHeader(ValSetHeader memory header, bytes calldata proof) internal virtual {
        if (getCurrentPhase() != ValSetPhase.COMMIT) {
            revert SettlementManager_InvalidPhase();
        }
        uint8 requiredKeyTag = getRequiredKeyTag();
        if (
            !verifyQuorumSig(
                abi.encode(
                    hashTypedDataV4Multichain(
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
            revert SettlementManager_VerificationFailed();
        }

        _setValSetHeader(header);
    }

    function _setValSetHeader(
        ValSetHeader memory header
    ) internal virtual {
        if (header.version != VALIDATOR_SET_VERSION) {
            revert SettlementManager_InvalidVersion();
        }

        SettlementManagerStorage storage $ = _getSettlementManagerStorage();
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
                revert SettlementManager_InvalidKey();
            }
            if (headerStorage.activeAggregatedKeys.keyByTag[header.activeAggregatedKeys[i].tag].length > 0) {
                revert SettlementManager_Duplicate();
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
