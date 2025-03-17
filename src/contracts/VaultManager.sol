// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {OperatorManager} from "./OperatorManager.sol";

import {VaultManagerLogic} from "./libraries/logic/VaultManagerLogic.sol";

import {IVaultManager} from "../interfaces/IVaultManager.sol";

contract VaultManager is OperatorManager, IVaultManager {
    address public immutable VAULT_FACTORY;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.VaultManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant VaultManagerStorageLocation =
        0xfd87879bc98f37af7578af722aecfbe5843e5ad354da2d1e70cb5157c4ec8800;

    bytes32 internal constant TOKEN_ADD_ROLE = keccak256("TOKEN_ADD_ROLE");

    bytes32 internal constant TOKEN_PRICE_UPDATE_ROLE = keccak256("TOKEN_PRICE_UPDATE_ROLE");

    bytes32 internal constant TOKEN_REMOVE_ROLE = keccak256("TOKEN_REMOVE_ROLE");

    bytes32 internal constant SHARED_VAULT_ADD_ROLE = keccak256("SHARED_VAULT_ADD_ROLE");

    bytes32 internal constant OPERATOR_VAULT_ADD_ROLE = keccak256("OPERATOR_VAULT_ADD_ROLE");

    bytes32 internal constant VAULT_WEIGHT_UPDATE_ROLE = keccak256("VAULT_WEIGHT_UPDATE_ROLE");

    bytes32 internal constant SHARED_VAULT_REMOVE_ROLE = keccak256("SHARED_VAULT_REMOVE_ROLE");

    bytes32 internal constant OPERATOR_VAULT_REMOVE_ROLE = keccak256("OPERATOR_VAULT_REMOVE_ROLE");

    bytes32 internal constant SLASH_REQUEST_ROLE = keccak256("SLASH_REQUEST_ROLE");

    bytes32 internal constant SLASH_EXECUTE_ROLE = keccak256("SLASH_EXECUTE_ROLE");

    constructor(address factory, address vaultFactory) OperatorManager(factory) {
        VAULT_FACTORY = vaultFactory;
    }

    function getVotingPower(
        address operator
    ) public view returns (uint256) {
        return VaultManagerLogic.getVotingPower(_getVaultManagerStorage(), _getNetworkConfigStorage(), operator);
    }

    function getTokenPrice(
        address token
    ) public view returns (uint208) {
        return VaultManagerLogic.getTokenPrice(_getVaultManagerStorage(), _getNetworkConfigStorage(), token);
    }

    function getVaultWeight(
        address vault
    ) public view returns (uint208) {
        return VaultManagerLogic.getVaultWeight(_getVaultManagerStorage(), _getNetworkConfigStorage(), vault);
    }

    function getSharedVaults() public view returns (address[] memory) {
        return VaultManagerLogic.getSharedVaults(_getVaultManagerStorage());
    }

    function getOperatorVaults(
        address operator
    ) public view returns (address[] memory) {
        return VaultManagerLogic.getOperatorVaults(_getVaultManagerStorage(), operator);
    }

    function addToken(address token, uint208 price) public onlyRole(TOKEN_ADD_ROLE) {
        VaultManagerLogic.addToken(_getVaultManagerStorage(), _getNetworkConfigStorage(), token, price);
    }

    function updateTokenPrice(address token, uint208 price) public onlyRole(TOKEN_PRICE_UPDATE_ROLE) {
        VaultManagerLogic.updateTokenPrice(_getVaultManagerStorage(), _getNetworkConfigStorage(), token, price);
    }

    function removeToken(
        address token
    ) public onlyRole(TOKEN_REMOVE_ROLE) {
        VaultManagerLogic.removeToken(_getVaultManagerStorage(), _getNetworkConfigStorage(), token);
    }

    function addSharedVault(address vault, uint208 weight) public onlyRole(SHARED_VAULT_ADD_ROLE) {
        VaultManagerLogic.addSharedVault(
            _getVaultManagerStorage(), _getNetworkConfigStorage(), VAULT_FACTORY, vault, weight
        );
    }

    function addOperatorVault(
        address operator,
        address vault,
        uint208 weight
    ) public onlyRole(OPERATOR_VAULT_ADD_ROLE) {
        VaultManagerLogic.addOperatorVault(
            _getVaultManagerStorage(), _getNetworkConfigStorage(), VAULT_FACTORY, operator, vault, weight
        );
    }

    function updateVaultWeight(address vault, uint208 weight) public onlyRole(VAULT_WEIGHT_UPDATE_ROLE) {
        VaultManagerLogic.updateVaultWeight(_getVaultManagerStorage(), _getNetworkConfigStorage(), vault, weight);
    }

    function removeSharedVault(
        address vault
    ) public onlyRole(SHARED_VAULT_REMOVE_ROLE) {
        VaultManagerLogic.removeSharedVault(_getVaultManagerStorage(), _getNetworkConfigStorage(), vault);
    }

    function removeOperatorVault(address operator, address vault) public onlyRole(OPERATOR_VAULT_REMOVE_ROLE) {
        VaultManagerLogic.removeOperatorVault(_getVaultManagerStorage(), _getNetworkConfigStorage(), operator, vault);
    }

    function requestSlash(
        address operator,
        address vault,
        uint256 amount,
        uint48 captureTimestamp,
        bytes memory hints
    ) public onlyRole(SLASH_REQUEST_ROLE) {
        VaultManagerLogic.requestSlash(_getNetworkConfigStorage(), operator, vault, amount, captureTimestamp, hints);
    }

    function executeSlash(address vault, uint256 slashIndex, bytes memory hints) public onlyRole(SLASH_EXECUTE_ROLE) {
        VaultManagerLogic.executeSlash(vault, slashIndex, hints);
    }

    function _getVaultManagerStorage() internal pure returns (VaultManagerStorage storage $) {
        assembly ("memory-safe") {
            $.slot := VaultManagerStorageLocation
        }
    }

    function _initialize(uint64 initialVersion, address owner, bytes memory data) internal virtual override {
        VaultManagerInitParams memory initParams = abi.decode(data, (VaultManagerInitParams));
        super._initialize(initialVersion, owner, abi.encode(initParams.baseParams));

        VaultManagerLogic.initialize(_getVaultManagerStorage(), initParams);
    }
}
