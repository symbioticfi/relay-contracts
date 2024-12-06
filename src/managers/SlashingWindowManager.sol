// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract SlashingWindowManager is Initializable {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.SlashingWindowManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SlashingWindowManagerStorageLocation =
        0x52becd5b30d67421b1f63b9d90d513daf82b3973912d3edfdac9468c1743c000;

    function __SlashingWindowManager_init_private(
        uint48 _slashingWindow
    ) internal onlyInitializing {
        assembly {
            sstore(SlashingWindowManagerStorageLocation, _slashingWindow)
        }
    }

    function _SLASHING_WINDOW() internal view returns (uint48) {
        uint48 slashingWindow;
        assembly {
            slashingWindow := sload(SlashingWindowManagerStorageLocation)
        }
        return slashingWindow;
    }
}
