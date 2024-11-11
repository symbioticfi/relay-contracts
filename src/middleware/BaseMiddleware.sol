// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {VaultManager} from "../vault-manager/VaultManager.sol";
import {OperatorManager} from "../operator-manager/OperatorManager.sol";
import {AccessManager} from "../access-manager/AccessManager.sol";


abstract contract BaseMiddleware is VaultManager, OperatorManager, AccessManager {
    using Subnetwork for address;

    /* 
     * @notice Constructor for initializing the BaseMiddleware contract.
     * @param network The address of the network.
     * @param operatorRegistry The address of the operator registry.
     * @param vaultRegistry The address of the vault registry.
     * @param operatorNetOptin The address of the operator network opt-in service.
     * @param epochDuration The duration of each epoch.
     * @param slashingWindow The duration of the slashing window
     */
    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        uint48 slashingWindow,
        address owner
    ) {
        initialize(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin, owner);
    }

    /**
     * @notice Updates the key associated with an operator
     * @param operator The address of the operator
     * @param key The key to update
     */
    function _updateKey(address operator, bytes memory key) internal virtual;

    /**
     * @notice Returns the operator address associated with a given key
     * @param key The key for which to find the associated operator
     * @return The address of the operator linked to the specified key
     */

    function operatorByKey(bytes memory key) public view virtual returns (address);

    /**
     * @notice Returns the current or previous key for a given operator
     * @dev Returns the previous key if the key was updated in the current epoch
     * @param operator The address of the operator
     * @return The key associated with the specified operator
     */
    function operatorKey(address operator) public view virtual returns (bytes memory);
}
