// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";
import "./helpers/SimpleMerkle.sol";
import "./helpers/FullMerkle.sol";
import "../src/libraries/Merkle.sol";

contract MerkleTest is Test {
    SimpleMerkle internal simpleMerkle;
    FullMerkle internal fullMerkle;

    function setUp() public {
        simpleMerkle = new SimpleMerkle();
        fullMerkle = new FullMerkle();
    }

    function testInsert() public {
        bytes32 node = keccak256("test");

        simpleMerkle.insert(node);
        fullMerkle.insert(node);

        bytes32[16] memory proof = fullMerkle.getProof(0);
        console.log("1");
        assertTrue(simpleMerkle.verify(node, proof, 0));
        console.log("2");
        assertTrue(fullMerkle.verify(node, proof, 0));
        console.log("3");
        assertEq(simpleMerkle.count(), fullMerkle.currentLeafIndex());
        console.log("4");
        assertEq(simpleMerkle.count(), 1);
        assertEq(simpleMerkle.root(), fullMerkle.root());
    }

    function testMultipleInserts() public {
        bytes32[] memory nodes = new bytes32[](3);
        nodes[0] = keccak256("test1");
        nodes[1] = keccak256("test2");
        nodes[2] = keccak256("test3");

        for (uint256 i = 0; i < nodes.length; i++) {
            simpleMerkle.insert(nodes[i]);
            fullMerkle.insert(nodes[i]);

            bytes32[16] memory proof = fullMerkle.getProof(i);
            assertTrue(simpleMerkle.verify(nodes[i], proof, i));
            assertTrue(fullMerkle.verify(nodes[i], proof, i));
            assertEq(simpleMerkle.count(), fullMerkle.currentLeafIndex());
            assertEq(simpleMerkle.count(), i + 1);
            assertEq(simpleMerkle.root(), fullMerkle.root());
        }
    }

    function testVerify() public {
        bytes32 node = keccak256("test");

        simpleMerkle.insert(node);
        fullMerkle.insert(node);

        bytes32[16] memory proof = fullMerkle.getProof(0);

        assertTrue(simpleMerkle.verify(node, proof, 0));
        assertTrue(fullMerkle.verify(node, proof, 0));
        assertEq(simpleMerkle.root(), fullMerkle.root());
    }

    function testUpdate() public {
        bytes32 oldNode = keccak256("test");
        bytes32 newNode = keccak256("updated");

        simpleMerkle.insert(oldNode);
        fullMerkle.insert(oldNode);

        bytes32[16] memory proof = fullMerkle.getProof(0);

        simpleMerkle.update(newNode, oldNode, proof, 0);
        fullMerkle.update(newNode, 0);

        assertEq(simpleMerkle.root(), fullMerkle.root());

        // Verify new node
        proof = fullMerkle.getProof(0);
        assertTrue(simpleMerkle.verify(newNode, proof, 0));
        assertTrue(fullMerkle.verify(newNode, proof, 0));
    }

    function testFuzzInsert(
        bytes32 node
    ) public {
        vm.assume(node != bytes32(0));

        simpleMerkle.insert(node);
        fullMerkle.insert(node);

        bytes32[16] memory proof = fullMerkle.getProof(0);
        assertTrue(simpleMerkle.verify(node, proof, 0));
        assertTrue(fullMerkle.verify(node, proof, 0));
        assertEq(simpleMerkle.count(), fullMerkle.currentLeafIndex());
        assertEq(simpleMerkle.root(), fullMerkle.root());
    }

    function testFuzzUpdate(bytes32[8] memory _nodes, uint256 _index, bytes32 newNode) public {
        vm.assume(_index < _nodes.length);
        vm.assume(_nodes[_index] != bytes32(0));
        vm.assume(newNode != _nodes[_index]);

        for (uint256 i = 0; i < _nodes.length; i++) {
            simpleMerkle.insert(_nodes[i]);
            fullMerkle.insert(_nodes[i]);
        }

        bytes32[16] memory proof = fullMerkle.getProof(_index);

        fullMerkle.update(newNode, _index);
        simpleMerkle.update(newNode, _nodes[_index], proof, _index);

        // Verify new node
        // proof = fullMerkle.getProof(_index);
        assertTrue(fullMerkle.verify(newNode, proof, _index));
        assertTrue(simpleMerkle.verify(newNode, proof, _index));
        assertEq(simpleMerkle.root(), fullMerkle.root());
    }

    function testFuzzRemove(bytes32[8] memory _nodes, uint256 _index) public {
        vm.assume(_index < _nodes.length);
        for (uint256 i = 0; i < _nodes.length; i++) {
            vm.assume(_nodes[i] != bytes32(0));
        }

        for (uint256 i = 0; i < _nodes.length; i++) {
            simpleMerkle.insert(_nodes[i]);
            fullMerkle.insert(_nodes[i]);
            assertEq(simpleMerkle.root(), fullMerkle.root());
        }

        bytes32[16] memory proof = fullMerkle.getProof(_index);
        simpleMerkle.remove(_nodes[_index], proof, _index);
        fullMerkle.remove(_index);
        assertEq(simpleMerkle.root(), fullMerkle.root());

        _nodes[_index] = _nodes[_nodes.length - 1];

        for (uint256 i = 0; i < _nodes.length - 1; i++) {
            proof = fullMerkle.getProof(i);
            assertTrue(fullMerkle.verify(_nodes[i], proof, i));
            assertTrue(simpleMerkle.verify(_nodes[i], proof, i));
        }
    }

    function testTreeRoot(
        bytes32[8] memory _leaves
    ) public {
        for (uint256 i = 0; i < _leaves.length; i++) {
            vm.assume(_leaves[i] != bytes32(0));
        }

        for (uint256 i = 0; i < _leaves.length; i++) {
            simpleMerkle.insert(_leaves[i]);
        }

        bytes32[] memory leaves = new bytes32[](_leaves.length);
        for (uint256 i = 0; i < _leaves.length; i++) {
            leaves[i] = _leaves[i];
        }

        assertEq(MerkleLib.treeRoot(leaves), simpleMerkle.root());
    }
}
