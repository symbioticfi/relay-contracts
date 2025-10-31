# AggregatorV3Interface
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/90b476bb8f01dc59dc602dcd0b4e541b7aed48d5/src/interfaces/modules/voting-power/common/voting-power-calc/libraries/AggregatorV3Interface.sol)


## Functions
### decimals


```solidity
function decimals() external view returns (uint8);
```

### description


```solidity
function description() external view returns (string memory);
```

### version


```solidity
function version() external view returns (uint256);
```

### getRoundData


```solidity
function getRoundData(uint80 _roundId)
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
```

### latestRoundData


```solidity
function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
```

