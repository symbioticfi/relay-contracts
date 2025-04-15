// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {Updatable} from "../libraries/utils/Updatable.sol";

contract SettlementConfig {
    using Updatable for Updatable.Uint208Value;

    error InvalidEpochDuration();

    struct CrossChainAddress {
        address addr;
        uint64 chainId;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.SettlementConfig
    struct SettlementConfigStorage {
        Updatable.Uint208Value[] stakeProviders;
        Updatable.Uint208Value keysProvider;
        Updatable.Uint208Value[] replicas;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.SettlementConfig")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SettlementConfigStorageLocation =
        0xab930e9b836b4d72502da14061937ab080936446173403910135ea983863d400;

    function _getSettlementConfigStorage() internal pure returns (SettlementConfigStorage storage $) {
        assembly ("memory-safe") {
            $.slot := SettlementConfigStorageLocation
        }
    }

    function __SettlementConfig_init(CrossChainAddress[] memory stakeProviders, CrossChainAddress memory keysProvider, CrossChainAddress[] memory replicas) public {
        SettlementConfigStorage storage self = _getSettlementConfigStorage();

    }

    function _setStakeProvider()


}
