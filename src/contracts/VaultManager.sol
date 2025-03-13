// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.25;

// import {OperatorManager} from "./OperatorManager.sol";
// import {NetworkConfig} from "./NetworkConfig.sol";
// import {Updatable} from "./libraries/utils/Updatable.sol";
// import {VaultManagerLogic} from "./libraries/logic/VaultManagerLogic.sol";

// contract VaultManager is NetworkConfig {
//     struct VaultManagerInitParams {
//         OperatorManager.OperatorManagerInitParams baseParams;
//         uint96 subnetID;
//     }

//     /// @custom:storage-location erc7201:symbiotic.storage.VaultManager
//     struct VaultManagerStorage {
//         EnumerableSet.AddressSet _tokens;
//         mapping(address => Updatable.Uint208Value) _tokenPrice;
//         EnumerableSet.AddressSet _sharedVaults;
//         EnumerableSet.AddressSet _allOperatorVaults;
//         mapping(address => EnumerableSet.AddressSet) _operatorVaults;
//         mapping(address => Updatable.Uint208Value) _vaultWeight;
//     }

//     address public immutable VAULT_FACTORY;

//     // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.VaultManager")) - 1)) & ~bytes32(uint256(0xff))
//     bytes32 private constant VaultManagerStorageLocation =
//         0xfd87879bc98f37af7578af722aecfbe5843e5ad354da2d1e70cb5157c4ec8800;

//     bytes32 public constant TOKEN_ADD_ROLE = keccak256("TOKEN_ADD_ROLE");

//     bytes32 public constant TOKEN_PRICE_UPDATE_ROLE = keccak256("TOKEN_PRICE_UPDATE_ROLE");

//     bytes32 public constant SHARED_VAULT_ADD_ROLE = keccak256("SHARED_VAULT_ADD_ROLE");

//     bytes32 public constant OPERATOR_VAULT_ADD_ROLE = keccak256("OPERATOR_VAULT_ADD_ROLE");

//     bytes32 public constant VAULT_WEIGHT_UPDATE_ROLE = keccak256("VAULT_WEIGHT_UPDATE_ROLE");

//     bytes32 public constant VAULT_REMOVE_ROLE = keccak256("VAULT_REMOVE_ROLE");

//     bytes32 public constant SLASH_REQUEST_ROLE = keccak256("SLASH_REQUEST_ROLE");

//     bytes32 public constant SLASH_EXECUTE_ROLE = keccak256("SLASH_EXECUTE_ROLE");

//     constructor(address factory, address vaultFactory) NetworkConfig(factory) {
//         VAULT_FACTORY = vaultFactory;
//     }

//     function getVotingPower(
//         address operator
//     ) public view returns (uint256) {
//         return VaultManagerLogic.getVotingPower(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), operator
//         );
//     }

//     function getTokenPrice(
//         address token
//     ) public view returns (uint208) {
//         return VaultManagerLogic.getTokenPrice(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), token
//         );
//     }

//     function getVaultWeight(
//         address vault
//     ) public view returns (uint208) {
//         return VaultManagerLogic.getVaultWeight(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), vault
//         );
//     }

//     function getSharedVaults() public view returns (address[] memory) {
//         return VaultManagerLogic.getSharedVaults(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage()
//         );
//     }

//     function getOperatorVaults(
//         address operator
//     ) public view returns (address[] memory) {
//         return VaultManagerLogic.getOperatorVaults(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), operator
//         );
//     }

//     function addToken(address token, uint256 price) public onlyRole(TOKEN_ADD_ROLE) {
//         VaultManagerLogic.addToken(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), token, price
//         );
//     }

//     function updateTokenPrice(address token, uint256 price) public onlyRole(TOKEN_PRICE_UPDATE_ROLE) {
//         VaultManagerLogic.updateTokenPrice(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), token, price
//         );
//     }

//     function removeToken(
//         address token
//     ) public onlyRole(TOKEN_REMOVE_ROLE) {
//         VaultManagerLogic.removeToken(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), token
//         );
//     }

//     function addSharedVault(address vault, uint208 weight) public onlyRole(SHARED_VAULT_ADD_ROLE) {
//         VaultManagerLogic.addSharedVault(
//             _getVaultManagerStorage(),
//             _getOperatorManagerStorage(),
//             _getNetworkConfigStorage(),
//             VAULT_FACTORY,
//             vault,
//             weight
//         );
//     }

//     function addOperatorVault(
//         address operator,
//         address vault,
//         uint208 weight
//     ) public onlyRole(OPERATOR_VAULT_ADD_ROLE) {
//         VaultManagerLogic.addOperatorVault(
//             _getVaultManagerStorage(),
//             _getOperatorManagerStorage(),
//             _getNetworkConfigStorage(),
//             VAULT_FACTORY,
//             operator,
//             vault,
//             weight
//         );
//     }

//     function updateVaultWeight(address vault, uint208 weight) public onlyRole(VAULT_WEIGHT_UPDATE_ROLE) {
//         VaultManagerLogic.updateVaultWeight(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), vault, weight
//         );
//     }

//     function removeVault(
//         address vault
//     ) public onlyRole(VAULT_REMOVE_ROLE) {
//         VaultManagerLogic.removeVault(
//             _getVaultManagerStorage(), _getOperatorManagerStorage(), _getNetworkConfigStorage(), vault
//         );
//     }

//     function requestSlash(
//         address operator,
//         address vault,
//         uint256 amount,
//         bytes memory hints
//     ) public onlyRole(SLASH_REQUEST_ROLE) {
//         VaultManagerLogic.slash(
//             _getVaultManagerStorage(),
//             _getOperatorManagerStorage(),
//             _getNetworkConfigStorage(),
//             operator,
//             vault,
//             amount,
//             hints
//         );
//     }

//     function executeSlash(address vault, uint256 slashIndex, bytes memory hints) public onlyRole(SLASH_EXECUTE_ROLE) {
//         VaultManagerLogic.executeSlash(
//             _getVaultManagerStorage(),
//             _getOperatorManagerStorage(),
//             _getNetworkConfigStorage(),
//             vault,
//             slashIndex,
//             hints
//         );
//     }

//     function _getVaultManagerStorage() internal pure returns (VaultManagerStorage storage $) {
//         assembly {
//             $.slot := VaultManagerStorageLocation
//         }
//     }

//     function _initialize(uint64 initialVersion, address owner, bytes memory data) internal virtual override {
//         VaultManagerInitParams memory initParams = abi.decode(data, (VaultManagerInitParams));
//         super._initialize(initialVersion, owner, abi.encode(initParams.baseParams));

//         VaultManagerLogic.initialize(_getVaultManagerStorage(), initParams);
//     }
// }
