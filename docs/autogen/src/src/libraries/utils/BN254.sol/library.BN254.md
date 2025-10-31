# BN254
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/90b476bb8f01dc59dc602dcd0b4e541b7aed48d5/src/libraries/utils/BN254.sol)


## State Variables
### FP_MODULUS

```solidity
uint256 internal constant FP_MODULUS =
    21_888_242_871_839_275_222_246_405_745_257_275_088_696_311_157_297_823_662_689_037_894_645_226_208_583
```


### FR_MODULUS

```solidity
uint256 internal constant FR_MODULUS =
    21_888_242_871_839_275_222_246_405_745_257_275_088_548_364_400_416_034_343_698_204_186_575_808_495_617
```


### G2x1
Generator point in F_q2 is of the form: (x0 + ix1, y0 + iy1).


```solidity
uint256 internal constant G2x1 =
    11_559_732_032_986_387_107_991_004_021_392_285_783_925_812_861_821_192_530_917_403_151_452_391_805_634
```


### G2x0

```solidity
uint256 internal constant G2x0 =
    10_857_046_999_023_057_135_944_570_762_232_829_481_370_756_359_578_518_086_990_519_993_285_655_852_781
```


### G2y1

```solidity
uint256 internal constant G2y1 =
    4_082_367_875_863_433_681_332_203_403_145_435_568_316_851_327_593_401_208_105_741_076_214_120_093_531
```


### G2y0

```solidity
uint256 internal constant G2y0 =
    8_495_653_923_123_431_417_604_973_247_489_272_438_418_190_587_263_600_148_770_280_649_306_958_101_930
```


### nG2x1
Generator point in F_q2 is of the form: (x0 + ix1, y0 + iy1).


```solidity
uint256 internal constant nG2x1 =
    11_559_732_032_986_387_107_991_004_021_392_285_783_925_812_861_821_192_530_917_403_151_452_391_805_634
```


### nG2x0

```solidity
uint256 internal constant nG2x0 =
    10_857_046_999_023_057_135_944_570_762_232_829_481_370_756_359_578_518_086_990_519_993_285_655_852_781
```


### nG2y1

```solidity
uint256 internal constant nG2y1 =
    17_805_874_995_975_841_540_914_202_342_111_839_520_379_459_829_704_422_454_583_296_818_431_106_115_052
```


### nG2y0

```solidity
uint256 internal constant nG2y0 =
    13_392_588_948_715_843_804_641_432_497_768_002_650_278_120_570_034_223_513_918_757_245_338_268_106_653
```


### powersOfTauMerkleRoot

```solidity
bytes32 internal constant powersOfTauMerkleRoot =
    0x22c998e49752bbb1918ba87d6d59dd0e83620a311ba91dd4b2cc84990b31b56f
```


## Functions
### generatorG1


```solidity
function generatorG1() internal pure returns (G1Point memory);
```

### generatorG2

returns the G2 generator

mind the ordering of the 1s and 0s!
this is because of the (unknown to us) convention used in the bn254 pairing precompile contract
"Elements a * i + b of F_p^2 are encoded as two elements of F_p, (a, b)."
https://github.com/ethereum/EIPs/blob/master/EIPS/eip-197.md#encoding


```solidity
function generatorG2() internal pure returns (G2Point memory);
```

### negGeneratorG2


```solidity
function negGeneratorG2() internal pure returns (G2Point memory);
```

### negate


```solidity
function negate(G1Point memory p) internal pure returns (G1Point memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`p`|`G1Point`|Some point in G1.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`G1Point`|The negation of `p`, i.e. p.plus(p.negate()) should be zero.|


### plus


```solidity
function plus(G1Point memory p1, G1Point memory p2) internal view returns (G1Point memory r);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`r`|`G1Point`|the sum of two points of G1|


### scalar_mul_tiny

an optimized ecMul implementation that takes O(log_2(s)) ecAdds

this function is only safe to use if the scalar is 9 bits or less


```solidity
function scalar_mul_tiny(BN254.G1Point memory p, uint16 s) internal view returns (BN254.G1Point memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`p`|`BN254.G1Point`|the point to multiply|
|`s`|`uint16`|the scalar to multiply by|


### scalar_mul


```solidity
function scalar_mul(G1Point memory p, uint256 s) internal view returns (G1Point memory r);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`r`|`G1Point`|the product of a point on G1 and a scalar, i.e. p == p.scalar_mul(1) and p.plus(p) == p.scalar_mul(2) for all points p.|


### pairing


```solidity
function pairing(G1Point memory a1, G2Point memory a2, G1Point memory b1, G2Point memory b2)
    internal
    view
    returns (bool);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The result of computing the pairing check e(p1[0], p2[0]) *  .... * e(p1[n], p2[n]) == 1 For example, pairing([P1(), P1().negate()], [P2(), P2()]) should return true.|


### safePairing

This function is functionally the same as pairing(), however it specifies a gas limit
the user can set, as a precompile may use the entire gas budget if it reverts.


```solidity
function safePairing(
    G1Point memory a1,
    G2Point memory a2,
    G1Point memory b1,
    G2Point memory b2,
    uint256 pairingGas
) internal view returns (bool, bool);
```

### hashG1Point

used for BLS signatures


```solidity
function hashG1Point(BN254.G1Point memory pk) internal pure returns (bytes32 hashedG1);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`hashedG1`|`bytes32`|the keccak256 hash of the G1 Point|


### hashG2Point

used for BLS signatures


```solidity
function hashG2Point(BN254.G2Point memory pk) internal pure returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|the keccak256 hash of the G2 Point|


### hashToG1

adapted from https://github.com/HarryR/solcrypto/blob/master/altbn128.sol


```solidity
function hashToG1(bytes32 _x) internal view returns (G1Point memory);
```

### findYFromX

Given X, find Y
where y = sqrt(x^3 + b)
Returns: (x^3 + b), y


```solidity
function findYFromX(uint256 x) internal view returns (uint256, uint256);
```

### expMod


```solidity
function expMod(uint256 _base, uint256 _exponent, uint256 _modulus) internal view returns (uint256 retval);
```

## Structs
### G1Point

```solidity
struct G1Point {
    uint256 X;
    uint256 Y;
}
```

### G2Point

```solidity
struct G2Point {
    uint256[2] X;
    uint256[2] Y;
}
```

