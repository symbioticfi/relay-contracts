// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Registry as SymbioticRegistry} from "@symbioticfi/core/src/contracts/common/Registry.sol";
import {Entity as SymbioticEntity} from "@symbioticfi/core/src/contracts/common/Entity.sol";
import {Factory as SymbioticFactory} from "@symbioticfi/core/src/contracts/common/Factory.sol";
import {MigratableEntity as SymbioticMigratableEntity} from
    "@symbioticfi/core/src/contracts/common/MigratableEntity.sol";
import {MigratablesFactory as SymbioticMigratablesFactory} from
    "@symbioticfi/core/src/contracts/common/MigratablesFactory.sol";
import {StaticDelegateCallable as SymbioticStaticDelegateCallable} from
    "@symbioticfi/core/src/contracts/common/StaticDelegateCallable.sol";
import {Vault as SymbioticVault} from "@symbioticfi/core/src/contracts/vault/Vault.sol";
import {VaultTokenized as SymbioticVaultTokenized} from "@symbioticfi/core/src/contracts/vault/VaultTokenized.sol";
import {VaultFactory as SymbioticVaultFactory} from "@symbioticfi/core/src/contracts/VaultFactory.sol";
import {BaseDelegator as SymbioticBaseDelegator} from "@symbioticfi/core/src/contracts/delegator/BaseDelegator.sol";
import {NetworkRestakeDelegator as SymbioticNetworkRestakeDelegator} from
    "@symbioticfi/core/src/contracts/delegator/NetworkRestakeDelegator.sol";
import {FullRestakeDelegator as SymbioticFullRestakeDelegator} from
    "@symbioticfi/core/src/contracts/delegator/FullRestakeDelegator.sol";
import {OperatorSpecificDelegator as SymbioticOperatorSpecificDelegator} from
    "@symbioticfi/core/src/contracts/delegator/OperatorSpecificDelegator.sol";
import {OperatorNetworkSpecificDelegator as SymbioticOperatorNetworkSpecificDelegator} from
    "@symbioticfi/core/src/contracts/delegator/OperatorNetworkSpecificDelegator.sol";
import {DelegatorFactory as SymbioticDelegatorFactory} from "@symbioticfi/core/src/contracts/DelegatorFactory.sol";
import {BaseSlasher as SymbioticBaseSlasher} from "@symbioticfi/core/src/contracts/slasher/BaseSlasher.sol";
import {
    Slasher as SymbioticSlasher,
    ISlasher as ISymbioticSlasher
} from "@symbioticfi/core/src/contracts/slasher/Slasher.sol";
import {VetoSlasher as SymbioticVetoSlasher} from "@symbioticfi/core/src/contracts/slasher/VetoSlasher.sol";
import {SlasherFactory as SymbioticSlasherFactory} from "@symbioticfi/core/src/contracts/SlasherFactory.sol";
import {NetworkRegistry as SymbioticNetworkRegistry} from "@symbioticfi/core/src/contracts/NetworkRegistry.sol";
import {
    OperatorRegistry as SymbioticOperatorRegistry,
    IOperatorRegistry as ISymbioticOperatorRegistry
} from "@symbioticfi/core/src/contracts/OperatorRegistry.sol";
import {MetadataService as SymbioticMetadataService} from "@symbioticfi/core/src/contracts/service/MetadataService.sol";
import {NetworkMiddlewareService as SymbioticNetworkMiddlewareService} from
    "@symbioticfi/core/src/contracts/service/NetworkMiddlewareService.sol";
import {OptInService as SymbioticOptInService} from "@symbioticfi/core/src/contracts/service/OptInService.sol";
import {VaultConfigurator as SymbioticVaultConfigurator} from "@symbioticfi/core/src/contracts/VaultConfigurator.sol";

interface SymbioticCoreImportsContracts {}
