// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @notice BN12381 wrapper.
/// @author Solady (https://github.com/vectorized/solady/blob/main/src/utils/BLS.sol)
/// @author Ithaca (https://github.com/ithacaxyz/odyssey-examples/blob/main/chapter1/contracts/src/libraries/BLS.sol)
///
/// @dev Precompile addresses come from the BLS addresses submodule in AlphaNet, see
/// See: (https://github.com/paradigmxyz/alphanet/blob/main/crates/precompile/src/addresses.rs)
///
/// Note:
/// - This implementation uses `mcopy`, since any chain that is edgy enough to
///   implement the BLS precompiles will definitely have implemented cancun.
/// - For efficiency, we use the legacy `staticcall` to call the precompiles.
///   For the intended use case in an entry points that requires gas-introspection,
///   which requires legacy bytecode, this won't be a blocker.
library BN12381 {
    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                          STRUCTS                           */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    // We use flattened structs to make encoding more efficient.
    // All structs use Big endian encoding.
    // See: https://eips.ethereum.org/EIPS/eip-2537

    /// @dev A representation of a base field element (Fp) in the BLS12-381 curve.
    /// Due to the size of `p`,
    /// `0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab`
    /// the top 16 bytes are always zeroes.
    struct Fp {
        bytes32 a; // Upper 32 bytes.
        bytes32 b; // Lower 32 bytes.
    }

    /// @dev A representation of an extension field element (Fp2) in the BLS12-381 curve.
    struct Fp2 {
        bytes32 c0_a;
        bytes32 c0_b;
        bytes32 c1_a;
        bytes32 c1_b;
    }

    /// @dev A representation of a point on the G1 curve of BLS12-381.
    struct G1Point {
        bytes32 x_a;
        bytes32 x_b;
        bytes32 y_a;
        bytes32 y_b;
    }

    /// @dev A representation of a point on the G2 curve of BLS12-381.
    struct G2Point {
        bytes32 x_c0_a;
        bytes32 x_c0_b;
        bytes32 x_c1_a;
        bytes32 x_c1_b;
        bytes32 y_c0_a;
        bytes32 y_c0_b;
        bytes32 y_c1_a;
        bytes32 y_c1_b;
    }

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                    FIELD ORDER                             */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    uint256 internal constant P_A = 0x000000000000000000000000000000001a0111ea397fe69a4b1ba7b6434bacd7;
    uint256 internal constant P_B = 0x64774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab;
    uint128 private constant P_PLUS_ONE_SLASH_2_A = 0x0680447a8e5ff9a692c6e9ed90d2eb35;
    uint256 private constant P_PLUS_ONE_SLASH_2_B = 0xd91dd2e13ce144afd9cc34a83dac3d8907aaffffac54ffffee7fbfffffffeaab;
    bytes32 private constant G1_SUBGROUP_ORDER = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;

    /// @dev Referenced from https://eips.ethereum.org/EIPS/eip-2537#curve-parameters
    function negGeneratorG1() internal pure returns (G1Point memory) {
        return G1Point({
            x_a: bytes32(0x0000000000000000000000000000000017f1d3a73197d7942695638c4fa9ac0f),
            x_b: bytes32(0xc3688c4f9774b905a14e3a3f171bac586c55e83ff97a1aeffb3af00adb22c6bb),
            y_a: bytes32(0x00000000000000000000000000000000114d1d6855d545a8aa7d76c8cf2e21f2),
            y_b: bytes32(0x67816aef1db507c96655b9d5caac42364e6f38ba0ecb751bad54dcd6b939c2ca)
        });
    }

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                    PRECOMPILE ADDRESSES                    */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    /// @dev For exponentiation modulo a field element.
    address internal constant EXP_MOD = 0x0000000000000000000000000000000000000005;

    /// @dev For addition of two points on the BLS12-381 G1 curve,
    address internal constant BLS12_G1ADD = 0x000000000000000000000000000000000000000b;

    /// @dev For multi-scalar multiplication (MSM) on the BLS12-381 G1 curve.
    address internal constant BLS12_G1MSM = 0x000000000000000000000000000000000000000C;

    /// @dev For addition of two points on the BLS12-381 G2 curve.
    address internal constant BLS12_G2ADD = 0x000000000000000000000000000000000000000d;

    /// @dev For multi-scalar multiplication (MSM) on the BLS12-381 G2 curve.
    address internal constant BLS12_G2MSM = 0x000000000000000000000000000000000000000E;

    /// @dev For performing a pairing check on the BLS12-381 curve.
    address internal constant BLS12_PAIRING_CHECK = 0x000000000000000000000000000000000000000F;

    /// @dev For mapping a Fp to a point on the BLS12-381 G1 curve.
    address internal constant BLS12_MAP_FP_TO_G1 = 0x0000000000000000000000000000000000000010;

    /// @dev For mapping a Fp2 to a point on the BLS12-381 G2 curve.
    address internal constant BLS12_MAP_FP2_TO_G2 = 0x0000000000000000000000000000000000000011;

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                        CUSTOM ERRORS                       */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    // A custom error for each precompile helps us in debugging which precompile has failed.

    /// @dev The G1Add operation failed.
    error G1AddFailed();

    /// @dev The G1MSM operation failed.
    error G1MSMFailed();

    /// @dev The G2Add operation failed.
    error G2AddFailed();

    /// @dev The G2MSM operation failed.
    error G2MSMFailed();

    /// @dev The pairing operation failed.
    error PairingFailed();

    /// @dev The MapFpToG1 operation failed.
    error MapFpToG1Failed();

    /// @dev The MapFpToG2 operation failed.
    error MapFp2ToG2Failed();

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                         OPERATIONS                         */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    /// @dev Adds two G1 points. Returns a new G1 point.
    function add(G1Point memory point0, G1Point memory point1) internal view returns (G1Point memory result) {
        assembly ("memory-safe") {
            mcopy(result, point0, 0x80)
            mcopy(add(result, 0x80), point1, 0x80)
            if iszero(and(eq(returndatasize(), 0x80), staticcall(gas(), BLS12_G1ADD, result, 0x100, result, 0x80))) {
                mstore(0x00, 0xd6cc76eb) // `G1AddFailed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    /// @dev Multi-scalar multiplication of G1 points with scalars. Returns a new G1 point.
    function msm(G1Point[] memory points, bytes32[] memory scalars) internal view returns (G1Point memory result) {
        assembly ("memory-safe") {
            let k := mload(points)
            let d := sub(scalars, points)
            for { let i := 0 } iszero(eq(i, k)) { i := add(i, 1) } {
                points := add(points, 0x20)
                let o := add(result, mul(0xa0, i))
                mcopy(o, mload(points), 0x80)
                mstore(add(o, 0x80), mload(add(points, d)))
            }
            if iszero(
                and(
                    and(eq(k, mload(scalars)), eq(returndatasize(), 0x80)),
                    staticcall(gas(), BLS12_G1MSM, result, mul(0xa0, k), result, 0x80)
                )
            ) {
                mstore(0x00, 0x5f776986) // `G1MSMFailed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    /// @dev Adds two G2 points. Returns a new G2 point.
    function add(G2Point memory point0, G2Point memory point1) internal view returns (G2Point memory result) {
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
    function msm(G2Point[] memory points, bytes32[] memory scalars) internal view returns (G2Point memory result) {
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

    /// @dev Checks the pairing of G1 points with G2 points. Returns whether the pairing is valid.
    function pairing(G1Point[] memory g1Points, G2Point[] memory g2Points) internal view returns (bool result) {
        assembly ("memory-safe") {
            let k := mload(g1Points)
            let m := mload(0x40)
            let d := sub(g2Points, g1Points)
            for { let i := 0 } iszero(eq(i, k)) { i := add(i, 1) } {
                g1Points := add(g1Points, 0x20)
                let o := add(m, mul(0x180, i))
                mcopy(o, mload(g1Points), 0x80)
                mcopy(add(o, 0x80), mload(add(d, g1Points)), 0x100)
            }
            if iszero(
                and(
                    and(eq(k, mload(g2Points)), eq(returndatasize(), 0x20)),
                    staticcall(gas(), BLS12_PAIRING_CHECK, m, mul(0x180, k), 0x00, 0x20)
                )
            ) {
                mstore(0x00, 0x4df45e2f) // `PairingFailed()`.
                revert(0x1c, 0x04)
            }
            result := mload(0x00)
        }
    }

    /// @dev Maps a Fp element to a G1 point.
    function toG1(Fp memory element) internal view returns (G1Point memory result) {
        assembly ("memory-safe") {
            if iszero(
                and(eq(returndatasize(), 0x80), staticcall(gas(), BLS12_MAP_FP_TO_G1, element, 0x40, result, 0x80))
            ) {
                mstore(0x00, 0x24a289fc) // `MapFpToG1Failed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    /// @dev Maps a Fp2 element to a G2 point.
    function toG2(Fp2 memory element) internal view returns (G2Point memory result) {
        assembly ("memory-safe") {
            if iszero(
                and(eq(returndatasize(), 0x100), staticcall(gas(), BLS12_MAP_FP2_TO_G2, element, 0x80, result, 0x100))
            ) {
                mstore(0x00, 0x89083b91) // `MapFp2ToG2Failed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    /// @dev Computes a point in G2 from a message.
    function hashToG2(bytes memory message) internal view returns (G2Point memory result) {
        assembly ("memory-safe") {
            function dstPrime(o_, i_) -> _o {
                mstore8(o_, i_) // 1.
                mstore(add(o_, 0x01), "BLS_SIG_BLS12381G2_XMD:SHA-256_S") // 32.
                mstore(add(o_, 0x21), "SWU_RO_NUL_\x2b") // 12.
                _o := add(0x2d, o_)
            }

            function sha2(data_, n_) -> _h {
                if iszero(and(eq(returndatasize(), 0x20), staticcall(gas(), 2, data_, n_, 0x00, 0x20))) {
                    revert(calldatasize(), 0x00)
                }
                _h := mload(0x00)
            }

            function modfield(s_, b_) {
                mcopy(add(s_, 0x60), b_, 0x40)
                if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), 5, s_, 0x100, b_, 0x40))) {
                    revert(calldatasize(), 0x00)
                }
            }

            function mapToG2(s_, r_) {
                if iszero(
                    and(eq(returndatasize(), 0x100), staticcall(gas(), BLS12_MAP_FP2_TO_G2, s_, 0x80, r_, 0x100))
                ) {
                    mstore(0x00, 0x89083b91) // `MapFp2ToG2Failed()`.
                    revert(0x1c, 0x04)
                }
            }

            let b := mload(0x40)
            let s := add(b, 0x100)
            calldatacopy(s, calldatasize(), 0x40)
            mcopy(add(0x40, s), add(0x20, message), mload(message))
            let o := add(add(0x40, s), mload(message))
            mstore(o, shl(240, 256))
            let b0 := sha2(s, sub(dstPrime(add(0x02, o), 0), s))
            mstore(0x20, b0)
            mstore(s, b0)
            mstore(b, sha2(s, sub(dstPrime(add(0x20, s), 1), s)))
            let j := b
            for { let i := 2 } 1 {} {
                mstore(s, xor(b0, mload(j)))
                j := add(j, 0x20)
                mstore(j, sha2(s, sub(dstPrime(add(0x20, s), i), s)))
                i := add(i, 1)
                if eq(i, 9) { break }
            }

            mstore(add(s, 0x00), 0x40)
            mstore(add(s, 0x20), 0x20)
            mstore(add(s, 0x40), 0x40)
            mstore(add(s, 0xa0), 1)
            mstore(add(s, 0xc0), P_A)
            mstore(add(s, 0xe0), P_B)
            modfield(s, add(b, 0x00))
            modfield(s, add(b, 0x40))
            modfield(s, add(b, 0x80))
            modfield(s, add(b, 0xc0))

            mapToG2(b, result)
            mapToG2(add(0x80, b), add(0x100, result))

            if iszero(and(eq(returndatasize(), 0x100), staticcall(gas(), BLS12_G2ADD, result, 0x200, result, 0x100))) {
                mstore(0x00, 0xc55e5e33) // `G2AddFailed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    function findYFromX(uint256 x_a, uint256 x_b) internal view returns (uint256 y_a, uint256 y_b) {
        // compute x**3 mod p
        (y_a, y_b) = _xCubePlus4(x_a, x_b);

        // compute y = sqrt(x**3 + 4) mod p = (x**3 + 4)^(p+1)/2 mod p
        bytes memory buf = new bytes(0x120);
        assembly ("memory-safe") {
            function modfield(s_, b_) {
                if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), 5, s_, 0x120, b_, 0x40))) {
                    revert(calldatasize(), 0x00)
                }
            }

            mstore(add(buf, 0x20), 0x40) // length of base
            mstore(add(buf, 0x40), 0x40) // length of exponent
            mstore(add(buf, 0x60), 0x40) // length of modulus
            mstore(add(buf, 0x80), y_a)
            mstore(add(buf, 0xa0), y_b)
            mstore(add(buf, 0xc0), P_PLUS_ONE_SLASH_2_A)
            mstore(add(buf, 0xe0), P_PLUS_ONE_SLASH_2_B)
            mstore(add(buf, 0x100), P_A)
            mstore(add(buf, 0x120), P_B)
            modfield(add(buf, 0x20), add(buf, 0x20))
            y_a := mload(add(buf, 0x20))
            y_b := mload(add(buf, 0x40))
        }
    }

    /**
     * @notice Negates a G1 point, by reflecting it over the x-axis
     * @dev Assumes that the Y coordinate is always less than the field modulus
     * @param point The G1 point to negate
     */
    function negate(G1Point memory point) internal pure returns (G1Point memory) {
        return P_B < uint256(point.y_b)
            ? G1Point({
                x_a: point.x_a,
                x_b: point.x_b,
                y_a: bytes32(P_A - uint256(point.y_a) - 1),
                y_b: bytes32(type(uint256).max - (uint256(point.y_b) - P_B) + 1)
            })
            : G1Point({
                x_a: point.x_a,
                x_b: point.x_b,
                y_a: bytes32(P_A - uint256(point.y_a)),
                y_b: bytes32(P_B - uint256(point.y_b))
            });
    }

    function isOnCurve(G1Point memory point) internal view returns (bool) {
        uint256 y_a = uint256(point.y_a);
        uint256 y_b = uint256(point.y_b);
        bytes memory buf = new bytes(0xe1);
        assembly ("memory-safe") {
            function modfield(s_, b_) {
                if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), 5, s_, 0xe1, b_, 0x40))) {
                    revert(calldatasize(), 0x00)
                }
            }

            mstore(add(buf, 0x20), 0x40) // length of base
            mstore(add(buf, 0x40), 0x01) // length of exponent 2
            mstore(add(buf, 0x60), 0x40) // length of modulus
            mstore(add(buf, 0x80), y_a)
            mstore(add(buf, 0xa0), y_b)
            mstore8(add(buf, 0xc0), 2) // exponent
            mstore(add(buf, 0xc1), P_A)
            mstore(add(buf, 0xe1), P_B)
            modfield(add(buf, 0x20), add(buf, 0x20))
            y_a := mload(add(buf, 0x20))
            y_b := mload(add(buf, 0x40))
        }

        (uint256 x_a, uint256 x_b) = _xCubePlus4(uint256(point.x_a), uint256(point.x_b));
        return x_a == y_a && x_b == y_b;
    }

    function isInSubgroup(G1Point memory point) internal view returns (bool) {
        G1Point[] memory points = new G1Point[](1);
        points[0] = point;
        bytes32[] memory scalars = new bytes32[](1);
        scalars[0] = G1_SUBGROUP_ORDER;
        G1Point memory result = msm(points, scalars);
        return result.x_a == 0 && result.x_b == 0 && result.y_a == 0 && result.y_b == 0;
    }

    function _xCubePlus4(uint256 x_a, uint256 x_b) internal view returns (uint256, uint256) {
        bytes memory buf = new bytes(0xe1);
        assembly ("memory-safe") {
            function modfield(s_, b_) {
                if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), 5, s_, 0xe1, b_, 0x40))) {
                    revert(calldatasize(), 0x00)
                }
            }

            mstore(add(buf, 0x20), 0x40) // length of base
            mstore(add(buf, 0x40), 0x01) // length of exponent 3
            mstore(add(buf, 0x60), 0x40) // length of modulus
            mstore(add(buf, 0x80), x_a)
            mstore(add(buf, 0xa0), x_b)
            mstore8(add(buf, 0xc0), 3) // exponent
            mstore(add(buf, 0xc1), P_A)
            mstore(add(buf, 0xe1), P_B)
            modfield(add(buf, 0x20), add(buf, 0x20))
            x_a := mload(add(buf, 0x20))
            x_b := mload(add(buf, 0x40))
        }
        unchecked {
            x_b += 4;
            if (x_b < 4) {
                x_a += 1;
            }
            if (x_a > P_A || (x_a == P_A && x_b >= P_B)) {
                uint256 borrow = x_b < P_B ? 1 : 0;
                x_b = x_b - P_B;
                x_a = x_a - P_A - borrow;
            }
        }
        return (x_a, x_b);
    }
}
