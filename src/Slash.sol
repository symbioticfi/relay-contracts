// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "./interfaces/IVault.sol";
import {ISlasher} from "./interfaces/ISlasher.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

abstract contract Slash {
    event InstantSlash(
        address indexed operator, address indexed vault, uint256 requested, uint256 slashed, uint48 captureTimestamp
    );
    event SlashRequest(
        address indexed operator, address indexed vault, uint256 requestIdx, uint256 requested, uint48 captureTimestamp
    );

    function slash(address network, address operator, address[] memory vaults, uint48 captureTimestamp, uint256 amount)
        internal
        returns (uint256[] memory amounts)
    {
        // get stakes, divide equally lol
        // call each vault
        if (amount == 0) {
            revert();
        }
        uint256 totalSlashableStake = 0;
        ISlasher[] memory slashers = new ISlasher[](vaults.length);
        for (uint256 i = 0; i < vaults.length; ++i) {
            slashers[i] = ISlasher(IVault(vaults[i]).slasher());
            if (address(slashers[i]) == address(0)) {
                continue;
            }
            amounts[i] = slashers[i].slashableStake(network, operator, captureTimestamp);
            totalSlashableStake += amounts[i];
        }

        if (totalSlashableStake < amount) {
            amount = totalSlashableStake;
        }

        for (uint256 i = 0; i < vaults.length; ++i) {
            if (address(slashers[i]) == address(0) || amounts[i] == 0) {
                continue;
            }
            amounts[i] = Math.mulDiv(amounts[i], amount, totalSlashableStake);
            if (slashers[i].TYPE() == 0) {
                uint256 slashedAmount = slashers[i].slash(network, operator, amounts[i], captureTimestamp);
                emit InstantSlash(operator, vaults[i], amounts[i], slashedAmount, captureTimestamp);
                continue;
            }
            uint256 slashIndex = slashers[i].requestSlash(network, operator, amounts[i], captureTimestamp);
            emit SlashRequest(operator, vaults[i], slashIndex, amounts[i], captureTimestamp);
        }
    }
}
