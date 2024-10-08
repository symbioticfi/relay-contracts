// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {VaultManager} from "../../VaultManager.sol";
import {OperatorManager} from "../../OperatorManager.sol";
import {KeyManager} from "../../KeyManager.sol";
import {MiddlewareStorage} from "../..//MiddlewareStorage.sol";

contract SimpleMiddleware is VaultManager, OperatorManager, KeyManager {
    using Subnetwork for address;

    error SlashingWindowTooShort();
    error InactiveKeySlash();
    error NotExistKeySlash();
    error InvalidHints();

    struct ValidatorData {
        uint256 power;
        bytes32 key;
    }

    uint48 public immutable EPOCH_DURATION;
    uint48 public immutable START_TIME;

    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        address owner,
        uint48 epochDuration,
        uint48 slashingWindow
    ) MiddlewareStorage(owner, network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin) {
        if (slashingWindow < epochDuration) {
            revert SlashingWindowTooShort();
        }

        EPOCH_DURATION = epochDuration;
        SLASHING_WINDOW = slashingWindow;
    }

    function getEpochStart(uint48 epoch) public view returns (uint48 timestamp) {
        return START_TIME + epoch * EPOCH_DURATION;
    }

    function getEpochAt(uint48 timestamp) public view returns (uint48 epoch) {
        return (timestamp - START_TIME) / EPOCH_DURATION;
    }

    function getCurrentEpoch() public view returns (uint48 epoch) {
        return getEpochAt(Time.timestamp());
    }

    function getCurrentEpochStart() public view returns (uint48 timestamp) {
        return START_TIME + getCurrentEpoch() * EPOCH_DURATION;
    }

    function getTotalStake() public view returns (uint256) {
        uint48 epochStart = getCurrentEpochStart();
        address[] memory operators = activeOperators(epochStart);

        return totalStake(epochStart, operators);
    }

    function getValidatorSet() public view returns (ValidatorData[] memory validatorSet) {
        uint48 epochStart = getCurrentEpochStart();

        address[] memory operators = activeOperators(epochStart);
        validatorSet = new ValidatorData[](operators.length);
        uint256 len = 0;

        for (uint256 i; i < operators.length; ++i) {
            address operator = operators[i];

            bytes32 key = operatorKey(operator);
            if (key == bytes32(0) || !keyWasActiveAt(key, epochStart)) {
                continue;
            }

            uint256 power = getOperatorPower(operator, epochStart);
            validatorSet[len++] = ValidatorData(power, key);
        }

        assembly ("memory-safe") {
            mstore(validatorSet, len)
        }
    }

    // Here are the hints getter
    // https://github.com/symbioticfi/core/blob/main/src/contracts/hints/SlasherHints.sol
    // https://github.com/symbioticfi/core/blob/main/src/contracts/hints/DelegatorHints.sol
    function slash(
        uint48 epoch,
        bytes32 key,
        uint256 amount,
        bytes[][] calldata stakeHints,
        bytes[] calldata slashHints
    ) public onlyOwner returns (SlashResponse[] memory slashResponses) {
        uint48 epochStart = getEpochStart(epoch);
        address operator = operatorByKey(key);

        if (operator == address(0)) {
            revert NotExistKeySlash();
        }

        if (!keyWasActiveAt(key, epochStart)) {
            revert InactiveKeySlash();
        }

        uint256 totalStake = getOperatorStake(operator, epochStart);
        address[] memory vaults = activeVaults(operator, epochStart);
        uint160[] memory _subnetworks = activeSubnetworks(epochStart);

        slashResponses = new SlashResponse[](vaults.length * _subnetworks.length);
        uint256 len = 0;

        if (stakeHints.length != slashHints.length || stakeHints.length != vaults.length) {
            revert InvalidHints();
        }

        for (uint256 i; i < vaults.length; ++i) {
            if (stakeHints[i].length != _subnetworks.length) {
                revert InvalidHints();
            }

            address vault = vaults[i];
            for (uint256 j = 0; j < _subnetworks.length; ++j) {
                bytes32 subnetwork = NETWORK.subnetwork(uint96(_subnetworks[j]));
                uint256 stake = IBaseDelegator(IVault(vault).delegator()).stakeAt(
                    subnetwork, operator, epochStart, stakeHints[i][j]
                );

                uint256 slashAmount = Math.mulDiv(amount, stake, totalStake);
                if (slashAmount == 0) {
                    continue;
                }

                slashResponses[len++] = slashVault(epochStart, vault, subnetwork, operator, slashAmount, slashHints[i]);
            }
        }

        assembly ("memory-safe") {
            mstore(slashResponses, len)
        }
    }
}
