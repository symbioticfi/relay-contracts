// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVotingPowerCalcManager {
    /**
     * @notice Returns the voting power given a `stake` amount of `vault`'s collateral at the certain vault at the given timestamp.
     * @param vault The vault.
     * @param stake The stake.
     * @param extraData The extra data.
     * @param timestamp The timestamp.
     * @return The voting power given a `stake` amount of `vault`'s collateral at the certain vault at the given timestamp.
     */
    function stakeToVotingPowerAt(
        address vault,
        uint256 stake,
        bytes memory extraData,
        uint48 timestamp
    ) external view returns (uint256);

    /**
     * @notice Returns the voting power given a `stake` amount of `vault`'s collateral at the certain vault.
     * @param vault The vault.
     * @param stake The stake.
     * @param extraData The extra data.
     * @return The voting power given a `stake` amount of `vault`'s collateral at the certain vault.
     */
    function stakeToVotingPower(address vault, uint256 stake, bytes memory extraData) external view returns (uint256);
}
