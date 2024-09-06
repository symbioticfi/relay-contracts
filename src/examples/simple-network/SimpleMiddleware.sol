// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbiotic/interfaces/common/IEntity.sol";
import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {IBaseSlasher} from "@symbiotic/interfaces/slasher/IBaseSlasher.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";
import {IEntity} from "@symbiotic/interfaces/common/IEntity.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {VaultConnector} from "../../VaultConnector.sol";
import {KeyRegistry32} from "../../KeyRegistry32.sol";
import {BitMaps} from "../../libraries/BitMaps.sol";
import {Subsets} from "../../libraries/Subsets.sol";

contract SimpleMiddleware is VaultConnector, Ownable {
    using EnumerableSet for EnumerableSet.AddressSet;
    using KeyRegistry32 for KeyRegistry32.Registry;
    using BitMaps for BitMaps.BitMap;
    using Subnetwork for address;

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorNotRegistred();
    error OperarorGracePeriodNotPassed();
    error OperatorAlreadyRegistred();
    error NotOperatorKey();

    error SlashingWindowTooShort();

    struct ValidatorData {
        uint256 stake;
        bytes32 key;
    }

    address public immutable OPERATOR_REGISTRY;
    address public immutable OPERATOR_NET_OPTIN;
    address public immutable OWNER;
    uint48 public immutable EPOCH_DURATION;
    uint48 public immutable START_TIME;

    EnumerableSet.AddressSet private operators;
    BitMaps.BitMap internal operatorsStatus;
    KeyRegistry32.Registry private keyRegistry;

    constructor(
        address _network,
        address _operatorRegistry,
        address _vaultRegistry,
        address _operatorNetOptin,
        address _owner,
        uint48 _epochDuration,
        uint48 _slashingWindow
    ) VaultConnector(_network, _vaultRegistry, _slashingWindow) Ownable(_owner) {
        if (_slashingWindow < _epochDuration) {
            revert SlashingWindowTooShort();
        }

        START_TIME = Time.timestamp();
        EPOCH_DURATION = _epochDuration;
        OWNER = _owner;
        OPERATOR_REGISTRY = _operatorRegistry;
        OPERATOR_NET_OPTIN = _operatorNetOptin;
    }

    function getEpochStartTs(uint48 epoch) public view returns (uint48 timestamp) {
        return START_TIME + epoch * EPOCH_DURATION;
    }

    function getEpochAtTs(uint48 timestamp) public view returns (uint48 epoch) {
        return (timestamp - START_TIME) / EPOCH_DURATION;
    }

    function getCurrentEpoch() public view returns (uint48 epoch) {
        return getEpochAtTs(Time.timestamp());
    }

    function getEnabledVaults(uint48 epoch) external view returns (address[] memory _operatorVaults) {
        uint48 epochStartTs = getEpochStartTs(epoch);
        return _getEnabledSharedVaults(epochStartTs);
    }

    function getEnabledOperators(uint48 epoch) public view returns (address[] memory _operatorVaults) {
        uint48 epochStartTs = getEpochStartTs(epoch);
        return Subsets.getEnabledEnumerableAddressSubset(operators, operatorsStatus, epochStartTs);
    }

    function getOperatorByKey(bytes32 key) public view returns (address) {
        return keyRegistry.getOperatorByKey(key);
    }

    function getCurrentOperatorKey(address operator) public view returns (bytes32) {
        return getOperatorKeyAt(operator, Time.timestamp());
    }

    function getOperatorKeyAt(address operator, uint48 timestamp) public view returns (bytes32) {
        bytes32[] memory keys = keyRegistry.getEnabledOperatorKeysAt(operator, timestamp);
        if (keys.length == 0) {
            return bytes32(0);
        }
        return keys[0];
    }

    function setSubnetworks(uint256 _subnetworks) external onlyOwner {
        if (subnetworks >= _subnetworks) {
            revert InvalidSubnetworksCnt();
        }

        _setSubnetworks(_subnetworks);
    }

    function registerOperator(address operator, bytes32 key) external onlyOwner {
        if (operators.contains(operator)) {
            revert OperatorAlreadyRegistred();
        }

        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NET_OPTIN).isOptedIn(operator, NETWORK)) {
            revert OperatorNotOptedIn();
        }

        keyRegistry.registerOperatorKey(operator, key);
        keyRegistry.enableOperatorKey(operator, 0);

        operators.add(operator);
        Subsets.enable(operatorsStatus, operators.length() - 1, operators.length());
    }

    function updateOperatorKey(address operator, bytes32 key) external onlyOwner {
        if (!operators.contains(operator)) {
            revert OperatorNotRegistred();
        }

        address keyOperator = getOperatorByKey(key);

        if (keyOperator == address(0)) {
            keyRegistry.registerOperatorKey(operator, key);
            keyRegistry.enableOperatorKey(operator, 0);
            return;
        }

        if (keyOperator != operator) {
            revert NotOperatorKey();
        }

        bytes32 currentKey = getCurrentOperatorKey(operator);
        uint256 currenyKeyPosition = keyRegistry.getKeyPosition(currentKey);
        keyRegistry.disableOperatorKey(operator, currenyKeyPosition);

        uint256 position = keyRegistry.getKeyPosition(key);
        keyRegistry.enableOperatorKey(operator, position);
    }

    function enableOperator(address operator) external onlyOwner {
        uint256 position = operators._inner._positions[bytes32(uint256(uint160(operator)))] - 1;
        Subsets.enable(operatorsStatus, position, operators.length());
    }

    function disableOperator(address operator) external onlyOwner {
        uint256 position = operators._inner._positions[bytes32(uint256(uint160(operator)))] - 1;
        Subsets.disable(operatorsStatus, position, operators.length());
    }

    function registerVault(address vault) external onlyOwner {
        _registerVault(vault, true);
        Subsets.enable(sharedVaultsStatus, sharedVaults.length() - 1, sharedVaults.length());
    }

    function enableVault(address vault) external onlyOwner {
        uint256 position = sharedVaults._inner._positions[bytes32(uint256(uint160(vault)))] - 1;
        Subsets.enable(sharedVaultsStatus, position, sharedVaults.length());
    }

    function disableVault(address vault) external onlyOwner {
        uint256 position = sharedVaults._inner._positions[bytes32(uint256(uint160(vault)))] - 1;
        Subsets.disable(sharedVaultsStatus, position, sharedVaults.length());
    }

    function getOperatorStake(address operator, uint48 epoch) public view returns (uint256 stake) {
        uint48 epochStartTs = getEpochStartTs(epoch);
        return _getOperatorStake(operator, epochStartTs);
    }

    function getTotalStake(uint48 epoch) public view returns (uint256 totalStake) {
        uint48 epochStartTs = getEpochStartTs(epoch);

        if (epochStartTs < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        if (epochStartTs > Time.timestamp()) {
            revert InvalidEpoch();
        }

        address[] memory _operators = getEnabledOperators(epoch);

        for (uint256 i; i < _operators.length; ++i) {
            uint256 operatorStake = _getOperatorStake(_operators[i], epochStartTs);
            totalStake += operatorStake;
        }
    }

    function getValidatorSet(uint48 epoch) public view returns (ValidatorData[] memory validatorsData) {
        uint48 epochStartTs = getEpochStartTs(epoch);

        validatorsData = new ValidatorData[](operators.length());
        uint256 valIdx = 0;
        address[] memory _operators = getEnabledOperators(epoch);

        for (uint256 i; i < _operators.length; ++i) {
            address operator = _operators[i];

            bytes32 key = getOperatorKeyAt(operator, epochStartTs);
            if (key == bytes32(0)) {
                continue;
            }

            uint256 stake = _getOperatorStake(operator, epochStartTs);

            validatorsData[valIdx++] = ValidatorData(stake, key);
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(validatorsData, valIdx)
        }
    }

    // just for example, our devnets don't support slashing
    function slash(uint48 epoch, address operator, uint256 amount) public onlyOwner {
        uint48 epochStartTs = getEpochStartTs(epoch);
        _slash(epochStartTs, operator, amount);
    }
}
