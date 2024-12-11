// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../managers/VaultManager.sol";
import {OperatorManager} from "../managers/OperatorManager.sol";
import {AccessManager} from "../managers/extendable/AccessManager.sol";
import {KeyManager} from "../managers/extendable/KeyManager.sol";

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
    // This constant aggregates changes of all not extendable managers
    uint64 public constant BaseMiddleware_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.BaseMiddleware")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ReaderStorageLocation = 0xfd87879bc98f37af7578af722aecfbe5843e5ad354da2d1e70cb5157c4ec8800;

    /**
     * @notice Initializes the BaseMiddleware contract with required dependencies and parameters
     * @dev This internal initialization function sets up core storage and manager components
     * @param network The address of the network contract
     * @param slashingWindow The duration of the slashing window in blocks
     * @param vaultRegistry The address of the vault registry contract
     * @param operatorRegistry The address of the operator registry contract
     * @param operatorNetOptin The address of the operator network opt-in contract
     * @param reader The address of the reader contract used for delegatecall
     */
    function __BaseMiddleware_init(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptin,
        address reader
    ) internal onlyInitializing {
        __NetworkStorage_init_private(network);
        __SlashingWindowStorage_init_private(slashingWindow);
        __VaultManager_init_private(vaultRegistry);
        __OperatorManager_init_private(operatorRegistry, operatorNetOptin);
        assembly {
            sstore(ReaderStorageLocation, reader)
        }
    }

    /**
     * @notice The fallback function is used to implement getter functions by delegating calls to the BasemiddlewareReader contract
     * @dev This allows the BaseMiddleware to expose view functions defined in the BasemiddlewareReader without explicitly implementing them,
     *      reducing code duplication and maintaining a single source of truth for read operations
     */
    fallback() external {
        address reader_;
        assembly {
            reader_ := sload(ReaderStorageLocation)
        }
        (bool success, bytes memory returndata) = reader_.delegatecall(abi.encodePacked(msg.data, address(this)));
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
