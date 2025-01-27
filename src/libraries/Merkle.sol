// SPDX-License-Identifier: MIT
// Original code: https://github.com/hyperlane-xyz/hyperlane-monorepo/blob/main/solidity/contracts/libs/Merkle.sol

pragma solidity ^0.8.25;

// work based on eth2 deposit contract, which is used under CC0-1.0

uint256 constant TREE_DEPTH = 16;
uint256 constant MAX_LEAVES = 2 ** TREE_DEPTH - 1;

/**
 * @title MerkleLib
 * @author Celo Labs Inc.
 * @notice An incremental merkle tree modeled on the eth2 deposit contract.
 *
 */
library MerkleLib {
    using MerkleLib for Tree;

    event UpdateLeaf(uint256 index, bytes32 node);
    event PopLeaf();

    error InvalidProof();
    error FullMerkleTree();
    error InvalidIndex();
    error SameNodeUpdate();
    error EmptyTree();

    /**
     * @notice Struct representing incremental merkle tree. Contains current
     * branch and the number of inserted leaves in the tree.
     *
     */
    struct Tree {
        bytes32[TREE_DEPTH] branch;
        bytes32[] leaves;
    }

    /**
     * @notice Inserts `_node` into merkle tree
     * @dev Reverts if tree is full
     * @param _node Element to insert into tree
     *
     */
    function insert(Tree storage _tree, bytes32 _node) internal {
        uint256 _size = _tree.leaves.length;

        if (_size >= MAX_LEAVES) {
            revert FullMerkleTree();
        }

        emit UpdateLeaf(_size, _node);
        _tree.leaves.push(_node);

        for (uint256 i = 0; i < TREE_DEPTH; i++) {
            if ((_size & 1) == 0) {
                _tree.branch[i] = _node;
                return;
            }
            _node = keccak256(abi.encodePacked(_tree.branch[i], _node));
            _size >>= 1;
        }
        // As the loop should always end prematurely with the `return` statement,
        // this code should be unreachable. We assert `false` just to be safe.
        assert(false);
    }

    function update(
        Tree storage _tree,
        bytes32 _node,
        bytes32 _oldNode, // we could read from storage, but we already have to check the old node proof validity
        bytes32[TREE_DEPTH] memory _branch,
        uint256 _index,
        bool isRemove
    ) internal {
        if (_node == _oldNode) {
            revert SameNodeUpdate();
        }

        bytes32 _root = branchRoot(_oldNode, _branch, _index);
        if (_root != _tree.root()) {
            // should be cheap enough, if it's not filled fully, mb optimize by checking root externally
            revert InvalidProof();
        }

        uint256 size = _tree.leaves.length;
        if (_index >= size) {
            revert InvalidIndex();
        }

        if (isRemove) {
            size--;
        }

        _tree.leaves[_index] = _node;
        emit UpdateLeaf(_index, _node);

        for (uint256 i = 0; i < TREE_DEPTH; i++) {
            if ((size / 2 * 2) == _index) {
                _tree.branch[i] = _node;
                return;
            }
            if ((_index & 1) == 1) {
                _node = keccak256(abi.encodePacked(_branch[i], _node));
            } else {
                _node = keccak256(abi.encodePacked(_node, _branch[i]));
            }
            size >>= 1;
            _index >>= 1;
        }

        assert(false);
    }

    function pop(
        Tree storage _tree
    ) internal {
        _tree.leaves.pop();
        uint256 size = _tree.leaves.length;
        bytes32 _node = bytes32(0);
        emit PopLeaf();

        for (uint256 i = 0; i < TREE_DEPTH; i++) {
            if ((size & 1) == 0) {
                _tree.branch[i] = _node;
                return;
            }
            _node = keccak256(abi.encodePacked(_tree.branch[i], _node));
            size >>= 1;
        }

        assert(false);
    }

    function remove(Tree storage _tree, bytes32 _node, bytes32[TREE_DEPTH] memory _branch, uint256 _index) internal {
        if (_index != _tree.leaves.length - 1) {
            update(_tree, _tree.leaves[_tree.leaves.length - 1], _node, _branch, _index, true);
        }
        pop(_tree);
    }

    /**
     * @notice Calculates and returns`_tree`'s current root
     * @return _current Calculated root of `_tree`
     *
     */
    function root(
        Tree storage _tree
    ) internal view returns (bytes32 _current) {
        bytes32[TREE_DEPTH] memory _zeroes = zeroHashes();
        uint256 _size = _tree.leaves.length;

        for (uint256 i = 0; i < TREE_DEPTH; i++) {
            uint256 _ithBit = (_size >> i) & 0x01;
            bytes32 _next = _tree.branch[i];
            if (_ithBit == 1) {
                _current = keccak256(abi.encodePacked(_next, _current));
            } else {
                _current = keccak256(abi.encodePacked(_current, _zeroes[i]));
            }
        }
    }

    /// @notice Returns array of TREE_DEPTH zero hashes
    /// @return _zeroes Array of TREE_DEPTH zero hashes
    function zeroHashes() internal pure returns (bytes32[TREE_DEPTH] memory _zeroes) {
        _zeroes[0] = Z_0;
        _zeroes[1] = Z_1;
        _zeroes[2] = Z_2;
        _zeroes[3] = Z_3;
        _zeroes[4] = Z_4;
        _zeroes[5] = Z_5;
        _zeroes[6] = Z_6;
        _zeroes[7] = Z_7;
        _zeroes[8] = Z_8;
        _zeroes[9] = Z_9;
        _zeroes[10] = Z_10;
        _zeroes[11] = Z_11;
        _zeroes[12] = Z_12;
        _zeroes[13] = Z_13;
        _zeroes[14] = Z_14;
        _zeroes[15] = Z_15;
    }

    /**
     * @notice Calculates and returns the merkle root for the given leaf
     * `_item`, a merkle branch, and the index of `_item` in the tree.
     * @param _item Merkle leaf
     * @param _branch Merkle proof
     * @param _index Index of `_item` in tree
     * @return _current Calculated merkle root
     *
     */
    function branchRoot(
        bytes32 _item,
        bytes32[TREE_DEPTH] memory _branch, // cheaper than calldata indexing
        uint256 _index
    ) internal pure returns (bytes32 _current) {
        _current = _item;

        for (uint256 i = 0; i < TREE_DEPTH; i++) {
            uint256 _ithBit = (_index >> i) & 0x01;
            // cheaper than calldata indexing _branch[i*32:(i+1)*32];
            bytes32 _next = _branch[i];
            if (_ithBit == 1) {
                _current = keccak256(abi.encodePacked(_next, _current));
            } else {
                _current = keccak256(abi.encodePacked(_current, _next));
            }
        }
    }

    function treeRoot(
        bytes32[] memory _leaves
    ) internal view returns (bytes32) {
        uint256 _size = _leaves.length;
        bytes32[TREE_DEPTH] memory _zeroes = zeroHashes();

        for (uint256 depth = 0; depth < TREE_DEPTH; depth++) {
            for (uint256 i = 0; i < _size - 1; i += 2) {
                _leaves[i / 2] = keccak256(abi.encodePacked(_leaves[i], _leaves[i + 1]));
            }

            if (_size % 2 == 1) {
                _leaves[(_size - 1) / 2] = keccak256(abi.encodePacked(_leaves[_size - 1], _zeroes[depth]));
            }

            _size = (_size + 1) / 2;
        }

        return _leaves[0];
    }

    // keccak256 zero hashes
    bytes32 internal constant Z_0 = hex"0000000000000000000000000000000000000000000000000000000000000000";
    bytes32 internal constant Z_1 = hex"ad3228b676f7d3cd4284a5443f17f1962b36e491b30a40b2405849e597ba5fb5";
    bytes32 internal constant Z_2 = hex"b4c11951957c6f8f642c4af61cd6b24640fec6dc7fc607ee8206a99e92410d30";
    bytes32 internal constant Z_3 = hex"21ddb9a356815c3fac1026b6dec5df3124afbadb485c9ba5a3e3398a04b7ba85";
    bytes32 internal constant Z_4 = hex"e58769b32a1beaf1ea27375a44095a0d1fb664ce2dd358e7fcbfb78c26a19344";
    bytes32 internal constant Z_5 = hex"0eb01ebfc9ed27500cd4dfc979272d1f0913cc9f66540d7e8005811109e1cf2d";
    bytes32 internal constant Z_6 = hex"887c22bd8750d34016ac3c66b5ff102dacdd73f6b014e710b51e8022af9a1968";
    bytes32 internal constant Z_7 = hex"ffd70157e48063fc33c97a050f7f640233bf646cc98d9524c6b92bcf3ab56f83";
    bytes32 internal constant Z_8 = hex"9867cc5f7f196b93bae1e27e6320742445d290f2263827498b54fec539f756af";
    bytes32 internal constant Z_9 = hex"cefad4e508c098b9a7e1d8feb19955fb02ba9675585078710969d3440f5054e0";
    bytes32 internal constant Z_10 = hex"f9dc3e7fe016e050eff260334f18a5d4fe391d82092319f5964f2e2eb7c1c3a5";
    bytes32 internal constant Z_11 = hex"f8b13a49e282f609c317a833fb8d976d11517c571d1221a265d25af778ecf892";
    bytes32 internal constant Z_12 = hex"3490c6ceeb450aecdc82e28293031d10c7d73bf85e57bf041a97360aa2c5d99c";
    bytes32 internal constant Z_13 = hex"c1df82d9c4b87413eae2ef048f94b4d3554cea73d92b0f7af96e0271c691e2bb";
    bytes32 internal constant Z_14 = hex"5c67add7c6caf302256adedf7ab114da0acfe870d449a3a489f781d659e8becc";
    bytes32 internal constant Z_15 = hex"da7bce9f4e8618b6bd2f4132ce798cdc7a60e7e1460a7299e3c6342a579626d2";
}
