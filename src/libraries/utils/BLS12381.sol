// SPDX-License-Identifier: MIT
// Original code: https://github.com/Vectorized/solady/blob/main/src/utils/ext/ithaca/BLS.sol
// Original code: https://github.com/randa-mu/bls-solidity/blob/main/src/libraries/BLS2.sol
pragma solidity ^0.8.24;

/**
 * @title BLS12381
 * @notice Library for working with BLS12-381 precompiles.
 * @dev Flattened structs to make encoding more efficient.
 *      All structs use Big endian encoding.
 *      See: https://eips.ethereum.org/EIPS/eip-2537
 */
library BLS12381 {
    /* CUSTOM ERRORS */

    /**
     * @notice Reverts when G1Add operation failed.
     */
    error G1AddFailed();

    /**
     * @notice Reverts when G1MSM operation failed.
     */
    error G1MSMFailed();

    /**
     * @notice Reverts when pairing operation failed.
     */
    error PairingFailed();

    /**
     * @notice Reverts when MapFpToG1 operation failed.
     */
    error MapFpToG1Failed();

    /**
     * @notice Reverts when the DST length is too long.
     */
    error InvalidDSTLength();

    /* STRUCTS */

    /**
     * @notice A representation of a point on the G1 curve of BLS12-381.
     * @param x_a The most significant 256 bits of the affine x-coordinate (big endian).
     * @param x_b The least significant 256 bits of the affine x-coordinate.
     * @param y_a The most significant 256 bits of the affine y-coordinate (big endian).
     * @param y_b The least significant 256 bits of the affine y-coordinate.
     */
    struct G1Point {
        uint256 x_a;
        uint256 x_b;
        uint256 y_a;
        uint256 y_b;
    }

    /**
     * @notice A representation of a point on the G2 curve of BLS12-381.
     * @param x_c0_a The most significant 256 bits of the x.c0 coordinate.
     * @param x_c0_b The least significant 256 bits of the x.c0 coordinate.
     * @param x_c1_a The most significant 256 bits of the x.c1 coordinate.
     * @param x_c1_b The least significant 256 bits of the x.c1 coordinate.
     * @param y_c0_a The most significant 256 bits of the y.c0 coordinate.
     * @param y_c0_b The least significant 256 bits of the y.c0 coordinate.
     * @param y_c1_a The most significant 256 bits of the y.c1 coordinate.
     * @param y_c1_b The least significant 256 bits of the y.c1 coordinate.
     */
    struct G2Point {
        uint256 x_c0_a;
        uint256 x_c0_b;
        uint256 x_c1_a;
        uint256 x_c1_b;
        uint256 y_c0_a;
        uint256 y_c0_b;
        uint256 y_c1_a;
        uint256 y_c1_b;
    }

    /* FIELD ORDER */

    /**
     * @notice Upper 256 bits of the BLS12-381 base field modulus.
     */
    uint256 internal constant P_A = 0x000000000000000000000000000000001a0111ea397fe69a4b1ba7b6434bacd7;

    /**
     * @notice Lower 256 bits of the BLS12-381 base field modulus.
     */
    uint256 internal constant P_B = 0x64774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab;

    /**
     * @notice High limb of (p + 1) / 4 used when taking modular square roots.
     */
    uint128 private constant P_PLUS_ONE_OVER_FOUR_A = 0x0680447a8e5ff9a692c6e9ed90d2eb35;

    /**
     * @notice Low limb of (p + 1) / 4 used when taking modular square roots.
     */
    uint256 private constant P_PLUS_ONE_OVER_FOUR_B =
        0xd91dd2e13ce144afd9cc34a83dac3d8907aaffffac54ffffee7fbfffffffeaab;

    /**
     * @notice Order of the prime-order subgroup of G1.
     */
    uint256 private constant G1_SUBGROUP_ORDER = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;

    /**
     * @notice Scalar field modulus Fr (equal to the G1 subgroup order).
     */
    uint256 internal constant FR_MODULUS = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;

    /**
     * @notice Returns the canonical G1 generator.
     * @return Generator point encoded with split-limb coordinates.
     */
    function generatorG1() internal pure returns (G1Point memory) {
        return G1Point({
            x_a: 0x0000000000000000000000000000000017f1d3a73197d7942695638c4fa9ac0f,
            x_b: 0xc3688c4f9774b905a14e3a3f171bac586c55e83ff97a1aeffb3af00adb22c6bb,
            y_a: 0x0000000000000000000000000000000008b3f481e3aaa0f1a09e30ed741d8ae4,
            y_b: 0xfcf5e095d5d00af600db18cb2c04b3edd03cc744a2888ae40caa232946c5e7e1
        });
    }

    /**
     * @notice Returns the negated generator coordinates (y -> -y mod p) using the same encoding as G1.
     * @return Generator with y-coordinate reflected modulo the base field.
     */
    function negGeneratorG1() internal pure returns (G1Point memory) {
        return G1Point({
            x_a: 0x0000000000000000000000000000000017f1d3a73197d7942695638c4fa9ac0f,
            x_b: 0xc3688c4f9774b905a14e3a3f171bac586c55e83ff97a1aeffb3af00adb22c6bb,
            y_a: 0x00000000000000000000000000000000114d1d6855d545a8aa7d76c8cf2e21f2,
            y_b: 0x67816aef1db507c96655b9d5caac42364e6f38ba0ecb751bad54dcd6b939c2ca
        });
    }

    /**
     * @notice Returns the canonical G2 generator.
     * @return Generator point encoded with split-limb Fp2 coordinates.
     */
    function generatorG2() internal pure returns (G2Point memory) {
        return G2Point({
            x_c0_a: 0x00000000000000000000000000000000024aa2b2f08f0a91260805272dc51051,
            x_c0_b: 0xc6e47ad4fa403b02b4510b647ae3d1770bac0326a805bbefd48056c8c121bdb8,
            x_c1_a: 0x0000000000000000000000000000000013e02b6052719f607dacd3a088274f65,
            x_c1_b: 0x596bd0d09920b61ab5da61bbdc7f5049334cf11213945d57e5ac7d055d042b7e,
            y_c0_a: 0x000000000000000000000000000000000ce5d527727d6e118cc9cdc6da2e351a,
            y_c0_b: 0xadfd9baa8cbdd3a76d429a695160d12c923ac9cc3baca289e193548608b82801,
            y_c1_a: 0x000000000000000000000000000000000606c4a02ea734cc32acd2b02bc28b99,
            y_c1_b: 0xcb3e287e85a763af267492ab572e99ab3f370d275cec1da1aaa9075ff05f79be
        });
    }

    /**
     * @notice Returns the negated generator coordinates (y -> -y mod p) using the same encoding as G2.
     * @return Generator with y-coordinate reflected modulo the base field.
     */
    function negGeneratorG2() internal pure returns (G2Point memory) {
        return G2Point({
            x_c0_a: 0x00000000000000000000000000000000024aa2b2f08f0a91260805272dc51051,
            x_c0_b: 0xc6e47ad4fa403b02b4510b647ae3d1770bac0326a805bbefd48056c8c121bdb8,
            x_c1_a: 0x0000000000000000000000000000000013e02b6052719f607dacd3a088274f65,
            x_c1_b: 0x596bd0d09920b61ab5da61bbdc7f5049334cf11213945d57e5ac7d055d042b7e,
            y_c0_a: 0x000000000000000000000000000000000d1b3cc2c7027888be51d9ef691d77bc,
            y_c0_b: 0xb679afda66c73f17f9ee3837a55024f78c71363275a75d75d86bab79f74782aa,
            y_c1_a: 0x0000000000000000000000000000000013fa4d4a0ad8b1ce186ed5061789213d,
            y_c1_b: 0x993923066dddaf1040bc3ff59f825c78df74f2d75467e25e0f55f8a00fa030ed
        });
    }

    /* PRECOMPILE ADDRESSES */

    /**
     * @notice For exponentiation modulo a field element.
     */
    address internal constant EXP_MOD = 0x0000000000000000000000000000000000000005;

    /**
     * @notice For addition of two points on the BLS12-381 G1 curve.
     */
    address internal constant BLS12_G1ADD = 0x000000000000000000000000000000000000000b;

    /**
     * @notice For multi-scalar multiplication (MSM) on the BLS12-381 G1 curve.
     */
    address internal constant BLS12_G1MSM = 0x000000000000000000000000000000000000000C;

    /**
     * @notice For performing a pairing check on the BLS12-381 curve.
     */
    address internal constant BLS12_PAIRING_CHECK = 0x000000000000000000000000000000000000000F;

    /**
     * @notice For mapping a Fp to a point on the BLS12-381 G1 curve.
     */
    address internal constant BLS12_MAP_FP_TO_G1 = 0x0000000000000000000000000000000000000010;

    /* OPERATIONS */

    /**
     * @notice Returns a sum of two G1 points.
     * @param point0 First addend in affine coordinates (split-limb representation).
     * @param point1 Second addend in affine coordinates (split-limb representation).
     * @return result Sum of point0 and point1 in affine coordinates.
     */
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

    /**
     * @notice Returns a scalar multiplication of a G1 point and a scalar.
     * @param point Base point in affine coordinates.
     * @param scalar Scalar multiplier in Fr.
     * @return result Point resulting from scalar multiplication in affine coordinates.
     */
    function scalar_mul(G1Point memory point, uint256 scalar) internal view returns (G1Point memory result) {
        assembly ("memory-safe") {
            mcopy(result, point, 0x80)
            mstore(add(result, 0x80), scalar)
            if iszero(and(eq(returndatasize(), 0x80), staticcall(gas(), BLS12_G1MSM, result, 0xa0, result, 0x80))) {
                mstore(0x00, 0x5f776986) // `G1MSMFailed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    /**
     * @notice Returns whether the pairing of two G1 and two G2 points is valid.
     * @param a1 First G1 point.
     * @param a2 First G2 point paired with a1.
     * @param b1 Second G1 point.
     * @param b2 Second G2 point paired with b1.
     * @return result True if e(a1, a2) equals e(b1, b2).
     */
    function pairing(G1Point memory a1, G2Point memory a2, G1Point memory b1, G2Point memory b2)
        internal
        view
        returns (bool result)
    {
        assembly ("memory-safe") {
            let m := mload(0x40)
            mcopy(m, a1, 0x80)
            mcopy(add(m, 0x80), a2, 0x100)
            mcopy(add(m, 0x180), b1, 0x80)
            mcopy(add(m, 0x200), b2, 0x100)
            if iszero(and(eq(returndatasize(), 0x20), staticcall(gas(), BLS12_PAIRING_CHECK, m, 0x300, 0x00, 0x20))) {
                mstore(0x00, 0x4df45e2f) // `PairingFailed()`.
                revert(0x1c, 0x04)
            }
            result := mload(0x00)
        }
    }

    /**
     * @notice Returns a negated G1 point by reflecting it over the x-axis.
     * @param point The G1 point to negate.
     * @return Negated point.
     * @dev Assumes that the Y coordinate is always less than the field modulus.
     *      Returns the point at infinity unchanged.
     */
    function negate(G1Point memory point) internal pure returns (G1Point memory) {
        if (point.x_a == 0 && point.x_b == 0 && point.y_a == 0 && point.y_b == 0) {
            return G1Point(0, 0, 0, 0);
        }
        if (P_B >= point.y_b) {
            return G1Point({x_a: point.x_a, x_b: point.x_b, y_a: P_A - point.y_a, y_b: P_B - point.y_b});
        }
        return G1Point({
            x_a: point.x_a, x_b: point.x_b, y_a: P_A - point.y_a - 1, y_b: type(uint256).max - (point.y_b - P_B) + 1
        });
    }

    /**
     * @notice Returns a point in G1 from a message.
     * @param message Message to hash using the RFC 9380 hash_to_curve suite for BLS12-381 G1.
     * @return result Deterministic G1 point corresponding to the message.
     */
    function hashToG1(bytes memory message) internal view returns (G1Point memory result) {
        bytes memory uniform_bytes = expandMsg("BLS_SIG_BLS12381G1_XMD:SHA-256_SSWU_RO_NUL_", message, 0x80);
        assembly ("memory-safe") {
            let m := mload(0x40)
            for { let i := 0 } iszero(eq(i, 2)) { i := add(i, 1) } {
                // inplace mod in uniform_bytes[64*i]
                let p := add(add(uniform_bytes, 0x20), mul(i, 0x40))
                mstore(m, 0x40) // length of base
                mstore(add(m, 0x20), 0x01) // length of exponent 1
                mstore(add(m, 0x40), 0x40) // length of modulus
                mcopy(add(m, 0x60), p, 0x40) // copy base
                mstore8(add(m, 0xa0), 1) // exponent
                mstore(add(m, 0xa1), P_A)
                mstore(add(m, 0xc1), P_B)
                if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), EXP_MOD, m, 0xe1, p, 0x40))) {
                    revert(calldatasize(), 0x00)
                }

                // EIP-2537 map_fp_to_g1
                if iszero(
                    and(
                        eq(returndatasize(), 0x80),
                        staticcall(gas(), BLS12_MAP_FP_TO_G1, p, 0x40, add(result, mul(i, 0x80)), 0x80)
                    )
                ) {
                    mstore(0x00, 0x24a289fc) // `MapFpToG1Failed()`.
                    revert(0x1c, 0x04)
                }
            }
        }
        assembly ("memory-safe") {
            if iszero(and(eq(returndatasize(), 0x80), staticcall(gas(), BLS12_G1ADD, result, 0x100, result, 0x80))) {
                mstore(0x00, 0xd6cc76eb) // `G1AddFailed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    /**
     * @notice Returns an expanded arbitrary message to n bytes, as described in rfc9380 section 5.3.1, using H = sha256.
     * @param DST Domain separation tag.
     * @param message The message to expand.
     * @param n_bytes The number of bytes to extend to.
     * @return out Pseudo-random byte string of length n_bytes derived from the message and DST.
     */
    function expandMsg(bytes memory DST, bytes memory message, uint8 n_bytes) internal pure returns (bytes memory out) {
        uint256 domainLen = DST.length;
        if (domainLen > 0xff) {
            revert InvalidDSTLength();
        }
        bytes memory b_0 =
            abi.encodePacked(new bytes(0x40), message, uint8(0x00), n_bytes, uint8(0x00), DST, uint8(domainLen));
        bytes32 b0 = sha256(b_0);

        bytes memory b_i = abi.encodePacked(b0, uint8(0x01), DST, uint8(domainLen));
        bytes32 bi = sha256(b_i);

        out = new bytes(n_bytes);
        uint256 ell = (n_bytes + 0x1F) >> 5;
        for (uint256 i = 1; i < ell; ++i) {
            b_i = abi.encodePacked(b0 ^ bi, uint8(i + 1), DST, uint8(domainLen));
            assembly ("memory-safe") {
                mstore(add(add(out, 0x20), mul(sub(i, 1), 0x20)), bi)
            }
            bi = sha256(b_i);
        }
        assembly ("memory-safe") {
            mstore(add(add(out, 0x20), mul(sub(ell, 1), 0x20)), bi)
        }
    }

    /**
     * @notice Returns a y-coordinate for the curve point with the provided x value.
     * @param x_a The most significant 256 bits of the affine x-coordinate.
     * @param x_b The least significant 256 bits of the affine x-coordinate.
     * @return y_a The most significant 256 bits of a valid affine y-coordinate.
     * @return y_b The least significant 256 bits of a valid affine y-coordinate.
     */
    function findYFromX(uint256 x_a, uint256 x_b) internal view returns (uint256 y_a, uint256 y_b) {
        // compute (x**3 + 4) mod p
        (y_a, y_b) = _xCubePlus4(x_a, x_b);

        // compute y = sqrt(x**3 + 4) mod p = (x**3 + 4)^(p+1)/4 mod p
        assembly ("memory-safe") {
            let m := mload(0x40)
            mstore(m, 0x40) // length of base
            mstore(add(m, 0x20), 0x40) // length of exponent
            mstore(add(m, 0x40), 0x40) // length of modulus
            mstore(add(m, 0x60), y_a)
            mstore(add(m, 0x80), y_b)
            mstore(add(m, 0xa0), P_PLUS_ONE_OVER_FOUR_A)
            mstore(add(m, 0xc0), P_PLUS_ONE_OVER_FOUR_B)
            mstore(add(m, 0xe0), P_A)
            mstore(add(m, 0x100), P_B)
            if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), EXP_MOD, m, 0x120, m, 0x40))) {
                revert(calldatasize(), 0x00)
            }
            y_a := mload(m)
            y_b := mload(add(m, 0x20))
        }
    }

    /**
     * @notice Returns true if the given point satisfies the BLS12-381 G1 curve equation.
     * @param point Point to check for curve membership.
     * @return True if the point lies on the curve.
     */
    function isOnCurve(G1Point memory point) internal view returns (bool) {
        uint256 y_a = point.y_a;
        uint256 y_b = point.y_b;
        if (y_a == 0 && y_b == 0 && point.x_a == 0 && point.x_b == 0) {
            return true;
        }
        assembly ("memory-safe") {
            let m := mload(0x40)
            mstore(m, 0x40) // length of base
            mstore(add(m, 0x20), 0x01) // length of exponent 2
            mstore(add(m, 0x40), 0x40) // length of modulus
            mstore(add(m, 0x60), y_a)
            mstore(add(m, 0x80), y_b)
            mstore8(add(m, 0xa0), 2) // exponent
            mstore(add(m, 0xa1), P_A)
            mstore(add(m, 0xc1), P_B)
            if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), EXP_MOD, m, 0xe1, m, 0x40))) {
                revert(calldatasize(), 0x00)
            }
            y_a := mload(m)
            y_b := mload(add(m, 0x20))
        }

        (uint256 x_a, uint256 x_b) = _xCubePlus4(point.x_a, point.x_b);
        return x_a == y_a && x_b == y_b;
    }

    /**
     * @notice Returns true if the given point lies in the prime-order subgroup of G1.
     * @param point Point to check for subgroup membership.
     * @return True if the point is in the correct subgroup.
     */
    function isInSubgroup(G1Point memory point) internal view returns (bool) {
        G1Point memory result = scalar_mul(point, G1_SUBGROUP_ORDER);
        return result.x_a == 0 && result.x_b == 0 && result.y_a == 0 && result.y_b == 0;
    }

    /**
     * @notice Computes x^3 + 4 modulo the BLS12-381 base field.
     * @param x_a The most significant 256 bits of the x-coordinate.
     * @param x_b The least significant 256 bits of the x-coordinate.
     * @return The most and least significant 256-bit limbs of (x^3 + 4) mod p.
     */
    function _xCubePlus4(uint256 x_a, uint256 x_b) internal view returns (uint256, uint256) {
        assembly ("memory-safe") {
            let m := mload(0x40)
            mstore(m, 0x40) // length of base
            mstore(add(m, 0x20), 0x01) // length of exponent 3
            mstore(add(m, 0x40), 0x40) // length of modulus
            mstore(add(m, 0x60), x_a)
            mstore(add(m, 0x80), x_b)
            mstore8(add(m, 0xa0), 3) // exponent
            mstore(add(m, 0xa1), P_A)
            mstore(add(m, 0xc1), P_B)
            if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), EXP_MOD, m, 0xe1, m, 0x40))) {
                revert(calldatasize(), 0x00)
            }
            x_a := mload(m)
            x_b := mload(add(m, 0x20))
        }
        // add 4 to x^3 and reduce modulo the field prime
        unchecked {
            x_b += 4;
            if (x_b < 4) {
                ++x_a;
            } else if (x_a == P_A && x_b >= P_B) {
                x_a = 0;
                x_b -= P_B;
            }
        }
        return (x_a, x_b);
    }
}
