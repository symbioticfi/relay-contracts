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

// IOperatorsBlacklistMetaData contains all meta data concerning the IOperatorsBlacklist contract.
var IOperatorsBlacklistMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"OPERATOR_REGISTRY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VAULT_FACTORY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"blacklistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"getOperatorStakes\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakesAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaults\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaultsAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowers\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowersAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaults\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaultsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingData\",\"inputs\":[],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingDataAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokens\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokensAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowers\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowersAt\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"invalidateOldSignatures\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"isOperatorBlacklisted\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegistered\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegisteredAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"registerOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"registerOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unblacklistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"BlacklistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSlashingData\",\"inputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnblacklistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"OperatorsBlacklist_OperatorBlacklisted\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OperatorsBlacklist_OperatorNotBlacklisted\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperator\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperatorVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSharedVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidToken\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorAlreadyRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenNotRegistered\",\"inputs\":[]}]",
}

// IOperatorsBlacklistABI is the input ABI used to generate the binding from.
// Deprecated: Use IOperatorsBlacklistMetaData.ABI instead.
var IOperatorsBlacklistABI = IOperatorsBlacklistMetaData.ABI

// IOperatorsBlacklist is an auto generated Go binding around an Ethereum contract.
type IOperatorsBlacklist struct {
	IOperatorsBlacklistCaller     // Read-only binding to the contract
	IOperatorsBlacklistTransactor // Write-only binding to the contract
	IOperatorsBlacklistFilterer   // Log filterer for contract events
}

// IOperatorsBlacklistCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOperatorsBlacklistCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsBlacklistTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOperatorsBlacklistTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsBlacklistFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOperatorsBlacklistFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsBlacklistSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOperatorsBlacklistSession struct {
	Contract     *IOperatorsBlacklist // Generic contract binding to set the session for
	CallOpts     bind.CallOpts        // Call options to use throughout this session
	TransactOpts bind.TransactOpts    // Transaction auth options to use throughout this session
}

// IOperatorsBlacklistCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOperatorsBlacklistCallerSession struct {
	Contract *IOperatorsBlacklistCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts              // Call options to use throughout this session
}

// IOperatorsBlacklistTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOperatorsBlacklistTransactorSession struct {
	Contract     *IOperatorsBlacklistTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts              // Transaction auth options to use throughout this session
}

// IOperatorsBlacklistRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOperatorsBlacklistRaw struct {
	Contract *IOperatorsBlacklist // Generic contract binding to access the raw methods on
}

// IOperatorsBlacklistCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOperatorsBlacklistCallerRaw struct {
	Contract *IOperatorsBlacklistCaller // Generic read-only contract binding to access the raw methods on
}

// IOperatorsBlacklistTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOperatorsBlacklistTransactorRaw struct {
	Contract *IOperatorsBlacklistTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOperatorsBlacklist creates a new instance of IOperatorsBlacklist, bound to a specific deployed contract.
func NewIOperatorsBlacklist(address common.Address, backend bind.ContractBackend) (*IOperatorsBlacklist, error) {
	contract, err := bindIOperatorsBlacklist(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklist{IOperatorsBlacklistCaller: IOperatorsBlacklistCaller{contract: contract}, IOperatorsBlacklistTransactor: IOperatorsBlacklistTransactor{contract: contract}, IOperatorsBlacklistFilterer: IOperatorsBlacklistFilterer{contract: contract}}, nil
}

// NewIOperatorsBlacklistCaller creates a new read-only instance of IOperatorsBlacklist, bound to a specific deployed contract.
func NewIOperatorsBlacklistCaller(address common.Address, caller bind.ContractCaller) (*IOperatorsBlacklistCaller, error) {
	contract, err := bindIOperatorsBlacklist(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistCaller{contract: contract}, nil
}

// NewIOperatorsBlacklistTransactor creates a new write-only instance of IOperatorsBlacklist, bound to a specific deployed contract.
func NewIOperatorsBlacklistTransactor(address common.Address, transactor bind.ContractTransactor) (*IOperatorsBlacklistTransactor, error) {
	contract, err := bindIOperatorsBlacklist(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistTransactor{contract: contract}, nil
}

// NewIOperatorsBlacklistFilterer creates a new log filterer instance of IOperatorsBlacklist, bound to a specific deployed contract.
func NewIOperatorsBlacklistFilterer(address common.Address, filterer bind.ContractFilterer) (*IOperatorsBlacklistFilterer, error) {
	contract, err := bindIOperatorsBlacklist(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistFilterer{contract: contract}, nil
}

// bindIOperatorsBlacklist binds a generic wrapper to an already deployed contract.
func bindIOperatorsBlacklist(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOperatorsBlacklistMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorsBlacklist *IOperatorsBlacklistRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorsBlacklist.Contract.IOperatorsBlacklistCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorsBlacklist *IOperatorsBlacklistRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.IOperatorsBlacklistTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorsBlacklist *IOperatorsBlacklistRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.IOperatorsBlacklistTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorsBlacklist.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.contract.Transact(opts, method, params...)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) OPERATORREGISTRY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "OPERATOR_REGISTRY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) OPERATORREGISTRY() (common.Address, error) {
	return _IOperatorsBlacklist.Contract.OPERATORREGISTRY(&_IOperatorsBlacklist.CallOpts)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) OPERATORREGISTRY() (common.Address, error) {
	return _IOperatorsBlacklist.Contract.OPERATORREGISTRY(&_IOperatorsBlacklist.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) VAULTFACTORY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "VAULT_FACTORY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) VAULTFACTORY() (common.Address, error) {
	return _IOperatorsBlacklist.Contract.VAULTFACTORY(&_IOperatorsBlacklist.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) VAULTFACTORY() (common.Address, error) {
	return _IOperatorsBlacklist.Contract.VAULTFACTORY(&_IOperatorsBlacklist.CallOpts)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetOperatorStakes(opts *bind.CallOpts, operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getOperatorStakes", operator)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorStakes(&_IOperatorsBlacklist.CallOpts, operator)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorStakes(&_IOperatorsBlacklist.CallOpts, operator)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetOperatorStakesAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getOperatorStakesAt", operator, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorStakesAt(&_IOperatorsBlacklist.CallOpts, operator, timestamp)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorStakesAt(&_IOperatorsBlacklist.CallOpts, operator, timestamp)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetOperatorVaults(opts *bind.CallOpts, operator common.Address) ([]common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getOperatorVaults", operator)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorVaults(&_IOperatorsBlacklist.CallOpts, operator)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorVaults(&_IOperatorsBlacklist.CallOpts, operator)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetOperatorVaultsAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getOperatorVaultsAt", operator, timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorVaultsAt(&_IOperatorsBlacklist.CallOpts, operator, timestamp)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorVaultsAt(&_IOperatorsBlacklist.CallOpts, operator, timestamp)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetOperatorVotingPowers(opts *bind.CallOpts, operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getOperatorVotingPowers", operator, extraData)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorVotingPowers(&_IOperatorsBlacklist.CallOpts, operator, extraData)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorVotingPowers(&_IOperatorsBlacklist.CallOpts, operator, extraData)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetOperatorVotingPowersAt(opts *bind.CallOpts, operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getOperatorVotingPowersAt", operator, extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorVotingPowersAt(&_IOperatorsBlacklist.CallOpts, operator, extraData, timestamp)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorVotingPowersAt(&_IOperatorsBlacklist.CallOpts, operator, extraData, timestamp)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetOperators(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getOperators")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetOperators() ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetOperators(&_IOperatorsBlacklist.CallOpts)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetOperators() ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetOperators(&_IOperatorsBlacklist.CallOpts)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetOperatorsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getOperatorsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorsAt(&_IOperatorsBlacklist.CallOpts, timestamp)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetOperatorsAt(&_IOperatorsBlacklist.CallOpts, timestamp)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetSharedVaults(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getSharedVaults")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetSharedVaults() ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetSharedVaults(&_IOperatorsBlacklist.CallOpts)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetSharedVaults() ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetSharedVaults(&_IOperatorsBlacklist.CallOpts)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetSharedVaultsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getSharedVaultsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetSharedVaultsAt(&_IOperatorsBlacklist.CallOpts, timestamp)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetSharedVaultsAt(&_IOperatorsBlacklist.CallOpts, timestamp)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetSlashingData(opts *bind.CallOpts) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getSlashingData")

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
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IOperatorsBlacklist.Contract.GetSlashingData(&_IOperatorsBlacklist.CallOpts)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IOperatorsBlacklist.Contract.GetSlashingData(&_IOperatorsBlacklist.CallOpts)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetSlashingDataAt(opts *bind.CallOpts, timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getSlashingDataAt", timestamp, hint)

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
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IOperatorsBlacklist.Contract.GetSlashingDataAt(&_IOperatorsBlacklist.CallOpts, timestamp, hint)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IOperatorsBlacklist.Contract.GetSlashingDataAt(&_IOperatorsBlacklist.CallOpts, timestamp, hint)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetTokens(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getTokens")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetTokens() ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetTokens(&_IOperatorsBlacklist.CallOpts)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetTokens() ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetTokens(&_IOperatorsBlacklist.CallOpts)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetTokensAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getTokensAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetTokensAt(&_IOperatorsBlacklist.CallOpts, timestamp)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IOperatorsBlacklist.Contract.GetTokensAt(&_IOperatorsBlacklist.CallOpts, timestamp)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetVotingPowers(opts *bind.CallOpts, extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getVotingPowers", extraData)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IOperatorsBlacklist.Contract.GetVotingPowers(&_IOperatorsBlacklist.CallOpts, extraData)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IOperatorsBlacklist.Contract.GetVotingPowers(&_IOperatorsBlacklist.CallOpts, extraData)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) GetVotingPowersAt(opts *bind.CallOpts, extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "getVotingPowersAt", extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IOperatorsBlacklist.Contract.GetVotingPowersAt(&_IOperatorsBlacklist.CallOpts, extraData, timestamp)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IOperatorsBlacklist.Contract.GetVotingPowersAt(&_IOperatorsBlacklist.CallOpts, extraData, timestamp)
}

// IsOperatorBlacklisted is a free data retrieval call binding the contract method 0xb9b6be97.
//
// Solidity: function isOperatorBlacklisted(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsOperatorBlacklisted(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isOperatorBlacklisted", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorBlacklisted is a free data retrieval call binding the contract method 0xb9b6be97.
//
// Solidity: function isOperatorBlacklisted(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsOperatorBlacklisted(operator common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorBlacklisted(&_IOperatorsBlacklist.CallOpts, operator)
}

// IsOperatorBlacklisted is a free data retrieval call binding the contract method 0xb9b6be97.
//
// Solidity: function isOperatorBlacklisted(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsOperatorBlacklisted(operator common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorBlacklisted(&_IOperatorsBlacklist.CallOpts, operator)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsOperatorRegistered(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isOperatorRegistered", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorRegistered(&_IOperatorsBlacklist.CallOpts, operator)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorRegistered(&_IOperatorsBlacklist.CallOpts, operator)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsOperatorRegisteredAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isOperatorRegisteredAt", operator, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorRegisteredAt(&_IOperatorsBlacklist.CallOpts, operator, timestamp)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorRegisteredAt(&_IOperatorsBlacklist.CallOpts, operator, timestamp)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsOperatorVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isOperatorVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorVaultRegistered(&_IOperatorsBlacklist.CallOpts, vault)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorVaultRegistered(&_IOperatorsBlacklist.CallOpts, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsOperatorVaultRegistered0(opts *bind.CallOpts, operator common.Address, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isOperatorVaultRegistered0", operator, vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorVaultRegistered0(&_IOperatorsBlacklist.CallOpts, operator, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorVaultRegistered0(&_IOperatorsBlacklist.CallOpts, operator, vault)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsOperatorVaultRegisteredAt(opts *bind.CallOpts, operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isOperatorVaultRegisteredAt", operator, vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorVaultRegisteredAt(&_IOperatorsBlacklist.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorVaultRegisteredAt(&_IOperatorsBlacklist.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsOperatorVaultRegisteredAt0(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isOperatorVaultRegisteredAt0", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorVaultRegisteredAt0(&_IOperatorsBlacklist.CallOpts, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorVaultRegisteredAt0(&_IOperatorsBlacklist.CallOpts, vault, timestamp)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsSharedVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isSharedVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsSharedVaultRegistered(&_IOperatorsBlacklist.CallOpts, vault)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsSharedVaultRegistered(&_IOperatorsBlacklist.CallOpts, vault)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsSharedVaultRegisteredAt(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isSharedVaultRegisteredAt", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsSharedVaultRegisteredAt(&_IOperatorsBlacklist.CallOpts, vault, timestamp)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsSharedVaultRegisteredAt(&_IOperatorsBlacklist.CallOpts, vault, timestamp)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsTokenRegistered(opts *bind.CallOpts, token common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isTokenRegistered", token)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsTokenRegistered(&_IOperatorsBlacklist.CallOpts, token)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsTokenRegistered(&_IOperatorsBlacklist.CallOpts, token)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsTokenRegisteredAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isTokenRegisteredAt", token, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsTokenRegisteredAt(&_IOperatorsBlacklist.CallOpts, token, timestamp)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsTokenRegisteredAt(&_IOperatorsBlacklist.CallOpts, token, timestamp)
}

// BlacklistOperator is a paid mutator transaction binding the contract method 0xb4492ecc.
//
// Solidity: function blacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) BlacklistOperator(opts *bind.TransactOpts, operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "blacklistOperator", operator)
}

// BlacklistOperator is a paid mutator transaction binding the contract method 0xb4492ecc.
//
// Solidity: function blacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) BlacklistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.BlacklistOperator(&_IOperatorsBlacklist.TransactOpts, operator)
}

// BlacklistOperator is a paid mutator transaction binding the contract method 0xb4492ecc.
//
// Solidity: function blacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) BlacklistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.BlacklistOperator(&_IOperatorsBlacklist.TransactOpts, operator)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) InvalidateOldSignatures(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "invalidateOldSignatures")
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.InvalidateOldSignatures(&_IOperatorsBlacklist.TransactOpts)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.InvalidateOldSignatures(&_IOperatorsBlacklist.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) RegisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "registerOperator")
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) RegisterOperator() (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.RegisterOperator(&_IOperatorsBlacklist.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) RegisterOperator() (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.RegisterOperator(&_IOperatorsBlacklist.TransactOpts)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) RegisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "registerOperatorWithSignature", operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.RegisterOperatorWithSignature(&_IOperatorsBlacklist.TransactOpts, operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.RegisterOperatorWithSignature(&_IOperatorsBlacklist.TransactOpts, operator, signature)
}

// UnblacklistOperator is a paid mutator transaction binding the contract method 0xd94f2692.
//
// Solidity: function unblacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) UnblacklistOperator(opts *bind.TransactOpts, operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "unblacklistOperator", operator)
}

// UnblacklistOperator is a paid mutator transaction binding the contract method 0xd94f2692.
//
// Solidity: function unblacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) UnblacklistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.UnblacklistOperator(&_IOperatorsBlacklist.TransactOpts, operator)
}

// UnblacklistOperator is a paid mutator transaction binding the contract method 0xd94f2692.
//
// Solidity: function unblacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) UnblacklistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.UnblacklistOperator(&_IOperatorsBlacklist.TransactOpts, operator)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) UnregisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "unregisterOperator")
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) UnregisterOperator() (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.UnregisterOperator(&_IOperatorsBlacklist.TransactOpts)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) UnregisterOperator() (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.UnregisterOperator(&_IOperatorsBlacklist.TransactOpts)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) UnregisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "unregisterOperatorWithSignature", operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.UnregisterOperatorWithSignature(&_IOperatorsBlacklist.TransactOpts, operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.UnregisterOperatorWithSignature(&_IOperatorsBlacklist.TransactOpts, operator, signature)
}

// IOperatorsBlacklistBlacklistOperatorIterator is returned from FilterBlacklistOperator and is used to iterate over the raw logs and unpacked data for BlacklistOperator events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistBlacklistOperatorIterator struct {
	Event *IOperatorsBlacklistBlacklistOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistBlacklistOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistBlacklistOperator)
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
		it.Event = new(IOperatorsBlacklistBlacklistOperator)
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
func (it *IOperatorsBlacklistBlacklistOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistBlacklistOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistBlacklistOperator represents a BlacklistOperator event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistBlacklistOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterBlacklistOperator is a free log retrieval operation binding the contract event 0xa2f2b21af6bc9ffdbeee793f463ab6dae1e9834763f7367ed293450777323839.
//
// Solidity: event BlacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterBlacklistOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsBlacklistBlacklistOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "BlacklistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistBlacklistOperatorIterator{contract: _IOperatorsBlacklist.contract, event: "BlacklistOperator", logs: logs, sub: sub}, nil
}

// WatchBlacklistOperator is a free log subscription operation binding the contract event 0xa2f2b21af6bc9ffdbeee793f463ab6dae1e9834763f7367ed293450777323839.
//
// Solidity: event BlacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchBlacklistOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistBlacklistOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "BlacklistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistBlacklistOperator)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "BlacklistOperator", log); err != nil {
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

// ParseBlacklistOperator is a log parse operation binding the contract event 0xa2f2b21af6bc9ffdbeee793f463ab6dae1e9834763f7367ed293450777323839.
//
// Solidity: event BlacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseBlacklistOperator(log types.Log) (*IOperatorsBlacklistBlacklistOperator, error) {
	event := new(IOperatorsBlacklistBlacklistOperator)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "BlacklistOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistRegisterOperatorIterator is returned from FilterRegisterOperator and is used to iterate over the raw logs and unpacked data for RegisterOperator events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistRegisterOperatorIterator struct {
	Event *IOperatorsBlacklistRegisterOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistRegisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistRegisterOperator)
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
		it.Event = new(IOperatorsBlacklistRegisterOperator)
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
func (it *IOperatorsBlacklistRegisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistRegisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistRegisterOperator represents a RegisterOperator event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistRegisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperator is a free log retrieval operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterRegisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsBlacklistRegisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistRegisterOperatorIterator{contract: _IOperatorsBlacklist.contract, event: "RegisterOperator", logs: logs, sub: sub}, nil
}

// WatchRegisterOperator is a free log subscription operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchRegisterOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistRegisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistRegisterOperator)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseRegisterOperator(log types.Log) (*IOperatorsBlacklistRegisterOperator, error) {
	event := new(IOperatorsBlacklistRegisterOperator)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistRegisterOperatorVaultIterator is returned from FilterRegisterOperatorVault and is used to iterate over the raw logs and unpacked data for RegisterOperatorVault events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistRegisterOperatorVaultIterator struct {
	Event *IOperatorsBlacklistRegisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistRegisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistRegisterOperatorVault)
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
		it.Event = new(IOperatorsBlacklistRegisterOperatorVault)
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
func (it *IOperatorsBlacklistRegisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistRegisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistRegisterOperatorVault represents a RegisterOperatorVault event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistRegisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperatorVault is a free log retrieval operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterRegisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IOperatorsBlacklistRegisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistRegisterOperatorVaultIterator{contract: _IOperatorsBlacklist.contract, event: "RegisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchRegisterOperatorVault is a free log subscription operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchRegisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistRegisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistRegisterOperatorVault)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseRegisterOperatorVault(log types.Log) (*IOperatorsBlacklistRegisterOperatorVault, error) {
	event := new(IOperatorsBlacklistRegisterOperatorVault)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistRegisterSharedVaultIterator is returned from FilterRegisterSharedVault and is used to iterate over the raw logs and unpacked data for RegisterSharedVault events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistRegisterSharedVaultIterator struct {
	Event *IOperatorsBlacklistRegisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistRegisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistRegisterSharedVault)
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
		it.Event = new(IOperatorsBlacklistRegisterSharedVault)
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
func (it *IOperatorsBlacklistRegisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistRegisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistRegisterSharedVault represents a RegisterSharedVault event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistRegisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterSharedVault is a free log retrieval operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterRegisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IOperatorsBlacklistRegisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistRegisterSharedVaultIterator{contract: _IOperatorsBlacklist.contract, event: "RegisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchRegisterSharedVault is a free log subscription operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchRegisterSharedVault(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistRegisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistRegisterSharedVault)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseRegisterSharedVault(log types.Log) (*IOperatorsBlacklistRegisterSharedVault, error) {
	event := new(IOperatorsBlacklistRegisterSharedVault)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistRegisterTokenIterator is returned from FilterRegisterToken and is used to iterate over the raw logs and unpacked data for RegisterToken events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistRegisterTokenIterator struct {
	Event *IOperatorsBlacklistRegisterToken // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistRegisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistRegisterToken)
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
		it.Event = new(IOperatorsBlacklistRegisterToken)
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
func (it *IOperatorsBlacklistRegisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistRegisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistRegisterToken represents a RegisterToken event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistRegisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterToken is a free log retrieval operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterRegisterToken(opts *bind.FilterOpts, token []common.Address) (*IOperatorsBlacklistRegisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistRegisterTokenIterator{contract: _IOperatorsBlacklist.contract, event: "RegisterToken", logs: logs, sub: sub}, nil
}

// WatchRegisterToken is a free log subscription operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchRegisterToken(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistRegisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistRegisterToken)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "RegisterToken", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseRegisterToken(log types.Log) (*IOperatorsBlacklistRegisterToken, error) {
	event := new(IOperatorsBlacklistRegisterToken)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "RegisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistSetSlashingDataIterator is returned from FilterSetSlashingData and is used to iterate over the raw logs and unpacked data for SetSlashingData events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistSetSlashingDataIterator struct {
	Event *IOperatorsBlacklistSetSlashingData // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistSetSlashingDataIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistSetSlashingData)
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
		it.Event = new(IOperatorsBlacklistSetSlashingData)
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
func (it *IOperatorsBlacklistSetSlashingDataIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistSetSlashingDataIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistSetSlashingData represents a SetSlashingData event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistSetSlashingData struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
	Raw                   types.Log // Blockchain specific contextual infos
}

// FilterSetSlashingData is a free log retrieval operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterSetSlashingData(opts *bind.FilterOpts) (*IOperatorsBlacklistSetSlashingDataIterator, error) {

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistSetSlashingDataIterator{contract: _IOperatorsBlacklist.contract, event: "SetSlashingData", logs: logs, sub: sub}, nil
}

// WatchSetSlashingData is a free log subscription operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchSetSlashingData(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistSetSlashingData) (event.Subscription, error) {

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistSetSlashingData)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseSetSlashingData(log types.Log) (*IOperatorsBlacklistSetSlashingData, error) {
	event := new(IOperatorsBlacklistSetSlashingData)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistUnblacklistOperatorIterator is returned from FilterUnblacklistOperator and is used to iterate over the raw logs and unpacked data for UnblacklistOperator events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnblacklistOperatorIterator struct {
	Event *IOperatorsBlacklistUnblacklistOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistUnblacklistOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistUnblacklistOperator)
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
		it.Event = new(IOperatorsBlacklistUnblacklistOperator)
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
func (it *IOperatorsBlacklistUnblacklistOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistUnblacklistOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistUnblacklistOperator represents a UnblacklistOperator event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnblacklistOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnblacklistOperator is a free log retrieval operation binding the contract event 0x8e5976d2355c5ef45f7640d6e5ee278dc35eeb6673b6e12231986c9ffc507b14.
//
// Solidity: event UnblacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterUnblacklistOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsBlacklistUnblacklistOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "UnblacklistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistUnblacklistOperatorIterator{contract: _IOperatorsBlacklist.contract, event: "UnblacklistOperator", logs: logs, sub: sub}, nil
}

// WatchUnblacklistOperator is a free log subscription operation binding the contract event 0x8e5976d2355c5ef45f7640d6e5ee278dc35eeb6673b6e12231986c9ffc507b14.
//
// Solidity: event UnblacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchUnblacklistOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistUnblacklistOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "UnblacklistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistUnblacklistOperator)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnblacklistOperator", log); err != nil {
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

// ParseUnblacklistOperator is a log parse operation binding the contract event 0x8e5976d2355c5ef45f7640d6e5ee278dc35eeb6673b6e12231986c9ffc507b14.
//
// Solidity: event UnblacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseUnblacklistOperator(log types.Log) (*IOperatorsBlacklistUnblacklistOperator, error) {
	event := new(IOperatorsBlacklistUnblacklistOperator)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnblacklistOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistUnregisterOperatorIterator is returned from FilterUnregisterOperator and is used to iterate over the raw logs and unpacked data for UnregisterOperator events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnregisterOperatorIterator struct {
	Event *IOperatorsBlacklistUnregisterOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistUnregisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistUnregisterOperator)
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
		it.Event = new(IOperatorsBlacklistUnregisterOperator)
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
func (it *IOperatorsBlacklistUnregisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistUnregisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistUnregisterOperator represents a UnregisterOperator event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnregisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperator is a free log retrieval operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterUnregisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsBlacklistUnregisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistUnregisterOperatorIterator{contract: _IOperatorsBlacklist.contract, event: "UnregisterOperator", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperator is a free log subscription operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchUnregisterOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistUnregisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistUnregisterOperator)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseUnregisterOperator(log types.Log) (*IOperatorsBlacklistUnregisterOperator, error) {
	event := new(IOperatorsBlacklistUnregisterOperator)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistUnregisterOperatorVaultIterator is returned from FilterUnregisterOperatorVault and is used to iterate over the raw logs and unpacked data for UnregisterOperatorVault events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnregisterOperatorVaultIterator struct {
	Event *IOperatorsBlacklistUnregisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistUnregisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistUnregisterOperatorVault)
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
		it.Event = new(IOperatorsBlacklistUnregisterOperatorVault)
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
func (it *IOperatorsBlacklistUnregisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistUnregisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistUnregisterOperatorVault represents a UnregisterOperatorVault event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnregisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperatorVault is a free log retrieval operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterUnregisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IOperatorsBlacklistUnregisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistUnregisterOperatorVaultIterator{contract: _IOperatorsBlacklist.contract, event: "UnregisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperatorVault is a free log subscription operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchUnregisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistUnregisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistUnregisterOperatorVault)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseUnregisterOperatorVault(log types.Log) (*IOperatorsBlacklistUnregisterOperatorVault, error) {
	event := new(IOperatorsBlacklistUnregisterOperatorVault)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistUnregisterSharedVaultIterator is returned from FilterUnregisterSharedVault and is used to iterate over the raw logs and unpacked data for UnregisterSharedVault events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnregisterSharedVaultIterator struct {
	Event *IOperatorsBlacklistUnregisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistUnregisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistUnregisterSharedVault)
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
		it.Event = new(IOperatorsBlacklistUnregisterSharedVault)
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
func (it *IOperatorsBlacklistUnregisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistUnregisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistUnregisterSharedVault represents a UnregisterSharedVault event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnregisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterSharedVault is a free log retrieval operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterUnregisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IOperatorsBlacklistUnregisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistUnregisterSharedVaultIterator{contract: _IOperatorsBlacklist.contract, event: "UnregisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterSharedVault is a free log subscription operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchUnregisterSharedVault(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistUnregisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistUnregisterSharedVault)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseUnregisterSharedVault(log types.Log) (*IOperatorsBlacklistUnregisterSharedVault, error) {
	event := new(IOperatorsBlacklistUnregisterSharedVault)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistUnregisterTokenIterator is returned from FilterUnregisterToken and is used to iterate over the raw logs and unpacked data for UnregisterToken events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnregisterTokenIterator struct {
	Event *IOperatorsBlacklistUnregisterToken // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistUnregisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistUnregisterToken)
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
		it.Event = new(IOperatorsBlacklistUnregisterToken)
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
func (it *IOperatorsBlacklistUnregisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistUnregisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistUnregisterToken represents a UnregisterToken event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnregisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterToken is a free log retrieval operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterUnregisterToken(opts *bind.FilterOpts, token []common.Address) (*IOperatorsBlacklistUnregisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistUnregisterTokenIterator{contract: _IOperatorsBlacklist.contract, event: "UnregisterToken", logs: logs, sub: sub}, nil
}

// WatchUnregisterToken is a free log subscription operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchUnregisterToken(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistUnregisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistUnregisterToken)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
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
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseUnregisterToken(log types.Log) (*IOperatorsBlacklistUnregisterToken, error) {
	event := new(IOperatorsBlacklistUnregisterToken)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
