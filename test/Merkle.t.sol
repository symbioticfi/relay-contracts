// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";
import "./helpers/SimpleMerkle.sol";
import "./helpers/FullMerkle.sol";

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
        simpleMerkle.insert(node);
        fullMerkle.insert(node);

        bytes32[16] memory proof = fullMerkle.getProof(0);
        assertTrue(simpleMerkle.verify(node, proof, 0));
        assertTrue(fullMerkle.verify(node, proof, 0));
        assertEq(simpleMerkle.count(), fullMerkle.currentLeafIndex());
        assertEq(simpleMerkle.root(), fullMerkle.root());
    }

    function testFuzzUpdate(bytes32 oldNode, bytes32 newNode) public {
        simpleMerkle.insert(oldNode);
        fullMerkle.insert(oldNode);

        bytes32[16] memory proof = fullMerkle.getProof(0);

        simpleMerkle.update(newNode, oldNode, proof, 0);
        fullMerkle.update(newNode, 0);

        // Verify new node
        proof = fullMerkle.getProof(0);
        assertTrue(simpleMerkle.verify(newNode, proof, 0));
        assertTrue(fullMerkle.verify(newNode, proof, 0));
        assertEq(simpleMerkle.root(), fullMerkle.root());
    }
}
