// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Test, console2} from "forge-std/Test.sol";

import {SimpleMiddleware} from "src/examples/simple-network/SimpleMiddleware.sol";

import {VaultFactory} from "@symbiotic/contracts/VaultFactory.sol";
import {DelegatorFactory} from "@symbiotic/contracts/DelegatorFactory.sol";
import {SlasherFactory} from "@symbiotic/contracts/SlasherFactory.sol";
import {NetworkRegistry} from "@symbiotic/contracts/NetworkRegistry.sol";
import {OperatorRegistry} from "@symbiotic/contracts/OperatorRegistry.sol";
import {MetadataService} from "@symbiotic/contracts/service/MetadataService.sol";
import {NetworkMiddlewareService} from "@symbiotic/contracts/service/NetworkMiddlewareService.sol";
import {OptInService} from "@symbiotic/contracts/service/OptInService.sol";

import {Vault} from "@symbiotic/contracts/vault/Vault.sol";
import {NetworkRestakeDelegator} from "@symbiotic/contracts/delegator/NetworkRestakeDelegator.sol";
import {FullRestakeDelegator} from "@symbiotic/contracts/delegator/FullRestakeDelegator.sol";
import {Slasher} from "@symbiotic/contracts/slasher/Slasher.sol";
import {VetoSlasher} from "@symbiotic/contracts/slasher/VetoSlasher.sol";

import {Token} from "@symbiotic-test/mocks/Token.sol";
import {VaultConfigurator, IVaultConfigurator} from "@symbiotic/contracts/VaultConfigurator.sol";
import {IVault} from "@symbiotic/interfaces/IVaultConfigurator.sol";
import {INetworkRestakeDelegator} from "@symbiotic/interfaces/delegator/INetworkRestakeDelegator.sol";
import {IFullRestakeDelegator, IBaseDelegator} from "@symbiotic/interfaces/delegator/IFullRestakeDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IVaultStorage} from "@symbiotic/interfaces/vault/IVaultStorage.sol";
import {IVetoSlasher} from "@symbiotic/interfaces/slasher/IVetoSlasher.sol";
import {IBaseSlasher} from "@symbiotic/interfaces/slasher/IBaseSlasher.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract SimpleMiddlewareTest is Test {
    using Subnetwork for address;

    address owner;
    address alice;
    uint256 alicePrivateKey;
    address bob;
    uint256 bobPrivateKey;

    SimpleMiddleware simpleMiddleware;

    VaultFactory vaultFactory;
    DelegatorFactory delegatorFactory;
    SlasherFactory slasherFactory;
    NetworkRegistry networkRegistry;
    OperatorRegistry operatorRegistry;
    MetadataService operatorMetadataService;
    MetadataService networkMetadataService;
    NetworkMiddlewareService networkMiddlewareService;
    OptInService networkVaultOptInService;
    OptInService operatorVaultOptInService;
    OptInService operatorNetworkOptInService;

    Token collateral;
    VaultConfigurator vaultConfigurator;

    function setUp() public {
        owner = address(this);
        (alice, alicePrivateKey) = makeAddrAndKey("alice");
        (bob, bobPrivateKey) = makeAddrAndKey("bob");

        vaultFactory = new VaultFactory(owner);
        delegatorFactory = new DelegatorFactory(owner);
        slasherFactory = new SlasherFactory(owner);
        networkRegistry = new NetworkRegistry();
        operatorRegistry = new OperatorRegistry();
        operatorMetadataService = new MetadataService(address(operatorRegistry));
        networkMetadataService = new MetadataService(address(networkRegistry));
        networkMiddlewareService = new NetworkMiddlewareService(address(networkRegistry));
        operatorVaultOptInService = new OptInService(address(operatorRegistry), address(vaultFactory));
        operatorNetworkOptInService = new OptInService(address(operatorRegistry), address(networkRegistry));

        address vaultImpl =
            address(new Vault(address(delegatorFactory), address(slasherFactory), address(vaultFactory)));
        vaultFactory.whitelist(vaultImpl);

        address networkRestakeDelegatorImpl = address(
            new NetworkRestakeDelegator(
                address(networkRegistry),
                address(vaultFactory),
                address(operatorVaultOptInService),
                address(operatorNetworkOptInService),
                address(delegatorFactory),
                delegatorFactory.totalTypes()
            )
        );
        delegatorFactory.whitelist(networkRestakeDelegatorImpl);

        address fullRestakeDelegatorImpl = address(
            new FullRestakeDelegator(
                address(networkRegistry),
                address(vaultFactory),
                address(operatorVaultOptInService),
                address(operatorNetworkOptInService),
                address(delegatorFactory),
                delegatorFactory.totalTypes()
            )
        );
        delegatorFactory.whitelist(fullRestakeDelegatorImpl);

        address slasherImpl = address(
            new Slasher(
                address(vaultFactory),
                address(networkMiddlewareService),
                address(slasherFactory),
                slasherFactory.totalTypes()
            )
        );
        slasherFactory.whitelist(slasherImpl);

        address vetoSlasherImpl = address(
            new VetoSlasher(
                address(vaultFactory),
                address(networkMiddlewareService),
                address(networkRegistry),
                address(slasherFactory),
                slasherFactory.totalTypes()
            )
        );
        slasherFactory.whitelist(vetoSlasherImpl);

        vaultConfigurator =
            new VaultConfigurator(address(vaultFactory), address(delegatorFactory), address(slasherFactory));

        collateral = new Token("Token");
    }

    struct Data {
        uint256[3] deposits;
        uint256[3][2] networkLimits;
        uint256[3][3][2] operatorLimits;
    }

    function test_All(Data memory data) public {
        uint256 blockTimestamp = block.timestamp * block.timestamp / block.timestamp * block.timestamp / block.timestamp;
        blockTimestamp = blockTimestamp + 1_720_700_948;
        vm.warp(blockTimestamp);

        address network = address(11_111);
        simpleMiddleware = new SimpleMiddleware(
            network, address(operatorRegistry), address(vaultFactory), address(vaultFactory), alice, 1 days, 3 days
        );

        _registerNetwork(network, address(simpleMiddleware));

        uint256 subnetworksN = 2;
        vm.startPrank(alice);
        simpleMiddleware.setSubnetworks(subnetworksN);
        vm.stopPrank();

        uint256 vaultsN = 3;
        Vault[] memory vaults = new Vault[](vaultsN);
        address[] memory _vaults = new address[](vaultsN);
        for (uint256 i; i < vaultsN; ++i) {
            (Vault vault,,) = _getVaultAndDelegatorAndSlasher(7 days, 1 days);
            vaults[i] = vault;
            _vaults[i] = address(vault);

            vm.startPrank(alice);
            simpleMiddleware.registerVault(address(vault));
            vm.stopPrank();

            data.deposits[i] = bound(data.deposits[i], 1, 100 ether);
            _deposit(alice, vault, data.deposits[i]);

            for (uint96 j; j < subnetworksN; ++j) {
                data.networkLimits[j][i] = bound(data.networkLimits[j][i], 1, type(uint256).max);
                _setMaxNetworkLimit(network, FullRestakeDelegator(vault.delegator()), j, data.networkLimits[j][i]);
                _setNetworkLimit(
                    alice, FullRestakeDelegator(vault.delegator()), network.subnetwork(j), data.networkLimits[j][i]
                );
            }
        }

        uint256 operatorsN = 3;
        address[] memory operators = new address[](operatorsN);
        for (uint256 i; i < operatorsN; ++i) {
            address operator = address(uint160(111 + i));
            operators[i] = operator;

            _registerOperator(operator);

            _optInOperatorNetwork(operator, network);

            vm.startPrank(alice);
            simpleMiddleware.registerOperator(operator, bytes32(uint256(uint160(operator))));
            vm.stopPrank();

            for (uint256 j; j < vaultsN; ++j) {
                Vault vault = vaults[j];

                _optInOperatorVault(operator, vault);
            }

            simpleMiddleware.enableVaults(operator, _vaults);

            for (uint96 j; j < subnetworksN; ++j) {
                for (uint256 k; k < vaultsN; ++k) {
                    Vault vault = vaults[k];

                    data.operatorLimits[j][k][i] = bound(data.operatorLimits[j][k][i], 1, type(uint256).max);
                    _setOperatorNetworkLimit(
                        alice,
                        FullRestakeDelegator(vault.delegator()),
                        network.subnetwork(j),
                        operator,
                        data.operatorLimits[j][k][i]
                    );
                }
            }
        }

        blockTimestamp = blockTimestamp + 1;
        vm.warp(blockTimestamp);

        for (uint256 i; i < operatorsN; ++i) {
            address operator = operators[i];

            uint256 operatorStake;
            for (uint256 j; j < vaultsN; ++j) {
                Vault vault = Vault(vaults[j]);

                uint256 vaultStake;
                for (uint96 k; k < subnetworksN; ++k) {
                    bytes32 subnetwork = network.subnetwork(k);

                    vaultStake +=
                        Math.min(Math.min(data.operatorLimits[k][j][i], data.networkLimits[k][j]), data.deposits[j]);
                }

                operatorStake += Math.min(vaultStake, data.deposits[j]);
            }

            assertEq(operatorStake, simpleMiddleware.getOperatorStake(operator, 0));
        }
    }

    function _getVaultAndDelegatorAndSlasher(uint48 epochDuration, uint48 vetoDuration)
        internal
        returns (Vault, FullRestakeDelegator, VetoSlasher)
    {
        address[] memory networkLimitSetRoleHolders = new address[](1);
        networkLimitSetRoleHolders[0] = alice;
        address[] memory operatorNetworkLimitSetRoleHolders = new address[](1);
        operatorNetworkLimitSetRoleHolders[0] = alice;
        (address vault_, address delegator_, address slasher_) = vaultConfigurator.create(
            IVaultConfigurator.InitParams({
                version: vaultFactory.lastVersion(),
                owner: alice,
                vaultParams: IVault.InitParams({
                    collateral: address(collateral),
                    delegator: address(0),
                    slasher: address(0),
                    burner: address(0xdEaD),
                    epochDuration: epochDuration,
                    depositWhitelist: false,
                    defaultAdminRoleHolder: alice,
                    depositWhitelistSetRoleHolder: alice,
                    depositorWhitelistRoleHolder: alice
                }),
                delegatorIndex: 1,
                delegatorParams: abi.encode(
                    IFullRestakeDelegator.InitParams({
                        baseParams: IBaseDelegator.BaseParams({
                            defaultAdminRoleHolder: alice,
                            hook: address(0),
                            hookSetRoleHolder: alice
                        }),
                        networkLimitSetRoleHolders: networkLimitSetRoleHolders,
                        operatorNetworkLimitSetRoleHolders: operatorNetworkLimitSetRoleHolders
                    })
                ),
                withSlasher: true,
                slasherIndex: 1,
                slasherParams: abi.encode(IVetoSlasher.InitParams({vetoDuration: vetoDuration, resolverSetEpochsDelay: 3}))
            })
        );

        return (Vault(vault_), FullRestakeDelegator(delegator_), VetoSlasher(slasher_));
    }

    function _deposit(address user, Vault vault, uint256 amount)
        internal
        returns (uint256 depositedAmount, uint256 mintedShares)
    {
        collateral.transfer(user, amount);
        vm.startPrank(user);
        collateral.approve(address(vault), amount);
        (depositedAmount, mintedShares) = vault.deposit(user, amount);
        vm.stopPrank();
    }

    function _setNetworkLimit(address user, FullRestakeDelegator delegator, bytes32 subnetwork, uint256 amount)
        internal
    {
        vm.startPrank(user);
        delegator.setNetworkLimit(subnetwork, amount);
        vm.stopPrank();
    }

    function _setOperatorNetworkLimit(
        address user,
        FullRestakeDelegator delegator,
        bytes32 subnetwork,
        address operator,
        uint256 amount
    ) internal {
        vm.startPrank(user);
        delegator.setOperatorNetworkLimit(subnetwork, operator, amount);
        vm.stopPrank();
    }

    function _setMaxNetworkLimit(address user, FullRestakeDelegator delegator, uint96 identifier, uint256 amount)
        internal
    {
        vm.startPrank(user);
        delegator.setMaxNetworkLimit(identifier, amount);
        vm.stopPrank();
    }

    function _registerOperator(address user) internal {
        vm.startPrank(user);
        operatorRegistry.registerOperator();
        vm.stopPrank();
    }

    function _registerNetwork(address user, address middleware) internal {
        vm.startPrank(user);
        networkRegistry.registerNetwork();
        networkMiddlewareService.setMiddleware(middleware);
        vm.stopPrank();
    }

    function _optInOperatorVault(address user, Vault vault) internal {
        vm.startPrank(user);
        operatorVaultOptInService.optIn(address(vault));
        vm.stopPrank();
    }

    function _optOutOperatorVault(address user, Vault vault) internal {
        vm.startPrank(user);
        operatorVaultOptInService.optOut(address(vault));
        vm.stopPrank();
    }

    function _optInOperatorNetwork(address user, address network) internal {
        vm.startPrank(user);
        operatorNetworkOptInService.optIn(network);
        vm.stopPrank();
    }

    function _optOutOperatorNetwork(address user, address network) internal {
        vm.startPrank(user);
        operatorNetworkOptInService.optOut(network);
        vm.stopPrank();
    }
}
