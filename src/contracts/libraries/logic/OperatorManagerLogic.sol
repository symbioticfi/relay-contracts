// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {OperatorManager} from "../../OperatorManager.sol";
import {NetworkConfig} from "../../NetworkConfig.sol";
import {NetworkConfigLogic} from "./NetworkConfigLogic.sol";
import {BN254} from "../utils/BN254.sol";
import {Updatable} from "../utils/Updatable.sol";
import {UpdatableEnumerableSet} from "../utils/UpdatableEnumerableSet.sol";

import {BLSSig} from "./sigs/BLSSig.sol";
import {ECDSASig} from "./sigs/ECDSASig.sol";
import {EdDSASig} from "./sigs/EdDSASig.sol";

import {IHookReceiver} from "../../../interfaces/IHookReceiver.sol";

library OperatorManagerLogic {
    using Updatable for Updatable.Uint48Value;
    using Updatable for Updatable.Bytes32Value;
    using UpdatableEnumerableSet for UpdatableEnumerableSet.AddressSet;

    uint256 public constant ON_UNREGISTER_OPERATOR_GAS_LIMIT = 150_000;

    uint256 public constant ON_UNREGISTER_OPERATOR_RESERVE = 20_000;

    function getRequiredKeyTags(
        OperatorManager.OperatorManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint48) {
        return self._requiredKeyTags.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function getKey(
        OperatorManager.OperatorManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        OperatorManager.KeyTag keyTag
    ) public view returns (bytes memory) {
        bytes32 key = self._keys[operator][keyTag].get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
        if (keyTag == OperatorManager.KeyTag.BN254) {
            if (key == bytes32(0)) {
                return abi.encode(BN254.G1Point({X: 0, Y: 0}));
            }
            uint256 X = uint256(key) >> 1;
            (, uint256 Y) = BN254.findYFromX(X);
            return abi.encode(
                uint256(key) & 1 != Y & 1 ? BN254.negate(BN254.G1Point({X: X, Y: Y})) : BN254.G1Point({X: X, Y: Y})
            );
        }
        if (keyTag == OperatorManager.KeyTag.SECP256K1) {
            return abi.encode(key);
        }
        if (keyTag == OperatorManager.KeyTag.EDDSA) {
            return abi.encode(bytes32(key));
        }
        revert("Invalid key tag");
    }

    function getOperator(
        OperatorManager.OperatorManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage, /* networkConfigStorage */
        bytes32 key
    ) public view returns (address) {
        return self._operatorsByKeys[key];
    }

    function initialize(
        OperatorManager.OperatorManagerStorage storage self,
        OperatorManager.OperatorManagerInitParams memory initParams
    ) public {
        if (initParams.requiredKeyTags >> uint256(type(OperatorManager.KeyTag).max) + 1 > 0) {
            revert("Only predetermined key tags are allowed");
        }
        self._requiredKeyTags.value = initParams.requiredKeyTags;
    }

    function setRequiredKeyTags(
        OperatorManager.OperatorManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint48 requiredKeyTags
    ) public {
        if (requiredKeyTags >> uint256(type(OperatorManager.KeyTag).max) + 1 > 0) {
            revert("Only predetermined key tags are allowed");
        }
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        self._requiredKeyTags.set(currentEpoch, currentEpoch + 1, requiredKeyTags);
    }

    function registerOperator(
        OperatorManager.OperatorManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        OperatorManager.KeyWithTag[] memory keysWithTags,
        bytes[] memory signatures
    ) public {
        if (keysWithTags.length != signatures.length) {
            revert("Invalid parameters");
        }

        uint48 requiredKeyTags = getRequiredKeyTags(self, networkConfigStorage);
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);

        for (uint256 i; i < keysWithTags.length; ++i) {
            OperatorManager.KeyWithTag memory keyWithTag = keysWithTags[i];

            if (self._keys[operator][keyWithTag.keyTag].nextValueTimepoint != 0) {
                revert("Duplicate");
            }
            bytes32 compressedKey = _validateKey(self, operator, keyWithTag.keyTag, keyWithTag.key, signatures[i]);
            self._keys[operator][keyWithTag.keyTag].set(currentEpoch, currentEpoch + 1, compressedKey);
        }

        for (uint256 i; i < uint256(type(OperatorManager.KeyTag).max) + 1; ++i) {
            if ((requiredKeyTags & (1 << i)) == 0) {
                continue;
            }
            if (self._keys[operator][OperatorManager.KeyTag(i)].nextValueTimepoint == 0) {
                revert("Missing required key tag");
            }
        }

        if (!self._operators.add(currentEpoch, currentEpoch + 1, operator)) {
            revert("Failed to add operator");
        }

        address hookReceiver = NetworkConfigLogic.getHookReceiver(networkConfigStorage);
        if (hookReceiver != address(0)) {
            IHookReceiver(hookReceiver).onRegisterOperator(msg.sender, operator, keysWithTags, signatures);
        }
    }

    function updateKey(
        OperatorManager.OperatorManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        OperatorManager.KeyTag keyTag,
        bytes memory key,
        bytes memory signature
    ) public {
        bytes32 compressedKey = _validateKey(self, operator, keyTag, key, signature);
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._keys[operator][keyTag].set(currentEpoch, currentEpoch + 1, compressedKey)) {
            revert("Failed to set key");
        }

        address hookReceiver = NetworkConfigLogic.getHookReceiver(networkConfigStorage);
        if (hookReceiver != address(0)) {
            IHookReceiver(hookReceiver).onUpdateKey(msg.sender, operator, keyTag, key, signature);
        }
    }

    function unregisterOperator(
        OperatorManager.OperatorManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._operators.remove(currentEpoch, currentEpoch + 1, msg.sender)) {
            revert("Failed to remove operator");
        }

        address hookReceiver = NetworkConfigLogic.getHookReceiver(networkConfigStorage);
        if (hookReceiver != address(0)) {
            bytes memory calldata_ = abi.encodeCall(IHookReceiver.onUnregisterOperator, (msg.sender));

            if (gasleft() < ON_UNREGISTER_OPERATOR_RESERVE + ON_UNREGISTER_OPERATOR_GAS_LIMIT * 64 / 63) {
                revert("Insufficient gas");
            }

            assembly ("memory-safe") {
                pop(
                    call(
                        ON_UNREGISTER_OPERATOR_GAS_LIMIT, hookReceiver, 0, add(calldata_, 0x20), mload(calldata_), 0, 0
                    )
                )
            }
        }
    }

    function _validateKey(
        OperatorManager.OperatorManagerStorage storage self,
        address operator,
        OperatorManager.KeyTag keyTag,
        bytes memory key,
        bytes memory signature
    ) internal returns (bytes32 compressedKey) {
        if (keyTag == OperatorManager.KeyTag.BN254) {
            compressedKey = BLSSig.verifyKeySignature(operator, key, signature);
        } else if (keyTag == OperatorManager.KeyTag.SECP256K1) {
            compressedKey = ECDSASig.verifyKeySignature(operator, key, signature);
        } else if (keyTag == OperatorManager.KeyTag.EDDSA) {
            compressedKey = EdDSASig.verifyKeySignature(operator, key, signature);
        } else {
            revert("Invalid key tag");
        }

        if (self._operatorsByKeys[compressedKey] != address(0)) {
            revert("Duplicate");
        }
    }
}
