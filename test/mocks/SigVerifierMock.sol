// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ISigVerifier} from "../../src/interfaces/base/ISigVerifier.sol";

contract SigVerifierMock is ISigVerifier {
    /**
     * @inheritdoc ISigVerifier
     */
    function verifyQuorumSig(
        address, /* settlement */
        uint48, /* epoch */
        bytes memory, /* message */
        uint8, /* keyTag */
        uint208, /* quorumThreshold */
        bytes calldata /* proof */
    ) external view returns (bool) {
        return true;
    }
}
