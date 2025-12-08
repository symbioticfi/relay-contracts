# Checkpoints
[Git Source](https://github.com/symbioticfi/relay-contracts/blob/378b3fa543dbcf48fbf7694e797030129cda42ef/src/libraries/structs/Checkpoints.sol)

**Title:**
Checkpoints

Library implementing a checkpointing mechanism for values as they change at different points in time.

This library defines the `Trace*` struct, for checkpointing values as they change at different points in
time, and later looking up past values by key.


## Functions
### push

Pushes a (`key`, `value`) pair into a Trace208 so that it is stored as the checkpoint.
Returns previous value and new value.


```solidity
function push(Trace208 storage self, uint48 key, uint208 value) internal returns (uint208, uint208);
```

### upperLookupRecent

Returns the value in the last (most recent) checkpoint with a key lower or equal than the search key, or zero
if there is none.


```solidity
function upperLookupRecent(Trace208 storage self, uint48 key) internal view returns (uint208);
```

### upperLookupRecent

Returns the value in the last (most recent) checkpoint with a key lower or equal than the search key, or zero
if there is none.
NOTE: This is a variant of [upperLookupRecent](/src/libraries/structs/Checkpoints.sol/library.Checkpoints.md#upperlookuprecent) that can be optimized by getting the hint
(index of the checkpoint with a key lower or equal than the search key).


```solidity
function upperLookupRecent(Trace208 storage self, uint48 key, bytes memory hint_) internal view returns (uint208);
```

### upperLookupRecentCheckpoint

Returns whether there is a checkpoint with a key lower or equal than the search key in the structure (i.e. it is not empty),
and if so the key and value in the checkpoint, and its position in the trace.


```solidity
function upperLookupRecentCheckpoint(Trace208 storage self, uint48 key)
    internal
    view
    returns (bool, uint48, uint208, uint32);
```

### upperLookupRecentCheckpoint

Returns whether there is a checkpoint with a key lower or equal than the search key in the structure (i.e. it is not empty),
and if so the key and value in the checkpoint, and its position in the trace.
NOTE: This is a variant of [upperLookupRecentCheckpoint](/src/libraries/structs/Checkpoints.sol/library.Checkpoints.md#upperlookuprecentcheckpoint) that can be optimized by getting the hint
(index of the checkpoint with a key lower or equal than the search key).


```solidity
function upperLookupRecentCheckpoint(Trace208 storage self, uint48 key, bytes memory hint_)
    internal
    view
    returns (bool, uint48, uint208, uint32);
```

### latest

Returns the value in the most recent checkpoint, or zero if there are no checkpoints.


```solidity
function latest(Trace208 storage self) internal view returns (uint208);
```

### latestCheckpoint

Returns whether there is a checkpoint in the structure (i.e. it is not empty), and if so the key and value
in the most recent checkpoint.


```solidity
function latestCheckpoint(Trace208 storage self) internal view returns (bool, uint48, uint208);
```

### length

Returns a total number of checkpoints.


```solidity
function length(Trace208 storage self) internal view returns (uint256);
```

### at

Returns checkpoint at a given position.


```solidity
function at(Trace208 storage self, uint32 pos) internal view returns (Checkpoint208 memory);
```

### pop

Pops the last (most recent) checkpoint.


```solidity
function pop(Trace208 storage self) internal returns (uint208 value);
```

### push

Pushes a (`key`, `value`) pair into a Trace256 so that it is stored as the checkpoint.
Returns previous value and new value.


```solidity
function push(Trace256 storage self, uint48 key, uint256 value) internal returns (uint256, uint256);
```

### upperLookupRecent

Returns the value in the last (most recent) checkpoint with a key lower or equal than the search key, or zero
if there is none.


```solidity
function upperLookupRecent(Trace256 storage self, uint48 key) internal view returns (uint256);
```

### upperLookupRecent

Returns the value in the last (most recent) checkpoint with a key lower or equal than the search key, or zero
if there is none.
NOTE: This is a variant of [upperLookupRecent](/src/libraries/structs/Checkpoints.sol/library.Checkpoints.md#upperlookuprecent) that can be optimized by getting the hint
(index of the checkpoint with a key lower or equal than the search key).


```solidity
function upperLookupRecent(Trace256 storage self, uint48 key, bytes memory hint_) internal view returns (uint256);
```

### upperLookupRecentCheckpoint

Returns whether there is a checkpoint with a key lower or equal than the search key in the structure (i.e. it is not empty),
and if so the key and value in the checkpoint, and its position in the trace.


```solidity
function upperLookupRecentCheckpoint(Trace256 storage self, uint48 key)
    internal
    view
    returns (bool, uint48, uint256, uint32);
```

### upperLookupRecentCheckpoint

Returns whether there is a checkpoint with a key lower or equal than the search key in the structure (i.e. it is not empty),
and if so the key and value in the checkpoint, and its position in the trace.
NOTE: This is a variant of [upperLookupRecentCheckpoint](/src/libraries/structs/Checkpoints.sol/library.Checkpoints.md#upperlookuprecentcheckpoint) that can be optimized by getting the hint
(index of the checkpoint with a key lower or equal than the search key).


```solidity
function upperLookupRecentCheckpoint(Trace256 storage self, uint48 key, bytes memory hint_)
    internal
    view
    returns (bool, uint48, uint256, uint32);
```

### latest

Returns the value in the most recent checkpoint, or zero if there are no checkpoints.


```solidity
function latest(Trace256 storage self) internal view returns (uint256);
```

### latestCheckpoint

Returns whether there is a checkpoint in the structure (i.e. it is not empty), and if so the key and value
in the most recent checkpoint.


```solidity
function latestCheckpoint(Trace256 storage self) internal view returns (bool exists, uint48 _key, uint256 _value);
```

### length

Returns a total number of checkpoints.


```solidity
function length(Trace256 storage self) internal view returns (uint256);
```

### at

Returns checkpoint at a given position.


```solidity
function at(Trace256 storage self, uint32 pos) internal view returns (Checkpoint256 memory);
```

### pop

Pops the last (most recent) checkpoint.


```solidity
function pop(Trace256 storage self) internal returns (uint256 value);
```

### push

Pushes a (`key`, `value`) pair into a Trace256 so that it is stored as the checkpoint.
Returns previous value and new value.


```solidity
function push(Trace512 storage self, uint48 key, uint256[2] memory value)
    internal
    returns (uint256[2] memory, uint256[2] memory);
```

### upperLookupRecent

Returns the value in the last (most recent) checkpoint with a key lower or equal than the search key, or zero
if there is none.


```solidity
function upperLookupRecent(Trace512 storage self, uint48 key) internal view returns (uint256[2] memory);
```

### upperLookupRecent

Returns the value in the last (most recent) checkpoint with a key lower or equal than the search key, or zero
if there is none.
NOTE: This is a variant of [upperLookupRecent](/src/libraries/structs/Checkpoints.sol/library.Checkpoints.md#upperlookuprecent) that can be optimized by getting the hint
(index of the checkpoint with a key lower or equal than the search key).


```solidity
function upperLookupRecent(Trace512 storage self, uint48 key, bytes memory hint_)
    internal
    view
    returns (uint256[2] memory);
```

### upperLookupRecentCheckpoint

Returns whether there is a checkpoint with a key lower or equal than the search key in the structure (i.e. it is not empty),
and if so the key and value in the checkpoint, and its position in the trace.


```solidity
function upperLookupRecentCheckpoint(Trace512 storage self, uint48 key)
    internal
    view
    returns (bool, uint48, uint256[2] memory, uint32);
```

### upperLookupRecentCheckpoint

Returns whether there is a checkpoint with a key lower or equal than the search key in the structure (i.e. it is not empty),
and if so the key and value in the checkpoint, and its position in the trace.
NOTE: This is a variant of [upperLookupRecentCheckpoint](/src/libraries/structs/Checkpoints.sol/library.Checkpoints.md#upperlookuprecentcheckpoint) that can be optimized by getting the hint
(index of the checkpoint with a key lower or equal than the search key).


```solidity
function upperLookupRecentCheckpoint(Trace512 storage self, uint48 key, bytes memory hint_)
    internal
    view
    returns (bool, uint48, uint256[2] memory, uint32);
```

### latest

Returns the value in the most recent checkpoint, or zero if there are no checkpoints.


```solidity
function latest(Trace512 storage self) internal view returns (uint256[2] memory);
```

### latestCheckpoint

Returns whether there is a checkpoint in the structure (i.e. it is not empty), and if so the key and value
in the most recent checkpoint.


```solidity
function latestCheckpoint(Trace512 storage self)
    internal
    view
    returns (bool exists, uint48 _key, uint256[2] memory _value);
```

### length

Returns a total number of checkpoints.


```solidity
function length(Trace512 storage self) internal view returns (uint256);
```

### at

Returns checkpoint at a given position.


```solidity
function at(Trace512 storage self, uint32 pos) internal view returns (Checkpoint512 memory);
```

### pop

Pops the last (most recent) checkpoint.


```solidity
function pop(Trace512 storage self) internal returns (uint256[2] memory value);
```

### _upperBinaryLookup

Return the index of the last (most recent) checkpoint with a key lower or equal than the search key, or `high`
if there is none. `low` and `high` define a section where to do the search, with inclusive `low` and exclusive
`high`.
WARNING: `high` should not be greater than the array's length.


```solidity
function _upperBinaryLookup(OZCheckpoints.Checkpoint208[] storage self, uint48 key, uint256 low, uint256 high)
    private
    view
    returns (uint256);
```

### _unsafeAccess

Access an element of the array without performing a bounds check. The position is assumed to be within bounds.


```solidity
function _unsafeAccess(OZCheckpoints.Checkpoint208[] storage self, uint256 pos)
    private
    pure
    returns (OZCheckpoints.Checkpoint208 storage result);
```

## Errors
### SystemCheckpoint

```solidity
error SystemCheckpoint();
```

## Structs
### Trace208

```solidity
struct Trace208 {
    OZCheckpoints.Trace208 _trace;
}
```

### Checkpoint208

```solidity
struct Checkpoint208 {
    uint48 _key;
    uint208 _value;
}
```

### Trace256

```solidity
struct Trace256 {
    OZCheckpoints.Trace208 _trace;
    mapping(uint208 pointer => uint256 value) _values;
}
```

### Trace512

```solidity
struct Trace512 {
    OZCheckpoints.Trace208 _trace;
    mapping(uint208 pointer => uint256[2] value) _values;
}
```

### Checkpoint256

```solidity
struct Checkpoint256 {
    uint48 _key;
    uint256 _value;
}
```

### Checkpoint512

```solidity
struct Checkpoint512 {
    uint48 _key;
    uint256[2] _value;
}
```

