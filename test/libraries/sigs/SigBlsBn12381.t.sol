// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

import {SigBlsBls12381} from "../../../src/libraries/sigs/SigBlsBls12381.sol";
import {KeyBlsBls12381} from "../../../src/libraries/keys/KeyBlsBls12381.sol";
import {BLS12381} from "../../../src/libraries/utils/BLS12381.sol";

contract SigBlsBls12381Test is Test {
    using KeyBlsBls12381 for KeyBlsBls12381.KEY_BLS_BLS12381;

    bytes internal constant DST_G1 = "BLS_SIG_BLS12381G1_XMD:SHA-256_SSWU_RO_NUL_";

    address internal constant BLS12_G2ADD = 0x000000000000000000000000000000000000000d;
    address internal constant BLS12_G2MSM = 0x000000000000000000000000000000000000000E;

    function test_VerifyValidSignature() public {
        uint256 privateKey = 0x123456789abcdef;
        bytes32 messageHash = keccak256("relay bls12381");

        BLS12381.G1Point memory generator = _g1Generator();
        BLS12381.G1Point memory keyG1 = _g1Mul(generator, bytes32(privateKey));
        BLS12381.G2Point memory keyG2 = _g2Mul(BLS12381.generatorG2(), bytes32(privateKey));
        BLS12381.G1Point memory messageG1 = BLS12381.hashToG1(abi.encodePacked(messageHash));
        BLS12381.G1Point memory signature = _g1Mul(messageG1, bytes32(privateKey));

        bytes memory keyBytes = KeyBlsBls12381.wrap(keyG1).toBytes();

        assertTrue(SigBlsBls12381.verify(keyBytes, abi.encode(messageHash), abi.encode(signature), abi.encode(keyG2)));
        assertTrue(SigBlsBls12381.verify(keyG1, messageHash, signature, keyG2));
    }

    function test_VerifyInvalidSignature() public {
        uint256 privateKey = 0x123456789abcdef;
        bytes32 messageHash = keccak256("relay bls12381");

        BLS12381.G1Point memory generator = _g1Generator();
        BLS12381.G1Point memory keyG1 = _g1Mul(generator, bytes32(privateKey));
        BLS12381.G2Point memory keyG2 = _g2Mul(BLS12381.generatorG2(), bytes32(privateKey));
        BLS12381.G1Point memory messageG1 = BLS12381.hashToG1(abi.encodePacked(messageHash));
        BLS12381.G1Point memory signature = _g1Mul(messageG1, bytes32(privateKey + 1));

        bytes memory keyBytes = KeyBlsBls12381.wrap(keyG1).toBytes();

        assertFalse(SigBlsBls12381.verify(keyBytes, abi.encode(messageHash), abi.encode(signature), abi.encode(keyG2)));
        assertFalse(SigBlsBls12381.verify(keyG1, messageHash, signature, keyG2));
    }

    function test_VerifyZeroKey() public {
        bytes32 messageHash = keccak256("relay bls12381 zero");
        BLS12381.G1Point memory messageG1 = BLS12381.hashToG1(abi.encodePacked(messageHash));
        BLS12381.G1Point memory signature = messageG1;
        BLS12381.G2Point memory keyG2 = _zeroG2Point();

        bytes memory keyBytes = KeyBlsBls12381.wrap(_zeroPoint()).toBytes();

        assertFalse(SigBlsBls12381.verify(keyBytes, abi.encode(messageHash), abi.encode(signature), abi.encode(keyG2)));
        assertFalse(SigBlsBls12381.verify(_zeroPoint(), messageHash, signature, keyG2));
    }

    function test_InvalidMessageLength() public {
        bytes memory keyBytes = KeyBlsBls12381.wrap(_zeroPoint()).toBytes();
        BLS12381.G1Point memory signature = _zeroPoint();
        BLS12381.G2Point memory keyG2 = _zeroG2Point();

        vm.expectRevert(SigBlsBls12381.SigBlsBls12381_InvalidMessageLength.selector);
        this.verify(keyBytes, abi.encode(bytes32(0), bytes32(uint256(1))), abi.encode(signature), abi.encode(keyG2));
    }

    function verify(bytes memory keyBytes, bytes memory message, bytes memory signature, bytes memory extraData)
        public
        view
        returns (bool)
    {
        return SigBlsBls12381.verify(keyBytes, message, signature, extraData);
    }

    function _zeroPoint() internal pure returns (BLS12381.G1Point memory) {
        return BLS12381.G1Point({x_a: 0, x_b: 0, y_a: 0, y_b: 0});
    }

    function _zeroG2Point() internal pure returns (BLS12381.G2Point memory) {
        return
            BLS12381.G2Point({x_c0_a: 0, x_c0_b: 0, x_c1_a: 0, x_c1_b: 0, y_c0_a: 0, y_c0_b: 0, y_c1_a: 0, y_c1_b: 0});
    }

    function _g1Generator() internal pure returns (BLS12381.G1Point memory) {
        return BLS12381.negate(BLS12381.negGeneratorG1());
    }

    function _g1Mul(BLS12381.G1Point memory point, bytes32 scalar)
        internal
        view
        returns (BLS12381.G1Point memory result)
    {
        BLS12381.G1Point[] memory points = new BLS12381.G1Point[](1);
        bytes32[] memory scalars = new bytes32[](1);
        points[0] = point;
        scalars[0] = scalar;
        result = BLS12381.msm(points, scalars);
    }

    function _g2Mul(BLS12381.G2Point memory point, bytes32 scalar)
        internal
        view
        returns (BLS12381.G2Point memory result)
    {
        BLS12381.G2Point[] memory points = new BLS12381.G2Point[](1);
        bytes32[] memory scalars = new bytes32[](1);
        points[0] = point;
        scalars[0] = scalar;
        result = _g2Msm(points, scalars);
    }

    /// @dev Adds two G2 points. Returns a new G2 point.
    function _g2Add(BLS12381.G2Point memory point0, BLS12381.G2Point memory point1)
        internal
        view
        returns (BLS12381.G2Point memory result)
    {
        assembly ("memory-safe") {
            mcopy(result, point0, 0x100)
            mcopy(add(result, 0x100), point1, 0x100)
            if iszero(and(eq(returndatasize(), 0x100), staticcall(gas(), BLS12_G2ADD, result, 0x200, result, 0x100))) {
                mstore(0x00, 0xc55e5e33) // `G2AddFailed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    /// @dev Multi-scalar multiplication of G2 points with scalars. Returns a new G2 point.
    function _g2Msm(BLS12381.G2Point[] memory points, bytes32[] memory scalars)
        internal
        view
        returns (BLS12381.G2Point memory result)
    {
        assembly ("memory-safe") {
            let k := mload(points)
            let d := sub(scalars, points)
            for { let i := 0 } iszero(eq(i, k)) { i := add(i, 1) } {
                points := add(points, 0x20)
                let o := add(result, mul(0x120, i))
                mcopy(o, mload(points), 0x100)
                mstore(add(o, 0x100), mload(add(d, points)))
            }
            if iszero(
                and(
                    and(eq(k, mload(scalars)), eq(returndatasize(), 0x100)),
                    staticcall(gas(), BLS12_G2MSM, result, mul(0x120, k), result, 0x100)
                )
            ) {
                mstore(0x00, 0xe3dc5425) // `G2MSMFailed()`.
                revert(0x1c, 0x04)
            }
        }
    }
}
