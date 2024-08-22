// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbiotic/interfaces/common/IEntity.sol";
import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {IBaseSlasher} from "@symbiotic/interfaces/slasher/IBaseSlasher.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";
import {IEntity} from "@symbiotic/interfaces/common/IEntity.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {SimpleKeyRegistry32} from "../../SimpleKeyRegistry32.sol";
import {VaultConnector} from "../../VaultConnector.sol";
import {MapWithTimeData} from "../../libraries/MapWithTimeData.sol";

contract SimpleMiddleware is SimpleKeyRegistry32, VaultConnector, Ownable {
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    using MapWithTimeData for EnumerableMap.AddressToUintMap;
    using Subnetwork for address;

    error NotOperator();

    error OperatorNotOptedIn();
    error OperatorNotRegistred();
    error OperarorGracePeriodNotPassed();
    error OperatorAlreadyRegistred();

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

    EnumerableMap.AddressToUintMap private operators;

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

    function getOperatorVaults(address operator, uint48 epoch)
        internal
        view
        returns (address[] memory _operatorVaults)
    {
        uint48 epochStartTs = getEpochStartTs(epoch);
        return _getOperatorVaults(operator, epochStartTs);
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

        _updateKey(operator, key);

        operators.add(operator);
        operators.enable(operator);
    }

    function updateOperatorKey(address operator, bytes32 key) external onlyOwner {
        if (!operators.contains(operator)) {
            revert OperatorNotRegistred();
        }

        _updateKey(operator, key);
    }

    function pauseOperator(address operator) external onlyOwner {
        operators.disable(operator);
    }

    function unpauseOperator(address operator) external onlyOwner {
        operators.enable(operator);
    }

    function unregisterOperator(address operator) external onlyOwner {
        (, uint48 disabledTime) = operators.getTimes(operator);

        if (disabledTime == 0 || disabledTime + SLASHING_WINDOW > Time.timestamp()) {
            revert OperarorGracePeriodNotPassed();
        }

        operators.remove(operator);
    }

    function registerVault(address vault) external onlyOwner {
        _registerVault(vault);
    }

    function enableVaults(address operator, address[] memory _vaults) external onlyOwner {
        _enableVaults(operator, _vaults);
    }

    function disableVaults(address operator, address[] memory _vaults) external onlyOwner {
        _disableVaults(operator, _vaults);
    }

    function getOperatorStake(address operator, uint48 epoch) public view returns (uint256 stake) {
        uint48 epochStartTs = getEpochStartTs(epoch);
        return _getOperatorStake(operator, epochStartTs);
    }

    function getTotalStake(uint48 epoch) public view returns (uint256 totalStake) {
        uint48 epochStartTs = getEpochStartTs(epoch);

        // for epoch older than SLASHING_WINDOW total stake can be invalidated (use cache)
        if (epochStartTs < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        if (epochStartTs > Time.timestamp()) {
            revert InvalidEpoch();
        }

        for (uint256 i; i < operators.length(); ++i) {
            (address operator, bool wasActiveAt) = operators.atWithStatus(i, epochStartTs);

            // just skip operator if it was added after the target epoch or paused
            if (!wasActiveAt) {
                continue;
            }

            uint256 operatorStake = _getOperatorStake(operator, epochStartTs);
            totalStake += operatorStake;
        }
    }

    function getValidatorSet(uint48 epoch) public view returns (ValidatorData[] memory validatorsData) {
        uint48 epochStartTs = getEpochStartTs(epoch);

        validatorsData = new ValidatorData[](operators.length());
        uint256 valIdx = 0;

        for (uint256 i; i < operators.length(); ++i) {
            (address operator, bool wasActiveAt) = operators.atWithStatus(i, epochStartTs);

            // just skip operator if it was added after the target epoch or paused
            if (!wasActiveAt) {
                continue;
            }

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
