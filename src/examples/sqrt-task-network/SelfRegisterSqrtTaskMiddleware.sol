// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {INetworkRegistry} from "@symbiotic/interfaces/INetworkRegistry.sol";
import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

import {AccessManager} from "../../managers/extendable/AccessManager.sol";

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
import {SharedVaults} from "../../extensions/SharedVaults.sol";
import {SelfRegisterOperators} from "../../extensions/operators/SelfRegisterOperators.sol";

import {ECDSASig} from "../../extensions/managers/sigs/ECDSASig.sol";
import {OwnableAccessManager} from "../../extensions/managers/access/OwnableAccessManager.sol";
import {KeyManagerAddress} from "../../extensions/managers/keys/KeyManagerAddress.sol";
import {TimestampCapture} from "../../extensions/managers/capture-timestamps/TimestampCapture.sol";
import {EqualStakePower} from "../../extensions/managers/stake-powers/EqualStakePower.sol";

contract SelfRegisterSqrtTaskMiddleware is
    SharedVaults,
    SelfRegisterOperators,
    ECDSASig,
    KeyManagerAddress,
    OwnableAccessManager,
    TimestampCapture,
    EqualStakePower
{
    using Subnetwork for address;
    using Math for uint256;

    error InvalidHints();
    error TaskCompleted();
    error TooManyOperators();
    error TooManyOperatorVaults();
    error TooManySharedVaults();

    event CreateTask(uint256 indexed taskIndex, address indexed operator);
    event CompleteTask(uint256 indexed taskIndex, bool isValidAnswer);

    struct Task {
        uint48 captureTimestamp;
        uint256 value;
        address operator;
        bool completed;
    }

    bytes32 private constant COMPLETE_TASK_TYPEHASH = keccak256("CompleteTask(uint256 taskIndex,uint256 answer)");

    uint256 public constant MAX_OPERATORS = 300;
    uint256 public constant MAX_OPERATOR_VAULTS = 40;
    uint256 public constant MAX_SHARED_VAULTS = 60;

    Task[] public tasks;

    constructor(
        address networkRegistry,
        uint48 slashingWindow,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        address reader,
        address owner
    ) {
        initialize(networkRegistry, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin, reader, owner);
    }

    function initialize(
        address networkRegistry,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptin,
        address reader,
        address owner
    ) internal initializer {
        INetworkRegistry(networkRegistry).registerNetwork();
        __BaseMiddleware_init(address(this), slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin, reader);
        __OwnableAccessManager_init(owner);
        __SelfRegisterOperators_init("SelfRegisterSqrtTaskMiddleware");
    }

    // allow anyone to register shared vaults
    function _checkAccess() internal view override(AccessManager, OwnableAccessManager) {
        if (
            msg.sig == this.registerSharedVault.selector || msg.sig == this.unregisterSharedVault.selector
                || msg.sig == this.pauseSharedVault.selector
        ) {
            return;
        }
        OwnableAccessManager._checkAccess();
    }

    function createTask(uint256 value, address operator) external returns (uint256 taskIndex) {
        taskIndex = tasks.length;
        tasks.push(Task({captureTimestamp: getCaptureTimestamp(), value: value, operator: operator, completed: false}));

        emit CreateTask(taskIndex, operator);
    }

    function completeTask(
        uint256 taskIndex,
        uint256 answer,
        bytes calldata signature,
        bytes[] calldata stakeHints,
        bytes[] calldata slashHints
    ) external returns (bool isValidAnswer) {
        isValidAnswer = _verify(taskIndex, answer, signature);

        tasks[taskIndex].completed = true;

        if (!isValidAnswer) {
            _slash(taskIndex, stakeHints, slashHints);
        }

        emit CompleteTask(taskIndex, isValidAnswer);
    }

    function _verify(uint256 taskIndex, uint256 answer, bytes calldata signature) private view returns (bool) {
        if (tasks[taskIndex].completed) {
            revert TaskCompleted();
        }
        _verifySignature(taskIndex, answer, signature);
        return _verifyAnswer(taskIndex, answer);
    }

    function _verifySignature(uint256 taskIndex, uint256 answer, bytes calldata signature) private view {
        Task storage task = tasks[taskIndex];

        bytes32 hash_ = _hashTypedDataV4(keccak256(abi.encode(COMPLETE_TASK_TYPEHASH, taskIndex, answer)));

        if (!SignatureChecker.isValidSignatureNow(task.operator, hash_, signature)) {
            revert InvalidSignature();
        }
    }

    function _verifyAnswer(uint256 taskIndex, uint256 answer) private view returns (bool) {
        uint256 value = tasks[taskIndex].value;
        uint256 square = answer ** 2;
        if (square == value) {
            return true;
        }

        if (square < value) {
            uint256 difference = value - square;
            uint256 nextSquare = (answer + 1) ** 2;
            uint256 nextDifference = nextSquare > value ? nextSquare - value : value - nextSquare;
            if (difference <= nextDifference) {
                return true;
            }
        } else {
            uint256 difference = square - value;
            uint256 prevSquare = (answer - 1) ** 2;
            uint256 prevDifference = prevSquare > value ? prevSquare - value : value - prevSquare;
            if (difference <= prevDifference) {
                return true;
            }
        }

        return false;
    }

    function _slash(uint256 taskIndex, bytes[] calldata stakeHints, bytes[] calldata slashHints) private {
        Task storage task = tasks[taskIndex];
        address[] memory vaults = _activeVaultsAt(task.captureTimestamp, task.operator);
        uint256 vaultsLength = vaults.length;

        if (stakeHints.length != slashHints.length || stakeHints.length != vaultsLength) {
            revert InvalidHints();
        }

        bytes32 subnetwork = _NETWORK().subnetwork(0);
        for (uint256 i; i < vaultsLength; ++i) {
            address vault = vaults[i];
            uint256 slashAmount = IBaseDelegator(IVault(vault).delegator()).stakeAt(
                subnetwork, task.operator, task.captureTimestamp, stakeHints[i]
            );

            if (slashAmount == 0) {
                continue;
            }

            _slashVault(task.captureTimestamp, vault, subnetwork, task.operator, slashAmount, slashHints[i]);
        }
    }

    function executeSlash(
        uint48 epochStart,
        address vault,
        bytes32 subnetwork,
        address operator,
        uint256 amount,
        bytes memory hints
    ) external checkAccess {
        _slashVault(epochStart, vault, subnetwork, operator, amount, hints);
    }

    /// @notice Prevents DOS by limiting total number of shared vaults that can be registered
    /// @dev MAX_SHARED_VAULTS constant prevents unbounded iteration when looping through shared vaults
    function _beforeRegisterSharedVault(
        address sharedVault
    ) internal override {
        super._beforeRegisterSharedVault(sharedVault);
        if (_sharedVaultsLength() >= MAX_SHARED_VAULTS) {
            revert TooManySharedVaults();
        }
        IBaseDelegator(IVault(sharedVault).delegator()).setMaxNetworkLimit(DEFAULT_SUBNETWORK, type(uint256).max);
    }

    /// @notice Prevents DOS by limiting number of vaults per operator
    /// @dev MAX_OPERATOR_VAULTS constant prevents unbounded iteration when looping through an operator's vaults
    function _beforeRegisterOperatorVault(address operator, address vault) internal override {
        super._beforeRegisterOperatorVault(operator, vault);
        if (_operatorVaultsLength(operator) >= MAX_OPERATOR_VAULTS) {
            revert TooManyOperatorVaults();
        }
        IBaseDelegator(IVault(vault).delegator()).setMaxNetworkLimit(DEFAULT_SUBNETWORK, type(uint256).max);
    }

    /// @notice Prevents DOS by limiting total number of operators that can be registered
    /// @dev MAX_OPERATORS constant prevents unbounded iteration when looping through operators
    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual override {
        super._beforeRegisterOperator(operator, key, vault);
        if (_operatorsLength() >= MAX_OPERATORS) {
            revert TooManyOperators();
        }
    }
}
