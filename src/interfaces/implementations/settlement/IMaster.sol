// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlement} from "../../../interfaces/implementations/settlement/ISettlement.sol";
import {IValSetConfigProvider} from "../../../interfaces/implementations/settlement/IValSetConfigProvider.sol";
import {IMasterConfigProvider} from "../../../interfaces/implementations/settlement/IMasterConfigProvider.sol";
import {IOzAccessControl} from "src/interfaces/features/permissions/IOzAccessControl.sol";

interface IMaster {
    function initialize(
        ISettlement.SettlementInitParams memory settlementInitParams,
        IValSetConfigProvider.ValSetConfigProviderInitParams memory valSetConfigProviderInitParams,
        IMasterConfigProvider.MasterConfigProviderInitParams memory masterConfigProviderInitParams,
        address defaultAdmin
    ) external;
}
