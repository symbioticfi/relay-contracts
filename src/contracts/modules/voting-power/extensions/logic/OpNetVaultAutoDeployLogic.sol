// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.25;

// import {IVaultConfigurator} from "@symbioticfi/core/src/interfaces/IVaultConfigurator.sol";
// import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
// import {IOperatorNetworkSpecificDelegator} from
//     "@symbioticfi/core/src/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";
// import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
// import {IBaseSlasher} from "@symbioticfi/core/src/interfaces/slasher/IBaseSlasher.sol";
// import {ISlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";

// library OpNetVaultAutoDeployLogic {
//     // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OpNetVaultAutoDeploy")) - 1)) & ~bytes32(uint256(0xff))
//     bytes32 private constant OpNetVaultAutoDeployStorageLocation =
//         0x85a64baaaf23c04aec63d80adaee49297f70e3944d69ec004fa7cee8ee6e8b00;

//     constructor(
//         address vaultConfigurator
//     ) {
//         VAULT_CONFIGURATOR = vaultConfigurator;
//     }

//     function _getOpNetVaultAutoDeployStorage() internal pure returns (OpNetVaultAutoDeployStorage storage $) {
//         bytes32 location = OpNetVaultAutoDeployStorageLocation;
//         assembly {
//             $.slot := location
//         }
//     }

//     /**
//      * @dev Must be called after __VotingPowerProvider_init().
//      */
//     function __OpNetVaultAutoDeploy_init(
//         OpNetVaultAutoDeployInitParams memory initParams
//     ) internal virtual onlyInitializing {
//         _setAutoDeployConfig(initParams.config);
//     }

//     /**
//      * @inheritdoc IOpNetVaultAutoDeploy
//      */
//     function getAutoDeployConfig() public view virtual returns (AutoDeployConfig memory) {
//         return _getOpNetVaultAutoDeployStorage()._config;
//     }

//     /**
//      * @inheritdoc IOpNetVaultAutoDeploy
//      */
//     function setAutoDeployConfig(
//         AutoDeployConfig memory config
//     ) public virtual checkPermission {
//         _setAutoDeployConfig(config);
//     }

//     function _registerOperatorImpl(
//         address operator
//     ) internal virtual override {
//         super._registerOperatorImpl(operator);
//         _registerOperatorVault(operator, _createVault(operator));
//     }

//     function _setAutoDeployConfig(
//         AutoDeployConfig memory config
//     ) internal virtual {
//         _validateConfig(config);
//         _getOpNetVaultAutoDeployStorage()._config = config;
//         emit SetAutoDeployConfig(config);
//     }

//     function _validateConfig(
//         AutoDeployConfig memory config
//     ) internal view virtual {
//         if (config.epochDuration < getSlashingWindow()) {
//             revert OpNetVaultAutoDeploy_InvalidEpochDuration();
//         }
//         if (config.collateral == address(0)) {
//             revert OpNetVaultAutoDeploy_InvalidCollateral();
//         }
//         if (!config.withSlasher && getSlashingWindow() > 0) {
//             revert OpNetVaultAutoDeploy_InvalidWithSlasher();
//         }
//         if (!config.withSlasher && config.isBurnerHook) {
//             revert OpNetVaultAutoDeploy_InvalidBurnerHook();
//         }
//     }

//     function _createVault(
//         address operator
//     ) internal virtual returns (address) {
//         AutoDeployConfig memory config = _getOpNetVaultAutoDeployStorage()._config;
//         (uint64 version, bytes memory vaultParams) = _getVaultParams(config);
//         (uint64 delegatorIndex, bytes memory delegatorParams) = _getDelegatorParams(config, operator);
//         (bool withSlasher, uint64 slasherIndex, bytes memory slasherParams) = _getSlasherParams(config);
//         (address vault, address delegator,) = IVaultConfigurator(VAULT_CONFIGURATOR).create(
//             IVaultConfigurator.InitParams({
//                 version: version,
//                 owner: address(0),
//                 vaultParams: vaultParams,
//                 delegatorIndex: delegatorIndex,
//                 delegatorParams: delegatorParams,
//                 withSlasher: withSlasher,
//                 slasherIndex: slasherIndex,
//                 slasherParams: slasherParams
//             })
//         );
//         if (NETWORK() == address(this)) {
//             IBaseDelegator(delegator).setMaxNetworkLimit(SUBNETWORK_IDENTIFIER(), type(uint256).max);
//         }
//         return vault;
//     }

//     function _getVaultParams(
//         AutoDeployConfig memory config
//     ) internal view virtual returns (uint64, bytes memory) {
//         return (
//             1,
//             abi.encode(
//                 IVault.InitParams({
//                     collateral: config.collateral,
//                     burner: config.burner,
//                     epochDuration: config.epochDuration,
//                     depositWhitelist: false,
//                     isDepositLimit: false,
//                     depositLimit: 0,
//                     defaultAdminRoleHolder: address(0),
//                     depositWhitelistSetRoleHolder: address(0),
//                     depositorWhitelistRoleHolder: address(0),
//                     isDepositLimitSetRoleHolder: address(0),
//                     depositLimitSetRoleHolder: address(0)
//                 })
//             )
//         );
//     }

//     function _getDelegatorParams(
//         AutoDeployConfig memory, /* config */
//         address operator
//     ) internal view virtual returns (uint64, bytes memory) {
//         return (
//             uint64(DelegatorType.OPERATOR_NETWORK_SPECIFIC),
//             abi.encode(
//                 IOperatorNetworkSpecificDelegator.InitParams({
//                     baseParams: IBaseDelegator.BaseParams({
//                         defaultAdminRoleHolder: address(0),
//                         hook: address(0),
//                         hookSetRoleHolder: address(0)
//                     }),
//                     network: NETWORK(),
//                     operator: operator
//                 })
//             )
//         );
//     }

//     function _getSlasherParams(
//         AutoDeployConfig memory config
//     ) internal view virtual returns (bool, uint64, bytes memory) {
//         if (!config.withSlasher) {
//             return (false, 0, new bytes(0));
//         }
//         return (
//             true,
//             uint64(SlasherType.INSTANT),
//             abi.encode(ISlasher.InitParams({baseParams: IBaseSlasher.BaseParams({isBurnerHook: config.isBurnerHook})}))
//         );
//     }
// }
