// Code generated - DO NOT EDIT.
// This file is a generated binding and any manual changes will be lost.

package relaycontracts

import (
	"context"
	"errors"
	"math/big"
	"strings"
	"time"

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
	_ = time.Tick
	_ = context.Background
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

// IOpNetVaultAutoDeployMetaData contains all meta data concerning the IOpNetVaultAutoDeploy contract.
var IOpNetVaultAutoDeployMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"OPERATOR_REGISTRY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VAULT_CONFIGURATOR\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VAULT_FACTORY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getAutoDeployConfig\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getAutoDeployedVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakes\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakesAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaults\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaultsAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowers\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowersAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaults\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaultsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingData\",\"inputs\":[],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingDataAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokens\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokensAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowers\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowersAt\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"invalidateOldSignatures\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"isAutoDeployEnabled\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSetMaxNetworkLimitHookEnabled\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegistered\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegisteredAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"registerOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"registerOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setAutoDeployConfig\",\"inputs\":[{\"name\":\"config\",\"type\":\"tuple\",\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setAutoDeployStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setSetMaxNetworkLimitHookStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"RegisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetAutoDeployConfig\",\"inputs\":[{\"name\":\"config\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetAutoDeployStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSetMaxNetworkLimitHookStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSlashingData\",\"inputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidBurnerHook\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidCollateral\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidEpochDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidWithSlasher\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperator\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperatorVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSharedVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidToken\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorAlreadyRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenNotRegistered\",\"inputs\":[]}]",
}

// IOpNetVaultAutoDeployABI is the input ABI used to generate the binding from.
// Deprecated: Use IOpNetVaultAutoDeployMetaData.ABI instead.
var IOpNetVaultAutoDeployABI = IOpNetVaultAutoDeployMetaData.ABI

// IOpNetVaultAutoDeploy is an auto generated Go binding around an Ethereum contract.
type IOpNetVaultAutoDeploy struct {
	IOpNetVaultAutoDeployCaller     // Read-only binding to the contract
	IOpNetVaultAutoDeployTransactor // Write-only binding to the contract
	IOpNetVaultAutoDeployFilterer   // Log filterer for contract events
}

// IOpNetVaultAutoDeployCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOpNetVaultAutoDeployTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOpNetVaultAutoDeployFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOpNetVaultAutoDeployFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOpNetVaultAutoDeploySession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOpNetVaultAutoDeploySession struct {
	Contract     *IOpNetVaultAutoDeploy // Generic contract binding to set the session for
	CallOpts     bind.CallOpts          // Call options to use throughout this session
	TransactOpts bind.TransactOpts      // Transaction auth options to use throughout this session
}

// IOpNetVaultAutoDeployCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOpNetVaultAutoDeployCallerSession struct {
	Contract *IOpNetVaultAutoDeployCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                // Call options to use throughout this session
}

// IOpNetVaultAutoDeployTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOpNetVaultAutoDeployTransactorSession struct {
	Contract     *IOpNetVaultAutoDeployTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                // Transaction auth options to use throughout this session
}

// IOpNetVaultAutoDeployRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployRaw struct {
	Contract *IOpNetVaultAutoDeploy // Generic contract binding to access the raw methods on
}

// IOpNetVaultAutoDeployCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployCallerRaw struct {
	Contract *IOpNetVaultAutoDeployCaller // Generic read-only contract binding to access the raw methods on
}

// IOpNetVaultAutoDeployTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployTransactorRaw struct {
	Contract *IOpNetVaultAutoDeployTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOpNetVaultAutoDeploy creates a new instance of IOpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewIOpNetVaultAutoDeploy(address common.Address, backend bind.ContractBackend) (*IOpNetVaultAutoDeploy, error) {
	contract, err := bindIOpNetVaultAutoDeploy(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploy{IOpNetVaultAutoDeployCaller: IOpNetVaultAutoDeployCaller{contract: contract}, IOpNetVaultAutoDeployTransactor: IOpNetVaultAutoDeployTransactor{contract: contract}, IOpNetVaultAutoDeployFilterer: IOpNetVaultAutoDeployFilterer{contract: contract}}, nil
}

// NewIOpNetVaultAutoDeployCaller creates a new read-only instance of IOpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewIOpNetVaultAutoDeployCaller(address common.Address, caller bind.ContractCaller) (*IOpNetVaultAutoDeployCaller, error) {
	contract, err := bindIOpNetVaultAutoDeploy(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployCaller{contract: contract}, nil
}

// NewIOpNetVaultAutoDeployTransactor creates a new write-only instance of IOpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewIOpNetVaultAutoDeployTransactor(address common.Address, transactor bind.ContractTransactor) (*IOpNetVaultAutoDeployTransactor, error) {
	contract, err := bindIOpNetVaultAutoDeploy(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployTransactor{contract: contract}, nil
}

// NewIOpNetVaultAutoDeployFilterer creates a new log filterer instance of IOpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewIOpNetVaultAutoDeployFilterer(address common.Address, filterer bind.ContractFilterer) (*IOpNetVaultAutoDeployFilterer, error) {
	contract, err := bindIOpNetVaultAutoDeploy(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployFilterer{contract: contract}, nil
}

// bindIOpNetVaultAutoDeploy binds a generic wrapper to an already deployed contract.
func bindIOpNetVaultAutoDeploy(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOpNetVaultAutoDeployMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOpNetVaultAutoDeploy.Contract.IOpNetVaultAutoDeployCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.IOpNetVaultAutoDeployTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.IOpNetVaultAutoDeployTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOpNetVaultAutoDeploy.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.contract.Transact(opts, method, params...)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) OPERATORREGISTRY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "OPERATOR_REGISTRY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) OPERATORREGISTRY() (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.OPERATORREGISTRY(&_IOpNetVaultAutoDeploy.CallOpts)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) OPERATORREGISTRY() (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.OPERATORREGISTRY(&_IOpNetVaultAutoDeploy.CallOpts)
}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) VAULTCONFIGURATOR(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "VAULT_CONFIGURATOR")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) VAULTCONFIGURATOR() (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.VAULTCONFIGURATOR(&_IOpNetVaultAutoDeploy.CallOpts)
}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) VAULTCONFIGURATOR() (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.VAULTCONFIGURATOR(&_IOpNetVaultAutoDeploy.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) VAULTFACTORY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "VAULT_FACTORY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) VAULTFACTORY() (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.VAULTFACTORY(&_IOpNetVaultAutoDeploy.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) VAULTFACTORY() (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.VAULTFACTORY(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetAutoDeployConfig(opts *bind.CallOpts) (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getAutoDeployConfig")

	if err != nil {
		return *new(IOpNetVaultAutoDeployAutoDeployConfig), err
	}

	out0 := *abi.ConvertType(out[0], new(IOpNetVaultAutoDeployAutoDeployConfig)).(*IOpNetVaultAutoDeployAutoDeployConfig)

	return out0, err

}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetAutoDeployConfig() (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetAutoDeployConfig(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetAutoDeployConfig() (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetAutoDeployConfig(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetAutoDeployedVault(opts *bind.CallOpts, operator common.Address) (common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getAutoDeployedVault", operator)

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetAutoDeployedVault(operator common.Address) (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetAutoDeployedVault(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetAutoDeployedVault(operator common.Address) (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetAutoDeployedVault(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetOperatorStakes(opts *bind.CallOpts, operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorStakes", operator)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorStakes(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorStakes(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetOperatorStakesAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorStakesAt", operator, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorStakesAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorStakesAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetOperatorVaults(opts *bind.CallOpts, operator common.Address) ([]common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorVaults", operator)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorVaults(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorVaults(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetOperatorVaultsAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorVaultsAt", operator, timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorVaultsAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorVaultsAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetOperatorVotingPowers(opts *bind.CallOpts, operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorVotingPowers", operator, extraData)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorVotingPowers(&_IOpNetVaultAutoDeploy.CallOpts, operator, extraData)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorVotingPowers(&_IOpNetVaultAutoDeploy.CallOpts, operator, extraData)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetOperatorVotingPowersAt(opts *bind.CallOpts, operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorVotingPowersAt", operator, extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorVotingPowersAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, extraData, timestamp)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorVotingPowersAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, extraData, timestamp)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetOperators(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperators")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetOperators() ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperators(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetOperators() ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperators(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetOperatorsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getOperatorsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorsAt(&_IOpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetOperatorsAt(&_IOpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetSharedVaults(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getSharedVaults")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetSharedVaults() ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetSharedVaults(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetSharedVaults() ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetSharedVaults(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetSharedVaultsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getSharedVaultsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetSharedVaultsAt(&_IOpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetSharedVaultsAt(&_IOpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetSlashingData(opts *bind.CallOpts) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getSlashingData")

	outstruct := new(struct {
		RequireSlasher        bool
		MinVaultEpochDuration *big.Int
	})
	if err != nil {
		return *outstruct, err
	}

	outstruct.RequireSlasher = *abi.ConvertType(out[0], new(bool)).(*bool)
	outstruct.MinVaultEpochDuration = *abi.ConvertType(out[1], new(*big.Int)).(**big.Int)

	return *outstruct, err

}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetSlashingData(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetSlashingData(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetSlashingDataAt(opts *bind.CallOpts, timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getSlashingDataAt", timestamp, hint)

	outstruct := new(struct {
		RequireSlasher        bool
		MinVaultEpochDuration *big.Int
	})
	if err != nil {
		return *outstruct, err
	}

	outstruct.RequireSlasher = *abi.ConvertType(out[0], new(bool)).(*bool)
	outstruct.MinVaultEpochDuration = *abi.ConvertType(out[1], new(*big.Int)).(**big.Int)

	return *outstruct, err

}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetSlashingDataAt(&_IOpNetVaultAutoDeploy.CallOpts, timestamp, hint)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetSlashingDataAt(&_IOpNetVaultAutoDeploy.CallOpts, timestamp, hint)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetTokens(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getTokens")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetTokens() ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetTokens(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetTokens() ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetTokens(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetTokensAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getTokensAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetTokensAt(&_IOpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetTokensAt(&_IOpNetVaultAutoDeploy.CallOpts, timestamp)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetVotingPowers(opts *bind.CallOpts, extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getVotingPowers", extraData)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetVotingPowers(&_IOpNetVaultAutoDeploy.CallOpts, extraData)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetVotingPowers(&_IOpNetVaultAutoDeploy.CallOpts, extraData)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetVotingPowersAt(opts *bind.CallOpts, extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getVotingPowersAt", extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetVotingPowersAt(&_IOpNetVaultAutoDeploy.CallOpts, extraData, timestamp)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetVotingPowersAt(&_IOpNetVaultAutoDeploy.CallOpts, extraData, timestamp)
}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsAutoDeployEnabled(opts *bind.CallOpts) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isAutoDeployEnabled")

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsAutoDeployEnabled() (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsAutoDeployEnabled(&_IOpNetVaultAutoDeploy.CallOpts)
}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsAutoDeployEnabled() (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsAutoDeployEnabled(&_IOpNetVaultAutoDeploy.CallOpts)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsOperatorRegistered(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorRegistered", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorRegistered(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorRegistered(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsOperatorRegisteredAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorRegisteredAt", operator, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorRegisteredAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorRegisteredAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, timestamp)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsOperatorVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorVaultRegistered(&_IOpNetVaultAutoDeploy.CallOpts, vault)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorVaultRegistered(&_IOpNetVaultAutoDeploy.CallOpts, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsOperatorVaultRegistered0(opts *bind.CallOpts, operator common.Address, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorVaultRegistered0", operator, vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorVaultRegistered0(&_IOpNetVaultAutoDeploy.CallOpts, operator, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorVaultRegistered0(&_IOpNetVaultAutoDeploy.CallOpts, operator, vault)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsOperatorVaultRegisteredAt(opts *bind.CallOpts, operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorVaultRegisteredAt", operator, vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorVaultRegisteredAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorVaultRegisteredAt(&_IOpNetVaultAutoDeploy.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsOperatorVaultRegisteredAt0(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isOperatorVaultRegisteredAt0", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorVaultRegisteredAt0(&_IOpNetVaultAutoDeploy.CallOpts, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsOperatorVaultRegisteredAt0(&_IOpNetVaultAutoDeploy.CallOpts, vault, timestamp)
}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsSetMaxNetworkLimitHookEnabled(opts *bind.CallOpts) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isSetMaxNetworkLimitHookEnabled")

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsSetMaxNetworkLimitHookEnabled() (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsSetMaxNetworkLimitHookEnabled(&_IOpNetVaultAutoDeploy.CallOpts)
}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsSetMaxNetworkLimitHookEnabled() (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsSetMaxNetworkLimitHookEnabled(&_IOpNetVaultAutoDeploy.CallOpts)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsSharedVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isSharedVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsSharedVaultRegistered(&_IOpNetVaultAutoDeploy.CallOpts, vault)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsSharedVaultRegistered(&_IOpNetVaultAutoDeploy.CallOpts, vault)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsSharedVaultRegisteredAt(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isSharedVaultRegisteredAt", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsSharedVaultRegisteredAt(&_IOpNetVaultAutoDeploy.CallOpts, vault, timestamp)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsSharedVaultRegisteredAt(&_IOpNetVaultAutoDeploy.CallOpts, vault, timestamp)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsTokenRegistered(opts *bind.CallOpts, token common.Address) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isTokenRegistered", token)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsTokenRegistered(&_IOpNetVaultAutoDeploy.CallOpts, token)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsTokenRegistered(&_IOpNetVaultAutoDeploy.CallOpts, token)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsTokenRegisteredAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isTokenRegisteredAt", token, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsTokenRegisteredAt(&_IOpNetVaultAutoDeploy.CallOpts, token, timestamp)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsTokenRegisteredAt(&_IOpNetVaultAutoDeploy.CallOpts, token, timestamp)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) InvalidateOldSignatures(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "invalidateOldSignatures")
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.InvalidateOldSignatures(&_IOpNetVaultAutoDeploy.TransactOpts)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.InvalidateOldSignatures(&_IOpNetVaultAutoDeploy.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) RegisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "registerOperator")
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) RegisterOperator() (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.RegisterOperator(&_IOpNetVaultAutoDeploy.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) RegisterOperator() (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.RegisterOperator(&_IOpNetVaultAutoDeploy.TransactOpts)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) RegisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "registerOperatorWithSignature", operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.RegisterOperatorWithSignature(&_IOpNetVaultAutoDeploy.TransactOpts, operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.RegisterOperatorWithSignature(&_IOpNetVaultAutoDeploy.TransactOpts, operator, signature)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) SetAutoDeployConfig(opts *bind.TransactOpts, config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "setAutoDeployConfig", config)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) SetAutoDeployConfig(config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetAutoDeployConfig(&_IOpNetVaultAutoDeploy.TransactOpts, config)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) SetAutoDeployConfig(config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetAutoDeployConfig(&_IOpNetVaultAutoDeploy.TransactOpts, config)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) SetAutoDeployStatus(opts *bind.TransactOpts, status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "setAutoDeployStatus", status)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) SetAutoDeployStatus(status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetAutoDeployStatus(&_IOpNetVaultAutoDeploy.TransactOpts, status)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) SetAutoDeployStatus(status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetAutoDeployStatus(&_IOpNetVaultAutoDeploy.TransactOpts, status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) SetSetMaxNetworkLimitHookStatus(opts *bind.TransactOpts, status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "setSetMaxNetworkLimitHookStatus", status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) SetSetMaxNetworkLimitHookStatus(status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetSetMaxNetworkLimitHookStatus(&_IOpNetVaultAutoDeploy.TransactOpts, status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) SetSetMaxNetworkLimitHookStatus(status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetSetMaxNetworkLimitHookStatus(&_IOpNetVaultAutoDeploy.TransactOpts, status)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) UnregisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "unregisterOperator")
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) UnregisterOperator() (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.UnregisterOperator(&_IOpNetVaultAutoDeploy.TransactOpts)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) UnregisterOperator() (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.UnregisterOperator(&_IOpNetVaultAutoDeploy.TransactOpts)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) UnregisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "unregisterOperatorWithSignature", operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.UnregisterOperatorWithSignature(&_IOpNetVaultAutoDeploy.TransactOpts, operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.UnregisterOperatorWithSignature(&_IOpNetVaultAutoDeploy.TransactOpts, operator, signature)
}

// IOpNetVaultAutoDeployRegisterOperatorIterator is returned from FilterRegisterOperator and is used to iterate over the raw logs and unpacked data for RegisterOperator events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployRegisterOperatorIterator struct {
	Event *IOpNetVaultAutoDeployRegisterOperator // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeployRegisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeployRegisterOperator)
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
		it.Event = new(IOpNetVaultAutoDeployRegisterOperator)
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
func (it *IOpNetVaultAutoDeployRegisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeployRegisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeployRegisterOperator represents a RegisterOperator event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployRegisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperator is a free log retrieval operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterRegisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IOpNetVaultAutoDeployRegisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployRegisterOperatorIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "RegisterOperator", logs: logs, sub: sub}, nil
}

// WatchRegisterOperator is a free log subscription operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchRegisterOperator(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeployRegisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeployRegisterOperator)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseRegisterOperator(log types.Log) (*IOpNetVaultAutoDeployRegisterOperator, error) {
	event := new(IOpNetVaultAutoDeployRegisterOperator)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeployRegisterOperatorVaultIterator is returned from FilterRegisterOperatorVault and is used to iterate over the raw logs and unpacked data for RegisterOperatorVault events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployRegisterOperatorVaultIterator struct {
	Event *IOpNetVaultAutoDeployRegisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeployRegisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeployRegisterOperatorVault)
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
		it.Event = new(IOpNetVaultAutoDeployRegisterOperatorVault)
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
func (it *IOpNetVaultAutoDeployRegisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeployRegisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeployRegisterOperatorVault represents a RegisterOperatorVault event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployRegisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperatorVault is a free log retrieval operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterRegisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IOpNetVaultAutoDeployRegisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployRegisterOperatorVaultIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "RegisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchRegisterOperatorVault is a free log subscription operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchRegisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeployRegisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeployRegisterOperatorVault)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseRegisterOperatorVault(log types.Log) (*IOpNetVaultAutoDeployRegisterOperatorVault, error) {
	event := new(IOpNetVaultAutoDeployRegisterOperatorVault)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeployRegisterSharedVaultIterator is returned from FilterRegisterSharedVault and is used to iterate over the raw logs and unpacked data for RegisterSharedVault events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployRegisterSharedVaultIterator struct {
	Event *IOpNetVaultAutoDeployRegisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeployRegisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeployRegisterSharedVault)
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
		it.Event = new(IOpNetVaultAutoDeployRegisterSharedVault)
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
func (it *IOpNetVaultAutoDeployRegisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeployRegisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeployRegisterSharedVault represents a RegisterSharedVault event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployRegisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterSharedVault is a free log retrieval operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterRegisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IOpNetVaultAutoDeployRegisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployRegisterSharedVaultIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "RegisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchRegisterSharedVault is a free log subscription operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchRegisterSharedVault(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeployRegisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeployRegisterSharedVault)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseRegisterSharedVault(log types.Log) (*IOpNetVaultAutoDeployRegisterSharedVault, error) {
	event := new(IOpNetVaultAutoDeployRegisterSharedVault)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeployRegisterTokenIterator is returned from FilterRegisterToken and is used to iterate over the raw logs and unpacked data for RegisterToken events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployRegisterTokenIterator struct {
	Event *IOpNetVaultAutoDeployRegisterToken // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeployRegisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeployRegisterToken)
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
		it.Event = new(IOpNetVaultAutoDeployRegisterToken)
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
func (it *IOpNetVaultAutoDeployRegisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeployRegisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeployRegisterToken represents a RegisterToken event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployRegisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterToken is a free log retrieval operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterRegisterToken(opts *bind.FilterOpts, token []common.Address) (*IOpNetVaultAutoDeployRegisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployRegisterTokenIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "RegisterToken", logs: logs, sub: sub}, nil
}

// WatchRegisterToken is a free log subscription operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchRegisterToken(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeployRegisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeployRegisterToken)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterToken", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseRegisterToken(log types.Log) (*IOpNetVaultAutoDeployRegisterToken, error) {
	event := new(IOpNetVaultAutoDeployRegisterToken)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "RegisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeploySetAutoDeployConfigIterator is returned from FilterSetAutoDeployConfig and is used to iterate over the raw logs and unpacked data for SetAutoDeployConfig events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetAutoDeployConfigIterator struct {
	Event *IOpNetVaultAutoDeploySetAutoDeployConfig // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeploySetAutoDeployConfigIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeploySetAutoDeployConfig)
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
		it.Event = new(IOpNetVaultAutoDeploySetAutoDeployConfig)
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
func (it *IOpNetVaultAutoDeploySetAutoDeployConfigIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeploySetAutoDeployConfigIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeploySetAutoDeployConfig represents a SetAutoDeployConfig event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetAutoDeployConfig struct {
	Config IOpNetVaultAutoDeployAutoDeployConfig
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetAutoDeployConfig is a free log retrieval operation binding the contract event 0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05.
//
// Solidity: event SetAutoDeployConfig((uint48,address,address,bool,bool) config)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterSetAutoDeployConfig(opts *bind.FilterOpts) (*IOpNetVaultAutoDeploySetAutoDeployConfigIterator, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetAutoDeployConfig")
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploySetAutoDeployConfigIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "SetAutoDeployConfig", logs: logs, sub: sub}, nil
}

// WatchSetAutoDeployConfig is a free log subscription operation binding the contract event 0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05.
//
// Solidity: event SetAutoDeployConfig((uint48,address,address,bool,bool) config)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchSetAutoDeployConfig(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeploySetAutoDeployConfig) (event.Subscription, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetAutoDeployConfig")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeploySetAutoDeployConfig)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployConfig", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseSetAutoDeployConfig(log types.Log) (*IOpNetVaultAutoDeploySetAutoDeployConfig, error) {
	event := new(IOpNetVaultAutoDeploySetAutoDeployConfig)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployConfig", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeploySetAutoDeployStatusIterator is returned from FilterSetAutoDeployStatus and is used to iterate over the raw logs and unpacked data for SetAutoDeployStatus events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetAutoDeployStatusIterator struct {
	Event *IOpNetVaultAutoDeploySetAutoDeployStatus // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeploySetAutoDeployStatusIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeploySetAutoDeployStatus)
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
		it.Event = new(IOpNetVaultAutoDeploySetAutoDeployStatus)
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
func (it *IOpNetVaultAutoDeploySetAutoDeployStatusIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeploySetAutoDeployStatusIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeploySetAutoDeployStatus represents a SetAutoDeployStatus event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetAutoDeployStatus struct {
	Status bool
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetAutoDeployStatus is a free log retrieval operation binding the contract event 0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d.
//
// Solidity: event SetAutoDeployStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterSetAutoDeployStatus(opts *bind.FilterOpts) (*IOpNetVaultAutoDeploySetAutoDeployStatusIterator, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetAutoDeployStatus")
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploySetAutoDeployStatusIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "SetAutoDeployStatus", logs: logs, sub: sub}, nil
}

// WatchSetAutoDeployStatus is a free log subscription operation binding the contract event 0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d.
//
// Solidity: event SetAutoDeployStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchSetAutoDeployStatus(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeploySetAutoDeployStatus) (event.Subscription, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetAutoDeployStatus")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeploySetAutoDeployStatus)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployStatus", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseSetAutoDeployStatus(log types.Log) (*IOpNetVaultAutoDeploySetAutoDeployStatus, error) {
	event := new(IOpNetVaultAutoDeploySetAutoDeployStatus)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployStatus", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator is returned from FilterSetSetMaxNetworkLimitHookStatus and is used to iterate over the raw logs and unpacked data for SetSetMaxNetworkLimitHookStatus events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator struct {
	Event *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
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
		it.Event = new(IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
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
func (it *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus represents a SetSetMaxNetworkLimitHookStatus event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus struct {
	Status bool
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetSetMaxNetworkLimitHookStatus is a free log retrieval operation binding the contract event 0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c.
//
// Solidity: event SetSetMaxNetworkLimitHookStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterSetSetMaxNetworkLimitHookStatus(opts *bind.FilterOpts) (*IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetSetMaxNetworkLimitHookStatus")
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "SetSetMaxNetworkLimitHookStatus", logs: logs, sub: sub}, nil
}

// WatchSetSetMaxNetworkLimitHookStatus is a free log subscription operation binding the contract event 0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c.
//
// Solidity: event SetSetMaxNetworkLimitHookStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchSetSetMaxNetworkLimitHookStatus(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus) (event.Subscription, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetSetMaxNetworkLimitHookStatus")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSetMaxNetworkLimitHookStatus", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseSetSetMaxNetworkLimitHookStatus(log types.Log) (*IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus, error) {
	event := new(IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSetMaxNetworkLimitHookStatus", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeploySetSlashingDataIterator is returned from FilterSetSlashingData and is used to iterate over the raw logs and unpacked data for SetSlashingData events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetSlashingDataIterator struct {
	Event *IOpNetVaultAutoDeploySetSlashingData // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeploySetSlashingDataIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeploySetSlashingData)
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
		it.Event = new(IOpNetVaultAutoDeploySetSlashingData)
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
func (it *IOpNetVaultAutoDeploySetSlashingDataIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeploySetSlashingDataIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeploySetSlashingData represents a SetSlashingData event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetSlashingData struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
	Raw                   types.Log // Blockchain specific contextual infos
}

// FilterSetSlashingData is a free log retrieval operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterSetSlashingData(opts *bind.FilterOpts) (*IOpNetVaultAutoDeploySetSlashingDataIterator, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploySetSlashingDataIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "SetSlashingData", logs: logs, sub: sub}, nil
}

// WatchSetSlashingData is a free log subscription operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchSetSlashingData(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeploySetSlashingData) (event.Subscription, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeploySetSlashingData)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseSetSlashingData(log types.Log) (*IOpNetVaultAutoDeploySetSlashingData, error) {
	event := new(IOpNetVaultAutoDeploySetSlashingData)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeployUnregisterOperatorIterator is returned from FilterUnregisterOperator and is used to iterate over the raw logs and unpacked data for UnregisterOperator events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployUnregisterOperatorIterator struct {
	Event *IOpNetVaultAutoDeployUnregisterOperator // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeployUnregisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeployUnregisterOperator)
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
		it.Event = new(IOpNetVaultAutoDeployUnregisterOperator)
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
func (it *IOpNetVaultAutoDeployUnregisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeployUnregisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeployUnregisterOperator represents a UnregisterOperator event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployUnregisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperator is a free log retrieval operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterUnregisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IOpNetVaultAutoDeployUnregisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployUnregisterOperatorIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "UnregisterOperator", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperator is a free log subscription operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchUnregisterOperator(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeployUnregisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeployUnregisterOperator)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseUnregisterOperator(log types.Log) (*IOpNetVaultAutoDeployUnregisterOperator, error) {
	event := new(IOpNetVaultAutoDeployUnregisterOperator)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeployUnregisterOperatorVaultIterator is returned from FilterUnregisterOperatorVault and is used to iterate over the raw logs and unpacked data for UnregisterOperatorVault events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployUnregisterOperatorVaultIterator struct {
	Event *IOpNetVaultAutoDeployUnregisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeployUnregisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeployUnregisterOperatorVault)
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
		it.Event = new(IOpNetVaultAutoDeployUnregisterOperatorVault)
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
func (it *IOpNetVaultAutoDeployUnregisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeployUnregisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeployUnregisterOperatorVault represents a UnregisterOperatorVault event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployUnregisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperatorVault is a free log retrieval operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterUnregisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IOpNetVaultAutoDeployUnregisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployUnregisterOperatorVaultIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "UnregisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperatorVault is a free log subscription operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchUnregisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeployUnregisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeployUnregisterOperatorVault)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseUnregisterOperatorVault(log types.Log) (*IOpNetVaultAutoDeployUnregisterOperatorVault, error) {
	event := new(IOpNetVaultAutoDeployUnregisterOperatorVault)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeployUnregisterSharedVaultIterator is returned from FilterUnregisterSharedVault and is used to iterate over the raw logs and unpacked data for UnregisterSharedVault events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployUnregisterSharedVaultIterator struct {
	Event *IOpNetVaultAutoDeployUnregisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeployUnregisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeployUnregisterSharedVault)
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
		it.Event = new(IOpNetVaultAutoDeployUnregisterSharedVault)
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
func (it *IOpNetVaultAutoDeployUnregisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeployUnregisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeployUnregisterSharedVault represents a UnregisterSharedVault event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployUnregisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterSharedVault is a free log retrieval operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterUnregisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IOpNetVaultAutoDeployUnregisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployUnregisterSharedVaultIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "UnregisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterSharedVault is a free log subscription operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchUnregisterSharedVault(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeployUnregisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeployUnregisterSharedVault)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseUnregisterSharedVault(log types.Log) (*IOpNetVaultAutoDeployUnregisterSharedVault, error) {
	event := new(IOpNetVaultAutoDeployUnregisterSharedVault)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeployUnregisterTokenIterator is returned from FilterUnregisterToken and is used to iterate over the raw logs and unpacked data for UnregisterToken events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployUnregisterTokenIterator struct {
	Event *IOpNetVaultAutoDeployUnregisterToken // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeployUnregisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeployUnregisterToken)
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
		it.Event = new(IOpNetVaultAutoDeployUnregisterToken)
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
func (it *IOpNetVaultAutoDeployUnregisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeployUnregisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeployUnregisterToken represents a UnregisterToken event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeployUnregisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterToken is a free log retrieval operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterUnregisterToken(opts *bind.FilterOpts, token []common.Address) (*IOpNetVaultAutoDeployUnregisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployUnregisterTokenIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "UnregisterToken", logs: logs, sub: sub}, nil
}

// WatchUnregisterToken is a free log subscription operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchUnregisterToken(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeployUnregisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeployUnregisterToken)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
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
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseUnregisterToken(log types.Log) (*IOpNetVaultAutoDeployUnregisterToken, error) {
	event := new(IOpNetVaultAutoDeployUnregisterToken)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
