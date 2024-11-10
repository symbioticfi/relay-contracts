// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {EIP712} from "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

import {DefaultVaultManager} from "../../vault-manager/DefaultVaultManager.sol";
import {DefaultOperatorManager} from "../../operator-manager/DefaultOperatorManager.sol";
import {DefaultKeyManager} from "../../key-manager/DefaultKeyManager.sol";

contract SqrtTaskMiddleware is DefaultVaultManager, DefaultOperatorManager, DefaultKeyManager, EIP712 {
    using Subnetwork for address;
    using Math for uint256;

    error InvalidHints();
    error InvalidSignature();
    error TaskCompleted();

    event CreateTask(uint256 indexed taskIndex);
    event CompleteTask(uint256 indexed taskIndex, bool isValidAnswer);

    struct Task {
        uint48 captureTimestamp;
        uint256 value;
        address operator;
        bool completed;
    }

    bytes32 private constant COMPLETE_TASK_TYPEHASH = keccak256("CompleteTask(uint256 taskIndex,uint256 answer)");

    Task[] public tasks;

    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        address owner,
        uint48 slashingWindow
    ) EIP712("SqrtTaskMiddleware", "1") {
        initialize(owner, network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin);
    }

    function createTask(uint256 value, address operator) external returns (uint256 taskIndex) {
        taskIndex = tasks.length;
        tasks.push(Task({captureTimestamp: getCaptureTimestamp(), value: value, operator: operator, completed: false}));

        emit CreateTask(taskIndex);
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
        address[] memory vaults = activeVaultsAt(task.captureTimestamp, task.operator);

        if (stakeHints.length != slashHints.length || stakeHints.length != vaults.length) {
            revert InvalidHints();
        }

        bytes32 subnetwork = NETWORK.subnetwork(0);
        for (uint256 i; i < vaults.length; ++i) {
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

    /* 
     * inheritdoc BaseMiddleware
     */
    function registerSubnetwork(uint96 subnetwork) public pure override {
        revert();
    }

    /* 
     * inheritdoc BaseMiddleware
     */
    function pauseSubnetwork(uint96 subnetwork) public pure override {
        revert();
    }

    /* 
     * inheritdoc BaseMiddleware
     */
    function unpauseSubnetwork(uint96 subnetwork) public pure override {
        revert();
    }

    /* 
     * inheritdoc BaseMiddleware
     */
    function unregisterSubnetwork(uint96 subnetwork) public pure override {
        revert();
    }
}
