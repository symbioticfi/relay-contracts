// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IKeyManager} from "../../../interfaces/base/IKeyManager.sol";
import {IOzEIP712} from "../../base/common/IOzEIP712.sol";

interface IKeyRegistry {
    function getOperatorsLengthAt(uint48 timestamp, bytes memory hint) external view returns (uint256);

    function getOperatorsLength() external view returns (uint256);

    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) external view returns (address[] memory);

    function getOperators() external view returns (address[] memory);

    function initialize(
        IKeyManager.KeyManagerInitParams memory keyManagerInitParams,
        IOzEIP712.OzEIP712InitParams memory ozEip712InitParams
    ) external;

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) external;

    function registerKeys(address operator, IKeyManager.KeyWithSignature[] memory keysWithSignatures) external;

    function updateKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) external;
}
