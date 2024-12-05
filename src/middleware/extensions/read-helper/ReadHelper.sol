// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract ReadHelper is Initializable {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ReadHelper.readHelperImpl")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ReadHelperStorageLocation =
        0xeeb01dcf9eb4176c944794e8cb12d9caba4faa2514a692b173894bc3e9135d00;

    function _readHelperImpl() internal view returns (address readHelperImpl_) {
        bytes32 location = ReadHelperStorageLocation;
        assembly {
            readHelperImpl_ := sload(location)
        }
    }

    function __ReadHelper_init(
        address readHelperImpl
    ) internal onlyInitializing {
        bytes32 location = ReadHelperStorageLocation;
        assembly {
            sstore(location, readHelperImpl)
        }
    }

    fallback() external {
        (bool success, bytes memory returndata) = _readHelperImpl().delegatecall(msg.data);
        bytes memory revertData = abi.encode(success, returndata);
        assembly {
            revert(add(32, revertData), mload(revertData))
        }
    }
}
