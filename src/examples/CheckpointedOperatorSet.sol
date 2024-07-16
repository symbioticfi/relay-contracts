// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IOperatorSet} from "../interfaces/IOperatorSet.sol";
import {Arrays} from "../utils/Arrays.sol";
import {BitMaps} from "../utils/BitMaps.sol";

contract CheckpointedOperatorSet is IOperatorSet {
    using Arrays for Arrays.CheckpointedAddressArray;

    address public immutable network;
    Arrays.CheckpointedAddressArray internal operators;

    constructor(address _network) {
        network = _network;
    }

    function get(uint48 captureTimestamp) public view override returns (address[] memory) {
        return operators.getActive(captureTimestamp);
    }

    function addOperators(address[] memory _operators) external {
        if (msg.sender != network) {
            revert();
        }

        operators.add(_operators);
    }

    // use BitMaps.idxsToBitmaps(idxs) locally to generate buckets and data
    function setActiveOperators(uint256[] calldata buckets, uint256[] calldata data) external {
        if (msg.sender != network) {
            revert();
        }

        operators.setActive(buckets, data);
    }
}
