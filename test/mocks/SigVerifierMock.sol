// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ISigVerifier} from "../../src/interfaces/modules/settlement/sig-verifiers/ISigVerifier.sol";

contract SigVerifierMock is ISigVerifier {
    /**
     * @inheritdoc ISigVerifier
     */
    uint32 public constant VERIFICATION_TYPE = type(uint32).max;

    /**
     * @inheritdoc ISigVerifier
     */
    function verifyQuorumSig(
        address, /* settlement */
        uint48, /* epoch */
        bytes memory, /* message */
        uint8, /* keyTag */
        uint256, /* quorumThreshold */
        bytes calldata /* proof */
    ) external view returns (bool) {
        return true;
    }
}
