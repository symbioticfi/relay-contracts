// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract FullMerkle {
    uint256 public constant DEPTH = 16;
    bytes32[DEPTH] public zeroValues;
    mapping(uint256 => mapping(uint256 => bytes32)) public nodes;
    uint256 public currentLeafIndex;

    constructor() {
        zeroValues[0] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        zeroValues[1] = 0xad3228b676f7d3cd4284a5443f17f1962b36e491b30a40b2405849e597ba5fb5;
        zeroValues[2] = 0xb4c11951957c6f8f642c4af61cd6b24640fec6dc7fc607ee8206a99e92410d30;
        zeroValues[3] = 0x21ddb9a356815c3fac1026b6dec5df3124afbadb485c9ba5a3e3398a04b7ba85;
        zeroValues[4] = 0xe58769b32a1beaf1ea27375a44095a0d1fb664ce2dd358e7fcbfb78c26a19344;
        zeroValues[5] = 0x0eb01ebfc9ed27500cd4dfc979272d1f0913cc9f66540d7e8005811109e1cf2d;
        zeroValues[6] = 0x887c22bd8750d34016ac3c66b5ff102dacdd73f6b014e710b51e8022af9a1968;
        zeroValues[7] = 0xffd70157e48063fc33c97a050f7f640233bf646cc98d9524c6b92bcf3ab56f83;
        zeroValues[8] = 0x9867cc5f7f196b93bae1e27e6320742445d290f2263827498b54fec539f756af;
        zeroValues[9] = 0xcefad4e508c098b9a7e1d8feb19955fb02ba9675585078710969d3440f5054e0;
        zeroValues[10] = 0xf9dc3e7fe016e050eff260334f18a5d4fe391d82092319f5964f2e2eb7c1c3a5;
        zeroValues[11] = 0xf8b13a49e282f609c317a833fb8d976d11517c571d1221a265d25af778ecf892;
        zeroValues[12] = 0x3490c6ceeb450aecdc82e28293031d10c7d73bf85e57bf041a97360aa2c5d99c;
        zeroValues[13] = 0xc1df82d9c4b87413eae2ef048f94b4d3554cea73d92b0f7af96e0271c691e2bb;
        zeroValues[14] = 0x5c67add7c6caf302256adedf7ab114da0acfe870d449a3a489f781d659e8becc;
        zeroValues[15] = 0xda7bce9f4e8618b6bd2f4132ce798cdc7a60e7e1460a7299e3c6342a579626d2;
    }

    function insert(
        bytes32 _node
    ) public {
        require(currentLeafIndex < 2 ** DEPTH, "Tree is full");

        uint256 leafPos = currentLeafIndex;
        nodes[0][leafPos] = _node;

        _updatePath(leafPos);
        currentLeafIndex++;
    }

    function update(bytes32 _node, uint256 _index) public {
        require(_index < currentLeafIndex, "Leaf index out of bounds");

        nodes[0][_index] = _node;

        _updatePath(_index);
    }

    function pop() public {
        require(currentLeafIndex > 0, "Tree is empty");

        update(bytes32(0), currentLeafIndex - 1);
        currentLeafIndex--;
    }

    function remove(
        uint256 _index
    ) public {
        require(_index < currentLeafIndex, "Leaf index out of bounds");

        update(nodes[0][currentLeafIndex - 1], _index);
        pop();
    }

    function root() public view returns (bytes32) {
        return nodes[DEPTH][0];
    }

    function getProof(
        uint256 _index
    ) public view returns (bytes32[16] memory proof) {
        require(_index < currentLeafIndex, "Leaf index out of bounds");
        uint256 currentIndex = _index;

        for (uint256 i = 0; i < DEPTH; i++) {
            uint256 siblingIndex;
            if (currentIndex % 2 == 0) {
                siblingIndex = currentIndex + 1;
            } else {
                siblingIndex = currentIndex - 1;
            }

            bytes32 sibling = nodes[i][siblingIndex];
            if (sibling == bytes32(0)) {
                sibling = zeroValues[i];
            }
            proof[i] = sibling;

            currentIndex = currentIndex / 2;
        }

        return proof;
    }

    function verify(bytes32 _node, bytes32[16] calldata _proof, uint256 _index) public view returns (bool) {
        bytes32 computedHash = _node;
        uint256 currentIndex = _index;

        for (uint256 i = 0; i < DEPTH; i++) {
            bytes32 sibling = _proof[i];
            if (currentIndex % 2 == 0) {
                computedHash = keccak256(abi.encodePacked(computedHash, sibling));
            } else {
                computedHash = keccak256(abi.encodePacked(sibling, computedHash));
            }
            currentIndex = currentIndex / 2;
        }

        return computedHash == nodes[DEPTH][0];
    }

    function _updatePath(
        uint256 currentPos
    ) private {
        for (uint256 depth = 0; depth < DEPTH; depth++) {
            uint256 leftPos = (currentPos / 2) * 2;
            uint256 rightPos = leftPos + 1;

            bytes32 left = nodes[depth][leftPos];
            bytes32 right = nodes[depth][rightPos];
            if (left == bytes32(0)) left = zeroValues[depth];
            if (right == bytes32(0)) right = zeroValues[depth];

            bytes32 parent = keccak256(abi.encodePacked(left, right));
            nodes[depth + 1][currentPos / 2] = parent;
            currentPos = currentPos / 2;
        }
    }
}
