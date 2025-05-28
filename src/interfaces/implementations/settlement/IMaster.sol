// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlement} from "../../../interfaces/implementations/settlement/ISettlement.sol";
import {IConfigProvider} from "../../../interfaces/implementations/settlement/IConfigProvider.sol";
import {IOzAccessControl} from "src/interfaces/features/permissions/IOzAccessControl.sol";

interface IMaster {
    function initialize(
        ISettlement.SettlementInitParams memory settlementInitParams,
        IConfigProvider.ConfigProviderInitParams memory configProviderInitParams,
        address defaultAdmin
    ) external;
}
