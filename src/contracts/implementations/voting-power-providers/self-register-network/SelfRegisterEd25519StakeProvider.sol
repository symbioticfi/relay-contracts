// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.25;

// import {BaseVotingPowerProvider} from "../../middleware/BaseVotingPowerProvider.sol";
// import {SharedVaults} from "../../extensions/SharedVaults.sol";
// import {SelfRegisterOperators} from "../../extensions/operators/SelfRegisterOperators.sol";

// import {OzOwnable} from "../../extensions/managers/permissions/OzOwnable.sol";
// import {TimestampCapture} from "../../extensions/managers/capture-timestamps/TimestampCapture.sol";
// import {EqualStakeToVP} from "../../extensions/managers/stakeToVotingPower/EqualStakeToVP.sol";
// import {EdDSASig} from "../../extensions/managers/sigs/EdDSASig.sol";

// contract SelfRegisterEd25519VotingPowerProvider is
//     SharedVaults,
//     SelfRegisterOperators,
//     EdDSASig,
//     OzOwnable,
//     TimestampCapture,
//     EqualStakeToVP
// {
//     /**
//      * @notice Constructor for initializing the SelfRegisterEd25519VotingPowerProvider contract
//      * @param network The address of the network
//      * @param subnetworkID The subnetwork ID
//      * @param slashingWindow The duration of the slashing window
//      * @param vaultFactory The address of the vault factory
//      * @param operatorRegistry The address of the operator registry
//      * @param operatorNetworkOptInService The address of the operator network opt-in service
//      * @param reader The address of the reader contract used for delegatecall
//      * @param owner The address of the owner
//      */
//     constructor(
//         address network,
//         uint96 subnetworkID,
//         uint48 slashingWindow,
//         address vaultFactory,
//         address operatorRegistry,
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
//         __BaseVotingPowerProvider_init(
//             network, subnetworkID, slashingWindow, vaultFactory, operatorRegistry, operatorNetworkOptInService, reader
//         );
//         __SelfRegisterOperators_init("SelfRegisterEd25519VotingPowerProvider", 0);
//         __OzOwnable_init(owner);
//     }
// }
