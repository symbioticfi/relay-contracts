// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IKeyManager} from "../../../../base/IKeyManager.sol";
import {IBaseSelfRegisterOperators} from "./IBaseSelfRegisterOperators.sol";

interface ISelfRegisterOperatorsWithKeys is IBaseSelfRegisterOperators {
    struct SelfRegisterOperatorsWithKeysInitParams {
        uint256 minVotingPowerThreshold;
    }

    function SelfRegisterOperatorsWithKeys_VERSION() external view returns (uint64);

    function registerOperator(
        address vault,
        IKeyManager.KeyWithSignature[] memory keysWithSignatures,
        bytes memory extraData
    ) external;

    function registerOperatorWithSignature(
        address operator,
        address vault,
        IKeyManager.KeyWithSignature[] memory keysWithSignatures,
        bytes memory signature,
        bytes memory extraData
    ) external;

    function updateKey(uint8 tag, bytes memory key, bytes memory keySignature, bytes memory extraData) external;

    function updateKeyWithSignature(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory keySignature,
        bytes memory extraData,
        bytes memory signature
    ) external;
}
