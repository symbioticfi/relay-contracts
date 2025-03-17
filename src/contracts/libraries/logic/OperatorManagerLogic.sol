// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {NetworkConfigLogic} from "./NetworkConfigLogic.sol";

import {BN254} from "../utils/BN254.sol";
import {Updatable} from "../utils/Updatable.sol";
import {BLSSig} from "./sigs/BLSSig.sol";
import {ECDSASig} from "./sigs/ECDSASig.sol";
import {EdDSASig} from "./sigs/EdDSASig.sol";

import {IOperatorManager} from "../../../interfaces/IOperatorManager.sol";
import {INetworkConfig} from "../../../interfaces/INetworkConfig.sol";
import {IHookReceiver} from "../../../interfaces/IHookReceiver.sol";

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";

library OperatorManagerLogic {
    using Updatable for Updatable.Uint104Value;
    using Updatable for Updatable.Uint208Value;
    using Updatable for Updatable.Bytes32Value;
    using Updatable for Updatable.Bytes64Value;
    using EnumerableSet for EnumerableSet.AddressSet;
    using Address for address;

    uint256 public constant ON_UNREGISTER_OPERATOR_GAS_LIMIT = 200_000;

    uint256 public constant ON_UNREGISTER_OPERATOR_RESERVE = 20_000;

    uint256 public constant ON_PAUSE_OPERATOR_GAS_LIMIT = 200_000;

    uint256 public constant ON_PAUSE_OPERATOR_RESERVE = 20_000;

    function getRequiredKeyTags(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (uint8[] memory requiredKeyTags) {
        uint128 compressedRequiredKeyTags =
            uint128(self._requiredKeyTags.get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage)));

        uint8 length;
        requiredKeyTags = new uint8[](128);
        for (uint8 i; i < 128; ++i) {
            if ((compressedRequiredKeyTags & (1 << i)) != 0) {
                requiredKeyTags[length++] = i;
            }
        }
        assembly ("memory-safe") {
            mstore(requiredKeyTags, length)
        }
    }

    function getKey(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        uint8 tag
    ) public view returns (bytes memory) {
        IOperatorManager.KeyType type_ = _getType(tag);
        if (type_ == IOperatorManager.KeyType.BLS_BN254) {
            bytes32 compressedKey = _getKeys32(self, networkConfigStorage, operator, tag);
            if (compressedKey == bytes32(0)) {
                return abi.encode(BN254.G1Point({X: 0, Y: 0}));
            }
            uint256 X = uint256(compressedKey) >> 1;
            (, uint256 Y) = BN254.findYFromX(X);
            return abi.encode(
                uint256(compressedKey) & 1 != Y & 1
                    ? BN254.negate(BN254.G1Point({X: X, Y: Y}))
                    : BN254.G1Point({X: X, Y: Y})
            );
        }
        if (type_ == IOperatorManager.KeyType.ECDSA_SECP256K1) {
            bytes32 compressedKey = _getKeys32(self, networkConfigStorage, operator, tag);
            return abi.encode(compressedKey);
        }
        if (type_ == IOperatorManager.KeyType.EDDSA_ED25519) {
            bytes32 compressedKey = _getKeys32(self, networkConfigStorage, operator, tag);
            return abi.encode(bytes32(compressedKey));
        }
        // if (type_ == IOperatorManager.KeyType.BLS_BLS12381) {
        //     (bytes32 compressedKey1, bytes32 compressedKey2) = _getKeys64(self, networkConfigStorage, operator, tag);
        //     return abi.encode(compressedKey1, compressedKey2);
        // }
        revert("Invalid key type");
    }

    function getCompressedKey(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        uint8 tag
    ) public view returns (bytes memory) {
        IOperatorManager.KeyType type_ = _getType(tag);
        if (type_ == IOperatorManager.KeyType.BLS_BN254) {
            return abi.encode(_getKeys32(self, networkConfigStorage, operator, tag));
        }
        if (type_ == IOperatorManager.KeyType.ECDSA_SECP256K1) {
            return abi.encode(_getKeys32(self, networkConfigStorage, operator, tag));
        }
        if (type_ == IOperatorManager.KeyType.EDDSA_ED25519) {
            return abi.encode(_getKeys32(self, networkConfigStorage, operator, tag));
        }
        revert("Invalid key type");
    }

    function getOperator(
        IOperatorManager.OperatorManagerStorage storage self,
        bytes memory compressedKey
    ) public view returns (address) {
        return self._operatorByKeyHash[keccak256(compressedKey)];
    }

    function getOperators(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public view returns (address[] memory operators) {
        address[] memory allOperators = self._operators.values();

        uint256 length;
        operators = new address[](allOperators.length);
        for (uint256 i; i < allOperators.length; ++i) {
            if (isUnpaused(self, networkConfigStorage, allOperators[i])) {
                operators[length++] = allOperators[i];
            }
        }
        assembly ("memory-safe") {
            mstore(operators, length)
        }
    }

    function isUnpaused(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) public view returns (bool) {
        return self._operatorUnpaused[operator].get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage)) == 1;
    }

    function initialize(
        IOperatorManager.OperatorManagerStorage storage self,
        IOperatorManager.OperatorManagerInitParams memory initParams
    ) public {
        if (initParams.requiredKeyTags >> uint256(type(IOperatorManager.KeyType).max) + 1 > 0) {
            revert("Only predetermined key tags are allowed");
        }
        self._requiredKeyTags.value = initParams.requiredKeyTags;
    }

    function setRequiredKeyTags(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        uint8[] memory requiredKeyTags
    ) public {
        uint128 compressedRequiredKeyTags;
        for (uint256 i; i < requiredKeyTags.length; ++i) {
            compressedRequiredKeyTags |= uint128(1 << requiredKeyTags[i]);
        }
        if (compressedRequiredKeyTags >> uint256(type(IOperatorManager.KeyType).max) + 1 > 0) {
            revert("Only predetermined key tags are allowed");
        }
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        self._requiredKeyTags.set(currentEpoch, currentEpoch + 1, compressedRequiredKeyTags);
    }

    function registerOperator(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        IOperatorManager.KeyWithTag[] memory keysWithTags,
        bytes[] memory signatures
    ) public {
        if (keysWithTags.length != signatures.length) {
            revert("Invalid parameters");
        }

        if (!self._operators.add(operator)) {
            revert("Failed to add operator");
        }
        unpauseOperator(self, networkConfigStorage, operator);

        uint128 inputtedTags;
        uint8[] memory requiredKeyTags = getRequiredKeyTags(self, networkConfigStorage);
        for (uint256 i; i < keysWithTags.length; ++i) {
            IOperatorManager.KeyWithTag memory keyWithTag = keysWithTags[i];

            bytes memory compressedKeyEncoded =
                _validateKey(self, operator, keyWithTag.tag, keyWithTag.key, signatures[i]);
            _setKey(self, networkConfigStorage, operator, keyWithTag.tag, compressedKeyEncoded);

            if ((inputtedTags & (1 << keyWithTag.tag)) != 0) {
                revert("Duplicate");
            }
            inputtedTags |= uint128(1 << keyWithTag.tag);
        }

        for (uint256 i; i < requiredKeyTags.length; ++i) {
            if ((inputtedTags & (1 << requiredKeyTags[i])) == 0) {
                revert("Missing required key tag");
            }
        }

        _blockingCall(
            networkConfigStorage,
            abi.encodeCall(IHookReceiver.onRegisterOperator, (msg.sender, operator, keysWithTags, signatures))
        );
    }

    function updateKey(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature
    ) public {
        if (!self._operators.contains(operator)) {
            revert("Operator does not exist");
        }
        bytes memory compressedKeyEncoded = _validateKey(self, operator, tag, key, signature);
        if (!_setKey(self, networkConfigStorage, operator, tag, compressedKeyEncoded)) {
            revert("Failed to set key");
        }

        _blockingCall(
            networkConfigStorage, abi.encodeCall(IHookReceiver.onUpdateKey, (msg.sender, operator, tag, key, signature))
        );
    }

    function unregisterOperator(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (
            self._operatorUnpaused[operator].get(currentEpoch) != 0
                || self._operatorUnpaused[operator].get(currentEpoch + 1) != 0
        ) {
            revert("Operator is not paused");
        }
        if (!self._operators.remove(operator)) {
            revert("Failed to remove operator");
        }
        self._operatorUnpaused[operator].clear();
    }

    function unregisterOperator(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public {
        unregisterOperator(self, networkConfigStorage, msg.sender);

        _nonBlockingCall(
            networkConfigStorage,
            abi.encodeCall(IHookReceiver.onUnregisterOperator, (msg.sender)),
            ON_UNREGISTER_OPERATOR_RESERVE,
            ON_UNREGISTER_OPERATOR_GAS_LIMIT
        );
    }

    function pauseOperator(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._operatorUnpaused[operator].set(currentEpoch, currentEpoch + 1, uint104(0))) {
            revert("Failed to set operator paused");
        }
    }

    function pauseOperator(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public {
        pauseOperator(self, networkConfigStorage, msg.sender);

        _nonBlockingCall(
            networkConfigStorage,
            abi.encodeCall(IHookReceiver.onPauseOperator, (msg.sender)),
            ON_PAUSE_OPERATOR_RESERVE,
            ON_PAUSE_OPERATOR_GAS_LIMIT
        );
    }

    function unpauseOperator(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._operatorUnpaused[operator].set(currentEpoch, currentEpoch + 1, uint104(1))) {
            revert("Failed to set operator unpaused");
        }
    }

    function unpauseOperator(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage
    ) public {
        unpauseOperator(self, networkConfigStorage, msg.sender);

        _blockingCall(networkConfigStorage, abi.encodeCall(IHookReceiver.onUnpauseOperator, (msg.sender)));
    }

    function _getType(
        uint8 tag
    ) internal pure returns (IOperatorManager.KeyType) {
        uint8 type_ = tag >> 4;
        if (type_ >= 8) {
            revert("Impossible key type");
        }
        return IOperatorManager.KeyType(type_);
    }

    function _validateKey(
        IOperatorManager.OperatorManagerStorage storage self,
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature
    ) internal returns (bytes memory compressedKey) {
        IOperatorManager.KeyType type_ = _getType(tag);
        if (type_ == IOperatorManager.KeyType.BLS_BN254) {
            compressedKey = abi.encode(BLSSig.verifyKeySignature(operator, key, signature));
        } else if (type_ == IOperatorManager.KeyType.ECDSA_SECP256K1) {
            compressedKey = abi.encode(ECDSASig.verifyKeySignature(operator, key, signature));
        } else if (type_ == IOperatorManager.KeyType.EDDSA_ED25519) {
            compressedKey = abi.encode(EdDSASig.verifyKeySignature(operator, key, signature));
        }
        // else if (type_ == IOperatorManager.KeyType.BLS_BLS12381) {
        //     compressedKey = abi.encode(EdDSASig.verifyKeySignature(operator, key, signature));
        // }
        else {
            revert("Invalid key tag");
        }

        // Disallow usage between different operators
        // Disallow usage of the same key on the same type on different tags
        // Allow usage of the old key on the same type and tag
        bytes32 compressedKeyHash = keccak256(compressedKey);
        address operatorByCompressedKey = self._operatorByKeyHash[compressedKeyHash];
        if (operatorByCompressedKey != address(0)) {
            if (operatorByCompressedKey != operator) {
                revert("Already used");
            }
            if (self._operatorByTagAndKeyHash[tag][compressedKeyHash] != address(0)) {
                return compressedKey;
            }
            if (self._operatorByTypeAndKeyHash[type_][compressedKeyHash] != address(0)) {
                revert("Already used");
            }
        }
    }

    function _setKey(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        uint8 tag,
        bytes memory compressedKeyEncoded
    ) internal returns (bool) {
        IOperatorManager.KeyType type_ = _getType(tag);

        bytes32 compressedKeyHash = keccak256(compressedKeyEncoded);
        self._operatorByKeyHash[compressedKeyHash] = operator;
        self._operatorByTypeAndKeyHash[type_][compressedKeyHash] = operator;
        self._operatorByTagAndKeyHash[tag][compressedKeyHash] = operator;

        if (type_ == IOperatorManager.KeyType.BLS_BN254) {
            bytes32 compressedKey = abi.decode(compressedKeyEncoded, (bytes32));
            return _setKey32(self, networkConfigStorage, operator, tag, compressedKey);
        }
        if (type_ == IOperatorManager.KeyType.ECDSA_SECP256K1) {
            bytes32 compressedKey = abi.decode(compressedKeyEncoded, (bytes32));
            return _setKey32(self, networkConfigStorage, operator, tag, compressedKey);
        }
        if (type_ == IOperatorManager.KeyType.EDDSA_ED25519) {
            bytes32 compressedKey = abi.decode(compressedKeyEncoded, (bytes32));
            return _setKey32(self, networkConfigStorage, operator, tag, compressedKey);
        }
        // if (type_ == IOperatorManager.KeyType.BLS_BLS12381) {
        //     (bytes32 compressedKey1, bytes32 compressedKey2) = abi.decode(compressedKeyEncoded, (bytes32, bytes32));
        //     return _setKey64(self, networkConfigStorage, operator, tag, compressedKey1, compressedKey2);
        // }
        revert("Invalid key type");
    }

    function _setKey32(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        uint8 tag,
        bytes32 compressedKey
    ) internal returns (bool) {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        return self._keys32[operator][tag].set(currentEpoch, currentEpoch + 1, compressedKey);
    }

    function _setKey64(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        uint8 tag,
        bytes32 compressedKey1,
        bytes32 compressedKey2
    ) internal returns (bool) {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        return self._keys64[operator][tag].set(currentEpoch, currentEpoch + 1, compressedKey1, compressedKey2);
    }

    function _getKeys32(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        uint8 tag
    ) internal view returns (bytes32) {
        return self._keys32[operator][tag].get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function _getKeys64(
        IOperatorManager.OperatorManagerStorage storage self,
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        uint8 tag
    ) internal view returns (bytes32, bytes32) {
        return self._keys64[operator][tag].get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function _blockingCall(
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        bytes memory calldata_
    ) internal {
        address hookReceiver = NetworkConfigLogic.getHookReceiver(networkConfigStorage);
        if (hookReceiver != address(0)) {
            hookReceiver.functionCall(calldata_);
        }
    }

    function _nonBlockingCall(
        INetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        bytes memory calldata_,
        uint256 reserve,
        uint256 gasLimit
    ) internal {
        address hookReceiver = NetworkConfigLogic.getHookReceiver(networkConfigStorage);
        if (hookReceiver != address(0)) {
            if (gasleft() < reserve + gasLimit * 64 / 63) {
                revert("Insufficient gas");
            }

            assembly ("memory-safe") {
                pop(call(gasLimit, hookReceiver, 0, add(calldata_, 0x20), mload(calldata_), 0, 0))
            }
        }
    }
}
