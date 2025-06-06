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

import {KeyTags} from "../../src/contracts/libraries/utils/KeyTags.sol";
import {KeyManagerLogic} from "../../src/contracts/base/logic/KeyManagerLogic.sol";

import {SigVerifierMock} from "../../test/mocks/SigVerifierMock.sol";

import "./InitSetup.s.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {SigVerifierBlsBn254ZK} from "../../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254ZK.sol";
import {SigVerifierBlsBn254Simple} from
    "../../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254Simple.sol";
import {Verifier as Verifier_10} from "../../src/contracts/implementations/sig-verifiers/zk/Verifier_10.sol";
import {Verifier as Verifier_100} from "../../src/contracts/implementations/sig-verifiers/zk/Verifier_100.sol";
import {Verifier as Verifier_1000} from "../../src/contracts/implementations/sig-verifiers/zk/Verifier_1000.sol";

// forge script script/test/SecondarySetup.s.sol:SecondarySetupScript 25235 --sig "run(uint256)" --rpc-url $ETH_RPC_URL_SECONDARY

contract SecondarySetupScript is InitSetupScript {
    using KeyTags for uint8;

    bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    struct SecondarySetupParams {
        Replica replica;
        SelfRegisterVotingPowerProvider votingPowerProvider;
    }

    function run(
        uint256 seed
    ) public virtual override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        SymbioticInit.run(seed);

        string memory obj = "data";
        string memory finalJson;
        (InitSetupParams memory initSetupParams, Vars memory vars) = loadInitSetupParamsAndVars();
        symbioticCore = initSetupParams.secondaryChain.core;
        SecondarySetupParams memory secondarySetupParams;

        vm.startBroadcast(vars.deployer.privateKey);
        secondarySetupParams.votingPowerProvider = new SelfRegisterVotingPowerProvider(
            address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
        );
        secondarySetupParams.votingPowerProvider.initialize(
            INetworkManager.NetworkManagerInitParams({
                network: vars.network.addr,
                subnetworkID: initSetupParams.subnetworkID
            }),
            IVaultManager.VaultManagerInitParams({slashingWindow: initSetupParams.slashingWindow}),
            IOzEIP712.OzEIP712InitParams({name: "SelfRegisterVotingPowerProvider", version: "1"}),
            IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperatorsInitParams({isWhitelistEnabled: false}),
            IOzOwnable.OzOwnableInitParams({owner: vars.network.addr})
        );
        vm.stopBroadcast();
        vm.serializeAddress(obj, "votingPowerProvider", address(secondarySetupParams.votingPowerProvider));

        _networkSetMiddleware_SymbioticCore(vars.network.addr, address(secondarySetupParams.votingPowerProvider));

        for (uint256 i; i < initSetupParams.secondaryChain.tokens.length; ++i) {
            vm.startBroadcast(vars.network.privateKey);
            secondarySetupParams.votingPowerProvider.registerToken(initSetupParams.secondaryChain.tokens[i]);
            vm.stopBroadcast();
        }
        for (uint256 i; i < initSetupParams.secondaryChain.vaults.length; ++i) {
            _setMaxNetworkLimit_SymbioticCore(
                vars.network.addr,
                initSetupParams.secondaryChain.vaults[i],
                initSetupParams.subnetworkID,
                type(uint256).max
            );
            _setNetworkLimit_SymbioticCore(
                vars.deployer.addr,
                initSetupParams.secondaryChain.vaults[i],
                secondarySetupParams.votingPowerProvider.SUBNETWORK(),
                type(uint256).max
            );
            for (uint256 j; j < vars.operators.length; ++j) {
                _setOperatorNetworkShares_SymbioticCore(
                    vars.deployer.addr,
                    initSetupParams.secondaryChain.vaults[i],
                    secondarySetupParams.votingPowerProvider.SUBNETWORK(),
                    vars.operators[j].addr,
                    1e18
                );
            }
            vm.startBroadcast(vars.network.privateKey);
            secondarySetupParams.votingPowerProvider.registerSharedVault(initSetupParams.secondaryChain.vaults[i]);
            vm.stopBroadcast();
        }

        for (uint256 i; i < vars.operators.length; ++i) {
            _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, vars.network.addr);

            for (uint256 j; j < initSetupParams.secondaryChain.vaults.length; ++j) {
                _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, initSetupParams.secondaryChain.vaults[j]);
            }

            vm.startBroadcast(vars.operators[i].privateKey);
            secondarySetupParams.votingPowerProvider.registerOperator(address(0));
            vm.stopBroadcast();
        }

        vm.startBroadcast(vars.network.privateKey);
        secondarySetupParams.replica = new Replica();
        uint8[] memory requiredKeyTags = new uint8[](2);
        requiredKeyTags[0] = KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15);
        requiredKeyTags[1] = KeyManagerLogic.KEY_TYPE_ECDSA_SECP256K1.getKeyTag(0);

        address sigVerifier;
        if (initSetupParams.sigVerifierType == 0) {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = address(new SigVerifierBlsBn254ZK(verifiers, maxValidators));
        } else if (initSetupParams.sigVerifierType == 1) {
            sigVerifier = address(new SigVerifierBlsBn254Simple());
        } else {
            revert("Invalid sig verifier type");
        }

        secondarySetupParams.replica.initialize(
            ISettlement.SettlementInitParams({
                networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                    network: vars.network.addr,
                    subnetworkID: initSetupParams.subnetworkID
                }),
                epochManagerInitParams: IEpochManager.EpochManagerInitParams({
                    epochDuration: initSetupParams.epochDuration,
                    epochDurationTimestamp: initSetupParams.zeroTimestamp
                }),
                ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "Middleware", version: "1"}),
                commitDuration: initSetupParams.commitDuration,
                prolongDuration: initSetupParams.prolongDuration,
                requiredKeyTag: KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15),
                sigVerifier: sigVerifier
            }),
            vars.deployer.addr
        );
        vm.stopBroadcast();
        finalJson = vm.serializeAddress(obj, "replica", address(secondarySetupParams.replica));

        console2.log("Secondary - VotingPowerProvider: ", address(secondarySetupParams.votingPowerProvider));
        console2.log("Secondary - Replica: ", address(secondarySetupParams.replica));

        vm.writeJson(finalJson, "script/test/data/secondary_setup_params.json");
    }

    function loadSecondarySetupParams() public returns (SecondarySetupParams memory secondarySetupParams) {
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/test/data/secondary_setup_params.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            secondarySetupParams = abi.decode(data, (SecondarySetupParams));
        }
    }
}
