// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {OperatorManager} from "../contracts/OperatorManager.sol";

interface IHookReceiver {
    function onRegisterOperator(
        address msgSender,
        address operator,
        OperatorManager.KeyWithTag[] memory keysWithTags,
        bytes[] memory signatures
    ) external;

    function onUpdateKey(
        address msgSender,
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature
    ) external;

    function onUnregisterOperator(
        address msgSender
    ) external;

    function onPauseOperator(
        address msgSender
    ) external;

    function onUnpauseOperator(
        address msgSender
    ) external;
}
