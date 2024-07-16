// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "./interfaces/IVault.sol";
import {IDelegator} from "./interfaces/IDelegator.sol";
import {IOperatorRegistry} from "./interfaces/IOperatorRegistry.sol";
import {BitMaps} from "./utils/BitMaps.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {console} from "forge-std/Test.sol";

abstract contract VaultConnector {
    using BitMaps for BitMaps.BitMap;

    address internal immutable networkVC;
    address[] public vaults;
    mapping(address => BitMaps.BitMap) internal operatorVaults;

    constructor(address _network) {
        networkVC = _network;
    }

    function getOperatorVaults(address operator, uint48 captureTimestamp)
        public
        view
        returns (address[] memory _vaults)
    {
        uint256 len = vaults.length;
        uint256 vaultsLen = 0;
        uint256 buckets = (len + 255) / 256;
        uint256[] memory data = new uint256[](buckets);

        for (uint256 bucket = 0; bucket < buckets; ++bucket) {
            data[bucket] = operatorVaults[operator].getBucket(bucket, captureTimestamp);
            for (uint256 i = 0; i < 256; ++i) {
                uint256 mask = 1 << i;
                if (data[bucket] & mask != 0) {
                    vaultsLen++;
                }
            }
        }

        _vaults = new address[](vaultsLen);
        vaultsLen = 0;

        for (uint256 bucket = 0; bucket < buckets; ++bucket) {
            for (uint256 i = 0; i < 256; ++i) {
                uint256 mask = 1 << i;
                if (data[bucket] & mask != 0) {
                    _vaults[vaultsLen++] = vaults[i + bucket * 256];
                }
            }
        }
    }

    function setOperatorVaults(address operator, uint256[] calldata vaultsIdxs) external {
        if (msg.sender != networkVC) {
            revert();
        }

        if (vaultsIdxs[vaultsIdxs.length - 1] >= vaults.length) {
            revert();
        }

        operatorVaults[operator].setBatchIdxs(vaultsIdxs);
    }
}
