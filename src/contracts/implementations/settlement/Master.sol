// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Settlement} from "./Settlement.sol";
import {ValSetConfigProvider} from "./ValSetConfigProvider.sol";
import {MasterConfigProvider} from "./MasterConfigProvider.sol";

import {OzAccessControl} from "../../features/permissions/OzAccessControl.sol";

import {IMaster} from "../../../interfaces/implementations/settlement/IMaster.sol";

contract Master is Settlement, ValSetConfigProvider, MasterConfigProvider, OzAccessControl, IMaster {
    /**
     * @inheritdoc IMaster
     */
    function initialize(
        SettlementInitParams memory settlementInitParams,
        ValSetConfigProviderInitParams memory valSetConfigProviderInitParams,
        MasterConfigProviderInitParams memory masterConfigProviderInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __Settlement_init(settlementInitParams);
        __ValSetConfigProvider_init(valSetConfigProviderInitParams);
        __MasterConfigProvider_init(masterConfigProviderInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
