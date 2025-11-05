# BN12381
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/773ae3c4e705581f92fbc339ac410d52ee1220ab/src/libraries/utils/BN12381.sol)

**Authors:**
Solady (https://github.com/vectorized/solady/blob/main/src/utils/BLS.sol), Ithaca (https://github.com/ithacaxyz/odyssey-examples/blob/main/chapter1/contracts/src/libraries/BLS.sol)

BN12381 wrapper.

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
### negGeneratorG1

Referenced from https://eips.ethereum.org/EIPS/eip-2537#curve-parameters


```solidity
function negGeneratorG1() internal pure returns (G1Point memory);
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

### hashToG2

Computes a point in G2 from a message.


```solidity
function hashToG2(bytes memory message) internal view returns (G2Point memory result);
```

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

