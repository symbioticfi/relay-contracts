// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseSelfRegisterOperators} from "../../BaseSelfRegisterOperators.sol";
import {SelfRegisterOperators} from "../../SelfRegisterOperators.sol";
import {BaseForcePauseSelfRegisterOperators} from "./BaseForcePauseSelfRegisterOperators.sol";

import {IForcePauseSelfRegisterOperators} from
    "../../../../../../../interfaces/features/registration/operators/self-register-operators/extensions/force-pause/IForcePauseSelfRegisterOperators.sol";

abstract contract ForcePauseSelfRegisterOperators is
    SelfRegisterOperators,
    BaseForcePauseSelfRegisterOperators,
    IForcePauseSelfRegisterOperators
{
    function __ForcePauseSelfRegisterOperators_init() internal virtual onlyInitializing {
        __BaseForcePauseSelfRegisterOperators_init();
    }

    function _registerOperatorImpl(
        address operator,
        address vault,
        bytes memory extraData
    ) internal virtual override(BaseForcePauseSelfRegisterOperators, BaseSelfRegisterOperators) {
        BaseForcePauseSelfRegisterOperators._registerOperatorImpl(operator, vault, extraData);
    }

    function _registerOperatorVaultImpl(
        address operator,
        address vault,
        bytes memory extraData
    ) internal virtual override(BaseForcePauseSelfRegisterOperators, BaseSelfRegisterOperators) {
        BaseForcePauseSelfRegisterOperators._registerOperatorVaultImpl(operator, vault, extraData);
    }
}
