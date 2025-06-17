// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {BN254} from "../../../../contracts/libraries/utils/BN254.sol";

import {ISigVerifier} from "./ISigVerifier.sol";

interface ISigVerifierBlsBn254Simple is ISigVerifier {
    error SigVerifierBlsBn254Simple_UnsupportedKeyTag();
    error SigVerifierBlsBn254Simple_InvalidNonSignersOrder();
    error SigVerifierBlsBn254Simple_TooManyValidators();
    error SigVerifierBlsBn254Simple_InvalidNonSignerIndex();
    error SigVerifierBlsBn254Simple_InvalidProofOffset();
    error SigVerifierBlsBn254Simple_InvalidProofLength();

    struct ValidatorData {
        bytes32 keySerialized;
        uint256 votingPower;
    }

    struct ProofData {
        bytes signature;
        bytes aggPublicKeyG2;
        ValidatorData[] validatorsData;
        bool[] isNonSigners;
    }

    function VALIDATOR_SET_HASH_KECCAK256_HASH() external view returns (bytes32);

    function TOTAL_VOTING_POWER_HASH() external view returns (bytes32);

    function AGGREGATED_PUBLIC_KEY_G1_HASH() external view returns (bytes32);

    function MAX_VALIDATORS() external view returns (uint256);
}
