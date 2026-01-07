// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import {
    PricedTokensChainlinkVPCalc
} from "../../../../../src/modules/voting-power/common/voting-power-calc/PricedTokensChainlinkVPCalc.sol";
import {
    WeightedTokensVPCalc
} from "../../../../../src/modules/voting-power/common/voting-power-calc/WeightedTokensVPCalc.sol";
import {
    WeightedVaultsVPCalc
} from "../../../../../src/modules/voting-power/common/voting-power-calc/WeightedVaultsVPCalc.sol";
import {VotingPowerCalcManager} from "../../../../../src/modules/voting-power/base/VotingPowerCalcManager.sol";
import {NoPermissionManager} from "../../../../mocks/NoPermissionManager.sol";

contract MockToken is ERC20 {
    uint8 private immutable _decimals;

    constructor(string memory name_, string memory symbol_, uint8 decimals_) ERC20(name_, symbol_) {
        _decimals = decimals_;
        _mint(msg.sender, type(uint128).max);
    }

    function decimals() public view override returns (uint8) {
        return _decimals;
    }
}

contract MultiCalcMock is PricedTokensChainlinkVPCalc, WeightedTokensVPCalc, WeightedVaultsVPCalc, NoPermissionManager {
    error CollateralNotSet();

    mapping(address vault => address collateral) private _vaultCollateral;
    mapping(address token => uint256 price) private _prices;

    function setVaultCollateral(address vault, address token) external {
        _vaultCollateral[vault] = token;
    }

    function setTokenPrice(address token, uint256 price) external {
        _prices[token] = price;
    }

    function _getCollateral(address vault) internal view override returns (address) {
        address collateral = _vaultCollateral[vault];
        if (collateral == address(0)) {
            revert CollateralNotSet();
        }
        return collateral;
    }

    function getTokenPriceAt(address token, uint48 timestamp) public view override returns (uint256) {
        timestamp;
        return _prices[token];
    }

    function getTokenPrice(address token) public view override returns (uint256) {
        return _prices[token];
    }

    function stakeToVotingPowerAt(address vault, uint256 stake, bytes memory extraData, uint48 timestamp)
        public
        view
        override(PricedTokensChainlinkVPCalc, WeightedTokensVPCalc, WeightedVaultsVPCalc)
        returns (uint256)
    {
        return super.stakeToVotingPowerAt(vault, stake, extraData, timestamp);
    }

    function stakeToVotingPower(address vault, uint256 stake, bytes memory extraData)
        public
        view
        override(PricedTokensChainlinkVPCalc, WeightedTokensVPCalc, WeightedVaultsVPCalc)
        returns (uint256)
    {
        return super.stakeToVotingPower(vault, stake, extraData);
    }
}

contract VotingPowerCalcsCompositionTest is Test {
    MultiCalcMock private calc;
    address private constant VAULT = address(0xBEEF);

    function setUp() public {
        calc = new MultiCalcMock();
    }

    function test_FactorsAppliedOnceWithStackedCalcs() public {
        MockToken token = new MockToken("Token", "TKN", 18);

        calc.setVaultCollateral(VAULT, address(token));
        calc.setTokenWeight(address(token), 2);
        calc.setVaultWeight(VAULT, 3);
        calc.setTokenPrice(address(token), 5);

        uint256 stake = 11;
        uint256 expected = stake * 2 * 3 * 5;

        assertEq(calc.stakeToVotingPower(VAULT, stake, ""), expected, "factors applied once");
        assertEq(
            calc.stakeToVotingPowerAt(VAULT, stake, "", uint48(block.timestamp)),
            expected,
            "factors applied once at timestamp"
        );
    }

    function test_NormalizationRunsOnceAcrossCalcs() public {
        MockToken token = new MockToken("LowDec", "LOW", 6);

        calc.setVaultCollateral(VAULT, address(token));
        calc.setTokenWeight(address(token), 2);
        calc.setVaultWeight(VAULT, 3);
        calc.setTokenPrice(address(token), 7);

        uint256 stake = 25_000_000; // 25 tokens with 6 decimals
        uint256 expected = stake * 1e12 * 2 * 3 * 7; // normalize to 18 decimals, then apply all factors once

        assertEq(calc.stakeToVotingPower(VAULT, stake, ""), expected, "normalization or factors were duplicated");
        assertEq(
            calc.stakeToVotingPowerAt(VAULT, stake, "", uint48(block.timestamp)),
            expected,
            "normalization or factors were duplicated for timestamped path"
        );
    }
}
