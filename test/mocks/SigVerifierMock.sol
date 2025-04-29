// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ISigVerifier} from "../../src/interfaces/other/ISigVerifier.sol";

contract SigVerifierMock is ISigVerifier {
    /**
     * @inheritdoc ISigVerifier
     */
    function verifyQuorumSig(
        address, /* middleware */
        bytes memory, /* message */
        uint8, /* keyTag */
        uint208, /* quorumThreshold */
        bytes calldata /* proof */
    ) external view returns (bool) {
        return true;
    }
}
