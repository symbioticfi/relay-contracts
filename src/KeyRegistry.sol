// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Checkpoints} from "@openzeppelin/contracts/utils/structs/Checkpoints.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";

import {BitMaps} from "./libraries/BitMaps.sol";
import {Subsets} from "./libraries/Subsets.sol";
import {KeyData} from "./libraries/KeyData.sol";

library KeyRegistry {
    using Checkpoints for Checkpoints.Trace208;
    using BitMaps for BitMaps.BitMap;
    using KeyData for uint256;

    error DuplicateKey();

    struct Registry {
        mapping(address => bytes[]) keys;
        mapping(address => BitMaps.BitMap) keysStatus;
        mapping(bytes => uint256) keyData;
    }

    function getOperatorByKey(Registry storage self, bytes memory key) internal view returns (address) {
        return self.keyData[key].getOperator();
    }

    function getKeyPosition(Registry storage self, bytes memory key) internal view returns (uint256) {
        return self.keyData[key].getPosition();
    }

    function getOperatorKeys(Registry storage self, address operator) internal view returns (bytes[] memory) {
        return self.keys[operator];
    }

    function OperatorKeyCount(Registry storage self, address operator) internal view returns (uint256) {
        return self.keys[operator].length;
    }

    function getEnabledOperatorKeys(Registry storage self, address operator) internal view returns (bytes[] memory) {
        return Subsets.getEnabledBytesSubset(self.keys[operator], self.keysStatus[operator], Time.timestamp());
    }

    function getEnabledOperatorKeysAt(Registry storage self, address operator, uint48 timestamp)
        internal
        view
        returns (bytes[] memory)
    {
        return Subsets.getEnabledBytesSubset(self.keys[operator], self.keysStatus[operator], timestamp);
    }

    function registerOperatorKey(Registry storage self, address operator, bytes memory key) internal {
        if (self.keyData[key].getOperator() != address(0)) {
            revert DuplicateKey();
        }

        self.keyData[key] = KeyData.pack(operator, uint96(self.keys[operator].length));
        self.keys[operator].push(key);
    }

    function enableOperatorKeys(Registry storage self, address operator, uint256[] memory positions) internal {
        Subsets.enableSubset(self.keysStatus[operator], positions, self.keys[operator].length);
    }

    function enableOperatorKey(Registry storage self, address operator, uint256 position) internal {
        Subsets.enable(self.keysStatus[operator], position, self.keys[operator].length);
    }

    function disableOperatorKeys(Registry storage self, address operator, uint256[] memory positions) internal {
        Subsets.disableSubset(self.keysStatus[operator], positions, self.keys[operator].length);
    }

    function disableOperatorKey(Registry storage self, address operator, uint256 position) internal {
        Subsets.disable(self.keysStatus[operator], position, self.keys[operator].length);
    }
}
