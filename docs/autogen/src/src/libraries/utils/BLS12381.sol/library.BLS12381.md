# BLS12381
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/9b9397f972967c27019ba88b9cb96dce82bcc4be/src/libraries/utils/BLS12381.sol)

**Title:**
BLS12381

Library for working with BLS12-381 precompiles.

Flattened structs to make encoding more efficient.
All structs use Big endian encoding.
See: https://eips.ethereum.org/EIPS/eip-2537


## State Variables
### P_A
Upper 256 bits of the BLS12-381 base field modulus.


```solidity
uint256 internal constant P_A = 0x000000000000000000000000000000001a0111ea397fe69a4b1ba7b6434bacd7
```


### P_B
Lower 256 bits of the BLS12-381 base field modulus.


```solidity
uint256 internal constant P_B = 0x64774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
```


### P_PLUS_ONE_OVER_FOUR_A
High limb of (p + 1) / 4 used when taking modular square roots.


```solidity
uint128 private constant P_PLUS_ONE_OVER_FOUR_A = 0x0680447a8e5ff9a692c6e9ed90d2eb35
```


### P_PLUS_ONE_OVER_FOUR_B
Low limb of (p + 1) / 4 used when taking modular square roots.


```solidity
uint256 private constant P_PLUS_ONE_OVER_FOUR_B =
    0xd91dd2e13ce144afd9cc34a83dac3d8907aaffffac54ffffee7fbfffffffeaab
```


### G1_SUBGROUP_ORDER
Order of the prime-order subgroup of G1.


```solidity
uint256 private constant G1_SUBGROUP_ORDER = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001
```


### FR_MODULUS
Scalar field modulus Fr (equal to the G1 subgroup order).


```solidity
uint256 internal constant FR_MODULUS = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001
```


### EXP_MOD
For exponentiation modulo a field element.


```solidity
address internal constant EXP_MOD = 0x0000000000000000000000000000000000000005
```


### BLS12_G1ADD
For addition of two points on the BLS12-381 G1 curve.


```solidity
address internal constant BLS12_G1ADD = 0x000000000000000000000000000000000000000b
```


### BLS12_G1MSM
For multi-scalar multiplication (MSM) on the BLS12-381 G1 curve.


```solidity
address internal constant BLS12_G1MSM = 0x000000000000000000000000000000000000000C
```


### BLS12_PAIRING_CHECK
For performing a pairing check on the BLS12-381 curve.


```solidity
address internal constant BLS12_PAIRING_CHECK = 0x000000000000000000000000000000000000000F
```


### BLS12_MAP_FP_TO_G1
For mapping a Fp to a point on the BLS12-381 G1 curve.


```solidity
address internal constant BLS12_MAP_FP_TO_G1 = 0x0000000000000000000000000000000000000010
```


## Functions
### generatorG1

Returns the canonical G1 generator.


```solidity
function generatorG1() internal pure returns (G1Point memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`G1Point`|Generator point encoded with split-limb coordinates.|


### negGeneratorG1

Returns the negated generator coordinates (y -> -y mod p) using the same encoding as G1.


```solidity
function negGeneratorG1() internal pure returns (G1Point memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`G1Point`|Generator with y-coordinate reflected modulo the base field.|


### generatorG2

Returns the canonical G2 generator.


```solidity
function generatorG2() internal pure returns (G2Point memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`G2Point`|Generator point encoded with split-limb Fp2 coordinates.|


### negGeneratorG2

Returns the negated generator coordinates (y -> -y mod p) using the same encoding as G2.


```solidity
function negGeneratorG2() internal pure returns (G2Point memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`G2Point`|Generator with y-coordinate reflected modulo the base field.|


### add

Returns a sum of two G1 points.


```solidity
function add(G1Point memory point0, G1Point memory point1) internal view returns (G1Point memory result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`point0`|`G1Point`|First addend in affine coordinates (split-limb representation).|
|`point1`|`G1Point`|Second addend in affine coordinates (split-limb representation).|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`G1Point`|Sum of point0 and point1 in affine coordinates.|


### scalar_mul

Returns a scalar multiplication of a G1 point and a scalar.


```solidity
function scalar_mul(G1Point memory point, uint256 scalar) internal view returns (G1Point memory result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`point`|`G1Point`|Base point in affine coordinates.|
|`scalar`|`uint256`|Scalar multiplier in Fr.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`G1Point`|Point resulting from scalar multiplication in affine coordinates.|


### pairing

Returns whether the pairing of two G1 and two G2 points is valid.


```solidity
function pairing(G1Point memory a1, G2Point memory a2, G1Point memory b1, G2Point memory b2)
    internal
    view
    returns (bool result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`a1`|`G1Point`|First G1 point.|
|`a2`|`G2Point`|First G2 point paired with a1.|
|`b1`|`G1Point`|Second G1 point.|
|`b2`|`G2Point`|Second G2 point paired with b1.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`bool`|True if e(a1, a2) equals e(b1, b2).|


### negate

Returns a negated G1 point by reflecting it over the x-axis.

Assumes that the Y coordinate is always less than the field modulus.
Returns the point at infinity unchanged.


```solidity
function negate(G1Point memory point) internal pure returns (G1Point memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`point`|`G1Point`|The G1 point to negate.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`G1Point`|Negated point.|


### hashToG1

Returns a point in G1 from a message.


```solidity
function hashToG1(bytes memory message) internal view returns (G1Point memory result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`message`|`bytes`|Message to hash using the RFC 9380 hash_to_curve suite for BLS12-381 G1.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`G1Point`|Deterministic G1 point corresponding to the message.|


### expandMsg

Returns an expanded arbitrary message to n bytes, as described in rfc9380 section 5.3.1, using H = sha256.


```solidity
function expandMsg(bytes memory DST, bytes memory message, uint8 n_bytes) internal pure returns (bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`DST`|`bytes`|Domain separation tag.|
|`message`|`bytes`|The message to expand.|
|`n_bytes`|`uint8`|The number of bytes to extend to.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes`|Pseudo-random byte string of length n_bytes derived from the message and DST.|


### findYFromX

Returns a y-coordinate for the curve point with the provided x value.


```solidity
function findYFromX(uint256 x_a, uint256 x_b) internal view returns (uint256 y_a, uint256 y_b);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x_a`|`uint256`|The most significant 256 bits of the affine x-coordinate.|
|`x_b`|`uint256`|The least significant 256 bits of the affine x-coordinate.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`y_a`|`uint256`|The most significant 256 bits of a valid affine y-coordinate.|
|`y_b`|`uint256`|The least significant 256 bits of a valid affine y-coordinate.|


### isOnCurve

Returns true if the given point satisfies the BLS12-381 G1 curve equation.


```solidity
function isOnCurve(G1Point memory point) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`point`|`G1Point`|Point to check for curve membership.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if the point lies on the curve.|


### isInSubgroup

Returns true if the given point lies in the prime-order subgroup of G1.


```solidity
function isInSubgroup(G1Point memory point) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`point`|`G1Point`|Point to check for subgroup membership.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if the point is in the correct subgroup.|


### _xCubePlus4

Computes x^3 + 4 modulo the BLS12-381 base field.


```solidity
function _xCubePlus4(uint256 x_a, uint256 x_b) internal view returns (uint256, uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x_a`|`uint256`|The most significant 256 bits of the x-coordinate.|
|`x_b`|`uint256`|The least significant 256 bits of the x-coordinate.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The most and least significant 256-bit limbs of (x^3 + 4) mod p.|
|`<none>`|`uint256`||


## Errors
### G1AddFailed
Reverts when G1Add operation failed.


```solidity
error G1AddFailed();
```

### G1MSMFailed
Reverts when G1MSM operation failed.


```solidity
error G1MSMFailed();
```

### PairingFailed
Reverts when pairing operation failed.


```solidity
error PairingFailed();
```

### MapFpToG1Failed
Reverts when MapFpToG1 operation failed.


```solidity
error MapFpToG1Failed();
```

### InvalidDSTLength
Reverts when the DST length is too long.


```solidity
error InvalidDSTLength(bytes);
```

## Structs
### G1Point
A representation of a point on the G1 curve of BLS12-381.


```solidity
struct G1Point {
    uint256 x_a;
    uint256 x_b;
    uint256 y_a;
    uint256 y_b;
}
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`x_a`|`uint256`|The most significant 256 bits of the affine x-coordinate (big endian).|
|`x_b`|`uint256`|The least significant 256 bits of the affine x-coordinate.|
|`y_a`|`uint256`|The most significant 256 bits of the affine y-coordinate (big endian).|
|`y_b`|`uint256`|The least significant 256 bits of the affine y-coordinate.|

### G2Point
A representation of a point on the G2 curve of BLS12-381.


```solidity
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
```

**Properties**

|Name|Type|Description|
|----|----|-----------|
|`x_c0_a`|`uint256`|The most significant 256 bits of the x.c0 coordinate.|
|`x_c0_b`|`uint256`|The least significant 256 bits of the x.c0 coordinate.|
|`x_c1_a`|`uint256`|The most significant 256 bits of the x.c1 coordinate.|
|`x_c1_b`|`uint256`|The least significant 256 bits of the x.c1 coordinate.|
|`y_c0_a`|`uint256`|The most significant 256 bits of the y.c0 coordinate.|
|`y_c0_b`|`uint256`|The least significant 256 bits of the y.c0 coordinate.|
|`y_c1_a`|`uint256`|The most significant 256 bits of the y.c1 coordinate.|
|`y_c1_b`|`uint256`|The least significant 256 bits of the y.c1 coordinate.|

