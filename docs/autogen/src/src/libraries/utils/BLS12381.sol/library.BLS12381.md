# BLS12381
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/40791731b80bf5666d350907bfe7f142e3c6d70c/src/libraries/utils/BLS12381.sol)

**Authors:**
Solady (https://github.com/vectorized/solady/blob/main/src/utils/BLS.sol), Ithaca (https://github.com/ithacaxyz/odyssey-examples/blob/main/chapter1/contracts/src/libraries/BLS.sol)

BLS12381 wrapper.

Precompile addresses come from the BLS addresses submodule in AlphaNet, see
See: (https://github.com/paradigmxyz/alphanet/blob/main/crates/precompile/src/addresses.rs)
Note:
- This implementation uses `mcopy`, since any chain that is edgy enough to
implement the BLS precompiles will definitely have implemented cancun.
- For efficiency, we use the legacy `staticcall` to call the precompiles.
For the intended use case in an entry points that requires gas-introspection,
which requires legacy bytecode, this won't be a blocker.


## State Variables
### P_A

```solidity
uint256 internal constant P_A = 0x000000000000000000000000000000001a0111ea397fe69a4b1ba7b6434bacd7
```


### P_B

```solidity
uint256 internal constant P_B = 0x64774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
```


### P_PLUS_ONE_SLASH_2_A

```solidity
uint128 private constant P_PLUS_ONE_SLASH_2_A = 0x0680447a8e5ff9a692c6e9ed90d2eb35
```


### P_PLUS_ONE_SLASH_2_B

```solidity
uint256 private constant P_PLUS_ONE_SLASH_2_B = 0xd91dd2e13ce144afd9cc34a83dac3d8907aaffffac54ffffee7fbfffffffeaab
```


### G1_SUBGROUP_ORDER

```solidity
bytes32 private constant G1_SUBGROUP_ORDER = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001
```


### FR_MODULUS

```solidity
uint256 internal constant FR_MODULUS = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001
```


### G2_X_C0_A

```solidity
bytes32 internal constant G2_X_C0_A = 0x00000000000000000000000000000000024aa2b2f08f0a91260805272dc51051
```


### G2_X_C0_B

```solidity
bytes32 internal constant G2_X_C0_B = 0xc6e47ad4fa403b02b4510b647ae3d1770bac0326a805bbefd48056c8c121bdb8
```


### G2_X_C1_A

```solidity
bytes32 internal constant G2_X_C1_A = 0x0000000000000000000000000000000013e02b6052719f607dacd3a088274f65
```


### G2_X_C1_B

```solidity
bytes32 internal constant G2_X_C1_B = 0x596bd0d09920b61ab5da61bbdc7f5049334cf11213945d57e5ac7d055d042b7e
```


### G2_Y_C0_A

```solidity
bytes32 internal constant G2_Y_C0_A = 0x000000000000000000000000000000000ce5d527727d6e118cc9cdc6da2e351a
```


### G2_Y_C0_B

```solidity
bytes32 internal constant G2_Y_C0_B = 0xadfd9baa8cbdd3a76d429a695160d12c923ac9cc3baca289e193548608b82801
```


### G2_Y_C1_A

```solidity
bytes32 internal constant G2_Y_C1_A = 0x000000000000000000000000000000000606c4a02ea734cc32acd2b02bc28b99
```


### G2_Y_C1_B

```solidity
bytes32 internal constant G2_Y_C1_B = 0xcb3e287e85a763af267492ab572e99ab3f370d275cec1da1aaa9075ff05f79be
```


### NEG_G2_Y_C0_A

```solidity
bytes32 internal constant NEG_G2_Y_C0_A = 0x000000000000000000000000000000000d1b3cc2c7027888be51d9ef691d77bc
```


### NEG_G2_Y_C0_B

```solidity
bytes32 internal constant NEG_G2_Y_C0_B = 0xb679afda66c73f17f9ee3837a55024f78c71363275a75d75d86bab79f74782aa
```


### NEG_G2_Y_C1_A

```solidity
bytes32 internal constant NEG_G2_Y_C1_A = 0x0000000000000000000000000000000013fa4d4a0ad8b1ce186ed5061789213d
```


### NEG_G2_Y_C1_B

```solidity
bytes32 internal constant NEG_G2_Y_C1_B = 0x993923066dddaf1040bc3ff59f825c78df74f2d75467e25e0f55f8a00fa030ed
```


### EXP_MOD
For exponentiation modulo a field element.


```solidity
address internal constant EXP_MOD = 0x0000000000000000000000000000000000000005
```


### BLS12_G1ADD
For addition of two points on the BLS12-381 G1 curve,


```solidity
address internal constant BLS12_G1ADD = 0x000000000000000000000000000000000000000b
```


### BLS12_G1MSM
For multi-scalar multiplication (MSM) on the BLS12-381 G1 curve.


```solidity
address internal constant BLS12_G1MSM = 0x000000000000000000000000000000000000000C
```


### BLS12_G2ADD
For addition of two points on the BLS12-381 G2 curve.


```solidity
address internal constant BLS12_G2ADD = 0x000000000000000000000000000000000000000d
```


### BLS12_G2MSM
For multi-scalar multiplication (MSM) on the BLS12-381 G2 curve.


```solidity
address internal constant BLS12_G2MSM = 0x000000000000000000000000000000000000000E
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


### BLS12_MAP_FP2_TO_G2
For mapping a Fp2 to a point on the BLS12-381 G2 curve.


```solidity
address internal constant BLS12_MAP_FP2_TO_G2 = 0x0000000000000000000000000000000000000011
```


## Functions
### generatorG1

Returns the canonical G1 generator.


```solidity
function generatorG1() internal pure returns (G1Point memory);
```

### negGeneratorG1

Returns the negated G1 generator (useful for pairings expecting -G1).


```solidity
function negGeneratorG1() internal pure returns (G1Point memory);
```

### generatorG2

Returns the canonical G2 generator.


```solidity
function generatorG2() internal pure returns (G2Point memory);
```

### negGeneratorG2

Returns the negated G2 generator (useful for pairings expecting -G2).


```solidity
function negGeneratorG2() internal pure returns (G2Point memory);
```

### add

Adds two G1 points. Returns a new G1 point.


```solidity
function add(G1Point memory point0, G1Point memory point1) internal view returns (G1Point memory result);
```

### msm

Multi-scalar multiplication of G1 points with scalars. Returns a new G1 point.


```solidity
function msm(G1Point[] memory points, bytes32[] memory scalars) internal view returns (G1Point memory result);
```

### scalarMulG1

Scalar multiplication of a G1 point with a scalar. Returns a new G1 point.


```solidity
function scalarMulG1(G1Point memory point, uint256 scalar) internal view returns (G1Point memory result);
```

### add

Adds two G2 points. Returns a new G2 point.


```solidity
function add(G2Point memory point0, G2Point memory point1) internal view returns (G2Point memory result);
```

### msm

Multi-scalar multiplication of G2 points with scalars. Returns a new G2 point.


```solidity
function msm(G2Point[] memory points, bytes32[] memory scalars) internal view returns (G2Point memory result);
```

### pairing

Convenience overload mirroring BN254's pairing signature.


```solidity
function pairing(G1Point memory a1, G2Point memory a2, G1Point memory b1, G2Point memory b2)
    internal
    view
    returns (bool);
```

### pairing

Checks the pairing of G1 points with G2 points. Returns whether the pairing is valid.


```solidity
function pairing(G1Point[] memory g1Points, G2Point[] memory g2Points) internal view returns (bool result);
```

### toG1

Maps a Fp element to a G1 point.


```solidity
function toG1(Fp memory element) internal view returns (G1Point memory result);
```

### toG2

Maps a Fp2 element to a G2 point.


```solidity
function toG2(Fp2 memory element) internal view returns (G2Point memory result);
```

### hashToG1

Computes a point in G1 from a message.


```solidity
function hashToG1(bytes memory dst, bytes memory message) internal view returns (G1Point memory out);
```

### expandMsg

Expand arbitrary message to n bytes, as described
in rfc9380 section 5.3.1, using H = sha256.


```solidity
function expandMsg(bytes memory DST, bytes memory message, uint8 n_bytes) internal pure returns (bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`DST`|`bytes`|Domain separation tag|
|`message`|`bytes`|The message to expand|
|`n_bytes`|`uint8`|The number of bytes to extend to|


### findYFromX


```solidity
function findYFromX(uint256 x_a, uint256 x_b) internal view returns (uint256 y_a, uint256 y_b);
```

### negate

Negates a G1 point, by reflecting it over the x-axis

Assumes that the Y coordinate is always less than the field modulus


```solidity
function negate(G1Point memory point) internal pure returns (G1Point memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`point`|`G1Point`|The G1 point to negate|


### isOnCurve


```solidity
function isOnCurve(G1Point memory point) internal view returns (bool);
```

### isInSubgroup


```solidity
function isInSubgroup(G1Point memory point) internal view returns (bool);
```

### _xCubePlus4


```solidity
function _xCubePlus4(uint256 x_a, uint256 x_b) internal view returns (uint256, uint256);
```

## Errors
### G1AddFailed
The G1Add operation failed.


```solidity
error G1AddFailed();
```

### G1MSMFailed
The G1MSM operation failed.


```solidity
error G1MSMFailed();
```

### G2AddFailed
The G2Add operation failed.


```solidity
error G2AddFailed();
```

### G2MSMFailed
The G2MSM operation failed.


```solidity
error G2MSMFailed();
```

### PairingFailed
The pairing operation failed.


```solidity
error PairingFailed();
```

### MapFpToG1Failed
The MapFpToG1 operation failed.


```solidity
error MapFpToG1Failed();
```

### MapFp2ToG2Failed
The MapFpToG2 operation failed.


```solidity
error MapFp2ToG2Failed();
```

### InvalidDSTLength
The DST length is too long.


```solidity
error InvalidDSTLength(bytes);
```

## Structs
### Fp
A representation of a base field element (Fp) in the BLS12-381 curve.
Due to the size of `p`,
`0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab`
the top 16 bytes are always zeroes.


```solidity
struct Fp {
    bytes32 a; // Upper 32 bytes.
    bytes32 b; // Lower 32 bytes.
}
```

### Fp2
A representation of an extension field element (Fp2) in the BLS12-381 curve.


```solidity
struct Fp2 {
    bytes32 c0_a;
    bytes32 c0_b;
    bytes32 c1_a;
    bytes32 c1_b;
}
```

### G1Point
A representation of a point on the G1 curve of BLS12-381.


```solidity
struct G1Point {
    bytes32 x_a;
    bytes32 x_b;
    bytes32 y_a;
    bytes32 y_b;
}
```

### G2Point
A representation of a point on the G2 curve of BLS12-381.


```solidity
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
```

