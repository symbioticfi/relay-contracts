// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {ConfigProviderLogic} from "./logic/ConfigProviderLogic.sol";
import {IConfigProvider} from "../../../interfaces/implementations/settlement/IConfigProvider.sol";

abstract contract ConfigProvider is PermissionManager, IConfigProvider {
    /**
     * @inheritdoc IConfigProvider
     */
    function ConfigProvider_VERSION() public pure virtual returns (uint64) {
        return ConfigProviderLogic.ConfigProvider_VERSION;
    }

    function __ConfigProvider_init(
        ConfigProviderInitParams memory configProviderInitParams
    ) internal virtual onlyInitializing {
        ConfigProviderLogic.initialize(configProviderInitParams);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function isVotingPowerProviderRegisteredAt(
        CrossChainAddress memory votingPowerProvider,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return ConfigProviderLogic.isVotingPowerProviderRegisteredAt(votingPowerProvider, timestamp, hint);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function isVotingPowerProviderRegistered(
        CrossChainAddress memory votingPowerProvider
    ) public view virtual returns (bool) {
        return ConfigProviderLogic.isVotingPowerProviderRegistered(votingPowerProvider);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getVotingPowerProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (CrossChainAddress[] memory) {
        return ConfigProviderLogic.getVotingPowerProvidersAt(timestamp, hints);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getVotingPowerProviders() public view virtual returns (CrossChainAddress[] memory) {
        return ConfigProviderLogic.getVotingPowerProviders();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getKeysProviderAt(
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (CrossChainAddress memory) {
        return ConfigProviderLogic.getKeysProviderAt(timestamp, hint);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getKeysProvider() public view virtual returns (CrossChainAddress memory) {
        return ConfigProviderLogic.getKeysProvider();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function isReplicaRegisteredAt(
        CrossChainAddress memory replica,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return ConfigProviderLogic.isReplicaRegisteredAt(replica, timestamp, hint);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function isReplicaRegistered(
        CrossChainAddress memory replica
    ) public view virtual returns (bool) {
        return ConfigProviderLogic.isReplicaRegistered(replica);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getReplicasAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (CrossChainAddress[] memory) {
        return ConfigProviderLogic.getReplicasAt(timestamp, hints);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getReplicas() public view virtual returns (CrossChainAddress[] memory) {
        return ConfigProviderLogic.getReplicas();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getVerificationTypeAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint32) {
        return ConfigProviderLogic.getVerificationTypeAt(timestamp, hint);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getVerificationType() public view virtual returns (uint32) {
        return ConfigProviderLogic.getVerificationType();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return ConfigProviderLogic.getMaxVotingPowerAt(timestamp, hint);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMaxVotingPower() public view virtual returns (uint256) {
        return ConfigProviderLogic.getMaxVotingPower();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMinInclusionVotingPowerAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return ConfigProviderLogic.getMinInclusionVotingPowerAt(timestamp, hint);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMinInclusionVotingPower() public view virtual returns (uint256) {
        return ConfigProviderLogic.getMinInclusionVotingPower();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint208) {
        return ConfigProviderLogic.getMaxValidatorsCountAt(timestamp, hint);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getMaxValidatorsCount() public view virtual returns (uint208) {
        return ConfigProviderLogic.getMaxValidatorsCount();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (uint8[] memory requiredKeyTags) {
        return ConfigProviderLogic.getRequiredKeyTagsAt(timestamp, hint);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getRequiredKeyTags() public view returns (uint8[] memory requiredKeyTags) {
        return ConfigProviderLogic.getRequiredKeyTags();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getConfigAt(uint48 timestamp, bytes memory hints) public view virtual returns (Config memory) {
        return ConfigProviderLogic.getConfigAt(timestamp, hints);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function getConfig() public view virtual returns (Config memory) {
        return ConfigProviderLogic.getConfig();
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        ConfigProviderLogic.addVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        ConfigProviderLogic.removeVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public virtual checkPermission {
        ConfigProviderLogic.setKeysProvider(keysProvider);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function addReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        ConfigProviderLogic.addReplica(replica);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function removeReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        ConfigProviderLogic.removeReplica(replica);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setVerificationType(
        uint32 verificationType
    ) public virtual checkPermission {
        ConfigProviderLogic.setVerificationType(verificationType);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public virtual checkPermission {
        ConfigProviderLogic.setMaxVotingPower(maxVotingPower);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public virtual checkPermission {
        ConfigProviderLogic.setMinInclusionVotingPower(minInclusionVotingPower);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setMaxValidatorsCount(
        uint208 maxValidatorsCount
    ) public virtual checkPermission {
        ConfigProviderLogic.setMaxValidatorsCount(maxValidatorsCount);
    }

    /**
     * @inheritdoc IConfigProvider
     */
    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public virtual checkPermission {
        ConfigProviderLogic.setRequiredKeyTags(requiredKeyTags);
    }
}
