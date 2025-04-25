// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IBaseSelfRegisterOperators} from "./IBaseSelfRegisterOperators.sol";

interface ISelfRegisterOperators is IBaseSelfRegisterOperators {
    struct SelfRegisterOperatorsInitParams {
        uint256 minVotingPowerThreshold;
    }

    function SelfRegisterOperators_VERSION() external view returns (uint64);

    function registerOperator(address vault, bytes memory extraData) external;

    function registerOperatorWithSignature(
        address operator,
        address vault,
        bytes memory signature,
        bytes memory extraData
    ) external;
}
