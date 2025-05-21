// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {PermissionManager} from "../../base/PermissionManager.sol";

import {ValSetConfigProviderLogic} from "./logic/ValSetConfigProviderLogic.sol";

import {IValSetConfigProvider} from "../../../interfaces/implementations/settlement/IValSetConfigProvider.sol";

abstract contract ValSetConfigProvider is PermissionManager, IValSetConfigProvider {
    /**
     * @inheritdoc IValSetConfigProvider
     */
    function ValSetConfigProvider_VERSION() public pure returns (uint64) {
        return ValSetConfigProviderLogic.ValSetConfigProvider_VERSION;
    }

    function __ValSetConfigProvider_init(
        ValSetConfigProviderInitParams memory valSetConfigProviderInitParams
    ) internal virtual onlyInitializing {
        ValSetConfigProviderLogic.initialize(valSetConfigProviderInitParams);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getMaxVotingPowerAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return ValSetConfigProviderLogic.getMaxVotingPowerAt(timestamp, hint);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getMaxVotingPower() public view virtual returns (uint256) {
        return ValSetConfigProviderLogic.getMaxVotingPower();
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getMinInclusionVotingPowerAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return ValSetConfigProviderLogic.getMinInclusionVotingPowerAt(timestamp, hint);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getMinInclusionVotingPower() public view virtual returns (uint256) {
        return ValSetConfigProviderLogic.getMinInclusionVotingPower();
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getMaxValidatorsCountAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint256) {
        return ValSetConfigProviderLogic.getMaxValidatorsCountAt(timestamp, hint);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getMaxValidatorsCount() public view virtual returns (uint256) {
        return ValSetConfigProviderLogic.getMaxValidatorsCount();
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (uint8[] memory requiredKeyTags) {
        return ValSetConfigProviderLogic.getRequiredKeyTagsAt(timestamp, hint);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getRequiredKeyTags() public view returns (uint8[] memory requiredKeyTags) {
        return ValSetConfigProviderLogic.getRequiredKeyTags();
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getValSetConfigAt(
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (ValSetConfig memory) {
        return ValSetConfigProviderLogic.getValSetConfigAt(timestamp, hints);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function getValSetConfig() public view virtual returns (ValSetConfig memory) {
        return ValSetConfigProviderLogic.getValSetConfig();
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function setMaxVotingPower(
        uint256 maxVotingPower
    ) public virtual checkPermission {
        ValSetConfigProviderLogic.setMaxVotingPower(maxVotingPower);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function setMinInclusionVotingPower(
        uint256 minInclusionVotingPower
    ) public virtual checkPermission {
        ValSetConfigProviderLogic.setMinInclusionVotingPower(minInclusionVotingPower);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function setMaxValidatorsCount(
        uint256 maxValidatorsCount
    ) public virtual checkPermission {
        ValSetConfigProviderLogic.setMaxValidatorsCount(maxValidatorsCount);
    }

    /**
     * @inheritdoc IValSetConfigProvider
     */
    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public virtual checkPermission {
        ValSetConfigProviderLogic.setRequiredKeyTags(requiredKeyTags);
    }
}
