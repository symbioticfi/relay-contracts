// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EpochManager} from "../../base/EpochManager.sol";
import {ConfigProvider} from "./ConfigProvider.sol";

import {IValSetDriver} from "../../../interfaces/modules/valset-driver/IValSetDriver.sol";
import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

abstract contract ValSetDriver is EpochManager, ConfigProvider, MulticallUpgradeable, IValSetDriver {
    function __ValSetDriver_init(
        ValSetDriverInitParams memory valSetDriverInitParams
    ) internal virtual onlyInitializing {
        __EpochManager_init(valSetDriverInitParams.epochManagerInitParams);
        __ConfigProvider_init(valSetDriverInitParams.configProviderInitParams);
    }
}
