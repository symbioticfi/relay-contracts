// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IEpochManager} from "../../base/IEpochManager.sol";
import {IConfigProvider} from "./IConfigProvider.sol";

interface IValSetDriver {
    struct ValSetDriverInitParams {
        IEpochManager.EpochManagerInitParams epochManagerInitParams;
        IConfigProvider.ConfigProviderInitParams configProviderInitParams;
    }
}
