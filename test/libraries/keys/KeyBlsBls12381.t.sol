// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

import {KeyBlsBls12381} from "../../../src/libraries/keys/KeyBlsBls12381.sol";
import {BLS12381} from "../../../src/libraries/utils/BLS12381.sol";

import {KeyBlsBls12381Mock} from "../../mocks/KeyBlsBls12381Mock.sol";

contract KeyBlsBls12381Test is Test {
    using KeyBlsBls12381 for BLS12381.G1Point;
    using KeyBlsBls12381 for KeyBlsBls12381.KEY_BLS_BLS12381;

    KeyBlsBls12381Mock mock;

    address private constant MODEXP = address(0x05);
    uint256 private constant P_A = 0x1a0111ea397fe69a4b1ba7b6434bacd7;
    uint256 private constant P_B = 0x64774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab;
    uint256 private constant P_PLUS_ONE_SLASH_2_A = 0x0680447a8e5ff9a692c6e9ed90d2eb35;
    uint256 private constant P_PLUS_ONE_SLASH_2_B = 0xd91dd2e13ce144afd9cc34a83dac3d8907aaffffac54ffffee7fbfffffffeaab;
    uint256 private constant PRE_BRANCH_LOW = type(uint256).max - 3;
    uint256 private constant POST_BRANCH_LOW = 0x9b88b47b0c7aed4098cf2d5f094f09dbe15400014eac00004601000000005556;
    bytes32 private constant G1_SUBGROUP_ORDER = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;
    address private constant G1_MSM_PRECOMPILE = address(0x0c);

    function setUp() public {
        mock = new KeyBlsBls12381Mock();
    }

    function _generator() internal pure returns (BLS12381.G1Point memory) {
        return BLS12381.negate(BLS12381.negGeneratorG1());
    }

    function _negGenerator() internal pure returns (BLS12381.G1Point memory) {
        return BLS12381.negGeneratorG1();
    }

    function test_WrapUnwrapZero() public {
        BLS12381.G1Point memory identity = BLS12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0});
        KeyBlsBls12381.KEY_BLS_BLS12381 memory wrapped = KeyBlsBls12381.wrap(identity);
        BLS12381.G1Point memory unwrapped = wrapped.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_WrapUnwrapGenerator() public {
        BLS12381.G1Point memory pt = _generator();
        KeyBlsBls12381.KEY_BLS_BLS12381 memory wrapped = KeyBlsBls12381.wrap(pt);
        BLS12381.G1Point memory unwrapped = wrapped.unwrap();
        assertEq(unwrapped.x_a, pt.x_a);
        assertEq(unwrapped.x_b, pt.x_b);
        assertEq(unwrapped.y_a, pt.y_a);
        assertEq(unwrapped.y_b, pt.y_b);
    }

    function test_SerializeDeserializeZero() public {
        BLS12381.G1Point memory identity = BLS12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0});
        KeyBlsBls12381.KEY_BLS_BLS12381 memory wrapped = KeyBlsBls12381.wrap(identity);
        bytes memory serialized = KeyBlsBls12381.serialize(wrapped);
        KeyBlsBls12381.KEY_BLS_BLS12381 memory deserialized = KeyBlsBls12381.deserialize(serialized);
        BLS12381.G1Point memory unwrapped = deserialized.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_SerializeDeserializeGenerator() public {
        BLS12381.G1Point memory pt = _generator();
        KeyBlsBls12381.KEY_BLS_BLS12381 memory wrapped = KeyBlsBls12381.wrap(pt);
        bytes memory serialized = KeyBlsBls12381.serialize(wrapped);
        KeyBlsBls12381.KEY_BLS_BLS12381 memory deserialized = KeyBlsBls12381.deserialize(serialized);
        BLS12381.G1Point memory finalPt = deserialized.unwrap();
        assertEq(finalPt.x_a, pt.x_a);
        assertEq(finalPt.x_b, pt.x_b);
        assertEq(finalPt.y_a, pt.y_a);
        assertEq(finalPt.y_b, pt.y_b);
    }

    function test_SerializeDeserializeNegated() public {
        BLS12381.G1Point memory pt = _negGenerator();
        KeyBlsBls12381.KEY_BLS_BLS12381 memory wrapped = KeyBlsBls12381.wrap(pt);
        bytes memory serialized = KeyBlsBls12381.serialize(wrapped);
        KeyBlsBls12381.KEY_BLS_BLS12381 memory deserialized = KeyBlsBls12381.deserialize(serialized);
        BLS12381.G1Point memory finalPt = deserialized.unwrap();
        assertEq(finalPt.x_a, pt.x_a);
        assertEq(finalPt.x_b, pt.x_b);
        assertEq(finalPt.y_a, pt.y_a);
        assertEq(finalPt.y_b, pt.y_b);
    }

    function test_ToBytesFromBytesZero() public {
        BLS12381.G1Point memory identity = BLS12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0});
        KeyBlsBls12381.KEY_BLS_BLS12381 memory wrapped = KeyBlsBls12381.wrap(identity);
        bytes memory encoded = KeyBlsBls12381.toBytes(wrapped);
        KeyBlsBls12381.KEY_BLS_BLS12381 memory decoded = KeyBlsBls12381.fromBytes(encoded);
        BLS12381.G1Point memory unwrapped = decoded.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_ToBytesFromBytesGenerator() public {
        BLS12381.G1Point memory pt = _generator();
        KeyBlsBls12381.KEY_BLS_BLS12381 memory wrapped = KeyBlsBls12381.wrap(pt);
        bytes memory encoded = KeyBlsBls12381.toBytes(wrapped);
        KeyBlsBls12381.KEY_BLS_BLS12381 memory decoded = KeyBlsBls12381.fromBytes(encoded);
        BLS12381.G1Point memory finalPt = decoded.unwrap();
        assertEq(finalPt.x_a, pt.x_a);
        assertEq(finalPt.x_b, pt.x_b);
        assertEq(finalPt.y_a, pt.y_a);
        assertEq(finalPt.y_b, pt.y_b);
    }

    function test_DeserializeZeroFromEmpty() public {
        bytes memory empty = abi.encode([uint256(0), uint256(0)]);
        KeyBlsBls12381.KEY_BLS_BLS12381 memory deserialized = KeyBlsBls12381.deserialize(empty);
        BLS12381.G1Point memory unwrapped = deserialized.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_DeserializeRevertsInvalidLength() public {
        bytes memory invalid = hex"1234";
        vm.expectRevert();
        mock.deserialize(invalid);
    }

    function test_FromBytesRevertsInvalidLength() public {
        bytes memory invalid = hex"123456";
        vm.expectRevert();
        mock.fromBytes(invalid);
    }

    function test_FromBytesRevertsInvalidBytes() public {
        BLS12381.G1Point memory pt = _generator();
        KeyBlsBls12381.fromBytes(abi.encode(pt));
        vm.expectRevert(KeyBlsBls12381.KeyBlsBls12381_InvalidBytes.selector);
        mock.fromBytes(abi.encode(pt, uint256(1)));
    }

    function test_FromBytesRevertsInvalidKey() public {
        BLS12381.G1Point memory invalid = _generator();
        invalid.y_a = bytes32(uint256(invalid.y_a) + 1);
        vm.expectRevert(KeyBlsBls12381.KeyBlsBls12381_InvalidKey.selector);
        mock.fromBytes(abi.encode(invalid));
    }

    function test_WrapRevertsInvalidKey() public {
        BLS12381.G1Point memory pt = _generator();
        pt.y_a = bytes32(uint256(pt.y_a) + 1);
        vm.expectRevert(KeyBlsBls12381.KeyBlsBls12381_InvalidKey.selector);
        mock.wrap(pt);
    }

    function test_WrapRevertsNonSubgroupPoint() public {
        BLS12381.G1Point memory smallOrder =
            BLS12381.G1Point({x_a: bytes32(0), x_b: bytes32(0), y_a: bytes32(0), y_b: bytes32(uint256(2))});
        vm.expectRevert(BLS12381.G1MSMFailed.selector);
        mock.wrap(smallOrder);
    }

    function test_OutOfBounds() public {
        BLS12381.G1Point memory invalid;
        invalid.x_a = bytes32(type(uint256).max);
        invalid.x_b = bytes32(0);
        invalid.y_a = bytes32(0);
        invalid.y_b = bytes32(0);
        vm.expectRevert(KeyBlsBls12381.KeyBlsBls12381_InvalidKey.selector);
        mock.wrap(invalid);
    }

    function test_ZeroKey() public {
        KeyBlsBls12381.KEY_BLS_BLS12381 memory zero = mock.zeroKey();
        BLS12381.G1Point memory unwrapped = zero.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_Equal() public {
        BLS12381.G1Point memory pt = _generator();
        KeyBlsBls12381.KEY_BLS_BLS12381 memory key1 = mock.wrap(pt);
        KeyBlsBls12381.KEY_BLS_BLS12381 memory key2 = mock.wrap(pt);
        assertTrue(mock.equal(key1, key2));
    }

    function test_EqualFalse() public {
        BLS12381.G1Point memory keyPos = _generator();
        BLS12381.G1Point memory keyNeg = _negGenerator();
        KeyBlsBls12381.KEY_BLS_BLS12381 memory key1 = mock.wrap(keyPos);
        KeyBlsBls12381.KEY_BLS_BLS12381 memory key2 = mock.wrap(keyNeg);
        assertFalse(mock.equal(key1, key2));
    }

    function test_WrapRevertsForTorsionPoint() public {
        BLS12381.G1Point memory torsion = _nonSubgroupPoint();
        vm.expectRevert(BLS12381.G1MSMFailed.selector);
        mock.wrap(torsion);
    }

    function test_WrapRevertsWhenSubgroupCheckReturnsNonZero() public {
        BLS12381.G1Point memory pt = _generator();
        bytes memory callData = abi.encodePacked(pt.x_a, pt.x_b, pt.y_a, pt.y_b, G1_SUBGROUP_ORDER);
        bytes memory nonZeroResult =
            abi.encodePacked(bytes32(uint256(1)), bytes32(uint256(2)), bytes32(uint256(3)), bytes32(uint256(4)));
        vm.mockCall(G1_MSM_PRECOMPILE, callData, nonZeroResult);
        vm.expectRevert(KeyBlsBls12381.KeyBlsBls12381_InvalidKey.selector);
        mock.wrap(pt);
        vm.clearMockedCalls();
    }

    function test_SerializeSetsSignBit() public {
        BLS12381.G1Point memory positive = _generator();
        BLS12381.G1Point memory negative = _negGenerator();

        uint256[2] memory compressedPositive = abi.decode(KeyBlsBls12381.serialize(positive.wrap()), (uint256[2]));
        uint256[2] memory compressedNegative = abi.decode(KeyBlsBls12381.serialize(negative.wrap()), (uint256[2]));

        assertEq(compressedPositive[0] >> 1, uint256(positive.x_a));
        assertEq(compressedPositive[1], uint256(positive.x_b));
        assertEq(compressedPositive[0] & 1, 0);

        assertEq(compressedNegative[0] >> 1, uint256(negative.x_a));
        assertEq(compressedNegative[1], uint256(negative.x_b));
        assertEq(compressedNegative[0] & 1, 1);
    }

    function _nonSubgroupPoint() internal pure returns (BLS12381.G1Point memory) {
        return BLS12381.G1Point({
            x_a: bytes32(0),
            x_b: bytes32(uint256(4)),
            y_a: bytes32(uint256(0x000000000000000000000000000000000a989badd40d6212b33cffc3f3763e9b)),
            y_b: bytes32(uint256(0xc760f988c9926b26da9dd85e928483446346b8ed00e1de5d5ea93e354abe706c))
        });
    }
}
