// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract DiamondProxy {
    mapping(bytes4 => address) internal _selectorToTarget;

    function _setSelectorToTarget(bytes4 selector, address target) internal {
        _selectorToTarget[selector] = target;
    }

    fallback() external {
        address target = _selectorToTarget[msg.sig];
        if (target == address(0)) {
            revert("Function not supported");
        }
        assembly {
            // copy function selector and any arguments
            calldatacopy(0, 0, calldatasize())
            // execute function call using the facet
            let result := delegatecall(gas(), target, 0, calldatasize(), 0, 0)
            // get any return value
            returndatacopy(0, 0, returndatasize())
            // return any return value or error back to the caller
            switch result
            case 0 { revert(0, returndatasize()) }
            default {
                // If the call succeeded, return the data to the caller
                return(0, returndatasize())
            }
        }
    }
}
