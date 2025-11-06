// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

import {KeyBlsBn12381} from "../../../src/libraries/keys/KeyBlsBn12381.sol";
import {BN12381} from "../../../src/libraries/utils/BN12381.sol";

import {KeyBlsBn12381Mock} from "../../mocks/KeyBlsBn12381Mock.sol";

contract KeyBlsBn12381Test is Test {
    using KeyBlsBn12381 for BN12381.G1Point;
    using KeyBlsBn12381 for KeyBlsBn12381.KEY_BLS_BN12381;

    KeyBlsBn12381Mock mock;

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
        mock = new KeyBlsBn12381Mock();
    }

    function _generator() internal pure returns (BN12381.G1Point memory) {
        return BN12381.negate(BN12381.negGeneratorG1());
    }

    function _negGenerator() internal pure returns (BN12381.G1Point memory) {
        return BN12381.negGeneratorG1();
    }

    function test_WrapUnwrapZero() public {
        BN12381.G1Point memory identity = BN12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0});
        KeyBlsBn12381.KEY_BLS_BN12381 memory wrapped = KeyBlsBn12381.wrap(identity);
        BN12381.G1Point memory unwrapped = wrapped.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_WrapUnwrapGenerator() public {
        BN12381.G1Point memory pt = _generator();
        KeyBlsBn12381.KEY_BLS_BN12381 memory wrapped = KeyBlsBn12381.wrap(pt);
        BN12381.G1Point memory unwrapped = wrapped.unwrap();
        assertEq(unwrapped.x_a, pt.x_a);
        assertEq(unwrapped.x_b, pt.x_b);
        assertEq(unwrapped.y_a, pt.y_a);
        assertEq(unwrapped.y_b, pt.y_b);
    }

    function test_SerializeDeserializeZero() public {
        BN12381.G1Point memory identity = BN12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0});
        KeyBlsBn12381.KEY_BLS_BN12381 memory wrapped = KeyBlsBn12381.wrap(identity);
        bytes memory serialized = KeyBlsBn12381.serialize(wrapped);
        KeyBlsBn12381.KEY_BLS_BN12381 memory deserialized = KeyBlsBn12381.deserialize(serialized);
        BN12381.G1Point memory unwrapped = deserialized.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_SerializeDeserializeGenerator() public {
        BN12381.G1Point memory pt = _generator();
        KeyBlsBn12381.KEY_BLS_BN12381 memory wrapped = KeyBlsBn12381.wrap(pt);
        bytes memory serialized = KeyBlsBn12381.serialize(wrapped);
        KeyBlsBn12381.KEY_BLS_BN12381 memory deserialized = KeyBlsBn12381.deserialize(serialized);
        BN12381.G1Point memory finalPt = deserialized.unwrap();
        assertEq(finalPt.x_a, pt.x_a);
        assertEq(finalPt.x_b, pt.x_b);
        assertEq(finalPt.y_a, pt.y_a);
        assertEq(finalPt.y_b, pt.y_b);
    }

    function test_SerializeDeserializeNegated() public {
        BN12381.G1Point memory pt = _negGenerator();
        KeyBlsBn12381.KEY_BLS_BN12381 memory wrapped = KeyBlsBn12381.wrap(pt);
        bytes memory serialized = KeyBlsBn12381.serialize(wrapped);
        KeyBlsBn12381.KEY_BLS_BN12381 memory deserialized = KeyBlsBn12381.deserialize(serialized);
        BN12381.G1Point memory finalPt = deserialized.unwrap();
        assertEq(finalPt.x_a, pt.x_a);
        assertEq(finalPt.x_b, pt.x_b);
        assertEq(finalPt.y_a, pt.y_a);
        assertEq(finalPt.y_b, pt.y_b);
    }

    function test_ToBytesFromBytesZero() public {
        BN12381.G1Point memory identity = BN12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0});
        KeyBlsBn12381.KEY_BLS_BN12381 memory wrapped = KeyBlsBn12381.wrap(identity);
        bytes memory encoded = KeyBlsBn12381.toBytes(wrapped);
        KeyBlsBn12381.KEY_BLS_BN12381 memory decoded = KeyBlsBn12381.fromBytes(encoded);
        BN12381.G1Point memory unwrapped = decoded.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_ToBytesFromBytesGenerator() public {
        BN12381.G1Point memory pt = _generator();
        KeyBlsBn12381.KEY_BLS_BN12381 memory wrapped = KeyBlsBn12381.wrap(pt);
        bytes memory encoded = KeyBlsBn12381.toBytes(wrapped);
        KeyBlsBn12381.KEY_BLS_BN12381 memory decoded = KeyBlsBn12381.fromBytes(encoded);
        BN12381.G1Point memory finalPt = decoded.unwrap();
        assertEq(finalPt.x_a, pt.x_a);
        assertEq(finalPt.x_b, pt.x_b);
        assertEq(finalPt.y_a, pt.y_a);
        assertEq(finalPt.y_b, pt.y_b);
    }

    function test_DeserializeZeroFromEmpty() public {
        bytes memory empty = abi.encode([uint256(0), uint256(0)]);
        KeyBlsBn12381.KEY_BLS_BN12381 memory deserialized = KeyBlsBn12381.deserialize(empty);
        BN12381.G1Point memory unwrapped = deserialized.unwrap();
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
        BN12381.G1Point memory pt = _generator();
        KeyBlsBn12381.fromBytes(abi.encode(pt));
        vm.expectRevert(KeyBlsBn12381.KeyBlsBn12381_InvalidBytes.selector);
        mock.fromBytes(abi.encode(pt, uint256(1)));
    }

    function test_WrapRevertsInvalidKey() public {
        BN12381.G1Point memory pt = _generator();
        pt.y_a = bytes32(uint256(pt.y_a) + 1);
        vm.expectRevert(KeyBlsBn12381.KeyBlsBn12381_InvalidKey.selector);
        mock.wrap(pt);
    }

    function test_WrapRevertsNonSubgroupPoint() public {
        BN12381.G1Point memory smallOrder =
            BN12381.G1Point({x_a: bytes32(0), x_b: bytes32(0), y_a: bytes32(0), y_b: bytes32(uint256(2))});
        vm.expectRevert(BN12381.G1MSMFailed.selector);
        mock.wrap(smallOrder);
    }

    function test_OutOfBounds() public {
        BN12381.G1Point memory invalid;
        invalid.x_a = bytes32(type(uint256).max);
        invalid.x_b = bytes32(0);
        invalid.y_a = bytes32(0);
        invalid.y_b = bytes32(0);
        vm.expectRevert(KeyBlsBn12381.KeyBlsBn12381_InvalidKey.selector);
        mock.wrap(invalid);
    }

    function test_ZeroKey() public {
        KeyBlsBn12381.KEY_BLS_BN12381 memory zero = mock.zeroKey();
        BN12381.G1Point memory unwrapped = zero.unwrap();
        assertEq(unwrapped.x_a, bytes32(0));
        assertEq(unwrapped.x_b, bytes32(0));
        assertEq(unwrapped.y_a, bytes32(0));
        assertEq(unwrapped.y_b, bytes32(0));
    }

    function test_Equal() public {
        BN12381.G1Point memory pt = _generator();
        KeyBlsBn12381.KEY_BLS_BN12381 memory key1 = mock.wrap(pt);
        KeyBlsBn12381.KEY_BLS_BN12381 memory key2 = mock.wrap(pt);
        assertTrue(mock.equal(key1, key2));
    }

    function test_EqualFalse() public {
        BN12381.G1Point memory keyPos = _generator();
        BN12381.G1Point memory keyNeg = _negGenerator();
        KeyBlsBn12381.KEY_BLS_BN12381 memory key1 = mock.wrap(keyPos);
        KeyBlsBn12381.KEY_BLS_BN12381 memory key2 = mock.wrap(keyNeg);
        assertFalse(mock.equal(key1, key2));
    }

    function test_WrapRevertsForTorsionPoint() public {
        BN12381.G1Point memory torsion = _nonSubgroupPoint();
        vm.expectRevert(BN12381.G1MSMFailed.selector);
        mock.wrap(torsion);
    }

    function test_WrapRevertsWhenSubgroupCheckReturnsNonZero() public {
        BN12381.G1Point memory pt = _generator();
        bytes memory callData = abi.encodePacked(pt.x_a, pt.x_b, pt.y_a, pt.y_b, G1_SUBGROUP_ORDER);
        bytes memory nonZeroResult =
            abi.encodePacked(bytes32(uint256(1)), bytes32(uint256(2)), bytes32(uint256(3)), bytes32(uint256(4)));
        vm.mockCall(G1_MSM_PRECOMPILE, callData, nonZeroResult);
        vm.expectRevert(KeyBlsBn12381.KeyBlsBn12381_InvalidKey.selector);
        mock.wrap(pt);
        vm.clearMockedCalls();
    }

    function test_SerializeTriggersXCubedPlus4CarryBranch() public {
        KeyBlsBn12381.KEY_BLS_BN12381 memory key = KeyBlsBn12381.KEY_BLS_BN12381(
            BN12381.G1Point({
                x_a: bytes32(P_A), x_b: bytes32(PRE_BRANCH_LOW), y_a: bytes32(0), y_b: bytes32(POST_BRANCH_LOW)
            })
        );

        bytes memory xCubeCallData = abi.encodePacked(
            bytes32(uint256(0x40)),
            bytes32(uint256(0x01)),
            bytes32(uint256(0x40)),
            key.value.x_a,
            key.value.x_b,
            bytes32(uint256(3)),
            bytes32(P_A),
            bytes32(P_B)
        );
        bytes memory xCubeReturnData = abi.encodePacked(bytes32(P_A), bytes32(PRE_BRANCH_LOW));
        vm.mockCall(MODEXP, xCubeCallData, xCubeReturnData);

        bytes memory sqrtCallData = abi.encodePacked(
            bytes32(uint256(0x40)),
            bytes32(uint256(0x40)),
            bytes32(uint256(0x40)),
            bytes32(uint256(0)),
            bytes32(POST_BRANCH_LOW),
            bytes32(P_PLUS_ONE_SLASH_2_A),
            bytes32(P_PLUS_ONE_SLASH_2_B),
            bytes32(P_A),
            bytes32(P_B)
        );
        bytes memory sqrtReturnData = abi.encodePacked(bytes32(uint256(0)), bytes32(POST_BRANCH_LOW));
        vm.mockCall(MODEXP, sqrtCallData, sqrtReturnData);

        mock.serialize(key);

        vm.clearMockedCalls();
    }

    function _nonSubgroupPoint() internal pure returns (BN12381.G1Point memory) {
        return BN12381.G1Point({
            x_a: bytes32(0),
            x_b: bytes32(uint256(4)),
            y_a: bytes32(uint256(0x000000000000000000000000000000000a989badd40d6212b33cffc3f3763e9b)),
            y_b: bytes32(uint256(0xc760f988c9926b26da9dd85e928483446346b8ed00e1de5d5ea93e354abe706c))
        });
    }
}
