// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {MasterConfigProviderLogic} from "./logic/MasterConfigProviderLogic.sol";
import {IMasterConfigProvider} from "../../../interfaces/implementations/settlement/IMasterConfigProvider.sol";

abstract contract MasterConfigProvider is PermissionManager, IMasterConfigProvider {
    /**
     * @inheritdoc IMasterConfigProvider
     */
    function MasterConfigProvider_VERSION() public pure virtual returns (uint64) {
        return MasterConfigProviderLogic.MasterConfigProvider_VERSION;
    }

    function __MasterConfigProvider_init(
        MasterConfigProviderInitParams memory masterConfigProviderInitParams
    ) internal virtual onlyInitializing {
        MasterConfigProviderLogic.initialize(masterConfigProviderInitParams);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function isVotingPowerProviderActiveAt(
        CrossChainAddress memory votingPowerProvider,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return MasterConfigProviderLogic.isVotingPowerProviderActiveAt(votingPowerProvider, timestamp, hint);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function isVotingPowerProviderActive(
        CrossChainAddress memory votingPowerProvider
    ) public view virtual returns (bool) {
        return MasterConfigProviderLogic.isVotingPowerProviderActive(votingPowerProvider);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function getActiveVotingPowerProvidersAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (CrossChainAddress[] memory) {
        return MasterConfigProviderLogic.getActiveVotingPowerProvidersAt(timestamp, hints);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function getActiveVotingPowerProviders() public view virtual returns (CrossChainAddress[] memory) {
        return MasterConfigProviderLogic.getActiveVotingPowerProviders();
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function getKeysProviderAt(
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (CrossChainAddress memory) {
        return MasterConfigProviderLogic.getKeysProviderAt(timestamp, hint);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function getKeysProvider() public view virtual returns (CrossChainAddress memory) {
        return MasterConfigProviderLogic.getKeysProvider();
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function isReplicaActiveAt(
        CrossChainAddress memory replica,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bool) {
        return MasterConfigProviderLogic.isReplicaActiveAt(replica, timestamp, hint);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function isReplicaActive(
        CrossChainAddress memory replica
    ) public view virtual returns (bool) {
        return MasterConfigProviderLogic.isReplicaActive(replica);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function getActiveReplicasAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view virtual returns (CrossChainAddress[] memory) {
        return MasterConfigProviderLogic.getActiveReplicasAt(timestamp, hints);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function getActiveReplicas() public view virtual returns (CrossChainAddress[] memory) {
        return MasterConfigProviderLogic.getActiveReplicas();
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function getMasterConfigAt(
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (MasterConfig memory) {
        return MasterConfigProviderLogic.getMasterConfigAt(timestamp, hints);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function getMasterConfig() public view virtual returns (MasterConfig memory) {
        return MasterConfigProviderLogic.getMasterConfig();
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function addVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        MasterConfigProviderLogic.addVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function removeVotingPowerProvider(
        CrossChainAddress memory votingPowerProvider
    ) public virtual checkPermission {
        MasterConfigProviderLogic.removeVotingPowerProvider(votingPowerProvider);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function setKeysProvider(
        CrossChainAddress memory keysProvider
    ) public virtual checkPermission {
        MasterConfigProviderLogic.setKeysProvider(keysProvider);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function addReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        MasterConfigProviderLogic.addReplica(replica);
    }

    /**
     * @inheritdoc IMasterConfigProvider
     */
    function removeReplica(
        CrossChainAddress memory replica
    ) public virtual checkPermission {
        MasterConfigProviderLogic.removeReplica(replica);
    }
}
