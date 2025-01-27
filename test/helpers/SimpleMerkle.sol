// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../../src/libraries/Merkle.sol";

contract SimpleMerkle {
    using MerkleLib for MerkleLib.Tree;

    MerkleLib.Tree private tree;

    function insert(
        bytes32 _node
    ) external {
        tree.insert(_node);
    }

    function update(bytes32 _node, bytes32 _oldNode, bytes32[TREE_DEPTH] memory _proof, uint256 _index) external {
        tree.update(_node, _oldNode, _proof, _index, false);
    }

    function verify(bytes32 _node, bytes32[TREE_DEPTH] memory _proof, uint256 _index) external view returns (bool) {
        return tree.root() == MerkleLib.branchRoot(_node, _proof, _index);
    }

    function pop() external {
        tree.pop();
    }

    function remove(bytes32 _node, bytes32[TREE_DEPTH] memory _proof, uint256 _index) external {
        tree.remove(_node, _proof, _index);
    }

    function root() external view returns (bytes32) {
        return tree.root();
    }

    function count() external view returns (uint256) {
        return tree.leaves.length;
    }
}
