// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library MultiProofBuilder {
    function _hashPair(bytes32 a, bytes32 b) private pure returns (bytes32) {
        return a < b ? keccak256(abi.encodePacked(a, b)) : keccak256(abi.encodePacked(b, a));
    }

    function buildProof(
        bytes32[] memory leaves,
        uint256[] memory indices
    )
        internal
        pure
        returns (bytes32 root, bytes32[] memory leavesToProve, bytes32[] memory proof, bool[] memory flags)
    {
        uint256 n = leaves.length;
        require(n > 0 && n & (n - 1) == 0, "length !pow2");

        bool[] memory needed = new bool[](n);
        for (uint256 i; i < indices.length; ++i) {
            uint256 idx = indices[i];
            require(i == 0 || idx > indices[i - 1], "indices not sorted");
            require(idx < n, "index oob");
            needed[idx] = true;
        }

        bytes32[] memory curr = leaves;
        bool[] memory currNeed = needed;

        proof = new bytes32[](n - 1);
        flags = new bool[](n - 1);
        uint256 pProof;
        uint256 pFlags;

        while (n > 1) {
            n >>= 1;
            bytes32[] memory next = new bytes32[](n);
            bool[] memory nextNeed = new bool[](n);

            for (uint256 i; i < n; ++i) {
                bytes32 left = curr[2 * i];
                bytes32 right = curr[2 * i + 1];

                bool needL = currNeed[2 * i];
                bool needR = currNeed[2 * i + 1];

                next[i] = _hashPair(left, right);
                nextNeed[i] = needL || needR;

                if (!nextNeed[i]) continue;

                if (needL && needR) {
                    flags[pFlags++] = true;
                } else {
                    flags[pFlags++] = false;
                    proof[pProof++] = needL ? right : left;
                }
            }
            curr = next;
            currNeed = nextNeed;
        }

        root = curr[0];

        assembly {
            mstore(flags, pFlags)
            mstore(proof, pProof)
        }

        leavesToProve = new bytes32[](indices.length);
        for (uint256 i; i < indices.length; ++i) {
            leavesToProve[i] = leaves[indices[i]];
        }
    }
}
