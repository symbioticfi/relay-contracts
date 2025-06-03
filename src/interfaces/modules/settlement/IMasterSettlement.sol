// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISettlement} from "../../../interfaces/modules/settlement/ISettlement.sol";
import {IConfigProvider} from "../../../interfaces/modules/settlement/IConfigProvider.sol";

interface IMasterSettlement {
    struct MasterSettlementInitParams {
        ISettlement.SettlementInitParams settlementInitParams;
        IConfigProvider.ConfigProviderInitParams configProviderInitParams;
    }

    function MasterSettlement_VERSION() external view returns (uint64);
}
