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

import {NoAccessManager} from "../../managers/extensions/access/NoAccessManager.sol";
import {TimestampCapture} from "../../managers/extensions/capture-timestamps/TimestampCapture.sol";
import {EqualStakePower} from "../../managers/extensions/stake-powers/EqualStakePower.sol";
import {KeyManager256} from "../../managers/extensions/keys/KeyManager256.sol";
import {EdDSASig} from "../../managers/extensions/sigs/EdDSASig.sol";

contract SelfRegisterEd25519Middleware is
    SharedVaults,
    SelfRegisterOperators,
    KeyManager256,
    EdDSASig,
    NoAccessManager,
    TimestampCapture,
    EqualStakePower
{
    /*
     * @notice Constructor for initializing the SelfRegisterEd25519Middleware contract.
     * @param network The address of the network.
     * @param operatorRegistry The address of the operator registry.
     * @param vaultRegistry The address of the vault registry.
     * @param operatorNetOptin The address of the operator network opt-in service.
     * @param owner The address of the contract owner.
     * @param slashingWindow The duration of the slashing window
     */
    constructor(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptin,
        address readHelper
    ) {
        initialize(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin, readHelper);
    }

    function initialize(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptin,
        address readHelper
    ) internal initializer {
        __BaseMiddleware_init(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin, readHelper);
        __SelfRegisterOperators_init("SelfRegisterEd25519Middleware");
    }
}
