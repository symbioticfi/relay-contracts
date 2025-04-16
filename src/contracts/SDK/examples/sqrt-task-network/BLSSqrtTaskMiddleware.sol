// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.25;

// import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
// import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
// import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

// import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

// import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
// import {SharedVaults} from "../../extensions/SharedVaults.sol";
// import {SelfRegisterOperators} from "../../extensions/operators/SelfRegisterOperators.sol";

// import {OwnableAccessManager} from "../../extensions/managers/access/OwnableAccessManager.sol";
// import {TimestampCapture} from "../../extensions/managers/capture-timestamps/TimestampCapture.sol";
// import {EqualStakePower} from "../../extensions/managers/stake-powers/EqualStakePower.sol";

// contract BLSSqrtTaskMiddleware is
//     SharedVaults,
//     SelfRegisterOperators,
//     OwnableAccessManager,
//     TimestampCapture,
//     EqualStakePower
// {
//     using Subnetwork for address;
//     using Math for uint256;

//     error InvalidHints();
//     error TaskCompleted();

//     event CreateTask(uint256 indexed taskIndex);
//     event CompleteTask(uint256 indexed taskIndex, bool isValidAnswer);

//     struct Task {
//         uint48 captureTimestamp;
//         uint48 deadlineTimestamp;
//         uint256 value;
//         bool completed;
//     }

//     uint48 public constant TASK_DURATION = 1 days;
//     Task[] public tasks;

//     constructor(
//         address network,
//         uint96 subnetworkID,
//         uint48 slashingWindow,
//         address operatorRegistry,
//         address vaultFactory,
//         address operatorNetworkOptInService,
//         address reader,
//         address owner
//     ) {
//         initialize(
//             network, subnetworkID, slashingWindow, vaultFactory, operatorRegistry, operatorNetworkOptInService, reader, owner
//         );
//     }

//     function initialize(
//         address network,
//         uint96 subnetworkID,
//         uint48 slashingWindow,
//         address vaultFactory,
//         address operatorRegistry,
//         address operatorNetworkOptInService,
//         address reader,
//         address owner
//     ) internal initializer {
//         __BaseMiddleware_init(
//             network, subnetworkID, slashingWindow, vaultFactory, operatorRegistry, operatorNetworkOptInService, reader
//         );
//         __OwnableAccessManager_init(owner);
//         __SelfRegisterOperators_init("BLS Sqrt Task", 0);
//     }

//     function createTask(uint256 value, address operator) external returns (uint256 taskIndex) {
//         taskIndex = tasks.length;
//         tasks.push(
//             Task({
//                 captureTimestamp: getCaptureTimestamp(),
//                 deadlineTimestamp: getCaptureTimestamp() + TASK_DURATION,
//                 value: value,
//                 completed: false
//             })
//         );

//         emit CreateTask(taskIndex);
//     }

//     function completeTask(
//         uint256 taskIndex,
//         uint256 answer,
//         bytes calldata signature
//     ) external returns (bool isValidAnswer) {
//         if (!_verify(taskIndex, answer, signature)) {
//             // revert InvalidAnswer();
//         }

//         tasks[taskIndex].completed = true;
//         emit CompleteTask(taskIndex, true);
//     }

//     function _verify(uint256 taskIndex, uint256 answer, bytes calldata signature) internal view returns (bool) {
//         if (tasks[taskIndex].completed) {
//             revert TaskCompleted();
//         }
//         // _verifySignature(taskIndex, answer, signature);
//         return _verifyAnswer(taskIndex, answer);
//     }

//     function _verifyAnswer(uint256 taskIndex, uint256 answer) internal view returns (bool) {
//         uint256 value = tasks[taskIndex].value;
//         uint256 square = answer ** 2;
//         if (square == value) {
//             return true;
//         }

//         if (square < value) {
//             uint256 difference = value - square;
//             uint256 nextSquare = (answer + 1) ** 2;
//             uint256 nextDifference = nextSquare > value ? nextSquare - value : value - nextSquare;
//             if (difference <= nextDifference) {
//                 return true;
//             }
//         } else {
//             uint256 difference = square - value;
//             uint256 prevSquare = (answer - 1) ** 2;
//             uint256 prevDifference = prevSquare > value ? prevSquare - value : value - prevSquare;
//             if (difference <= prevDifference) {
//                 return true;
//             }
//         }

//         return false;
//     }

//     // function _slash(uint256 taskIndex, bytes[] calldata stakeHints, bytes[] calldata slashHints) internal {
//     //     Task storage task = tasks[taskIndex];
//     //     address[] memory vaults = _activeVaultsAt(task.captureTimestamp, task.operator);
//     //     uint256 vaultsLength = vaults.length;

//     //     if (stakeHints.length != slashHints.length || stakeHints.length != vaultsLength) {
//     //         revert InvalidHints();
//     //     }

//     //     bytes32 subnetwork = SUBNETWORK;
//     //     for (uint256 i; i < vaultsLength; ++i) {
//     //         address vault = vaults[i];
//     //         uint256 slashAmount = IBaseDelegator(IVault(vault).delegator()).stakeAt(
//     //             subnetwork, task.operator, task.captureTimestamp, stakeHints[i]
//     //         );

//     //         if (slashAmount == 0) {
//     //             continue;
//     //         }

//     //         _slashVault(task.captureTimestamp, vault, task.operator, slashAmount, slashHints[i]);
//     //     }
//     // }

//     // function executeSlash(
//     //     uint48 epochStart,
//     //     address vault,
//     //     address operator,
//     //     uint256 amount,
//     //     bytes memory hints
//     // ) external checkAccess {
//     //     _slashVault(epochStart, vault, operator, amount, hints);
//     // }
// }
