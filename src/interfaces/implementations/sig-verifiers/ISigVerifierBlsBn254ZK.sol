// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";

interface ISigVerifierBlsBn254ZK is ISigVerifier {
    error SigVerifierBlsBn254ZK_InvalidLength();
    error SigVerifierBlsBn254ZK_InvalidMaxValidators();
    error SigVerifierBlsBn254ZK_InvalidTotalActiveValidators();

    function TOTAL_ACTIVE_VALIDATORS() external view returns (string memory);

    function VALIDATOR_SET_HASH_MIMC() external view returns (string memory);

    function verifiers(
        uint256 index
    ) external view returns (address);

    function maxValidators(
        uint256 index
    ) external view returns (uint256);
}
