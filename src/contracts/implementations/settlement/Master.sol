// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Settlement} from "./Settlement.sol";
import {ConfigProvider} from "./ConfigProvider.sol";

import {OzAccessControl} from "../../features/permissions/OzAccessControl.sol";

import {IMaster} from "../../../interfaces/implementations/settlement/IMaster.sol";

contract Master is Settlement, ConfigProvider, OzAccessControl, IMaster {
    /**
     * @inheritdoc IMaster
     */
    function initialize(
        SettlementInitParams memory settlementInitParams,
        ConfigProviderInitParams memory configProviderInitParams,
        address defaultAdmin
    ) public virtual initializer {
        __Settlement_init(settlementInitParams);
        __ConfigProvider_init(configProviderInitParams);
        __OzAccessControl_init();

        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }
}
