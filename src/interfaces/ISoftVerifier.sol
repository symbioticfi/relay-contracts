// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ValSetManager} from "../contracts/ValSetManager.sol";

interface ISoftVerifier {
    function verifyQuorumSig(
        bytes32 valSetHeader,
        bytes32 digest,
        uint8 keyTag,
        uint104 quorumThreshold,
        ValSetManager.Proof calldata proof
    ) external view returns (bool);
}
