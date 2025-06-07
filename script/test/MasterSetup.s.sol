// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";

import {ISettlement} from "../../src/interfaces/implementations/settlement/ISettlement.sol";
import {IOzOwnable} from "../../src/interfaces/features/permissions/IOzOwnable.sol";
import {INetworkManager} from "../../src/interfaces/base/INetworkManager.sol";
import {IEpochManager} from "../../src/interfaces/base/IEpochManager.sol";
import {IWhitelistSelfRegisterOperators} from
    "../../src/interfaces/features/registration/operators/extensions/IWhitelistSelfRegisterOperators.sol";
import {IOzEIP712} from "../../src/interfaces/base/common/IOzEIP712.sol";
import {IVaultManager} from "../../src/interfaces/base/IVaultManager.sol";
import {IConfigProvider} from "../../src/interfaces/implementations/settlement/IConfigProvider.sol";

import {KeyTags} from "../../src/contracts/libraries/utils/KeyTags.sol";
import {KeyManagerLogic} from "../../src/contracts/base/logic/KeyManagerLogic.sol";

import {SigVerifierMock} from "../../test/mocks/SigVerifierMock.sol";

import {KeyTags} from "../../src/contracts/libraries/utils/KeyTags.sol";
import {KeyEcdsaSecp256k1} from "../../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../../src/contracts/libraries/keys/KeyBlsBn254.sol";

import {BN254G2} from "../../test/helpers/BN254G2.sol";
import "./InitSetup.s.sol";

import {SigVerifierBlsBn254ZK} from "../../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254ZK.sol";
import {SigVerifierBlsBn254Simple} from
    "../../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254Simple.sol";
import {Verifier as Verifier_10} from "../../src/contracts/implementations/sig-verifiers/zk/Verifier_10.sol";
import {Verifier as Verifier_100} from "../../src/contracts/implementations/sig-verifiers/zk/Verifier_100.sol";
import {Verifier as Verifier_1000} from "../../src/contracts/implementations/sig-verifiers/zk/Verifier_1000.sol";

// forge script script/test/MasterSetup.s.sol:MasterSetupScript 25235 --sig "run(uint256)" --rpc-url $ETH_RPC_URL_MASTER

contract MasterSetupScript is InitSetupScript {
    using KeyTags for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;
    using SymbioticSubnetwork for address;

    struct MasterSetupParams {
        address keyRegistry;
        Master master;
        SelfRegisterVotingPowerProvider votingPowerProvider;
    }

    struct NetworkSetupParams {
        uint256 OPERATORS_TO_REGISTER;
        uint48 EPOCH_DURATION;
        uint48 COMMIT_DURATION;
        uint48 PROLONG_DURATION;
        uint48 SLASHING_WINDOW;
        uint32 VERIFICATION_TYPE;
        uint96 SUBNETWORK_ID;
    }

    struct LocalVars {
        uint8[] requiredKeyTags;
        IConfigProvider.CrossChainAddress[] votingPowerProviders;
        IConfigProvider.CrossChainAddress[] replicas;
        IConfigProvider.CrossChainAddress keysProvider;
        address sigVerifier;
    }

    function run(
        uint256 seed
    ) public virtual override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        SymbioticInit.run(seed);

        NetworkSetupParams memory networkSetupParams;

        networkSetupParams.OPERATORS_TO_REGISTER = vm.envOr("OPERATORS", uint256(4));
        networkSetupParams.EPOCH_DURATION = uint48(vm.envOr("EPOCH_DURATION", uint256(60)));
        networkSetupParams.COMMIT_DURATION = uint48(vm.envOr("COMMIT_DURATION", uint256(30)));
        networkSetupParams.PROLONG_DURATION = uint48(vm.envOr("PROLONG_DURATION", uint256(75)));
        networkSetupParams.SLASHING_WINDOW = uint48(vm.envOr("SLASHING_WINDOW", uint256(1200)));
        networkSetupParams.VERIFICATION_TYPE = uint32(vm.envOr("VERIFICATION_TYPE", uint256(1)));
        networkSetupParams.SUBNETWORK_ID = IDENTIFIER;

        if (networkSetupParams.OPERATORS_TO_REGISTER > SYMBIOTIC_CORE_NUMBER_OF_OPERATORS) {
            revert("Too many operators to register");
        }

        string memory obj = "data";
        string memory finalJson;
        (InitSetupParams memory initSetupParams, Vars memory vars) = loadInitSetupParamsAndVars();
        symbioticCore = initSetupParams.masterChain.core;
        MasterSetupParams memory masterSetupParams;


        vm.startBroadcast(vars.deployer.privateKey);
        masterSetupParams.votingPowerProvider = new SelfRegisterVotingPowerProvider(
            address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
        );
        masterSetupParams.votingPowerProvider.initialize(
            INetworkManager.NetworkManagerInitParams({
                network: vars.network.addr,
                subnetworkID: networkSetupParams.SUBNETWORK_ID
            }),
            IVaultManager.VaultManagerInitParams({slashingWindow: networkSetupParams.SLASHING_WINDOW}),
            IOzEIP712.OzEIP712InitParams({name: "SelfRegisterVotingPowerProvider", version: "1"}),
            IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperatorsInitParams({isWhitelistEnabled: false}),
            IOzOwnable.OzOwnableInitParams({owner: vars.network.addr})
        );
        vm.stopBroadcast();
        vm.serializeAddress(obj, "votingPowerProvider", address(masterSetupParams.votingPowerProvider));

        _networkSetMiddleware_SymbioticCore(vars.network.addr, address(masterSetupParams.votingPowerProvider));

        for (uint256 i; i < initSetupParams.masterChain.tokens.length; ++i) {
            vm.startBroadcast(vars.deployer.privateKey);
            masterSetupParams.votingPowerProvider.registerToken(initSetupParams.masterChain.tokens[i]);
            vm.stopBroadcast();
        }
        for (uint256 i; i < initSetupParams.masterChain.vaults.length; ++i) {
            vm.startBroadcast(vars.network.privateKey);
            masterSetupParams.votingPowerProvider.registerSharedVault(initSetupParams.masterChain.vaults[i]);
            vm.stopBroadcast();
        }

        masterSetupParams.keyRegistry = initSetupParams.keyRegistry;
        vm.serializeAddress(obj, "keyRegistry", initSetupParams.keyRegistry);

        for (uint256 i; i < networkSetupParams.OPERATORS_TO_REGISTER; ++i) {
            Vm.Wallet memory operator = getOperator(i);
            vm.startBroadcast(operator.privateKey);
            masterSetupParams.votingPowerProvider.registerOperator(address(0));
            vm.stopBroadcast();
        }

        vm.startBroadcast(vars.deployer.privateKey);
        masterSetupParams.master = new Master{salt: bytes32("master")}();
        {
            LocalVars memory localVars;
            
            localVars.requiredKeyTags = new uint8[](1);
            localVars.requiredKeyTags[0] = KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15);

            localVars.votingPowerProviders = new IConfigProvider.CrossChainAddress[](1);
            localVars.votingPowerProviders[0] = IConfigProvider.CrossChainAddress({
                addr: address(masterSetupParams.votingPowerProvider),
                chainId: uint64(initSetupParams.masterChain.chainId)
            });

            localVars.keysProvider = IConfigProvider.CrossChainAddress({
                addr: address(masterSetupParams.keyRegistry),
                chainId: uint64(initSetupParams.masterChain.chainId)
            });
            localVars.replicas = new IConfigProvider.CrossChainAddress[](0);
     
            if (networkSetupParams.VERIFICATION_TYPE == 0) {
                address[] memory verifiers = new address[](3);
                verifiers[0] = address(new Verifier_10());
                verifiers[1] = address(new Verifier_100());
                verifiers[2] = address(new Verifier_1000());
                uint256[] memory maxValidators = new uint256[](verifiers.length);
                maxValidators[0] = 10;
                maxValidators[1] = 100;
                maxValidators[2] = 1000;
                localVars.sigVerifier = address(new SigVerifierBlsBn254ZK(verifiers, maxValidators));
            } else if (networkSetupParams.VERIFICATION_TYPE == 1) {
                localVars.sigVerifier = address(new SigVerifierBlsBn254Simple());
            } else {
                revert("Invalid verification type");
            }

            masterSetupParams.master.initialize(
                ISettlement.SettlementInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: vars.network.addr,
                        subnetworkID: networkSetupParams.SUBNETWORK_ID
                    }),
                    epochManagerInitParams: IEpochManager.EpochManagerInitParams({
                        epochDuration: networkSetupParams.EPOCH_DURATION,
                        epochDurationTimestamp: uint48(vm.getBlockTimestamp() + vm.envUint("DEPLOYMENT_BUFFER"))
                    }),
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "Middleware", version: "1"}),
                    commitDuration: networkSetupParams.COMMIT_DURATION,
                    prolongDuration: networkSetupParams.PROLONG_DURATION,
                    requiredKeyTag: KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15),
                    sigVerifier: localVars.sigVerifier
                }),
                IConfigProvider.ConfigProviderInitParams({
                    votingPowerProviders: localVars.votingPowerProviders,
                    keysProvider: localVars.keysProvider,
                    replicas: localVars.replicas,
                    verificationType: networkSetupParams.VERIFICATION_TYPE,
                    maxVotingPower: 1e36,
                    minInclusionVotingPower: 0,
                    maxValidatorsCount: 99_999_999,
                    requiredKeyTags: localVars.requiredKeyTags
                }),
                vars.deployer.addr
            );
        }
        vm.stopBroadcast();
        finalJson = vm.serializeAddress(obj, "master", address(masterSetupParams.master));

        console2.log("-----------------------------------------------------------------------------------------------");
        console2.log("Network address: ", vars.network.addr);
        console2.log("VotingPowerProvider address: ", address(masterSetupParams.votingPowerProvider));
        console2.log("KeyRegistry address: ", address(masterSetupParams.keyRegistry));
        console2.log("Master address: ", address(masterSetupParams.master), "<--- USE THIS ADDRESS IN OFF-CHAIN CONFIG");
        console2.log("-----------------------------------------------------------------------------------------------");

        console2.log("-----------------------------------------------------------------------------------------------");
        console2.log("Network config: ");
        console2.log("  Subnetwork ID: ", networkSetupParams.SUBNETWORK_ID);
        console2.log("  Commit duration: ", networkSetupParams.COMMIT_DURATION);
        console2.log("  Prolong duration: ", networkSetupParams.PROLONG_DURATION);
        console2.log("  Slashing window: ", networkSetupParams.SLASHING_WINDOW);
        console2.log("  Epoch duration: ", networkSetupParams.EPOCH_DURATION);
        console2.log("  Verification type: ", networkSetupParams.VERIFICATION_TYPE == 0 ? "ZK" : "Simple");
        console2.log("-----------------------------------------------------------------------------------------------");

        console2.log("-----------------------------------------------------------------------------------------------");
        console2.log("Total voting power: ", masterSetupParams.votingPowerProvider.getTotalVotingPower(new bytes[](0)));
        console2.log("Registred operators: ", networkSetupParams.OPERATORS_TO_REGISTER);
        for (uint256 i; i < networkSetupParams.OPERATORS_TO_REGISTER; ++i) {
            Vm.Wallet memory operator = getOperator(i);
            console2.log("  ", operator.addr);
            console2.log("      Voting power: ", masterSetupParams.votingPowerProvider.getOperatorVotingPower(operator.addr, new bytes(0)));
            console2.log("      Private key: ", operator.privateKey);
        }
        console2.log("-----------------------------------------------------------------------------------------------");

        vm.writeJson(finalJson, "script/test/data/master_setup_params.json");
    }


    function loadMasterSetupParams() public returns (MasterSetupParams memory masterSetupParams) {
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "/script/test/data/master_setup_params.json");
        string memory json = vm.readFile(path);
        bytes memory data = vm.parseJson(json);
        masterSetupParams = abi.decode(data, (MasterSetupParams));
    }
}
