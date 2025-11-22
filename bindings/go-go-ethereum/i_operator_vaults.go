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

// IOperatorVaultsMetaData contains all meta data concerning the IOperatorVaults contract.
var IOperatorVaultsMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"registerOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperatorVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"}]",
}

// IOperatorVaultsABI is the input ABI used to generate the binding from.
// Deprecated: Use IOperatorVaultsMetaData.ABI instead.
var IOperatorVaultsABI = IOperatorVaultsMetaData.ABI

// IOperatorVaults is an auto generated Go binding around an Ethereum contract.
type IOperatorVaults struct {
	IOperatorVaultsCaller     // Read-only binding to the contract
	IOperatorVaultsTransactor // Write-only binding to the contract
	IOperatorVaultsFilterer   // Log filterer for contract events
}

// IOperatorVaultsCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOperatorVaultsCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorVaultsTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOperatorVaultsTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorVaultsFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOperatorVaultsFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorVaultsSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOperatorVaultsSession struct {
	Contract     *IOperatorVaults  // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IOperatorVaultsCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOperatorVaultsCallerSession struct {
	Contract *IOperatorVaultsCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts          // Call options to use throughout this session
}

// IOperatorVaultsTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOperatorVaultsTransactorSession struct {
	Contract     *IOperatorVaultsTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts          // Transaction auth options to use throughout this session
}

// IOperatorVaultsRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOperatorVaultsRaw struct {
	Contract *IOperatorVaults // Generic contract binding to access the raw methods on
}

// IOperatorVaultsCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOperatorVaultsCallerRaw struct {
	Contract *IOperatorVaultsCaller // Generic read-only contract binding to access the raw methods on
}

// IOperatorVaultsTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOperatorVaultsTransactorRaw struct {
	Contract *IOperatorVaultsTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOperatorVaults creates a new instance of IOperatorVaults, bound to a specific deployed contract.
func NewIOperatorVaults(address common.Address, backend bind.ContractBackend) (*IOperatorVaults, error) {
	contract, err := bindIOperatorVaults(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOperatorVaults{IOperatorVaultsCaller: IOperatorVaultsCaller{contract: contract}, IOperatorVaultsTransactor: IOperatorVaultsTransactor{contract: contract}, IOperatorVaultsFilterer: IOperatorVaultsFilterer{contract: contract}}, nil
}

// NewIOperatorVaultsCaller creates a new read-only instance of IOperatorVaults, bound to a specific deployed contract.
func NewIOperatorVaultsCaller(address common.Address, caller bind.ContractCaller) (*IOperatorVaultsCaller, error) {
	contract, err := bindIOperatorVaults(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorVaultsCaller{contract: contract}, nil
}

// NewIOperatorVaultsTransactor creates a new write-only instance of IOperatorVaults, bound to a specific deployed contract.
func NewIOperatorVaultsTransactor(address common.Address, transactor bind.ContractTransactor) (*IOperatorVaultsTransactor, error) {
	contract, err := bindIOperatorVaults(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorVaultsTransactor{contract: contract}, nil
}

// NewIOperatorVaultsFilterer creates a new log filterer instance of IOperatorVaults, bound to a specific deployed contract.
func NewIOperatorVaultsFilterer(address common.Address, filterer bind.ContractFilterer) (*IOperatorVaultsFilterer, error) {
	contract, err := bindIOperatorVaults(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOperatorVaultsFilterer{contract: contract}, nil
}

// bindIOperatorVaults binds a generic wrapper to an already deployed contract.
func bindIOperatorVaults(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOperatorVaultsMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorVaults *IOperatorVaultsRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorVaults.Contract.IOperatorVaultsCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorVaults *IOperatorVaultsRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.IOperatorVaultsTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorVaults *IOperatorVaultsRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.IOperatorVaultsTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorVaults *IOperatorVaultsCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorVaults.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorVaults *IOperatorVaultsTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorVaults *IOperatorVaultsTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.contract.Transact(opts, method, params...)
}

// RegisterOperatorVault is a paid mutator transaction binding the contract method 0xb1a69fa2.
//
// Solidity: function registerOperatorVault(address operator, address vault) returns()
func (_IOperatorVaults *IOperatorVaultsTransactor) RegisterOperatorVault(opts *bind.TransactOpts, operator common.Address, vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.contract.Transact(opts, "registerOperatorVault", operator, vault)
}

// RegisterOperatorVault is a paid mutator transaction binding the contract method 0xb1a69fa2.
//
// Solidity: function registerOperatorVault(address operator, address vault) returns()
func (_IOperatorVaults *IOperatorVaultsSession) RegisterOperatorVault(operator common.Address, vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.RegisterOperatorVault(&_IOperatorVaults.TransactOpts, operator, vault)
}

// RegisterOperatorVault is a paid mutator transaction binding the contract method 0xb1a69fa2.
//
// Solidity: function registerOperatorVault(address operator, address vault) returns()
func (_IOperatorVaults *IOperatorVaultsTransactorSession) RegisterOperatorVault(operator common.Address, vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.RegisterOperatorVault(&_IOperatorVaults.TransactOpts, operator, vault)
}

// UnregisterOperatorVault is a paid mutator transaction binding the contract method 0x7664c514.
//
// Solidity: function unregisterOperatorVault(address vault) returns()
func (_IOperatorVaults *IOperatorVaultsTransactor) UnregisterOperatorVault(opts *bind.TransactOpts, vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.contract.Transact(opts, "unregisterOperatorVault", vault)
}

// UnregisterOperatorVault is a paid mutator transaction binding the contract method 0x7664c514.
//
// Solidity: function unregisterOperatorVault(address vault) returns()
func (_IOperatorVaults *IOperatorVaultsSession) UnregisterOperatorVault(vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.UnregisterOperatorVault(&_IOperatorVaults.TransactOpts, vault)
}

// UnregisterOperatorVault is a paid mutator transaction binding the contract method 0x7664c514.
//
// Solidity: function unregisterOperatorVault(address vault) returns()
func (_IOperatorVaults *IOperatorVaultsTransactorSession) UnregisterOperatorVault(vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.UnregisterOperatorVault(&_IOperatorVaults.TransactOpts, vault)
}

// UnregisterOperatorVault0 is a paid mutator transaction binding the contract method 0xcb87ef6e.
//
// Solidity: function unregisterOperatorVault(address operator, address vault) returns()
func (_IOperatorVaults *IOperatorVaultsTransactor) UnregisterOperatorVault0(opts *bind.TransactOpts, operator common.Address, vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.contract.Transact(opts, "unregisterOperatorVault0", operator, vault)
}

// UnregisterOperatorVault0 is a paid mutator transaction binding the contract method 0xcb87ef6e.
//
// Solidity: function unregisterOperatorVault(address operator, address vault) returns()
func (_IOperatorVaults *IOperatorVaultsSession) UnregisterOperatorVault0(operator common.Address, vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.UnregisterOperatorVault0(&_IOperatorVaults.TransactOpts, operator, vault)
}

// UnregisterOperatorVault0 is a paid mutator transaction binding the contract method 0xcb87ef6e.
//
// Solidity: function unregisterOperatorVault(address operator, address vault) returns()
func (_IOperatorVaults *IOperatorVaultsTransactorSession) UnregisterOperatorVault0(operator common.Address, vault common.Address) (*types.Transaction, error) {
	return _IOperatorVaults.Contract.UnregisterOperatorVault0(&_IOperatorVaults.TransactOpts, operator, vault)
}
