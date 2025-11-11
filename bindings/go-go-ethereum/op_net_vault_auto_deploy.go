// Code generated - DO NOT EDIT.
// This file is a generated binding and any manual changes will be lost.

package relaycontracts

import (
	"errors"
	"math/big"
	"strings"

	ethereum "github.com/ethereum/go-ethereum"
	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/event"
)

// Reference imports to suppress errors if they are not otherwise used.
var (
	_ = errors.New
	_ = big.NewInt
	_ = strings.NewReader
	_ = ethereum.NotFound
	_ = bind.Bind
	_ = common.Big1
	_ = types.BloomLookup
	_ = event.NewSubscription
	_ = abi.ConvertType
)

// IOpNetVaultAutoDeployAutoDeployConfig is an auto generated low-level Go binding around an user-defined struct.
type IOpNetVaultAutoDeployAutoDeployConfig struct {
	EpochDuration *big.Int
	Collateral    common.Address
	Burner        common.Address
	WithSlasher   bool
	IsBurnerHook  bool
}

// IVotingPowerProviderOperatorVotingPower is an auto generated low-level Go binding around an user-defined struct.
type IVotingPowerProviderOperatorVotingPower struct {
	Operator common.Address
	Vaults   []IVotingPowerProviderVaultValue
}

// IVotingPowerProviderVaultValue is an auto generated low-level Go binding around an user-defined struct.
type IVotingPowerProviderVaultValue struct {
	Vault common.Address
	Value *big.Int
}

// OpNetVaultAutoDeployMetaData contains all meta data concerning the OpNetVaultAutoDeploy contract.
var OpNetVaultAutoDeployMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"NETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"OPERATOR_REGISTRY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK_IDENTIFIER\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint96\",\"internalType\":\"uint96\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VAULT_CONFIGURATOR\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VAULT_FACTORY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"eip712Domain\",\"inputs\":[],\"outputs\":[{\"name\":\"fields\",\"type\":\"bytes1\",\"internalType\":\"bytes1\"},{\"name\":\"name\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"salt\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"extensions\",\"type\":\"uint256[]\",\"internalType\":\"uint256[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getAutoDeployConfig\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getAutoDeployedVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakes\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakesAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaults\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaultsAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowers\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowersAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaults\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaultsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingData\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingDataAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokens\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokensAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowers\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowersAt\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4CrossChain\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"invalidateOldSignatures\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"isAutoDeployEnabled\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSetMaxNetworkLimitHookEnabled\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegistered\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegisteredAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"multicall\",\"inputs\":[{\"name\":\"data\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"results\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"nonces\",\"inputs\":[{\"name\":\"owner\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"registerOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"registerOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setAutoDeployConfig\",\"inputs\":[{\"name\":\"config\",\"type\":\"tuple\",\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setAutoDeployStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setSetMaxNetworkLimitHookStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"stakeToVotingPower\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"power\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"stakeToVotingPowerAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"power\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"staticDelegateCall\",\"inputs\":[{\"name\":\"target\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"data\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"EIP712DomainChanged\",\"inputs\":[],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitEIP712\",\"inputs\":[{\"name\":\"name\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitSubnetwork\",\"inputs\":[{\"name\":\"network\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"},{\"name\":\"subnetworkId\",\"type\":\"uint96\",\"indexed\":false,\"internalType\":\"uint96\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetAutoDeployConfig\",\"inputs\":[{\"name\":\"config\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetAutoDeployStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSetMaxNetworkLimitHookStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSlashingData\",\"inputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"AddressEmptyCode\",\"inputs\":[{\"name\":\"target\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"type\":\"error\",\"name\":\"FailedCall\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidAccountNonce\",\"inputs\":[{\"name\":\"account\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"currentNonce\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NetworkManager_InvalidNetwork\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidBurnerHook\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidCollateral\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidEpochDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidWithSlasher\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperator\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperatorVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSharedVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidToken\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorAlreadyRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenNotRegistered\",\"inputs\":[]}]",
}

// OpNetVaultAutoDeployABI is the input ABI used to generate the binding from.
// Deprecated: Use OpNetVaultAutoDeployMetaData.ABI instead.
var OpNetVaultAutoDeployABI = OpNetVaultAutoDeployMetaData.ABI

// OpNetVaultAutoDeploy is an auto generated Go binding around an Ethereum contract.
type OpNetVaultAutoDeploy struct {
	OpNetVaultAutoDeployCaller     // Read-only binding to the contract
	OpNetVaultAutoDeployTransactor // Write-only binding to the contract
	OpNetVaultAutoDeployFilterer   // Log filterer for contract events
}

// OpNetVaultAutoDeployCaller is an auto generated read-only Go binding around an Ethereum contract.
type OpNetVaultAutoDeployCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// OpNetVaultAutoDeployTransactor is an auto generated write-only Go binding around an Ethereum contract.
type OpNetVaultAutoDeployTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// OpNetVaultAutoDeployFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type OpNetVaultAutoDeployFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// OpNetVaultAutoDeploySession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type OpNetVaultAutoDeploySession struct {
	Contract     *OpNetVaultAutoDeploy // Generic contract binding to set the session for
	CallOpts     bind.CallOpts         // Call options to use throughout this session
	TransactOpts bind.TransactOpts     // Transaction auth options to use throughout this session
}

// OpNetVaultAutoDeployCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type OpNetVaultAutoDeployCallerSession struct {
	Contract *OpNetVaultAutoDeployCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts               // Call options to use throughout this session
}

// OpNetVaultAutoDeployTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type OpNetVaultAutoDeployTransactorSession struct {
	Contract     *OpNetVaultAutoDeployTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts               // Transaction auth options to use throughout this session
}

// OpNetVaultAutoDeployRaw is an auto generated low-level Go binding around an Ethereum contract.
type OpNetVaultAutoDeployRaw struct {
	Contract *OpNetVaultAutoDeploy // Generic contract binding to access the raw methods on
}

// OpNetVaultAutoDeployCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type OpNetVaultAutoDeployCallerRaw struct {
	Contract *OpNetVaultAutoDeployCaller // Generic read-only contract binding to access the raw methods on
}

// OpNetVaultAutoDeployTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type OpNetVaultAutoDeployTransactorRaw struct {
	Contract *OpNetVaultAutoDeployTransactor // Generic write-only contract binding to access the raw methods on
}

// NewOpNetVaultAutoDeploy creates a new instance of OpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewOpNetVaultAutoDeploy(address common.Address, backend bind.ContractBackend) (*OpNetVaultAutoDeploy, error) {
	contract, err := bindOpNetVaultAutoDeploy(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeploy{OpNetVaultAutoDeployCaller: OpNetVaultAutoDeployCaller{contract: contract}, OpNetVaultAutoDeployTransactor: OpNetVaultAutoDeployTransactor{contract: contract}, OpNetVaultAutoDeployFilterer: OpNetVaultAutoDeployFilterer{contract: contract}}, nil
}

// NewOpNetVaultAutoDeployCaller creates a new read-only instance of OpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewOpNetVaultAutoDeployCaller(address common.Address, caller bind.ContractCaller) (*OpNetVaultAutoDeployCaller, error) {
	contract, err := bindOpNetVaultAutoDeploy(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployCaller{contract: contract}, nil
}

// NewOpNetVaultAutoDeployTransactor creates a new write-only instance of OpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewOpNetVaultAutoDeployTransactor(address common.Address, transactor bind.ContractTransactor) (*OpNetVaultAutoDeployTransactor, error) {
	contract, err := bindOpNetVaultAutoDeploy(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployTransactor{contract: contract}, nil
}

// NewOpNetVaultAutoDeployFilterer creates a new log filterer instance of OpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewOpNetVaultAutoDeployFilterer(address common.Address, filterer bind.ContractFilterer) (*OpNetVaultAutoDeployFilterer, error) {
	contract, err := bindOpNetVaultAutoDeploy(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployFilterer{contract: contract}, nil
}

// bindOpNetVaultAutoDeploy binds a generic wrapper to an already deployed contract.
func bindOpNetVaultAutoDeploy(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := OpNetVaultAutoDeployMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _OpNetVaultAutoDeploy.Contract.OpNetVaultAutoDeployCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.OpNetVaultAutoDeployTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.OpNetVaultAutoDeployTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _OpNetVaultAutoDeploy.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.contract.Transact(opts, method, params...)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) NETWORK(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "NETWORK")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) NETWORK() (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.NETWORK(&_OpNetVaultAutoDeploy.CallOpts)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) NETWORK() (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.NETWORK(&_OpNetVaultAutoDeploy.CallOpts)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) OPERATORREGISTRY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "OPERATOR_REGISTRY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) OPERATORREGISTRY() (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.OPERATORREGISTRY(&_OpNetVaultAutoDeploy.CallOpts)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) OPERATORREGISTRY() (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.OPERATORREGISTRY(&_OpNetVaultAutoDeploy.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) SUBNETWORK(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "SUBNETWORK")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) SUBNETWORK() ([32]byte, error) {
	return _OpNetVaultAutoDeploy.Contract.SUBNETWORK(&_OpNetVaultAutoDeploy.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) SUBNETWORK() ([32]byte, error) {
	return _OpNetVaultAutoDeploy.Contract.SUBNETWORK(&_OpNetVaultAutoDeploy.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) SUBNETWORKIDENTIFIER(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "SUBNETWORK_IDENTIFIER")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.SUBNETWORKIDENTIFIER(&_OpNetVaultAutoDeploy.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.SUBNETWORKIDENTIFIER(&_OpNetVaultAutoDeploy.CallOpts)
}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) VAULTCONFIGURATOR(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "VAULT_CONFIGURATOR")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) VAULTCONFIGURATOR() (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.VAULTCONFIGURATOR(&_OpNetVaultAutoDeploy.CallOpts)
}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) VAULTCONFIGURATOR() (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.VAULTCONFIGURATOR(&_OpNetVaultAutoDeploy.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) VAULTFACTORY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "VAULT_FACTORY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) VAULTFACTORY() (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.VAULTFACTORY(&_OpNetVaultAutoDeploy.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) VAULTFACTORY() (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.VAULTFACTORY(&_OpNetVaultAutoDeploy.CallOpts)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) Eip712Domain(opts *bind.CallOpts) (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "eip712Domain")

	outstruct := new(struct {
		Fields            [1]byte
		Name              string
		Version           string
		ChainId           *big.Int
		VerifyingContract common.Address
		Salt              [32]byte
		Extensions        []*big.Int
	})
	if err != nil {
		return *outstruct, err
	}

	outstruct.Fields = *abi.ConvertType(out[0], new([1]byte)).(*[1]byte)
	outstruct.Name = *abi.ConvertType(out[1], new(string)).(*string)
	outstruct.Version = *abi.ConvertType(out[2], new(string)).(*string)
	outstruct.ChainId = *abi.ConvertType(out[3], new(*big.Int)).(**big.Int)
	outstruct.VerifyingContract = *abi.ConvertType(out[4], new(common.Address)).(*common.Address)
	outstruct.Salt = *abi.ConvertType(out[5], new([32]byte)).(*[32]byte)
	outstruct.Extensions = *abi.ConvertType(out[6], new([]*big.Int)).(*[]*big.Int)

	return *outstruct, err

}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _OpNetVaultAutoDeploy.Contract.Eip712Domain(&_OpNetVaultAutoDeploy.CallOpts)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _OpNetVaultAutoDeploy.Contract.Eip712Domain(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetAutoDeployConfig(opts *bind.CallOpts) (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getAutoDeployConfig")

	if err != nil {
		return *new(IOpNetVaultAutoDeployAutoDeployConfig), err
	}

	out0 := *abi.ConvertType(out[0], new(IOpNetVaultAutoDeployAutoDeployConfig)).(*IOpNetVaultAutoDeployAutoDeployConfig)

	return out0, err

}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetAutoDeployConfig() (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	return _OpNetVaultAutoDeploy.Contract.GetAutoDeployConfig(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetAutoDeployConfig() (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	return _OpNetVaultAutoDeploy.Contract.GetAutoDeployConfig(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetAutoDeployedVault(opts *bind.CallOpts, operator common.Address) (common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getAutoDeployedVault", operator)

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetAutoDeployedVault(operator common.Address) (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetAutoDeployedVault(&_OpNetVaultAutoDeploy.CallOpts, operator)
}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetAutoDeployedVault(operator common.Address) (common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetAutoDeployedVault(&_OpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetOperatorStakes(opts *bind.CallOpts, operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorStakes", operator)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorStakes(&_OpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorStakes(&_OpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetOperatorStakesAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorStakesAt", operator, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorStakesAt(&_OpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorStakesAt(&_OpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetOperatorVaults(opts *bind.CallOpts, operator common.Address) ([]common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorVaults", operator)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorVaults(&_OpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorVaults(&_OpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetOperatorVaultsAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorVaultsAt", operator, timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorVaultsAt(&_OpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorVaultsAt(&_OpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetOperatorVotingPowers(opts *bind.CallOpts, operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorVotingPowers", operator, extraData)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorVotingPowers(&_OpNetVaultAutoDeploy.CallOpts, operator, extraData)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorVotingPowers(&_OpNetVaultAutoDeploy.CallOpts, operator, extraData)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetOperatorVotingPowersAt(opts *bind.CallOpts, operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorVotingPowersAt", operator, extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorVotingPowersAt(&_OpNetVaultAutoDeploy.CallOpts, operator, extraData, timestamp)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorVotingPowersAt(&_OpNetVaultAutoDeploy.CallOpts, operator, extraData, timestamp)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetOperators(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperators")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetOperators() ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperators(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetOperators() ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperators(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetOperatorsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorsAt(&_OpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetOperatorsAt(&_OpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetSharedVaults(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getSharedVaults")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetSharedVaults() ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetSharedVaults(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetSharedVaults() ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetSharedVaults(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetSharedVaultsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getSharedVaultsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetSharedVaultsAt(&_OpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetSharedVaultsAt(&_OpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool, uint48)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetSlashingData(opts *bind.CallOpts) (bool, *big.Int, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getSlashingData")

	if err != nil {
		return *new(bool), *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)
	out1 := *abi.ConvertType(out[1], new(*big.Int)).(**big.Int)

	return out0, out1, err

}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool, uint48)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetSlashingData() (bool, *big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.GetSlashingData(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool, uint48)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetSlashingData() (bool, *big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.GetSlashingData(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool, uint48)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetSlashingDataAt(opts *bind.CallOpts, timestamp *big.Int, hint []byte) (bool, *big.Int, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getSlashingDataAt", timestamp, hint)

	if err != nil {
		return *new(bool), *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)
	out1 := *abi.ConvertType(out[1], new(*big.Int)).(**big.Int)

	return out0, out1, err

}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool, uint48)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (bool, *big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.GetSlashingDataAt(&_OpNetVaultAutoDeploy.CallOpts, timestamp, hint)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool, uint48)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (bool, *big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.GetSlashingDataAt(&_OpNetVaultAutoDeploy.CallOpts, timestamp, hint)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetTokens(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getTokens")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetTokens() ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetTokens(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetTokens() ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetTokens(&_OpNetVaultAutoDeploy.CallOpts)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetTokensAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getTokensAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetTokensAt(&_OpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _OpNetVaultAutoDeploy.Contract.GetTokensAt(&_OpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetVotingPowers(opts *bind.CallOpts, extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getVotingPowers", extraData)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _OpNetVaultAutoDeploy.Contract.GetVotingPowers(&_OpNetVaultAutoDeploy.CallOpts, extraData)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _OpNetVaultAutoDeploy.Contract.GetVotingPowers(&_OpNetVaultAutoDeploy.CallOpts, extraData)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) GetVotingPowersAt(opts *bind.CallOpts, extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "getVotingPowersAt", extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _OpNetVaultAutoDeploy.Contract.GetVotingPowersAt(&_OpNetVaultAutoDeploy.CallOpts, extraData, timestamp)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _OpNetVaultAutoDeploy.Contract.GetVotingPowersAt(&_OpNetVaultAutoDeploy.CallOpts, extraData, timestamp)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) HashTypedDataV4(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "hashTypedDataV4", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _OpNetVaultAutoDeploy.Contract.HashTypedDataV4(&_OpNetVaultAutoDeploy.CallOpts, structHash)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _OpNetVaultAutoDeploy.Contract.HashTypedDataV4(&_OpNetVaultAutoDeploy.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) HashTypedDataV4CrossChain(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "hashTypedDataV4CrossChain", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _OpNetVaultAutoDeploy.Contract.HashTypedDataV4CrossChain(&_OpNetVaultAutoDeploy.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _OpNetVaultAutoDeploy.Contract.HashTypedDataV4CrossChain(&_OpNetVaultAutoDeploy.CallOpts, structHash)
}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsAutoDeployEnabled(opts *bind.CallOpts) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isAutoDeployEnabled")

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsAutoDeployEnabled() (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsAutoDeployEnabled(&_OpNetVaultAutoDeploy.CallOpts)
}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsAutoDeployEnabled() (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsAutoDeployEnabled(&_OpNetVaultAutoDeploy.CallOpts)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsOperatorRegistered(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorRegistered", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorRegistered(&_OpNetVaultAutoDeploy.CallOpts, operator)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorRegistered(&_OpNetVaultAutoDeploy.CallOpts, operator)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsOperatorRegisteredAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorRegisteredAt", operator, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorRegisteredAt(&_OpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorRegisteredAt(&_OpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsOperatorVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorVaultRegistered(&_OpNetVaultAutoDeploy.CallOpts, vault)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorVaultRegistered(&_OpNetVaultAutoDeploy.CallOpts, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsOperatorVaultRegistered0(opts *bind.CallOpts, operator common.Address, vault common.Address) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorVaultRegistered0", operator, vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorVaultRegistered0(&_OpNetVaultAutoDeploy.CallOpts, operator, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorVaultRegistered0(&_OpNetVaultAutoDeploy.CallOpts, operator, vault)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsOperatorVaultRegisteredAt(opts *bind.CallOpts, operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorVaultRegisteredAt", operator, vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorVaultRegisteredAt(&_OpNetVaultAutoDeploy.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorVaultRegisteredAt(&_OpNetVaultAutoDeploy.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsOperatorVaultRegisteredAt0(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorVaultRegisteredAt0", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorVaultRegisteredAt0(&_OpNetVaultAutoDeploy.CallOpts, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsOperatorVaultRegisteredAt0(&_OpNetVaultAutoDeploy.CallOpts, vault, timestamp)
}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsSetMaxNetworkLimitHookEnabled(opts *bind.CallOpts) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isSetMaxNetworkLimitHookEnabled")

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsSetMaxNetworkLimitHookEnabled() (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsSetMaxNetworkLimitHookEnabled(&_OpNetVaultAutoDeploy.CallOpts)
}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsSetMaxNetworkLimitHookEnabled() (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsSetMaxNetworkLimitHookEnabled(&_OpNetVaultAutoDeploy.CallOpts)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsSharedVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isSharedVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsSharedVaultRegistered(&_OpNetVaultAutoDeploy.CallOpts, vault)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsSharedVaultRegistered(&_OpNetVaultAutoDeploy.CallOpts, vault)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsSharedVaultRegisteredAt(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isSharedVaultRegisteredAt", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsSharedVaultRegisteredAt(&_OpNetVaultAutoDeploy.CallOpts, vault, timestamp)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsSharedVaultRegisteredAt(&_OpNetVaultAutoDeploy.CallOpts, vault, timestamp)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsTokenRegistered(opts *bind.CallOpts, token common.Address) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isTokenRegistered", token)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsTokenRegistered(token common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsTokenRegistered(&_OpNetVaultAutoDeploy.CallOpts, token)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsTokenRegistered(&_OpNetVaultAutoDeploy.CallOpts, token)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) IsTokenRegisteredAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "isTokenRegisteredAt", token, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsTokenRegisteredAt(&_OpNetVaultAutoDeploy.CallOpts, token, timestamp)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _OpNetVaultAutoDeploy.Contract.IsTokenRegisteredAt(&_OpNetVaultAutoDeploy.CallOpts, token, timestamp)
}

// Nonces is a free data retrieval call binding the contract method 0x7ecebe00.
//
// Solidity: function nonces(address owner) view returns(uint256)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) Nonces(opts *bind.CallOpts, owner common.Address) (*big.Int, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "nonces", owner)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// Nonces is a free data retrieval call binding the contract method 0x7ecebe00.
//
// Solidity: function nonces(address owner) view returns(uint256)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) Nonces(owner common.Address) (*big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.Nonces(&_OpNetVaultAutoDeploy.CallOpts, owner)
}

// Nonces is a free data retrieval call binding the contract method 0x7ecebe00.
//
// Solidity: function nonces(address owner) view returns(uint256)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) Nonces(owner common.Address) (*big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.Nonces(&_OpNetVaultAutoDeploy.CallOpts, owner)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256 power)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) StakeToVotingPower(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "stakeToVotingPower", vault, stake, extraData)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256 power)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.StakeToVotingPower(&_OpNetVaultAutoDeploy.CallOpts, vault, stake, extraData)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256 power)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.StakeToVotingPower(&_OpNetVaultAutoDeploy.CallOpts, vault, stake, extraData)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256 power)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCaller) StakeToVotingPowerAt(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _OpNetVaultAutoDeploy.contract.Call(opts, &out, "stakeToVotingPowerAt", vault, stake, extraData, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256 power)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.StakeToVotingPowerAt(&_OpNetVaultAutoDeploy.CallOpts, vault, stake, extraData, timestamp)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256 power)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployCallerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _OpNetVaultAutoDeploy.Contract.StakeToVotingPowerAt(&_OpNetVaultAutoDeploy.CallOpts, vault, stake, extraData, timestamp)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) InvalidateOldSignatures(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "invalidateOldSignatures")
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.InvalidateOldSignatures(&_OpNetVaultAutoDeploy.TransactOpts)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.InvalidateOldSignatures(&_OpNetVaultAutoDeploy.TransactOpts)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) Multicall(opts *bind.TransactOpts, data [][]byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "multicall", data)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) Multicall(data [][]byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.Multicall(&_OpNetVaultAutoDeploy.TransactOpts, data)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) Multicall(data [][]byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.Multicall(&_OpNetVaultAutoDeploy.TransactOpts, data)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) RegisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "registerOperator")
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) RegisterOperator() (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.RegisterOperator(&_OpNetVaultAutoDeploy.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) RegisterOperator() (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.RegisterOperator(&_OpNetVaultAutoDeploy.TransactOpts)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) RegisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "registerOperatorWithSignature", operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.RegisterOperatorWithSignature(&_OpNetVaultAutoDeploy.TransactOpts, operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.RegisterOperatorWithSignature(&_OpNetVaultAutoDeploy.TransactOpts, operator, signature)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) SetAutoDeployConfig(opts *bind.TransactOpts, config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "setAutoDeployConfig", config)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) SetAutoDeployConfig(config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.SetAutoDeployConfig(&_OpNetVaultAutoDeploy.TransactOpts, config)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) SetAutoDeployConfig(config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.SetAutoDeployConfig(&_OpNetVaultAutoDeploy.TransactOpts, config)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) SetAutoDeployStatus(opts *bind.TransactOpts, status bool) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "setAutoDeployStatus", status)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) SetAutoDeployStatus(status bool) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.SetAutoDeployStatus(&_OpNetVaultAutoDeploy.TransactOpts, status)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) SetAutoDeployStatus(status bool) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.SetAutoDeployStatus(&_OpNetVaultAutoDeploy.TransactOpts, status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) SetSetMaxNetworkLimitHookStatus(opts *bind.TransactOpts, status bool) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "setSetMaxNetworkLimitHookStatus", status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) SetSetMaxNetworkLimitHookStatus(status bool) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.SetSetMaxNetworkLimitHookStatus(&_OpNetVaultAutoDeploy.TransactOpts, status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) SetSetMaxNetworkLimitHookStatus(status bool) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.SetSetMaxNetworkLimitHookStatus(&_OpNetVaultAutoDeploy.TransactOpts, status)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) StaticDelegateCall(opts *bind.TransactOpts, target common.Address, data []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "staticDelegateCall", target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.StaticDelegateCall(&_OpNetVaultAutoDeploy.TransactOpts, target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.StaticDelegateCall(&_OpNetVaultAutoDeploy.TransactOpts, target, data)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) UnregisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "unregisterOperator")
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) UnregisterOperator() (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.UnregisterOperator(&_OpNetVaultAutoDeploy.TransactOpts)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) UnregisterOperator() (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.UnregisterOperator(&_OpNetVaultAutoDeploy.TransactOpts)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactor) UnregisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.contract.Transact(opts, "unregisterOperatorWithSignature", operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeploySession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.UnregisterOperatorWithSignature(&_OpNetVaultAutoDeploy.TransactOpts, operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployTransactorSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _OpNetVaultAutoDeploy.Contract.UnregisterOperatorWithSignature(&_OpNetVaultAutoDeploy.TransactOpts, operator, signature)
}

// OpNetVaultAutoDeployEIP712DomainChangedIterator is returned from FilterEIP712DomainChanged and is used to iterate over the raw logs and unpacked data for EIP712DomainChanged events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployEIP712DomainChangedIterator struct {
	Event *OpNetVaultAutoDeployEIP712DomainChanged // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployEIP712DomainChangedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployEIP712DomainChanged)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployEIP712DomainChanged)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployEIP712DomainChangedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployEIP712DomainChangedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployEIP712DomainChanged represents a EIP712DomainChanged event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployEIP712DomainChanged struct {
	Raw types.Log // Blockchain specific contextual infos
}

// FilterEIP712DomainChanged is a free log retrieval operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterEIP712DomainChanged(opts *bind.FilterOpts) (*OpNetVaultAutoDeployEIP712DomainChangedIterator, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployEIP712DomainChangedIterator{contract: _OpNetVaultAutoDeploy.contract, event: "EIP712DomainChanged", logs: logs, sub: sub}, nil
}

// WatchEIP712DomainChanged is a free log subscription operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchEIP712DomainChanged(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployEIP712DomainChanged) (event.Subscription, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployEIP712DomainChanged)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseEIP712DomainChanged is a log parse operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseEIP712DomainChanged(log types.Log) (*OpNetVaultAutoDeployEIP712DomainChanged, error) {
	event := new(OpNetVaultAutoDeployEIP712DomainChanged)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployInitEIP712Iterator is returned from FilterInitEIP712 and is used to iterate over the raw logs and unpacked data for InitEIP712 events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployInitEIP712Iterator struct {
	Event *OpNetVaultAutoDeployInitEIP712 // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployInitEIP712Iterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployInitEIP712)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployInitEIP712)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployInitEIP712Iterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployInitEIP712Iterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployInitEIP712 represents a InitEIP712 event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployInitEIP712 struct {
	Name    string
	Version string
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitEIP712 is a free log retrieval operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterInitEIP712(opts *bind.FilterOpts) (*OpNetVaultAutoDeployInitEIP712Iterator, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployInitEIP712Iterator{contract: _OpNetVaultAutoDeploy.contract, event: "InitEIP712", logs: logs, sub: sub}, nil
}

// WatchInitEIP712 is a free log subscription operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchInitEIP712(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployInitEIP712) (event.Subscription, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployInitEIP712)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "InitEIP712", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseInitEIP712 is a log parse operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseInitEIP712(log types.Log) (*OpNetVaultAutoDeployInitEIP712, error) {
	event := new(OpNetVaultAutoDeployInitEIP712)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "InitEIP712", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployInitSubnetworkIterator is returned from FilterInitSubnetwork and is used to iterate over the raw logs and unpacked data for InitSubnetwork events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployInitSubnetworkIterator struct {
	Event *OpNetVaultAutoDeployInitSubnetwork // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployInitSubnetworkIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployInitSubnetwork)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployInitSubnetwork)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployInitSubnetworkIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployInitSubnetworkIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployInitSubnetwork represents a InitSubnetwork event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployInitSubnetwork struct {
	Network      common.Address
	SubnetworkId *big.Int
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterInitSubnetwork is a free log retrieval operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterInitSubnetwork(opts *bind.FilterOpts) (*OpNetVaultAutoDeployInitSubnetworkIterator, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployInitSubnetworkIterator{contract: _OpNetVaultAutoDeploy.contract, event: "InitSubnetwork", logs: logs, sub: sub}, nil
}

// WatchInitSubnetwork is a free log subscription operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchInitSubnetwork(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployInitSubnetwork) (event.Subscription, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployInitSubnetwork)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseInitSubnetwork is a log parse operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseInitSubnetwork(log types.Log) (*OpNetVaultAutoDeployInitSubnetwork, error) {
	event := new(OpNetVaultAutoDeployInitSubnetwork)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployInitializedIterator struct {
	Event *OpNetVaultAutoDeployInitialized // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployInitialized)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployInitialized)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployInitialized represents a Initialized event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterInitialized(opts *bind.FilterOpts) (*OpNetVaultAutoDeployInitializedIterator, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployInitializedIterator{contract: _OpNetVaultAutoDeploy.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployInitialized) (event.Subscription, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployInitialized)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "Initialized", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseInitialized is a log parse operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseInitialized(log types.Log) (*OpNetVaultAutoDeployInitialized, error) {
	event := new(OpNetVaultAutoDeployInitialized)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployRegisterOperatorIterator is returned from FilterRegisterOperator and is used to iterate over the raw logs and unpacked data for RegisterOperator events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployRegisterOperatorIterator struct {
	Event *OpNetVaultAutoDeployRegisterOperator // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployRegisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployRegisterOperator)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployRegisterOperator)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployRegisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployRegisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployRegisterOperator represents a RegisterOperator event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployRegisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperator is a free log retrieval operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterRegisterOperator(opts *bind.FilterOpts, operator []common.Address) (*OpNetVaultAutoDeployRegisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployRegisterOperatorIterator{contract: _OpNetVaultAutoDeploy.contract, event: "RegisterOperator", logs: logs, sub: sub}, nil
}

// WatchRegisterOperator is a free log subscription operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchRegisterOperator(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployRegisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployRegisterOperator)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseRegisterOperator is a log parse operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseRegisterOperator(log types.Log) (*OpNetVaultAutoDeployRegisterOperator, error) {
	event := new(OpNetVaultAutoDeployRegisterOperator)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployRegisterOperatorVaultIterator is returned from FilterRegisterOperatorVault and is used to iterate over the raw logs and unpacked data for RegisterOperatorVault events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployRegisterOperatorVaultIterator struct {
	Event *OpNetVaultAutoDeployRegisterOperatorVault // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployRegisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployRegisterOperatorVault)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployRegisterOperatorVault)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployRegisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployRegisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployRegisterOperatorVault represents a RegisterOperatorVault event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployRegisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperatorVault is a free log retrieval operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterRegisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*OpNetVaultAutoDeployRegisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployRegisterOperatorVaultIterator{contract: _OpNetVaultAutoDeploy.contract, event: "RegisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchRegisterOperatorVault is a free log subscription operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchRegisterOperatorVault(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployRegisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployRegisterOperatorVault)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseRegisterOperatorVault is a log parse operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseRegisterOperatorVault(log types.Log) (*OpNetVaultAutoDeployRegisterOperatorVault, error) {
	event := new(OpNetVaultAutoDeployRegisterOperatorVault)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployRegisterSharedVaultIterator is returned from FilterRegisterSharedVault and is used to iterate over the raw logs and unpacked data for RegisterSharedVault events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployRegisterSharedVaultIterator struct {
	Event *OpNetVaultAutoDeployRegisterSharedVault // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployRegisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployRegisterSharedVault)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployRegisterSharedVault)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployRegisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployRegisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployRegisterSharedVault represents a RegisterSharedVault event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployRegisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterSharedVault is a free log retrieval operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterRegisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*OpNetVaultAutoDeployRegisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployRegisterSharedVaultIterator{contract: _OpNetVaultAutoDeploy.contract, event: "RegisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchRegisterSharedVault is a free log subscription operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchRegisterSharedVault(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployRegisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployRegisterSharedVault)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseRegisterSharedVault is a log parse operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseRegisterSharedVault(log types.Log) (*OpNetVaultAutoDeployRegisterSharedVault, error) {
	event := new(OpNetVaultAutoDeployRegisterSharedVault)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployRegisterTokenIterator is returned from FilterRegisterToken and is used to iterate over the raw logs and unpacked data for RegisterToken events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployRegisterTokenIterator struct {
	Event *OpNetVaultAutoDeployRegisterToken // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployRegisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployRegisterToken)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployRegisterToken)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployRegisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployRegisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployRegisterToken represents a RegisterToken event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployRegisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterToken is a free log retrieval operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterRegisterToken(opts *bind.FilterOpts, token []common.Address) (*OpNetVaultAutoDeployRegisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployRegisterTokenIterator{contract: _OpNetVaultAutoDeploy.contract, event: "RegisterToken", logs: logs, sub: sub}, nil
}

// WatchRegisterToken is a free log subscription operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchRegisterToken(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployRegisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployRegisterToken)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterToken", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseRegisterToken is a log parse operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseRegisterToken(log types.Log) (*OpNetVaultAutoDeployRegisterToken, error) {
	event := new(OpNetVaultAutoDeployRegisterToken)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeploySetAutoDeployConfigIterator is returned from FilterSetAutoDeployConfig and is used to iterate over the raw logs and unpacked data for SetAutoDeployConfig events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeploySetAutoDeployConfigIterator struct {
	Event *OpNetVaultAutoDeploySetAutoDeployConfig // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeploySetAutoDeployConfigIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeploySetAutoDeployConfig)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeploySetAutoDeployConfig)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeploySetAutoDeployConfigIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeploySetAutoDeployConfigIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeploySetAutoDeployConfig represents a SetAutoDeployConfig event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeploySetAutoDeployConfig struct {
	Config IOpNetVaultAutoDeployAutoDeployConfig
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetAutoDeployConfig is a free log retrieval operation binding the contract event 0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05.
//
// Solidity: event SetAutoDeployConfig((uint48,address,address,bool,bool) config)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterSetAutoDeployConfig(opts *bind.FilterOpts) (*OpNetVaultAutoDeploySetAutoDeployConfigIterator, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetAutoDeployConfig")
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeploySetAutoDeployConfigIterator{contract: _OpNetVaultAutoDeploy.contract, event: "SetAutoDeployConfig", logs: logs, sub: sub}, nil
}

// WatchSetAutoDeployConfig is a free log subscription operation binding the contract event 0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05.
//
// Solidity: event SetAutoDeployConfig((uint48,address,address,bool,bool) config)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchSetAutoDeployConfig(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeploySetAutoDeployConfig) (event.Subscription, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetAutoDeployConfig")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeploySetAutoDeployConfig)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployConfig", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseSetAutoDeployConfig is a log parse operation binding the contract event 0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05.
//
// Solidity: event SetAutoDeployConfig((uint48,address,address,bool,bool) config)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseSetAutoDeployConfig(log types.Log) (*OpNetVaultAutoDeploySetAutoDeployConfig, error) {
	event := new(OpNetVaultAutoDeploySetAutoDeployConfig)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployConfig", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeploySetAutoDeployStatusIterator is returned from FilterSetAutoDeployStatus and is used to iterate over the raw logs and unpacked data for SetAutoDeployStatus events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeploySetAutoDeployStatusIterator struct {
	Event *OpNetVaultAutoDeploySetAutoDeployStatus // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeploySetAutoDeployStatusIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeploySetAutoDeployStatus)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeploySetAutoDeployStatus)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeploySetAutoDeployStatusIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeploySetAutoDeployStatusIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeploySetAutoDeployStatus represents a SetAutoDeployStatus event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeploySetAutoDeployStatus struct {
	Status bool
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetAutoDeployStatus is a free log retrieval operation binding the contract event 0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d.
//
// Solidity: event SetAutoDeployStatus(bool status)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterSetAutoDeployStatus(opts *bind.FilterOpts) (*OpNetVaultAutoDeploySetAutoDeployStatusIterator, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetAutoDeployStatus")
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeploySetAutoDeployStatusIterator{contract: _OpNetVaultAutoDeploy.contract, event: "SetAutoDeployStatus", logs: logs, sub: sub}, nil
}

// WatchSetAutoDeployStatus is a free log subscription operation binding the contract event 0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d.
//
// Solidity: event SetAutoDeployStatus(bool status)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchSetAutoDeployStatus(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeploySetAutoDeployStatus) (event.Subscription, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetAutoDeployStatus")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeploySetAutoDeployStatus)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployStatus", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseSetAutoDeployStatus is a log parse operation binding the contract event 0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d.
//
// Solidity: event SetAutoDeployStatus(bool status)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseSetAutoDeployStatus(log types.Log) (*OpNetVaultAutoDeploySetAutoDeployStatus, error) {
	event := new(OpNetVaultAutoDeploySetAutoDeployStatus)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployStatus", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator is returned from FilterSetSetMaxNetworkLimitHookStatus and is used to iterate over the raw logs and unpacked data for SetSetMaxNetworkLimitHookStatus events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator struct {
	Event *OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus represents a SetSetMaxNetworkLimitHookStatus event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus struct {
	Status bool
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetSetMaxNetworkLimitHookStatus is a free log retrieval operation binding the contract event 0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c.
//
// Solidity: event SetSetMaxNetworkLimitHookStatus(bool status)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterSetSetMaxNetworkLimitHookStatus(opts *bind.FilterOpts) (*OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetSetMaxNetworkLimitHookStatus")
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator{contract: _OpNetVaultAutoDeploy.contract, event: "SetSetMaxNetworkLimitHookStatus", logs: logs, sub: sub}, nil
}

// WatchSetSetMaxNetworkLimitHookStatus is a free log subscription operation binding the contract event 0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c.
//
// Solidity: event SetSetMaxNetworkLimitHookStatus(bool status)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchSetSetMaxNetworkLimitHookStatus(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus) (event.Subscription, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetSetMaxNetworkLimitHookStatus")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSetMaxNetworkLimitHookStatus", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseSetSetMaxNetworkLimitHookStatus is a log parse operation binding the contract event 0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c.
//
// Solidity: event SetSetMaxNetworkLimitHookStatus(bool status)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseSetSetMaxNetworkLimitHookStatus(log types.Log) (*OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus, error) {
	event := new(OpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSetMaxNetworkLimitHookStatus", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeploySetSlashingDataIterator is returned from FilterSetSlashingData and is used to iterate over the raw logs and unpacked data for SetSlashingData events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeploySetSlashingDataIterator struct {
	Event *OpNetVaultAutoDeploySetSlashingData // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeploySetSlashingDataIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeploySetSlashingData)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeploySetSlashingData)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeploySetSlashingDataIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeploySetSlashingDataIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeploySetSlashingData represents a SetSlashingData event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeploySetSlashingData struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
	Raw                   types.Log // Blockchain specific contextual infos
}

// FilterSetSlashingData is a free log retrieval operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterSetSlashingData(opts *bind.FilterOpts) (*OpNetVaultAutoDeploySetSlashingDataIterator, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeploySetSlashingDataIterator{contract: _OpNetVaultAutoDeploy.contract, event: "SetSlashingData", logs: logs, sub: sub}, nil
}

// WatchSetSlashingData is a free log subscription operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchSetSlashingData(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeploySetSlashingData) (event.Subscription, error) {

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeploySetSlashingData)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseSetSlashingData is a log parse operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseSetSlashingData(log types.Log) (*OpNetVaultAutoDeploySetSlashingData, error) {
	event := new(OpNetVaultAutoDeploySetSlashingData)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployUnregisterOperatorIterator is returned from FilterUnregisterOperator and is used to iterate over the raw logs and unpacked data for UnregisterOperator events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployUnregisterOperatorIterator struct {
	Event *OpNetVaultAutoDeployUnregisterOperator // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployUnregisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployUnregisterOperator)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployUnregisterOperator)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployUnregisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployUnregisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployUnregisterOperator represents a UnregisterOperator event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployUnregisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperator is a free log retrieval operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterUnregisterOperator(opts *bind.FilterOpts, operator []common.Address) (*OpNetVaultAutoDeployUnregisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployUnregisterOperatorIterator{contract: _OpNetVaultAutoDeploy.contract, event: "UnregisterOperator", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperator is a free log subscription operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchUnregisterOperator(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployUnregisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployUnregisterOperator)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseUnregisterOperator is a log parse operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseUnregisterOperator(log types.Log) (*OpNetVaultAutoDeployUnregisterOperator, error) {
	event := new(OpNetVaultAutoDeployUnregisterOperator)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployUnregisterOperatorVaultIterator is returned from FilterUnregisterOperatorVault and is used to iterate over the raw logs and unpacked data for UnregisterOperatorVault events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployUnregisterOperatorVaultIterator struct {
	Event *OpNetVaultAutoDeployUnregisterOperatorVault // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployUnregisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployUnregisterOperatorVault)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployUnregisterOperatorVault)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployUnregisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployUnregisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployUnregisterOperatorVault represents a UnregisterOperatorVault event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployUnregisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperatorVault is a free log retrieval operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterUnregisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*OpNetVaultAutoDeployUnregisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployUnregisterOperatorVaultIterator{contract: _OpNetVaultAutoDeploy.contract, event: "UnregisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperatorVault is a free log subscription operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchUnregisterOperatorVault(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployUnregisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployUnregisterOperatorVault)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseUnregisterOperatorVault is a log parse operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseUnregisterOperatorVault(log types.Log) (*OpNetVaultAutoDeployUnregisterOperatorVault, error) {
	event := new(OpNetVaultAutoDeployUnregisterOperatorVault)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployUnregisterSharedVaultIterator is returned from FilterUnregisterSharedVault and is used to iterate over the raw logs and unpacked data for UnregisterSharedVault events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployUnregisterSharedVaultIterator struct {
	Event *OpNetVaultAutoDeployUnregisterSharedVault // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployUnregisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployUnregisterSharedVault)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployUnregisterSharedVault)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployUnregisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployUnregisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployUnregisterSharedVault represents a UnregisterSharedVault event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployUnregisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterSharedVault is a free log retrieval operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterUnregisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*OpNetVaultAutoDeployUnregisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployUnregisterSharedVaultIterator{contract: _OpNetVaultAutoDeploy.contract, event: "UnregisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterSharedVault is a free log subscription operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchUnregisterSharedVault(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployUnregisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployUnregisterSharedVault)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseUnregisterSharedVault is a log parse operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseUnregisterSharedVault(log types.Log) (*OpNetVaultAutoDeployUnregisterSharedVault, error) {
	event := new(OpNetVaultAutoDeployUnregisterSharedVault)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OpNetVaultAutoDeployUnregisterTokenIterator is returned from FilterUnregisterToken and is used to iterate over the raw logs and unpacked data for UnregisterToken events raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployUnregisterTokenIterator struct {
	Event *OpNetVaultAutoDeployUnregisterToken // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *OpNetVaultAutoDeployUnregisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OpNetVaultAutoDeployUnregisterToken)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(OpNetVaultAutoDeployUnregisterToken)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *OpNetVaultAutoDeployUnregisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OpNetVaultAutoDeployUnregisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OpNetVaultAutoDeployUnregisterToken represents a UnregisterToken event raised by the OpNetVaultAutoDeploy contract.
type OpNetVaultAutoDeployUnregisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterToken is a free log retrieval operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) FilterUnregisterToken(opts *bind.FilterOpts, token []common.Address) (*OpNetVaultAutoDeployUnregisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.FilterLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &OpNetVaultAutoDeployUnregisterTokenIterator{contract: _OpNetVaultAutoDeploy.contract, event: "UnregisterToken", logs: logs, sub: sub}, nil
}

// WatchUnregisterToken is a free log subscription operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) WatchUnregisterToken(opts *bind.WatchOpts, sink chan<- *OpNetVaultAutoDeployUnregisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _OpNetVaultAutoDeploy.contract.WatchLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OpNetVaultAutoDeployUnregisterToken)
				if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseUnregisterToken is a log parse operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_OpNetVaultAutoDeploy *OpNetVaultAutoDeployFilterer) ParseUnregisterToken(log types.Log) (*OpNetVaultAutoDeployUnregisterToken, error) {
	event := new(OpNetVaultAutoDeployUnregisterToken)
	if err := _OpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
