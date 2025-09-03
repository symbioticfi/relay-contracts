// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IValSetDriver} from "../valset-driver/IValSetDriver.sol";

/**
 * @title IRelayRewardsDriver
 * @notice Interface for managing relay rewards across different blockchain networks
 */
interface IRelayRewardsDriver {
    /**
     * @notice Error thrown when an invalid cross-chain address is provided
     */
    error RelayRewardsDriver_InvalidCrossChainAddress();

    /**
     * @notice Retrieves relay rewards for a specific timestamp
     * @param timestamp The timestamp for which to retrieve relay rewards
     * @return An array of cross-chain addresses that have relay rewards at the specified timestamp
     */
    function getRelayRewardsAt(
        uint48 timestamp
    ) external view returns (IValSetDriver.CrossChainAddress[] memory);

    /**
     * @notice Retrieves current relay rewards
     * @return An array of cross-chain addresses that currently have relay rewards
     */
    function getRelayRewards() external view returns (IValSetDriver.CrossChainAddress[] memory);

    /**
     * @notice Adds a new relay reward for a cross-chain address
     * @param relayRewards The cross-chain address to add relay rewards for
     */
    function addRelayRewards(
        IValSetDriver.CrossChainAddress memory relayRewards
    ) external;

    /**
     * @notice Removes relay rewards for a cross-chain address
     * @param relayRewards The cross-chain address to remove relay rewards from
     */
    function removeRelayRewards(
        IValSetDriver.CrossChainAddress memory relayRewards
    ) external;
}
