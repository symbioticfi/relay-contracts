// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "./interfaces/IVault.sol";
import {ISlasher} from "./interfaces/ISlasher.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

abstract contract Slash {
    uint64 constant INSTANT_SLASH_TYPE = 0;

    event InstantSlash(
        address indexed operator, address indexed vault, uint256 requested, uint256 slashed, uint48 captureTimestamp
    );
    event SlashRequest(
        address indexed operator, address indexed vault, uint256 requestIdx, uint256 requested, uint48 captureTimestamp
    );

    function slash(
        address network,
        address operator,
        address[] memory vaults,
        uint256[] memory amounts,
        uint48 captureTimestamp
    ) internal {
        if (vaults.length == amounts.length) {
            revert();
        }
        ISlasher[] memory slashers = new ISlasher[](vaults.length);
        for (uint256 i = 0; i < vaults.length; ++i) {
            if (amounts[i] == 0) {
                continue;
            }
            slashers[i] = ISlasher(IVault(vaults[i]).slasher());
            if (address(slashers[i]) == address(0)) {
                revert();
            }
            uint256 slashableStake = slashers[i].slashableStake(network, operator, captureTimestamp);
            if (slashableStake < amounts[i]) {
                revert(); // or just slash slashableStake?
            }

            if (slashers[i].TYPE() == INSTANT_SLASH_TYPE) {
                uint256 slashedAmount = slashers[i].slash(network, operator, amounts[i], captureTimestamp);
                emit InstantSlash(operator, vaults[i], amounts[i], slashedAmount, captureTimestamp);
                continue;
            }
            uint256 slashIndex = slashers[i].requestSlash(network, operator, amounts[i], captureTimestamp);
            emit SlashRequest(operator, vaults[i], slashIndex, amounts[i], captureTimestamp);
        }
    }
}
