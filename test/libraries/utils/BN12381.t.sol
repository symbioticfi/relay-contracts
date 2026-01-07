// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

import {BLS12381} from "../../../src/libraries/utils/BLS12381.sol";
import {Bls12381GoHelper} from "../../helpers/Bls12381Go.sol";

contract BLS12381Harness {
    function isInSubgroup(BLS12381.G1Point memory point) external view returns (bool) {
        return BLS12381.isInSubgroup(point);
    }

    function xCubePlus4(uint256 x_a, uint256 x_b) external view returns (uint256, uint256) {
        return BLS12381._xCubePlus4(x_a, x_b);
    }

    function expandMsg(bytes memory dst, bytes memory message, uint8 n_bytes) external pure returns (bytes memory) {
        return BLS12381.expandMsg(dst, message, n_bytes);
    }
}

contract BLS12381UtilsTest is Bls12381GoHelper {
    BLS12381Harness private harness;

    address private constant MODEXP = address(0x05);
    uint256 private constant P_A = 0x1a0111ea397fe69a4b1ba7b6434bacd7;
    uint256 private constant P_B = 0x64774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab;
    uint256 private constant P_B_COMPLEMENT = type(uint256).max - P_B + 1;

    function setUp() public {
        harness = new BLS12381Harness();
    }

    function test_IsInSubgroup_RevertsForTorsionPoint() public {
        BLS12381.G1Point memory torsion = BLS12381.G1Point({
            x_a: 0,
            x_b: 4,
            y_a: 0x000000000000000000000000000000000a989badd40d6212b33cffc3f3763e9b,
            y_b: 0xc760f988c9926b26da9dd85e928483446346b8ed00e1de5d5ea93e354abe706c
        });

        vm.expectRevert(BLS12381.G1MSMFailed.selector);
        harness.isInSubgroup(torsion);
    }

    function test_XCubePlus4_NoCarryBorrowZeroBranch() public {
        uint256 x_a = P_A;
        uint256 x_b = P_B - 2;
        bytes memory callData = _buildModexpCallData(x_a, x_b);
        bytes memory returnData = abi.encodePacked(bytes32(P_A), bytes32(P_B - 2));

        vm.mockCall(MODEXP, callData, returnData);

        (uint256 resultA, uint256 resultB) = harness.xCubePlus4(x_a, x_b);
        assertEq(resultA, 0);
        assertEq(resultB, 2);

        vm.clearMockedCalls();
    }

    function test_XCubePlus4_ReducesModPrime() public {
        (uint256 resultA, uint256 resultB) = harness.xCubePlus4(P_A, P_B - 1);
        assertEq(resultA, 0);
        assertEq(resultB, 3);
    }

    function test_ExpandMsg_RevertsWhenDomainTooLong() public {
        bytes memory dst = new bytes(0x100);
        vm.expectRevert(abi.encodeWithSelector(BLS12381.InvalidDSTLength.selector, dst));
        harness.expandMsg(dst, bytes("dst-too-long"), 64);
    }

    function test_FindYFromX_MatchesGenerator() public {
        BLS12381.G1Point memory generator = BLS12381.generatorG1();
        (uint256 y_a, uint256 y_b) = BLS12381.findYFromX(uint256(generator.x_a), uint256(generator.x_b));
        assertEq(y_a, uint256(generator.y_a));
        assertEq(y_b, uint256(generator.y_b));
    }

    function test_IsOnCurve_Generator() public {
        assertTrue(BLS12381.isOnCurve(BLS12381.generatorG1()));
    }

    function test_IsOnCurve_ReturnsFalseForTweakedPoint() public {
        BLS12381.G1Point memory tweaked = BLS12381.generatorG1();
        tweaked.y_a += 1;
        assertFalse(BLS12381.isOnCurve(tweaked));
    }

    function test_HashToG1_OnCurveAndNonZero() public {
        BLS12381.G1Point memory hashed = BLS12381.hashToG1("relay-bls12381-hash");
        assertTrue(BLS12381.isOnCurve(hashed));
        assertFalse(hashed.x_a == 0 && hashed.x_b == 0 && hashed.y_a == 0 && hashed.y_b == 0);
    }

    function test_GoGeneratorG1_MatchesSolidity() public {
        BLS12381.G1Point memory expected = _goG1Mul(bytes32(uint256(1)));
        _assertG1Eq(BLS12381.generatorG1(), expected);
    }

    function test_GoGeneratorG2_MatchesSolidity() public {
        BLS12381.G2Point memory expected = _goG2Mul(bytes32(uint256(1)));
        _assertG2Eq(BLS12381.generatorG2(), expected);
    }

    function test_GoHashToG1_MatchesSolidity() public {
        bytes memory message = "relay-bls12381-hash";
        BLS12381.G1Point memory expected = _goHashToG1(message);
        BLS12381.G1Point memory hashed = BLS12381.hashToG1(message);
        _assertG1Eq(hashed, expected);
    }

    function test_GoScalarMulG1_MatchesSolidity() public {
        uint256 scalar = 0x12345;
        BLS12381.G1Point memory expected = _goG1Mul(bytes32(scalar));
        BLS12381.G1Point memory computed = BLS12381.scalar_mul(BLS12381.generatorG1(), scalar);
        _assertG1Eq(computed, expected);
    }

    function test_Negate_GeneratorMatchesKnownNegation() public {
        BLS12381.G1Point memory negated = BLS12381.negate(BLS12381.generatorG1());
        BLS12381.G1Point memory expected = BLS12381.negGeneratorG1();
        assertEq(negated.x_a, expected.x_a);
        assertEq(negated.x_b, expected.x_b);
        assertEq(negated.y_a, expected.y_a);
        assertEq(negated.y_b, expected.y_b);
    }

    function _assertG1Eq(BLS12381.G1Point memory lhs, BLS12381.G1Point memory rhs) internal {
        assertEq(lhs.x_a, rhs.x_a);
        assertEq(lhs.x_b, rhs.x_b);
        assertEq(lhs.y_a, rhs.y_a);
        assertEq(lhs.y_b, rhs.y_b);
    }

    function _assertG2Eq(BLS12381.G2Point memory lhs, BLS12381.G2Point memory rhs) internal {
        assertEq(lhs.x_c0_a, rhs.x_c0_a);
        assertEq(lhs.x_c0_b, rhs.x_c0_b);
        assertEq(lhs.x_c1_a, rhs.x_c1_a);
        assertEq(lhs.x_c1_b, rhs.x_c1_b);
        assertEq(lhs.y_c0_a, rhs.y_c0_a);
        assertEq(lhs.y_c0_b, rhs.y_c0_b);
        assertEq(lhs.y_c1_a, rhs.y_c1_a);
        assertEq(lhs.y_c1_b, rhs.y_c1_b);
    }

    function _buildModexpCallData(uint256 x_a, uint256 x_b) internal pure returns (bytes memory callData) {
        uint256 pA = P_A;
        uint256 pB = P_B;
        bytes memory buf = new bytes(0xe1);
        assembly ("memory-safe") {
            mstore(add(buf, 0x20), 0x40)
            mstore(add(buf, 0x40), 0x01)
            mstore(add(buf, 0x60), 0x40)
            mstore(add(buf, 0x80), x_a)
            mstore(add(buf, 0xa0), x_b)
            mstore8(add(buf, 0xc0), 3)
            mstore(add(buf, 0xc1), pA)
            mstore(add(buf, 0xe1), pB)
        }
        callData = buf;
    }
}
