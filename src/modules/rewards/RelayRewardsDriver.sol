// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {NetworkManager} from "../base/NetworkManager.sol";
import {PermissionManager} from "../base/PermissionManager.sol";
import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {IRelayRewardsDriver} from "../../interfaces/modules/rewards/IRelayRewardsDriver.sol";
import {IValSetDriver} from "../../interfaces/modules/valset-driver/IValSetDriver.sol";

/**
 * @title RelayRewardsDriver
 * @notice Manages relay rewards across different blockchain networks with persistent storage
 */
abstract contract RelayRewardsDriver is NetworkManager, PermissionManager, IRelayRewardsDriver {
    using PersistentSet for PersistentSet.Bytes32Set;

    /// @notice Persistent set storing relay rewards as serialized cross-chain addresses
    PersistentSet.Bytes32Set internal _relayRewards;

    /* PUBLIC FUNCTIONS */

    /**
     * @inheritdoc IRelayRewardsDriver
     */
    function getRelayRewardsAt(
        uint48 timestamp
    ) public view returns (IValSetDriver.CrossChainAddress[] memory) {
        bytes32[] memory relayRewardsRaw = _relayRewards.valuesAt(timestamp);

        IValSetDriver.CrossChainAddress[] memory relayRewards =
            new IValSetDriver.CrossChainAddress[](relayRewardsRaw.length);
        for (uint256 i; i < relayRewardsRaw.length; ++i) {
            relayRewards[i] = _deserializeCrossChainAddress(relayRewardsRaw[i]);
        }
        return relayRewards;
    }

    /**
     * @inheritdoc IRelayRewardsDriver
     */
    function getRelayRewards() public view returns (IValSetDriver.CrossChainAddress[] memory) {
        bytes32[] memory relayRewardsRaw = _relayRewards.values();

        IValSetDriver.CrossChainAddress[] memory relayRewards =
            new IValSetDriver.CrossChainAddress[](relayRewardsRaw.length);
        for (uint256 i; i < relayRewardsRaw.length; ++i) {
            relayRewards[i] = _deserializeCrossChainAddress(relayRewardsRaw[i]);
        }
        return relayRewards;
    }

    /**
     * @inheritdoc IRelayRewardsDriver
     */
    function addRelayRewards(
        IValSetDriver.CrossChainAddress memory relayRewards
    ) public checkPermission {
        if (relayRewards.chainId == 0 || relayRewards.addr == address(0)) {
            revert RelayRewardsDriver_InvalidCrossChainAddress();
        }

        _relayRewards.add(uint48(block.timestamp), _serializeCrossChainAddress(relayRewards));
    }

    /**
     * @inheritdoc IRelayRewardsDriver
     */
    function removeRelayRewards(
        IValSetDriver.CrossChainAddress memory relayRewards
    ) public checkPermission {
        _relayRewards.remove(uint48(block.timestamp), _serializeCrossChainAddress(relayRewards));
    }

    /* INTERNAL FUNCTIONS */

    /**
     * @notice Serializes a CrossChainAddress struct into a bytes32 for storage
     * @param crossChainAddress The cross-chain address to serialize
     * @return The serialized bytes32 representation
     */
    function _serializeCrossChainAddress(
        IValSetDriver.CrossChainAddress memory crossChainAddress
    ) internal pure virtual returns (bytes32) {
        return bytes32(uint256(crossChainAddress.chainId) << 160 | uint256(uint160(crossChainAddress.addr)));
    }

    /**
     * @notice Deserializes a bytes32 back into a CrossChainAddress struct
     * @param compressedAddress The compressed bytes32 representation
     * @return The deserialized CrossChainAddress struct
     */
    function _deserializeCrossChainAddress(
        bytes32 compressedAddress
    ) internal pure virtual returns (IValSetDriver.CrossChainAddress memory) {
        return IValSetDriver.CrossChainAddress({
            addr: address(uint160(uint256(compressedAddress))),
            chainId: uint64(uint256(compressedAddress) >> 160)
        });
    }
}
