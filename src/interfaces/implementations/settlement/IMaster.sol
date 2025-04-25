// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlementManager} from "../../../interfaces/implementations/settlement/ISettlementManager.sol";
import {IValSetConfigManager} from "../../../interfaces/implementations/settlement/IValSetConfigManager.sol";
import {IMasterConfigManager} from "../../../interfaces/implementations/settlement/IMasterConfigManager.sol";
import {IOzOwnable} from "../../../interfaces/features/permissions/IOzOwnable.sol";

interface IMaster {
    function initialize(
        ISettlementManager.SettlementManagerInitParams memory settlementManagerInitParams,
        IValSetConfigManager.ValSetConfigManagerInitParams memory valSetConfigManagerInitParams,
        IMasterConfigManager.MasterConfigManagerInitParams memory masterConfigManagerInitParams,
        IOzOwnable.OzOwnableInitParams memory ozOwnableInitParams
    ) external;
}
