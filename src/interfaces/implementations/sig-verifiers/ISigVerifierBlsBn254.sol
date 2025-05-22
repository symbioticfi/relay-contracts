// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISigVerifier} from "../../../interfaces/base/ISigVerifier.sol";

interface ISigVerifierBlsBn254 is ISigVerifier {
    error SigVerifierBlsBn254_InvalidLength();
    error SigVerifierBlsBn254_InvalidMaxValidators();
    error SigVerifierBlsBn254_InvalidTotalActiveValidators();

    function TOTAL_ACTIVE_VALIDATORS() external view returns (string memory);

    function VALIDATOR_SET_HASH_MIMC() external view returns (string memory);

    function verifiers(
        uint256 index
    ) external view returns (address);

    function maxValidators(
        uint256 index
    ) external view returns (uint256);
}
