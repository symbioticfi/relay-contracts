// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IRegistry as ISymbioticRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";
import {IEntity as ISymbioticEntity} from "@symbioticfi/core/src/interfaces/common/IEntity.sol";
import {IFactory as ISymbioticFactory} from "@symbioticfi/core/src/interfaces/common/IFactory.sol";
import {IMigratableEntity as ISymbioticMigratableEntity} from
    "@symbioticfi/core/src/interfaces/common/IMigratableEntity.sol";
import {IMigratablesFactory as ISymbioticMigratablesFactory} from
    "@symbioticfi/core/src/interfaces/common/IMigratablesFactory.sol";
import {IStaticDelegateCallable as ISymbioticStaticDelegateCallable} from
    "@symbioticfi/core/src/interfaces/common/IStaticDelegateCallable.sol";
import {IVault as ISymbioticVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {IVaultTokenized as ISymbioticVaultTokenized} from "@symbioticfi/core/src/interfaces/vault/IVaultTokenized.sol";
import {IVaultFactory as ISymbioticVaultFactory} from "@symbioticfi/core/src/interfaces/IVaultFactory.sol";
import {IBaseDelegator as ISymbioticBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
import {INetworkRestakeDelegator as ISymbioticNetworkRestakeDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/INetworkRestakeDelegator.sol";
import {IFullRestakeDelegator as ISymbioticFullRestakeDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IFullRestakeDelegator.sol";
import {IOperatorSpecificDelegator as ISymbioticOperatorSpecificDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IOperatorSpecificDelegator.sol";
import {IOperatorNetworkSpecificDelegator as ISymbioticOperatorNetworkSpecificDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";
import {IDelegatorFactory as ISymbioticDelegatorFactory} from "@symbioticfi/core/src/interfaces/IDelegatorFactory.sol";
import {IBaseSlasher as ISymbioticBaseSlasher} from "@symbioticfi/core/src/interfaces/slasher/IBaseSlasher.sol";
import {ISlasher as ISymbioticSlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
import {IVetoSlasher as ISymbioticVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";
import {ISlasherFactory as ISymbioticSlasherFactory} from "@symbioticfi/core/src/interfaces/ISlasherFactory.sol";
import {INetworkRegistry as ISymbioticNetworkRegistry} from "@symbioticfi/core/src/interfaces/INetworkRegistry.sol";
import {IOperatorRegistry as ISymbioticOperatorRegistry} from "@symbioticfi/core/src/interfaces/IOperatorRegistry.sol";
import {IMetadataService as ISymbioticMetadataService} from
    "@symbioticfi/core/src/interfaces/service/IMetadataService.sol";
import {INetworkMiddlewareService as ISymbioticNetworkMiddlewareService} from
    "@symbioticfi/core/src/interfaces/service/INetworkMiddlewareService.sol";
import {IOptInService as ISymbioticOptInService} from "@symbioticfi/core/src/interfaces/service/IOptInService.sol";
import {IVaultConfigurator as ISymbioticVaultConfigurator} from
    "@symbioticfi/core/src/interfaces/IVaultConfigurator.sol";
import {Checkpoints as SymbioticCheckpoints} from "@symbioticfi/core/src/contracts/libraries/Checkpoints.sol";
import {ERC4626Math as SymbioticERC4626Math} from "@symbioticfi/core/src/contracts/libraries/ERC4626Math.sol";
import {Subnetwork as SymbioticSubnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

interface SymbioticCoreImports {}
