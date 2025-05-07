// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ValSetVerifier} from "../../src/contracts/libraries/utils/ValSetVerifier.sol";

contract ValSetVerifierMock {
    function verifyOperator(
        ValSetVerifier.SszProof calldata validatorRootProof,
        uint256 validatorRootLocalIndex,
        bytes32 validatorSetRoot,
        ValSetVerifier.SszProof calldata operatorRootProof
    ) public view returns (bool) {
        return ValSetVerifier.verifyOperator(
            validatorRootProof, validatorRootLocalIndex, validatorSetRoot, operatorRootProof
        );
    }

    function verifyValidatorRootLocal(
        ValSetVerifier.SszProof calldata validatorRootProof,
        uint256 validatorRootLocalIndex,
        bytes32 validatorSetRoot
    ) public view returns (bool) {
        return ValSetVerifier.verifyValidatorRootLocal(validatorRootProof, validatorRootLocalIndex, validatorSetRoot);
    }

    function verifyValidatorOperatorLocal(
        ValSetVerifier.SszProof calldata operatorRootProof,
        bytes32 validatorSetRoot
    ) public view returns (bool) {
        return ValSetVerifier.verifyValidatorOperatorLocal(operatorRootProof, validatorSetRoot);
    }
}
