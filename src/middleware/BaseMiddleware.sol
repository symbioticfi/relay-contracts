// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../managers/base/VaultManager.sol";
import {OperatorManager} from "../managers/base/OperatorManager.sol";
import {AccessManager} from "../managers/base/AccessManager.sol";
import {KeyManager} from "../managers/base/KeyManager.sol";
import "forge-std/console.sol";

/**
 * @title BaseMiddleware
 * @notice Abstract base contract that combines core manager functionality for building middleware
 * @dev Inherits from VaultManager, OperatorManager, AccessManager, and KeyManager to provide:
 *      - Vault management and registration
 *      - Operator management and registration
 *      - Access management
 *      - Key management
 *
 * This contract serves as a foundation for building custom middleware by providing essential
 * management capabilities that can be extended with additional functionality.
 */
abstract contract BaseMiddleware is VaultManager, OperatorManager, AccessManager, KeyManager {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.BaseMiddleware.readHelper")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ReadHelperStorageLocation =
        0x19370075337de2141d8d7be7b8e2dab6686d6a69c74729da94b114b78d743b00;

    function __BaseMiddleware_init(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptin,
        address readHelper
    ) internal onlyInitializing {
        __BaseManager_init(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin);
        assembly {
            sstore(ReadHelperStorageLocation, readHelper)
        }
    }

    /**
     * @notice The fallback function is used to implement getter functions by delegating calls to the ReadHelper contract
     * @dev This allows the BaseMiddleware to expose view functions defined in the ReadHelper without explicitly implementing them,
     *      reducing code duplication and maintaining a single source of truth for read operations
     */
    fallback() external {
        address readHelper_;
        assembly {
            readHelper_ := sload(ReadHelperStorageLocation)
        }
        (bool success, bytes memory returndata) = readHelper_.delegatecall(abi.encodePacked(msg.data, address(this)));
        if (!success) {
            assembly {
                revert(add(returndata, 0x20), mload(returndata))
            }
        }
        assembly {
            return(add(returndata, 0x20), mload(returndata))
        }
    }
}
