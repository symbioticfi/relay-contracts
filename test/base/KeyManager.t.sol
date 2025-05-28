// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {KeyManager} from "../../src/contracts/base/KeyManager.sol";
import {IKeyManager} from "../../src/interfaces/base/IKeyManager.sol";

import {KeyBlsBn254} from "../../src/contracts/libraries/keys/KeyBlsBn254.sol";
import {KeyEcdsaSecp256k1} from "../../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {BN254} from "../../src/contracts/libraries/utils/BN254.sol";
import {BN254G2} from "../helpers/BN254G2.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {KeyManagerLogic} from "../../src/contracts/base/logic/KeyManagerLogic.sol";

import {IOzEIP712} from "../../src/interfaces/base/common/IOzEIP712.sol";
import {KeyTags} from "../../src/contracts/libraries/utils/KeyTags.sol";

contract TestKeyManager is KeyManager {
    function initialize(string memory name_, string memory version_) external initializer {
        __OzEIP712_init(IOzEIP712.OzEIP712InitParams({name: name_, version: version_}));
        __KeyManager_init();
    }

    function getOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view virtual returns (uint208) {
        return _getKeysOperatorsLengthAt(timestamp, hint);
    }

    function getOperatorsLength() public view virtual returns (uint208) {
        return _getKeysOperatorsLength();
    }

    function getOperatorsAt(uint48 timestamp, bytes[] memory hints) public view virtual returns (address[] memory) {
        return _getKeysOperatorsAt(timestamp, hints);
    }

    function getOperators() public view virtual returns (address[] memory) {
        return _getKeysOperators();
    }

    function getKeyTagsAt(
        address operator,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (uint8[] memory) {
        return _getKeyTagsAt(operator, timestamp, hint);
    }

    function getKeyTags(
        address operator
    ) public view virtual returns (uint8[] memory) {
        return _getKeyTags(operator);
    }
}

contract KeyManagerTest is Test {
    using KeyBlsBn254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for bytes;
    using KeyEcdsaSecp256k1 for address;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;
    using KeyEcdsaSecp256k1 for bytes;
    using KeyTags for uint8;
    using KeyTags for bytes32;
    using BN254 for BN254.G1Point;
    using BN254 for BN254.G2Point;

    TestKeyManager keyManager;

    bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    uint256 ecdsaUserPrivateKey = 0xABCDE;
    address ecdsaUser = vm.createWallet(ecdsaUserPrivateKey).addr;

    uint256 blsUserSk = 0x12345;

    function getG2Key(
        uint256 privateKey
    ) internal view returns (BN254.G2Point memory) {
        BN254.G2Point memory G2 = BN254.generatorG2();
        (uint256 x1, uint256 x2, uint256 y1, uint256 y2) =
            BN254G2.ECTwistMul(privateKey, G2.X[1], G2.X[0], G2.Y[1], G2.Y[0]);
        return BN254.G2Point([x2, x1], [y2, y1]);
    }

    function setUp() public {
        keyManager = new TestKeyManager();
        keyManager.initialize("KeyRegistry", "1");
    }

    function test_SetECDSAKey() public {
        vm.startPrank(ecdsaUser);
        bytes memory key1Bytes = KeyEcdsaSecp256k1.wrap(ecdsaUser).toBytes();
        bytes32 messageHash1 =
            keyManager.hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, ecdsaUser, keccak256(key1Bytes))));
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(ecdsaUserPrivateKey, messageHash1);
        bytes memory signature1 = abi.encodePacked(r, s, v);
        keyManager.setKey(keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0), key1Bytes, signature1, new bytes(0));
        vm.stopPrank();

        address operator = keyManager.getOperator(key1Bytes);
        assertEq(operator, ecdsaUser, "Operator mismatch for ECDSA key");

        bytes memory storedKey = keyManager.getKey(ecdsaUser, keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0));
        assertEq(keccak256(storedKey), keccak256(key1Bytes), "ECDSA Key mismatch");

        bytes memory storedKey2 = keyManager.getKeyAt(
            ecdsaUser, keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0), uint48(vm.getBlockTimestamp()), new bytes(0)
        );
        assertEq(keccak256(storedKey2), keccak256(key1Bytes), "ECDSA Key mismatch");

        vm.expectRevert(IKeyManager.KeyManager_InvalidKeyType.selector);
        keyManager.getKey(ecdsaUser, uint8(7).getKeyTag(0));

        vm.expectRevert(IKeyManager.KeyManager_InvalidKeyType.selector);
        keyManager.getKeyAt(ecdsaUser, uint8(7).getKeyTag(0), uint48(vm.getBlockTimestamp()), new bytes(0));

        uint8[] memory keyTags = keyManager.getKeyTags(ecdsaUser);
        assertEq(keyTags.length, 1, "Should have 1 key tag");
        assertEq(keyTags[0], keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0), "Key tag mismatch");

        uint8[] memory keyTagsAt = keyManager.getKeyTagsAt(ecdsaUser, uint48(vm.getBlockTimestamp()), new bytes(0));
        assertEq(keyTagsAt.length, 1, "Should have 1 key tag");
        assertEq(keyTagsAt[0], keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0), "Key tag mismatch");
    }

    function test_SetECDSAKey_RevertOnInvalidSignature() public {
        bytes memory ecdsaKeyBytes = ecdsaUser.wrap().toBytes();
        bytes32 keyHash = keccak256(ecdsaKeyBytes);
        bytes32 structHash = keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, ecdsaUser, keyHash));
        bytes32 digest = keyManager.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(0x9999, digest);
        bytes memory signature = abi.encodePacked(r, s, v);

        uint8 ecdsaKeyTag = keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0);

        vm.expectRevert(IKeyManager.KeyManager_InvalidKeySignature.selector);
        keyManager.setKey(ecdsaKeyTag, ecdsaKeyBytes, signature, new bytes(0));
    }

    function test_SetBLSKey() public {
        BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(blsUserSk);
        BN254.G2Point memory keyG2 = getG2Key(blsUserSk);
        bytes memory key0Bytes = KeyBlsBn254.wrap(keyG1).toBytes();
        bytes32 messageHash0 =
            keyManager.hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, ecdsaUser, keccak256(key0Bytes))));
        BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash0);
        BN254.G1Point memory sigG1 = messageG1.scalar_mul(blsUserSk);
        vm.startPrank(ecdsaUser);
        keyManager.setKey(
            keyManager.KEY_TYPE_BLS_BN254().getKeyTag(15), key0Bytes, abi.encode(sigG1), abi.encode(keyG2)
        );
        vm.stopPrank();
        address storedOperator = keyManager.getOperator(key0Bytes);
        assertEq(storedOperator, ecdsaUser, "Operator mismatch for BLS key");

        bytes memory storedKey = keyManager.getKey(ecdsaUser, keyManager.KEY_TYPE_BLS_BN254().getKeyTag(15));
        assertEq(keccak256(storedKey), keccak256(key0Bytes), "BLS Key mismatch");

        bytes memory storedKey2 = keyManager.getKeyAt(
            ecdsaUser, keyManager.KEY_TYPE_BLS_BN254().getKeyTag(15), uint48(vm.getBlockTimestamp()), new bytes(0)
        );
        assertEq(keccak256(storedKey2), keccak256(key0Bytes), "BLS Key mismatch");

        vm.expectRevert(IKeyManager.KeyManager_InvalidKeyType.selector);
        keyManager.getKey(ecdsaUser, uint8(7).getKeyTag(15));

        vm.expectRevert(IKeyManager.KeyManager_InvalidKeyType.selector);
        keyManager.getKeyAt(ecdsaUser, uint8(7).getKeyTag(15), uint48(vm.getBlockTimestamp()), new bytes(0));

        uint8[] memory keyTags = keyManager.getKeyTags(ecdsaUser);
        assertEq(keyTags.length, 1, "Should have 1 key tag");
        assertEq(keyTags[0], keyManager.KEY_TYPE_BLS_BN254().getKeyTag(15), "Key tag mismatch");

        uint8[] memory keyTagsAt = keyManager.getKeyTagsAt(ecdsaUser, uint48(vm.getBlockTimestamp()), new bytes(0));
        assertEq(keyTagsAt.length, 1, "Should have 1 key tag");
        assertEq(keyTagsAt[0], keyManager.KEY_TYPE_BLS_BN254().getKeyTag(15), "Key tag mismatch");
    }

    function test_SetKey_AlreadyUsedKeyDifferentOperator() public {
        vm.startPrank(ecdsaUser);
        bytes memory key1Bytes = KeyEcdsaSecp256k1.wrap(ecdsaUser).toBytes();
        bytes32 messageHash1 =
            keyManager.hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, ecdsaUser, keccak256(key1Bytes))));
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(ecdsaUserPrivateKey, messageHash1);
        bytes memory signature1 = abi.encodePacked(r, s, v);
        uint8 keyTag = keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0);
        keyManager.setKey(keyTag, key1Bytes, signature1, new bytes(0));
        vm.stopPrank();

        uint256 differentOperatorPk = 0x9999;
        address differentOperator = vm.createWallet(differentOperatorPk).addr;
        bytes memory differentOperatorKey = KeyEcdsaSecp256k1.wrap(differentOperator).toBytes();
        bytes memory signature2;
        {
            bytes32 messageHash2 = keyManager.hashTypedDataV4(
                keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, differentOperator, keccak256(key1Bytes)))
            );
            (uint8 v2, bytes32 r2, bytes32 s2) = vm.sign(ecdsaUserPrivateKey, messageHash2);
            signature2 = abi.encodePacked(r2, s2, v2);
        }

        vm.startPrank(differentOperator);
        vm.expectRevert(IKeyManager.KeyManager_AlreadyUsed.selector);
        keyManager.setKey(keyTag, key1Bytes, signature2, new bytes(0));
        vm.stopPrank();
    }

    function test_SetKey_SameOperatorSameTag_Overwrite() public {
        vm.startPrank(ecdsaUser);
        bytes memory oldKeyBytes = KeyEcdsaSecp256k1.wrap(ecdsaUser).toBytes();
        bytes32 msgHash =
            keyManager.hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, ecdsaUser, keccak256(oldKeyBytes))));
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(ecdsaUserPrivateKey, msgHash);
        bytes memory sig = abi.encodePacked(r, s, v);

        uint8 ecdsaTag = keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0);
        keyManager.setKey(ecdsaTag, oldKeyBytes, sig, new bytes(0));
        vm.stopPrank();

        vm.startPrank(ecdsaUser);
        uint256 newPrivateKey = 0x999999;
        address newAddr = vm.createWallet(newPrivateKey).addr;
        bytes memory newKeyBytes = KeyEcdsaSecp256k1.wrap(newAddr).toBytes();

        bytes32 msgHash2 =
            keyManager.hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, ecdsaUser, keccak256(newKeyBytes))));
        (uint8 v2, bytes32 r2, bytes32 s2) = vm.sign(newPrivateKey, msgHash2);
        bytes memory sig2 = abi.encodePacked(r2, s2, v2);

        keyManager.setKey(ecdsaTag, newKeyBytes, sig2, new bytes(0));
        vm.stopPrank();

        bytes memory storedKey = keyManager.getKey(ecdsaUser, ecdsaTag);
        assertEq(keccak256(storedKey), keccak256(newKeyBytes), "Should have updated key to the new key bytes");
    }

    function test_SetKey_SameOperatorDifferentTags() public {
        vm.startPrank(ecdsaUser);
        uint8 ecdsaTag0 = keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0);
        uint8 ecdsaTag1 = keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(1);
        {
            bytes memory keyBytes0 = KeyEcdsaSecp256k1.wrap(ecdsaUser).toBytes();
            bytes32 structHash0 = keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, ecdsaUser, keccak256(keyBytes0)));
            bytes32 digest0 = keyManager.hashTypedDataV4(structHash0);
            (uint8 v0, bytes32 r0, bytes32 s0) = vm.sign(ecdsaUserPrivateKey, digest0);
            bytes memory sig0 = abi.encodePacked(r0, s0, v0);

            keyManager.setKey(ecdsaTag0, keyBytes0, sig0, new bytes(0));

            vm.expectRevert(IKeyManager.KeyManager_AlreadyUsed.selector);
            keyManager.setKey(ecdsaTag1, keyBytes0, sig0, new bytes(0));
        }

        {
            uint256 pk2 = 0x55555;
            address addr2 = vm.createWallet(pk2).addr;
            bytes memory keyBytes1 = KeyEcdsaSecp256k1.wrap(addr2).toBytes();

            bytes32 structHash1 = keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, ecdsaUser, keccak256(keyBytes1)));
            bytes32 digest1 = keyManager.hashTypedDataV4(structHash1);
            (uint8 v1, bytes32 r1, bytes32 s1) = vm.sign(pk2, digest1);
            bytes memory sig1 = abi.encodePacked(r1, s1, v1);

            keyManager.setKey(ecdsaTag1, keyBytes1, sig1, new bytes(0));
        }

        vm.stopPrank();

        bytes memory storedKey0 = keyManager.getKey(ecdsaUser, ecdsaTag0);
        bytes memory storedKey1 = keyManager.getKey(ecdsaUser, ecdsaTag1);
        assertTrue(storedKey0.length > 0, "Key #0 must exist");
        assertTrue(storedKey1.length > 0, "Key #1 must exist");
        assertNotEq(keccak256(storedKey0), keccak256(storedKey1), "Keys differ for different tags");
    }

    function test_SetKey_RevertOnInvalidKeyType() public {
        uint8 invalidType = 3;
        uint8 identifier = 0;
        uint8 invalidTag = KeyTags.getKeyTag(invalidType, identifier);

        address randomAddr = vm.addr(0x9999999);
        bytes memory randomKey = KeyEcdsaSecp256k1.wrap(randomAddr).toBytes();

        vm.expectRevert(IKeyManager.KeyManager_InvalidKeyType.selector);
        keyManager.setKey(invalidTag, randomKey, new bytes(0), new bytes(0));
    }

    function test_GetOperator_UnknownKey() public {
        bytes memory someKey = "random-key-bytes";
        address op = keyManager.getOperator(someKey);
        assertEq(op, address(0), "Should return address(0) for unknown key");
    }

    function test_GetKeysOperators_MultipleOperators() public {
        _registerSimpleECDSA(ecdsaUser, ecdsaUserPrivateKey, 0);
        uint256 pk2 = 0xABCDEF;
        address op2 = vm.createWallet(pk2).addr;
        _registerSimpleECDSA(op2, pk2, 1);

        address[] memory ops = keyManager.getOperators();
        bool foundOp1;
        bool foundOp2;
        for (uint256 i = 0; i < ops.length; i++) {
            if (ops[i] == ecdsaUser) foundOp1 = true;
            if (ops[i] == op2) foundOp2 = true;
        }
        assertTrue(foundOp1, "Should find operator #1 in set");
        assertTrue(foundOp2, "Should find operator #2 in set");

        address[] memory opsAt = keyManager.getOperatorsAt(uint48(vm.getBlockTimestamp()), new bytes[](0));
        assertEq(opsAt.length, 2, "Should have 2 operators");
        assertEq(opsAt[0], ecdsaUser, "Operator #1 mismatch");
        assertEq(opsAt[1], op2, "Operator #2 mismatch");

        uint256 opsLength = keyManager.getOperatorsLength();
        assertEq(opsLength, 2, "Should have 2 operators");

        uint256 opsLengthAt = keyManager.getOperatorsLengthAt(uint48(vm.getBlockTimestamp()), new bytes(0));
        assertEq(opsLengthAt, 2, "Should have 2 operators");

        IKeyManager.Key[] memory keysOp1 = keyManager.getKeys(ecdsaUser);
        assertEq(keysOp1.length, 1, "Operator #1 should have exactly 1 key");
        assertEq(keysOp1[0].tag, keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0), "Tag mismatch for op1's key");

        IKeyManager.Key[] memory keysOp2 = keyManager.getKeys(op2);
        assertEq(keysOp2.length, 1, "Operator #2 should have exactly 1 key");
        assertEq(keysOp2[0].tag, keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(1), "Tag mismatch for op2's key");

        IKeyManager.OperatorWithKeys[] memory operatorsKeys = keyManager.getKeys();
        assertEq(operatorsKeys.length, 2, "Should have 2 operators");
        assertEq(operatorsKeys[0].operator, ecdsaUser, "Operator #1 mismatch");
        assertEq(operatorsKeys[1].operator, op2, "Operator #2 mismatch");
        assertEq(operatorsKeys[0].keys.length, 1, "Operator #1 should have exactly 1 key");
        assertEq(operatorsKeys[1].keys.length, 1, "Operator #2 should have exactly 1 key");
        assertEq(
            operatorsKeys[0].keys[0].tag,
            keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0),
            "Tag mismatch for op1's key"
        );

        IKeyManager.OperatorWithKeys[] memory operatorsKeysAt = keyManager.getKeysAt(uint48(vm.getBlockTimestamp()), "");
        assertEq(operatorsKeysAt.length, 2, "Should have 2 operators");
        assertEq(operatorsKeysAt[0].operator, ecdsaUser, "Operator #1 mismatch");
        assertEq(operatorsKeysAt[1].operator, op2, "Operator #2 mismatch");
        assertEq(operatorsKeysAt[0].keys.length, 1, "Operator #1 should have exactly 1 key");
        assertEq(operatorsKeysAt[1].keys.length, 1, "Operator #2 should have exactly 1 key");
        assertEq(
            operatorsKeysAt[0].keys[0].tag,
            keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0),
            "Tag mismatch for op1's key"
        );
    }

    function test_GetKeysAt_TimeCheckpoints() public {
        uint48 t1 = uint48(vm.getBlockTimestamp());
        _registerSimpleECDSA(ecdsaUser, ecdsaUserPrivateKey, 0);

        vm.warp(vm.getBlockTimestamp() + 100);
        uint48 t2 = uint48(vm.getBlockTimestamp());
        _registerSimpleECDSA(ecdsaUser, ecdsaUserPrivateKey + 1, 1);

        IKeyManager.Key[] memory keysAtT1 = keyManager.getKeysAt(ecdsaUser, t1, "");
        assertEq(keysAtT1.length, 1, "Should have only 1 key at time t1");

        IKeyManager.Key[] memory keysNow = keyManager.getKeys(ecdsaUser);
        assertEq(keysNow.length, 2, "Should have 2 keys in the latest state");

        IKeyManager.Key[] memory keysAtT2 = keyManager.getKeysAt(ecdsaUser, t2, "");
        assertEq(keysAtT2.length, 2, "2 keys at time t2");

        uint8[] memory keyTagsAtT1 = keyManager.getKeyTagsAt(ecdsaUser, t1, "");
        assertEq(keyTagsAtT1.length, 1, "Should have only 1 key tag at time t1");
        assertEq(keyTagsAtT1[0], keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0), "Key tag mismatch");

        uint8[] memory keyTagsAtT2 = keyManager.getKeyTagsAt(ecdsaUser, t2, "");
        assertEq(keyTagsAtT2.length, 2, "Should have 2 key tags at time t2");
        assertEq(keyTagsAtT2[0], keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(0), "Key tag mismatch");
        assertEq(keyTagsAtT2[1], keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(1), "Key tag mismatch");
    }

    function _registerSimpleECDSA(address operator, uint256 pk, uint8 tagIdentifier) internal {
        address keyOwner = vm.createWallet(pk).addr;
        bytes memory keyBytes = KeyEcdsaSecp256k1.wrap(keyOwner).toBytes();
        bytes32 structHash = keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, operator, keccak256(keyBytes)));
        bytes32 digest = keyManager.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(pk, digest);
        bytes memory sig = abi.encodePacked(r, s, v);

        uint8 ecdsaKeyTag = keyManager.KEY_TYPE_ECDSA_SECP256K1().getKeyTag(tagIdentifier);

        vm.startPrank(operator);
        keyManager.setKey(ecdsaKeyTag, keyBytes, sig, new bytes(0));
        vm.stopPrank();
    }

    function test_Location() public {
        bytes32 location =
            keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManager")) - 1)) & ~bytes32(uint256(0xff));
        assertEq(location, 0x6521690ca2d70b23823c69a92a4a0089d4c270c9c885205eafdf0ae297a8bf00, "Location mismatch");
    }

    function test_KeyTypes() public {
        assertEq(keyManager.TOTAL_KEY_TYPES(), 2);
        assertEq(keyManager.KeyManager_VERSION(), 1);
    }
}
