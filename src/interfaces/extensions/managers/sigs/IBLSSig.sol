// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISigManager} from "../../../managers/extendable/ISigManager.sol";

import {BN254} from "../../../../libraries/BN254.sol";

interface IBLSSig {
    function BLSSig_VERSION() external view returns (uint64);

    /**
     * @notice Verifies a BLS signature
     * @param pubkeyG1 The G1 public key to verify against
     * @param pubkeyG2 The G2 public key to verify against
     * @param signature The signature to verify
     * @param messageHash The message hash that was signed
     * @return True if signature is valid, false otherwise
     */
    function verify(
        BN254.G1Point memory pubkeyG1,
        BN254.G2Point memory pubkeyG2,
        BN254.G1Point memory signature,
        bytes32 messageHash
    ) external view returns (bool);
}
