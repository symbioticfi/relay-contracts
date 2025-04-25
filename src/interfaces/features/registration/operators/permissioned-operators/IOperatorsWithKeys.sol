// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IKeyManager} from "../../../../base/IKeyManager.sol";
import {IBaseOperators} from "./IBaseOperators.sol";

interface IOperatorsWithKeys is IBaseOperators {
    function OperatorsWithKeys_VERSION() external view returns (uint64);

    function registerOperatorWithPermission(
        address operator,
        address vault,
        IKeyManager.KeyWithSignature[] memory keysWithSignatures
    ) external;

    function updateKeyWithPermission(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) external;
}
