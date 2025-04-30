// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SettlementManager} from "./SettlementManager.sol";
import {ValSetConfigManager} from "./ValSetConfigManager.sol";
import {MasterConfigManager} from "./MasterConfigManager.sol";

import {OzAccessControl} from "../../features/permissions/OzAccessControl.sol";

import {IMaster} from "../../../interfaces/implementations/settlement/IMaster.sol";

contract Master is SettlementManager, ValSetConfigManager, MasterConfigManager, OzAccessControl, IMaster {
    constructor() {
        // _disableInitializers();
    }

    /**
     * @inheritdoc IMaster
     */
    function initialize(
        SettlementManagerInitParams memory settlementManagerInitParams,
        ValSetConfigManagerInitParams memory valSetConfigManagerInitParams,
        MasterConfigManagerInitParams memory masterConfigManagerInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __SettlementManager_init(settlementManagerInitParams);
        __ValSetConfigManager_init(valSetConfigManagerInitParams);
        __MasterConfigManager_init(masterConfigManagerInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
