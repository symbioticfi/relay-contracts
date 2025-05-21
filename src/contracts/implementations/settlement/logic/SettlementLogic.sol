// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Checkpoints} from "../../../libraries/structs/Checkpoints.sol";
import {EpochManagerLogic} from "../../../base/logic/EpochManagerLogic.sol";
import {OzEIP712Logic} from "../../../base/common/logic/OzEIP712Logic.sol";
import {NetworkManagerLogic} from "../../../base/logic/NetworkManagerLogic.sol";

import {ISigVerifier} from "../../../../interfaces/base/ISigVerifier.sol";
import {IBaseKeyManager} from "../../../../interfaces/base/IBaseKeyManager.sol";
import {ISettlement} from "../../../../interfaces/implementations/settlement/ISettlement.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

library SettlementLogic {
    using Checkpoints for Checkpoints.Trace208;

    uint64 public constant Settlement_VERSION = 1;

    uint8 public constant VALIDATOR_SET_VERSION = 1;

    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash)");

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.Settlement")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SettlementStorageLocation =
        0xad58d27706f0faa4634000571d7d9c19a0123d182a06ad775cbe8a9c22f64400;

    function _getSettlementStorage() internal pure returns (ISettlement.SettlementStorage storage $) {
        bytes32 location = SettlementStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function initialize(
        ISettlement.SettlementInitParams memory settlementInitParams
    ) public {
        EpochManagerLogic.initialize(settlementInitParams.epochManagerInitParams);
        OzEIP712Logic.initialize(settlementInitParams.ozEip712InitParams);
        NetworkManagerLogic.initialize(settlementInitParams.networkManagerInitParams);

        ISettlement.SettlementStorage storage $ = _getSettlementStorage();

        if (settlementInitParams.epochManagerInitParams.epochDuration <= settlementInitParams.commitDuration) {
            revert ISettlement.Settlement_EpochDurationTooShort();
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

    function getCurrentValSetTimestamp() public view returns (uint48) {
        ISettlement.ValSetPhase currentPhase = getCurrentPhase();
        if (currentPhase == ISettlement.ValSetPhase.IDLE || currentPhase == ISettlement.ValSetPhase.FAIL) {
            return EpochManagerLogic.getCurrentEpochStart();
        }
        return EpochManagerLogic.getEpochStart(EpochManagerLogic.getCurrentEpoch() - 1, new bytes(0));
    }

    function getCurrentValSetEpoch() public view returns (uint48) {
        ISettlement.ValSetPhase currentPhase = getCurrentPhase();
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();
        if (currentPhase == ISettlement.ValSetPhase.IDLE || currentPhase == ISettlement.ValSetPhase.FAIL) {
            return currentEpoch;
        }
        return currentEpoch - 1;
    }

    function getQuorumThresholdAt(uint8 keyTag, uint48 epoch, bytes memory hint) public view returns (uint208) {
        return _getSettlementStorage()._quorumThreshold[keyTag].upperLookupRecent(epoch, hint);
    }

    function getQuorumThreshold(
        uint8 keyTag
    ) public view returns (uint208) {
        return EpochManagerLogic.getCurrentValue(_getSettlementStorage()._quorumThreshold[keyTag], Time.timestamp());
    }

    function getCommitDurationAt(uint48 epoch, bytes memory hint) public view returns (uint48) {
        return uint48(_getSettlementStorage()._commitDuration.upperLookupRecent(epoch, hint));
    }

    function getCommitDuration() public view returns (uint48) {
        return uint48(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._commitDuration, Time.timestamp()));
    }

    function getRequiredKeyTagAt(uint48 epoch, bytes memory hint) public view returns (uint8) {
        return uint8(_getSettlementStorage()._requiredKeyTag.upperLookupRecent(epoch, hint));
    }

    function getRequiredKeyTag() public view returns (uint8) {
        return uint8(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._requiredKeyTag, Time.timestamp()));
    }

    function getSigVerifierAt(uint48 epoch, bytes memory hint) public view returns (address) {
        return address(uint160(_getSettlementStorage()._sigVerifier.upperLookupRecent(epoch, hint)));
    }

    function getSigVerifier() public view returns (address) {
        return
            address(uint160(EpochManagerLogic.getCurrentValue(_getSettlementStorage()._sigVerifier, Time.timestamp())));
    }

    function isValSetHeaderSubmittedAt(
        uint48 epoch
    ) public view returns (bool) {
        return _getSettlementStorage()._valSetHeader[epoch].version > 0;
    }

    function isValSetHeaderSubmitted() public view returns (bool) {
        return isValSetHeaderSubmittedAt(EpochManagerLogic.getCurrentEpoch());
    }

    function getCurrentPhase() public view returns (ISettlement.ValSetPhase) {
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();
        if (currentEpoch == 0 || !isValSetHeaderSubmittedAt(currentEpoch - 1)) {
            return isValSetHeaderSubmittedAt(currentEpoch) ? ISettlement.ValSetPhase.IDLE : ISettlement.ValSetPhase.FAIL;
        }
        uint48 commitPhaseDeadline = EpochManagerLogic.getCurrentEpochStart() + getCommitDuration();
        if (Time.timestamp() < commitPhaseDeadline) {
            return ISettlement.ValSetPhase.COMMIT;
        }
        if (isValSetHeaderSubmittedAt(currentEpoch)) {
            return ISettlement.ValSetPhase.IDLE;
        }
        return ISettlement.ValSetPhase.FAIL;
    }

    function getValSetHeaderAt(
        uint48 epoch
    ) public view returns (ISettlement.ValSetHeader memory) {
        ISettlement.SettlementStorage storage $ = _getSettlementStorage();

        ISettlement.ValSetHeaderStorage storage headerStorage = $._valSetHeader[epoch];

        IBaseKeyManager.Key[] memory activeAggregatedKeys =
            new IBaseKeyManager.Key[](headerStorage.activeAggregatedKeys.keyTags.length);
        for (uint256 i; i < headerStorage.activeAggregatedKeys.keyTags.length; ++i) {
            activeAggregatedKeys[i] = IBaseKeyManager.Key({
                tag: headerStorage.activeAggregatedKeys.keyTags[i],
                payload: headerStorage.activeAggregatedKeys.keyByTag[headerStorage.activeAggregatedKeys.keyTags[i]]
            });
        }
        return ISettlement.ValSetHeader({
            version: headerStorage.version,
            activeAggregatedKeys: activeAggregatedKeys,
            totalActiveVotingPower: headerStorage.totalActiveVotingPower,
            validatorsSszMRoot: headerStorage.validatorsSszMRoot,
            extraData: headerStorage.extraData
        });
    }

    function getValSetHeader() public view returns (ISettlement.ValSetHeader memory header) {
        return getValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getVersionFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint8) {
        return _getSettlementStorage()._valSetHeader[epoch].version;
    }

    function getVersionFromValSetHeader() public view returns (uint8) {
        return getVersionFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getActiveAggregatedKeyFromValSetHeaderAt(uint48 epoch, uint8 keyTag) public view returns (bytes memory) {
        return _getSettlementStorage()._valSetHeader[epoch].activeAggregatedKeys.keyByTag[keyTag];
    }

    function getActiveAggregatedKeyFromValSetHeader(
        uint8 keyTag
    ) public view returns (bytes memory) {
        return getActiveAggregatedKeyFromValSetHeaderAt(getCurrentValSetEpoch(), keyTag);
    }

    function getTotalActiveVotingPowerFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (uint256) {
        return _getSettlementStorage()._valSetHeader[epoch].totalActiveVotingPower;
    }

    function getTotalActiveVotingPowerFromValSetHeader() public view returns (uint256) {
        return getTotalActiveVotingPowerFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getValidatorsSszMRootFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (bytes32) {
        return _getSettlementStorage()._valSetHeader[epoch].validatorsSszMRoot;
    }

    function getValidatorsSszMRootFromValSetHeader() public view returns (bytes32) {
        return getValidatorsSszMRootFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function getExtraDataFromValSetHeaderAt(
        uint48 epoch
    ) public view returns (bytes memory) {
        return _getSettlementStorage()._valSetHeader[epoch].extraData;
    }

    function getExtraDataFromValSetHeader() public view returns (bytes memory) {
        return getExtraDataFromValSetHeaderAt(getCurrentValSetEpoch());
    }

    function verifyQuorumSig(
        uint48 epoch,
        bytes memory message,
        uint8 keyTag,
        uint208 quorumThreshold,
        bytes calldata proof
    ) public view returns (bool) {
        return ISigVerifier(getSigVerifier()).verifyQuorumSig(
            address(this), epoch, message, keyTag, quorumThreshold, proof
        );
    }

    function setEpochDuration(
        uint48 epochDuration
    ) public {
        if (epochDuration <= _getSettlementStorage()._commitDuration.latest()) {
            revert ISettlement.Settlement_EpochDurationTooShort();
        }
        EpochManagerLogic.setEpochDuration(epochDuration);
    }

    function setQuorumThreshold(uint8 keyTag, uint208 quorumThreshold) public {
        _getSettlementStorage()._quorumThreshold[keyTag].push(EpochManagerLogic.getNextEpochStart(), quorumThreshold);
    }

    function setCommitDuration(
        uint48 commitDuration
    ) public {
        _getSettlementStorage()._commitDuration.push(EpochManagerLogic.getNextEpochStart(), commitDuration);
    }

    function setRequiredKeyTag(
        uint8 requiredKeyTag
    ) public {
        _getSettlementStorage()._requiredKeyTag.push(EpochManagerLogic.getNextEpochStart(), requiredKeyTag);
    }

    function setSigVerifier(
        address sigVerifier
    ) public {
        _getSettlementStorage()._sigVerifier.push(EpochManagerLogic.getNextEpochStart(), uint160(sigVerifier));
    }

    function setGenesis(
        ISettlement.ValSetHeader memory valSetHeader
    ) public {
        if (getCurrentPhase() != ISettlement.ValSetPhase.FAIL) {
            revert ISettlement.Settlement_InvalidPhase();
        }

        setValSetHeader(valSetHeader);
    }

    function commitValSetHeader(ISettlement.ValSetHeader memory header, bytes calldata proof) public {
        if (getCurrentPhase() != ISettlement.ValSetPhase.COMMIT) {
            revert ISettlement.Settlement_InvalidPhase();
        }
        uint8 requiredKeyTag = getRequiredKeyTag();
        if (
            !verifyQuorumSig(
                getCurrentValSetEpoch(),
                abi.encode(
                    OzEIP712Logic.hashTypedDataV4CrossChain(
                        keccak256(
                            abi.encode(
                                VALSET_HEADER_COMMIT_TYPEHASH,
                                NetworkManagerLogic.SUBNETWORK(),
                                EpochManagerLogic.getCurrentEpoch(),
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
            revert ISettlement.Settlement_VerificationFailed();
        }

        setValSetHeader(header);
    }

    function setValSetHeader(
        ISettlement.ValSetHeader memory header
    ) public {
        if (header.version != VALIDATOR_SET_VERSION) {
            revert ISettlement.Settlement_InvalidVersion();
        }

        ISettlement.SettlementStorage storage $ = _getSettlementStorage();
        uint48 currentEpoch = EpochManagerLogic.getCurrentEpoch();

        ISettlement.ValSetHeaderStorage storage headerStorage = $._valSetHeader[currentEpoch];

        if (isValSetHeaderSubmittedAt(currentEpoch)) {
            ISettlement.ActiveAggregatedKeysStorage storage activeAggregatedKeysStorage =
                headerStorage.activeAggregatedKeys;
            for (uint256 i; i < activeAggregatedKeysStorage.keyTags.length; ++i) {
                delete activeAggregatedKeysStorage.keyByTag[activeAggregatedKeysStorage.keyTags[i]];
            }
            delete $._valSetHeader[currentEpoch];
        }

        headerStorage.version = header.version;
        for (uint256 i; i < header.activeAggregatedKeys.length; ++i) {
            if (header.activeAggregatedKeys[i].payload.length == 0) {
                revert ISettlement.Settlement_InvalidKey();
            }
            if (headerStorage.activeAggregatedKeys.keyByTag[header.activeAggregatedKeys[i].tag].length > 0) {
                revert ISettlement.Settlement_Duplicate();
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
