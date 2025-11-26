// SPDX-License-Identifier: MIT
// Original code: https://github.com/Vectorized/solady/blob/main/src/utils/ext/ithaca/BLS.sol
// Original code: https://github.com/randa-mu/bls-solidity/blob/main/src/libraries/BLS2.sol
pragma solidity ^0.8.24;

/**
 * @title BLS12381
 * @notice Library for working with BLS12-381 precompiles.
 */
library BLS12381 {
    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                          STRUCTS                           */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    // We use flattened structs to make encoding more efficient.
    // All structs use Big endian encoding.
    // See: https://eips.ethereum.org/EIPS/eip-2537

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
    uint256 private constant G1_SUBGROUP_ORDER = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;
    uint256 internal constant FR_MODULUS = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;

    /// @notice Returns the canonical G1 generator.
    function generatorG1() internal pure returns (G1Point memory) {
        return G1Point({
            x_a: bytes32(0x0000000000000000000000000000000017f1d3a73197d7942695638c4fa9ac0f),
            x_b: bytes32(0xc3688c4f9774b905a14e3a3f171bac586c55e83ff97a1aeffb3af00adb22c6bb),
            y_a: bytes32(0x0000000000000000000000000000000008b3f481e3aaa0f1a09e30ed741d8ae4),
            y_b: bytes32(0xfcf5e095d5d00af600db18cb2c04b3edd03cc744a2888ae40caa232946c5e7e1)
        });
    }

    /// @notice Returns the negated generator coordinates (y -> -y mod p) using the same encoding as G1.
    function negGeneratorG1() internal pure returns (G1Point memory) {
        return G1Point({
            x_a: bytes32(0x0000000000000000000000000000000017f1d3a73197d7942695638c4fa9ac0f),
            x_b: bytes32(0xc3688c4f9774b905a14e3a3f171bac586c55e83ff97a1aeffb3af00adb22c6bb),
            y_a: bytes32(0x00000000000000000000000000000000114d1d6855d545a8aa7d76c8cf2e21f2),
            y_b: bytes32(0x67816aef1db507c96655b9d5caac42364e6f38ba0ecb751bad54dcd6b939c2ca)
        });
    }

    /// @notice Returns the canonical G2 generator.
    /// @dev Sourced from https://datatracker.ietf.org/doc/html/draft-irtf-cfrg-bls-signature-05#section-4.2.3.
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

    /// @notice Returns the negated generator coordinates (y -> -y mod p) using the same encoding as G2.
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

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                    PRECOMPILE ADDRESSES                    */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    /// @dev For exponentiation modulo a field element.
    address internal constant EXP_MOD = 0x0000000000000000000000000000000000000005;

    /// @dev For addition of two points on the BLS12-381 G1 curve,
    address internal constant BLS12_G1ADD = 0x000000000000000000000000000000000000000b;

    /// @dev For multi-scalar multiplication (MSM) on the BLS12-381 G1 curve.
    address internal constant BLS12_G1MSM = 0x000000000000000000000000000000000000000C;

    /// @dev For performing a pairing check on the BLS12-381 curve.
    address internal constant BLS12_PAIRING_CHECK = 0x000000000000000000000000000000000000000F;

    /// @dev For mapping a Fp to a point on the BLS12-381 G1 curve.
    address internal constant BLS12_MAP_FP_TO_G1 = 0x0000000000000000000000000000000000000010;

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                        CUSTOM ERRORS                       */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    // A custom error for each precompile helps us in debugging which precompile has failed.

    /// @dev The G1Add operation failed.
    error G1AddFailed();

    /// @dev The G1MSM operation failed.
    error G1MSMFailed();

    /// @dev The pairing operation failed.
    error PairingFailed();

    /// @dev The MapFpToG1 operation failed.
    error MapFpToG1Failed();

    /// @dev The DST length is too long.
    error InvalidDSTLength(bytes);

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

    /// @dev Scalar multiplication of a G1 point with a scalar. Returns a new G1 point.
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

    /// @dev Checks the pairing of G1 points with G2 points. Returns whether the pairing is valid.
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

    /// @dev Computes a point in G1 from a message.
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
        assembly {
            if iszero(and(eq(returndatasize(), 0x80), staticcall(gas(), BLS12_G1ADD, result, 0x100, result, 0x80))) {
                mstore(0x00, 0xd6cc76eb) // `G1AddFailed()`.
                revert(0x1c, 0x04)
            }
        }
    }

    /// @notice Expand arbitrary message to n bytes, as described
    ///     in rfc9380 section 5.3.1, using H = sha256.
    /// @param DST Domain separation tag
    /// @param message The message to expand
    /// @param n_bytes The number of bytes to extend to
    function expandMsg(bytes memory DST, bytes memory message, uint8 n_bytes) internal pure returns (bytes memory) {
        uint256 domainLen = DST.length;
        if (domainLen > 0xff) {
            revert InvalidDSTLength(DST);
        }
        bytes memory zpad = new bytes(0x40);
        bytes memory b_0 = abi.encodePacked(zpad, message, uint8(0x00), n_bytes, uint8(0x00), DST, uint8(domainLen));
        bytes32 b0 = sha256(b_0);

        bytes memory b_i = abi.encodePacked(b0, uint8(0x01), DST, uint8(domainLen));
        bytes32 bi = sha256(b_i);
        bytes memory out = new bytes(n_bytes);
        uint256 ell = (n_bytes + 0x1F) >> 5;
        for (uint256 i = 1; i < ell; ++i) {
            b_i = abi.encodePacked(b0 ^ bi, uint8(i + 1), DST, uint8(domainLen));
            assembly {
                mstore(add(add(out, 0x20), mul(sub(i, 1), 0x20)), bi)
            }
            bi = sha256(b_i);
        }
        assembly {
            mstore(add(add(out, 0x20), mul(sub(ell, 1), 0x20)), bi)
        }
        return out;
    }

    function findYFromX(uint256 x_a, uint256 x_b) internal view returns (uint256 y_a, uint256 y_b) {
        // compute (x**3 + 4) mod p
        (y_a, y_b) = _xCubePlus4(x_a, x_b);

        // compute y = sqrt(x**3 + 4) mod p = (x**3 + 4)^(p+1)/2 mod p
        bytes memory buf = new bytes(0x120);
        assembly ("memory-safe") {
            function modfield(s_, b_) {
                if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), EXP_MOD, s_, 0x120, b_, 0x40))) {
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

    function isOnCurve(G1Point memory point) internal view returns (bool) {
        uint256 y_a = uint256(point.y_a);
        uint256 y_b = uint256(point.y_b);
        bytes memory buf = new bytes(0xe1);
        assembly ("memory-safe") {
            function modfield(s_, b_) {
                if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), EXP_MOD, s_, 0xe1, b_, 0x40))) {
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
        G1Point memory result = scalar_mul(point, G1_SUBGROUP_ORDER);
        return result.x_a == 0 && result.x_b == 0 && result.y_a == 0 && result.y_b == 0;
    }

    function _xCubePlus4(uint256 x_a, uint256 x_b) internal view returns (uint256, uint256) {
        bytes memory buf = new bytes(0xe1);
        assembly ("memory-safe") {
            function modfield(s_, b_) {
                if iszero(and(eq(returndatasize(), 0x40), staticcall(gas(), EXP_MOD, s_, 0xe1, b_, 0x40))) {
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
        // add 4 to x^3 and reduce modulo the field prime
        unchecked {
            x_b += 4;
            if (x_b < 4) {
                ++x_a;
            }
            if (x_a == P_A && x_b >= P_B) {
                x_a = 0;
                x_b -= P_B;
            }
        }
        return (x_a, x_b);
    }
}
