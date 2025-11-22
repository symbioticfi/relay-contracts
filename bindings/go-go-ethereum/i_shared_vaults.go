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

// ISharedVaultsMetaData contains all meta data concerning the ISharedVaults contract.
var ISharedVaultsMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"registerSharedVault\",\"inputs\":[{\"name\":\"sharedVault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterSharedVault\",\"inputs\":[{\"name\":\"sharedVault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"}]",
}

// ISharedVaultsABI is the input ABI used to generate the binding from.
// Deprecated: Use ISharedVaultsMetaData.ABI instead.
var ISharedVaultsABI = ISharedVaultsMetaData.ABI

// ISharedVaults is an auto generated Go binding around an Ethereum contract.
type ISharedVaults struct {
	ISharedVaultsCaller     // Read-only binding to the contract
	ISharedVaultsTransactor // Write-only binding to the contract
	ISharedVaultsFilterer   // Log filterer for contract events
}

// ISharedVaultsCaller is an auto generated read-only Go binding around an Ethereum contract.
type ISharedVaultsCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISharedVaultsTransactor is an auto generated write-only Go binding around an Ethereum contract.
type ISharedVaultsTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISharedVaultsFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type ISharedVaultsFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISharedVaultsSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type ISharedVaultsSession struct {
	Contract     *ISharedVaults    // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// ISharedVaultsCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type ISharedVaultsCallerSession struct {
	Contract *ISharedVaultsCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts        // Call options to use throughout this session
}

// ISharedVaultsTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type ISharedVaultsTransactorSession struct {
	Contract     *ISharedVaultsTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts        // Transaction auth options to use throughout this session
}

// ISharedVaultsRaw is an auto generated low-level Go binding around an Ethereum contract.
type ISharedVaultsRaw struct {
	Contract *ISharedVaults // Generic contract binding to access the raw methods on
}

// ISharedVaultsCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type ISharedVaultsCallerRaw struct {
	Contract *ISharedVaultsCaller // Generic read-only contract binding to access the raw methods on
}

// ISharedVaultsTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type ISharedVaultsTransactorRaw struct {
	Contract *ISharedVaultsTransactor // Generic write-only contract binding to access the raw methods on
}

// NewISharedVaults creates a new instance of ISharedVaults, bound to a specific deployed contract.
func NewISharedVaults(address common.Address, backend bind.ContractBackend) (*ISharedVaults, error) {
	contract, err := bindISharedVaults(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &ISharedVaults{ISharedVaultsCaller: ISharedVaultsCaller{contract: contract}, ISharedVaultsTransactor: ISharedVaultsTransactor{contract: contract}, ISharedVaultsFilterer: ISharedVaultsFilterer{contract: contract}}, nil
}

// NewISharedVaultsCaller creates a new read-only instance of ISharedVaults, bound to a specific deployed contract.
func NewISharedVaultsCaller(address common.Address, caller bind.ContractCaller) (*ISharedVaultsCaller, error) {
	contract, err := bindISharedVaults(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &ISharedVaultsCaller{contract: contract}, nil
}

// NewISharedVaultsTransactor creates a new write-only instance of ISharedVaults, bound to a specific deployed contract.
func NewISharedVaultsTransactor(address common.Address, transactor bind.ContractTransactor) (*ISharedVaultsTransactor, error) {
	contract, err := bindISharedVaults(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &ISharedVaultsTransactor{contract: contract}, nil
}

// NewISharedVaultsFilterer creates a new log filterer instance of ISharedVaults, bound to a specific deployed contract.
func NewISharedVaultsFilterer(address common.Address, filterer bind.ContractFilterer) (*ISharedVaultsFilterer, error) {
	contract, err := bindISharedVaults(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &ISharedVaultsFilterer{contract: contract}, nil
}

// bindISharedVaults binds a generic wrapper to an already deployed contract.
func bindISharedVaults(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := ISharedVaultsMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ISharedVaults *ISharedVaultsRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ISharedVaults.Contract.ISharedVaultsCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ISharedVaults *ISharedVaultsRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ISharedVaults.Contract.ISharedVaultsTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ISharedVaults *ISharedVaultsRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ISharedVaults.Contract.ISharedVaultsTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ISharedVaults *ISharedVaultsCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ISharedVaults.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ISharedVaults *ISharedVaultsTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ISharedVaults.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ISharedVaults *ISharedVaultsTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ISharedVaults.Contract.contract.Transact(opts, method, params...)
}

// RegisterSharedVault is a paid mutator transaction binding the contract method 0xca2d2a18.
//
// Solidity: function registerSharedVault(address sharedVault) returns()
func (_ISharedVaults *ISharedVaultsTransactor) RegisterSharedVault(opts *bind.TransactOpts, sharedVault common.Address) (*types.Transaction, error) {
	return _ISharedVaults.contract.Transact(opts, "registerSharedVault", sharedVault)
}

// RegisterSharedVault is a paid mutator transaction binding the contract method 0xca2d2a18.
//
// Solidity: function registerSharedVault(address sharedVault) returns()
func (_ISharedVaults *ISharedVaultsSession) RegisterSharedVault(sharedVault common.Address) (*types.Transaction, error) {
	return _ISharedVaults.Contract.RegisterSharedVault(&_ISharedVaults.TransactOpts, sharedVault)
}

// RegisterSharedVault is a paid mutator transaction binding the contract method 0xca2d2a18.
//
// Solidity: function registerSharedVault(address sharedVault) returns()
func (_ISharedVaults *ISharedVaultsTransactorSession) RegisterSharedVault(sharedVault common.Address) (*types.Transaction, error) {
	return _ISharedVaults.Contract.RegisterSharedVault(&_ISharedVaults.TransactOpts, sharedVault)
}

// UnregisterSharedVault is a paid mutator transaction binding the contract method 0x47449640.
//
// Solidity: function unregisterSharedVault(address sharedVault) returns()
func (_ISharedVaults *ISharedVaultsTransactor) UnregisterSharedVault(opts *bind.TransactOpts, sharedVault common.Address) (*types.Transaction, error) {
	return _ISharedVaults.contract.Transact(opts, "unregisterSharedVault", sharedVault)
}

// UnregisterSharedVault is a paid mutator transaction binding the contract method 0x47449640.
//
// Solidity: function unregisterSharedVault(address sharedVault) returns()
func (_ISharedVaults *ISharedVaultsSession) UnregisterSharedVault(sharedVault common.Address) (*types.Transaction, error) {
	return _ISharedVaults.Contract.UnregisterSharedVault(&_ISharedVaults.TransactOpts, sharedVault)
}

// UnregisterSharedVault is a paid mutator transaction binding the contract method 0x47449640.
//
// Solidity: function unregisterSharedVault(address sharedVault) returns()
func (_ISharedVaults *ISharedVaultsTransactorSession) UnregisterSharedVault(sharedVault common.Address) (*types.Transaction, error) {
	return _ISharedVaults.Contract.UnregisterSharedVault(&_ISharedVaults.TransactOpts, sharedVault)
}
