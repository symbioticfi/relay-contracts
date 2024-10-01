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
import {KeyManager32} from "../../KeyManager32.sol";

contract SimpleMiddleware is Ownable {
    using Subnetwork for address;

    error SlashingWindowTooShort();
    error TooOldEpoch();
    error InvalidEpoch();
    error InvalidSlash();

    struct ValidatorData {
        uint256 stake;
        bytes32 key;
    }

    address public immutable NETWORK;
    uint48 public immutable EPOCH_DURATION;
    uint48 public immutable START_TIME;
    uint48 public immutable SLASHING_WINDOW;

    address public immutable vaultManager;
    address public immutable operatorManager;
    address public immutable keyManager;

    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        address owner,
        uint48 epochDuration,
        uint48 slashingWindow
    ) Ownable(owner) {
        if (slashingWindow < epochDuration) {
            revert SlashingWindowTooShort();
        }

        vaultManager = address(new VaultManager(owner, network, vaultRegistry, slashingWindow));
        operatorManager =
            address(new OperatorManager(owner, network, operatorRegistry, operatorNetOptin, slashingWindow));
        keyManager = address(new KeyManager32(owner, slashingWindow));

        NETWORK = network;
        START_TIME = Time.timestamp();
        EPOCH_DURATION = epochDuration;
        SLASHING_WINDOW = slashingWindow;
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

    function getTotalStake(uint48 epoch) public view returns (uint256 totalStake) {
        uint48 epochStartTs = getEpochStartTs(epoch);

        if (epochStartTs < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        if (epochStartTs > Time.timestamp()) {
            revert InvalidEpoch();
        }

        address[] memory operators = OperatorManager(operatorManager).activeOperators(epochStartTs);

        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = VaultManager(vaultManager).getOperatorStake(operators[i], epochStartTs);
            totalStake += operatorStake;
        }
    }

    function getValidatorSet(uint48 epoch) public view returns (ValidatorData[] memory validatorSet) {
        uint48 epochStartTs = getEpochStartTs(epoch);

        address[] memory operators = OperatorManager(operatorManager).activeOperators(epochStartTs);
        validatorSet = new ValidatorData[](operators.length);
        uint256 len = 0;

        for (uint256 i; i < operators.length; ++i) {
            address operator = operators[i];

            bytes32 key = KeyManager32(keyManager).operatorKey(operator);
            if (key == bytes32(0) || !KeyManager32(keyManager).keyWasActiveAt(key, epochStartTs)) {
                continue;
            }

            uint256 stake = VaultManager(vaultManager).getOperatorStake(operator, epochStartTs);
            validatorSet[len++] = ValidatorData(stake, key);
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(validatorSet, len)
        }
    }

    // just for example, our devnets don't support slashing
    function slash(uint48 epoch, address operator, uint256 amount) public onlyOwner {
        uint48 epochStartTs = getEpochStartTs(epoch);
        uint256 totalStake = VaultManager(vaultManager).getOperatorStake(operator, epochStartTs);
        address[] memory vaults = VaultManager(vaultManager).activeVaults(operator, epochStartTs);

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint96 subnet = 0; subnet < VaultManager(vaultManager).subnetworks(); ++subnet) {
                bytes32 subnetwork = NETWORK.subnetwork(subnet);
                uint256 stake =
                    IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, epochStartTs, "");
                uint256 slashAmount = Math.mulDiv(amount, stake, totalStake);
                (bool success,) = vaultManager.delegatecall(
                    abi.encodeWithSelector(
                        VaultManager.slashVault.selector, epochStartTs, vault, subnetwork, operator, slashAmount
                    )
                );

                if (!success) {
                    revert InvalidSlash();
                }
            }
        }
    }
}
