// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlement} from "../../../interfaces/modules/settlement/ISettlement.sol";
import {IConfigProvider} from "../../../interfaces/modules/settlement/IConfigProvider.sol";
import {IOzAccessControl} from "src/interfaces/modules/common/permissions/IOzAccessControl.sol";

interface IMasterSettlement {
    function initialize(
        ISettlement.SettlementInitParams memory settlementInitParams,
        IConfigProvider.ConfigProviderInitParams memory configProviderInitParams,
        address defaultAdmin
    ) external;
}
