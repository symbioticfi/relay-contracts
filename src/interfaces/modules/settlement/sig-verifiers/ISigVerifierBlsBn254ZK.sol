// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISigVerifier} from "../../../../interfaces/base/ISigVerifier.sol";

interface ISigVerifierBlsBn254ZK is ISigVerifier {
    error SigVerifierBlsBn254ZK_InvalidLength();
    error SigVerifierBlsBn254ZK_InvalidMaxValidators();
    error SigVerifierBlsBn254ZK_InvalidTotalActiveValidators();
    error SigVerifierBlsBn254ZK_UnsupportedKeyTag();
    error SigVerifierBlsBn254ZK_InvalidVerifier();

    function TOTAL_ACTIVE_VALIDATORS_HASH() external view returns (bytes32);

    function VALIDATOR_SET_HASH_MIMC_HASH() external view returns (bytes32);

    function verifiers(
        uint256 index
    ) external view returns (address);

    function maxValidators(
        uint256 index
    ) external view returns (uint256);
}
