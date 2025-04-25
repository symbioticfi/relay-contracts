// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseSelfRegisterOperators} from "../../BaseSelfRegisterOperators.sol";
import {SelfRegisterOperatorsWithKeys} from "../../SelfRegisterOperatorsWithKeys.sol";
import {BaseForcePauseSelfRegisterOperators} from "./BaseForcePauseSelfRegisterOperators.sol";

import {IForcePauseSelfRegisterOperatorsWithKeys} from
    "../../../../../../../interfaces/features/registration/operators/self-register-operators/extensions/force-pause/IForcePauseSelfRegisterOperatorsWithKeys.sol";

abstract contract ForcePauseSelfRegisterOperatorsWithKeys is
    SelfRegisterOperatorsWithKeys,
    BaseForcePauseSelfRegisterOperators,
    IForcePauseSelfRegisterOperatorsWithKeys
{
    function __ForcePauseSelfRegisterOperatorsWithKeys_init() internal virtual onlyInitializing {
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
