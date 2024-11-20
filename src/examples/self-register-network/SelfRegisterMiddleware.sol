// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
import {SharedVaults} from "../../middleware/extensions/SharedVaults.sol";
import {SelfRegisterOperators} from "../../middleware/extensions/operators/SelfRegisterOperators.sol";
import {ECDSASig} from "../../middleware/extensions/sigs/ECDSASig.sol";
import {NoAccessManager} from "../../middleware/extensions/access-managers/NoAccessManager.sol";

import {KeyStorage256} from "../../key-storage/KeyStorage256.sol";

contract SelfRegisterMiddleware is SharedVaults, SelfRegisterOperators, KeyStorage256, ECDSASig, NoAccessManager {
    /*
     * @notice Constructor for initializing the SelfRegisterMiddleware contract.
     * @param network The address of the network.
     * @param operatorRegistry The address of the operator registry.
     * @param vaultRegistry The address of the vault registry.
     * @param operatorNetOptin The address of the operator network opt-in service.
     * @param owner The address of the contract owner.
     * @param slashingWindow The duration of the slashing window
     */
    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        uint48 slashingWindow
    ) {
        initialize(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin);
    }

    function initialize(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptIn
    ) public override initializer {
        super.initialize(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptIn);
        __SelfRegisterOperators_init("SelfRegisterMiddleware");
    }
}
