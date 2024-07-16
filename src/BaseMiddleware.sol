// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "./interfaces/IVault.sol";
import {IDelegator} from "./interfaces/IDelegator.sol";
import {IEpoch} from "./interfaces/IEpoch.sol";
import {IOperatorSet} from "./interfaces/IOperatorSet.sol";
import {IOperatorRegistry} from "./interfaces/IOperatorRegistry.sol";
import {KeyRegistry} from "./KeyRegistry.sol";
import {VaultConnector} from "./VaultConnector.sol";
import {Stake} from "./Stake.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

abstract contract BaseMiddleware is KeyRegistry, VaultConnector, Stake {
    address internal immutable network;
    IEpoch public immutable epoch;
    IOperatorSet public immutable operatorSet;
    IOperatorRegistry internal immutable operatorRegistry;

    struct OperatorData {
        uint256 votingPower;
        bytes key;
    }

    modifier onlyNetwork() {
        if (msg.sender != network) {
            revert();
        }
        _;
    }

    constructor(address _network, address _operatorRegistry, address _epoch, address _operatorSet)
        KeyRegistry(_network, _operatorRegistry)
        VaultConnector(_network)
    {
        network = _network;
        operatorRegistry = IOperatorRegistry(_operatorRegistry);
        epoch = IEpoch(_epoch);
        operatorSet = IOperatorSet(_operatorSet);
    }

    // this function is only for offchain calls so it's unoptimized
    function getValidatorSet(uint256 epoch) external virtual returns (OperatorData[] memory);

    function votingPower(uint256 stake) public virtual returns (uint256);
}
