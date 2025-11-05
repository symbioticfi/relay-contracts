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
}

contract BN12381UtilsTest is Test {
    BN12381Harness private harness;

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
}
