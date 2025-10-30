// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {EqualStakeVPCalc} from "../src/modules/voting-power/common/voting-power-calc/EqualStakeVPCalc.sol";
import {OperatorVaults} from "../src/modules/voting-power/extensions/OperatorVaults.sol";
import {OzOwnable} from "../src/modules/common/permissions/OzOwnable.sol";
import {VotingPowerProvider} from "../src/modules/voting-power/VotingPowerProvider.sol";

/// @title MyVotingPowerProvider
/// @notice Example implementation of the VotingPowerProvider contract.
contract MyVotingPowerProvider is VotingPowerProvider, OzOwnable, EqualStakeVPCalc, OperatorVaults {
    constructor(address operatorRegistry, address vaultFactory) VotingPowerProvider(operatorRegistry, vaultFactory) {}

    function initialize(
        VotingPowerProviderInitParams memory votingPowerProviderInitParams,
        OzOwnableInitParams memory ozOwnableInitParams
    ) public virtual initializer {
        __VotingPowerProvider_init(votingPowerProviderInitParams);
        __OzOwnable_init(ozOwnableInitParams);
    }
}
