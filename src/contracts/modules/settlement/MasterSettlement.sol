// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Settlement} from "./Settlement.sol";
import {ConfigProvider} from "./ConfigProvider.sol";

import {IMasterSettlement} from "../../../interfaces/modules/settlement/IMasterSettlement.sol";

abstract contract MasterSettlement is Settlement, ConfigProvider, IMasterSettlement {
    /**
     * @inheritdoc IMasterSettlement
     */
    uint64 public constant MasterSettlement_VERSION = 1;

    function __MasterSettlement_init(
        MasterSettlementInitParams memory masterSettlementInitParams
    ) public virtual onlyInitializing {
        __Settlement_init(masterSettlementInitParams.settlementInitParams);
        __ConfigProvider_init(masterSettlementInitParams.configProviderInitParams);
    }
}
