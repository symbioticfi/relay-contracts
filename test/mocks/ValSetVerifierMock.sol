// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ValSetVerifier} from "../../src/contracts/libraries/utils/ValSetVerifier.sol";

contract ValSetVerifierMock {
    function verifyVault(
        ValSetVerifier.SszProof calldata validatorRootProof,
        uint256 validatorRootLocalIndex,
        bytes32 validatorSetRoot,
        ValSetVerifier.SszProof calldata vaultRootProof,
        uint256 vaultRootLocalIndex,
        ValSetVerifier.SszProof calldata vaultChainIdProof,
        ValSetVerifier.SszProof calldata vaultVaultProof,
        ValSetVerifier.SszProof calldata vaultVotingPowerProof
    ) public view returns (bool) {
        return ValSetVerifier.verifyVault(
            validatorRootProof,
            validatorRootLocalIndex,
            validatorSetRoot,
            vaultRootProof,
            vaultRootLocalIndex,
            vaultChainIdProof,
            vaultVaultProof,
            vaultVotingPowerProof
        );
    }
}
