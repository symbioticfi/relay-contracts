// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

import {BN12381} from "../../../src/libraries/utils/BN12381.sol";

contract BN12381Harness {
    function isInSubgroup(BN12381.G1Point memory point) external view returns (bool) {
        return BN12381.isInSubgroup(point);
    }

    function xCubePlus4(uint256 x_a, uint256 x_b) external view returns (uint256, uint256) {
        return BN12381._xCubePlus4(x_a, x_b);
    }

    function findYFromX(uint256 x_a, uint256 x_b) external view returns (uint256, uint256) {
        return BN12381.findYFromX(x_a, x_b);
    }
}

contract BN12381UtilsTest is Test {
    BN12381Harness private harness;

    address private constant MODEXP = address(0x05);
    uint256 private constant P_A = 0x1a0111ea397fe69a4b1ba7b6434bacd7;
    uint256 private constant P_B = 0x64774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab;
    uint256 private constant PRE_BRANCH_LOW = type(uint256).max - 3;
    uint256 private constant P_B_COMPLEMENT = type(uint256).max - P_B + 1;

    function setUp() public {
        harness = new BN12381Harness();
    }

    function test_IsInSubgroup_RevertsForTorsionPoint() public {
        BN12381.G1Point memory torsion = BN12381.G1Point({
            x_a: bytes32(0),
            x_b: bytes32(uint256(4)),
            y_a: bytes32(uint256(0x000000000000000000000000000000000a989badd40d6212b33cffc3f3763e9b)),
            y_b: bytes32(uint256(0xc760f988c9926b26da9dd85e928483446346b8ed00e1de5d5ea93e354abe706c))
        });

        vm.expectRevert(BN12381.G1MSMFailed.selector);
        harness.isInSubgroup(torsion);
    }

    function test_XCubePlus4_CarryAndBorrowBranch() public {
        uint256 x_a = P_A;
        uint256 x_b = PRE_BRANCH_LOW;
        bytes memory callData = _buildModexpCallData(x_a, x_b);
        bytes memory returnData = abi.encodePacked(bytes32(P_A), bytes32(PRE_BRANCH_LOW));

        vm.mockCall(MODEXP, callData, returnData);

        (uint256 resultA, uint256 resultB) = harness.xCubePlus4(x_a, x_b);
        assertEq(resultA, 0);
        assertEq(resultB, P_B_COMPLEMENT);

        vm.clearMockedCalls();
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

    function test_FindYFromX_RevertsForNonResidue() public {
        vm.expectRevert(BN12381.InvalidPoint.selector);
        harness.findYFromX(0, 1);
    }

    function test_FindYFromX_ReturnsValidRoot() public {
        BN12381.G1Point memory generator = BN12381.negate(BN12381.negGeneratorG1());
        (uint256 y_a, uint256 y_b) = harness.findYFromX(uint256(generator.x_a), uint256(generator.x_b));
        assertEq(y_a, uint256(generator.y_a));
        assertEq(y_b, uint256(generator.y_b));
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
