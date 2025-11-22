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

// IPermissionManagerMetaData contains all meta data concerning the IPermissionManager contract.
var IPermissionManagerMetaData = &bind.MetaData{
	ABI: "[]",
}

// IPermissionManagerABI is the input ABI used to generate the binding from.
// Deprecated: Use IPermissionManagerMetaData.ABI instead.
var IPermissionManagerABI = IPermissionManagerMetaData.ABI

// IPermissionManager is an auto generated Go binding around an Ethereum contract.
type IPermissionManager struct {
	IPermissionManagerCaller     // Read-only binding to the contract
	IPermissionManagerTransactor // Write-only binding to the contract
	IPermissionManagerFilterer   // Log filterer for contract events
}

// IPermissionManagerCaller is an auto generated read-only Go binding around an Ethereum contract.
type IPermissionManagerCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IPermissionManagerTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IPermissionManagerTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IPermissionManagerFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IPermissionManagerFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IPermissionManagerSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IPermissionManagerSession struct {
	Contract     *IPermissionManager // Generic contract binding to set the session for
	CallOpts     bind.CallOpts       // Call options to use throughout this session
	TransactOpts bind.TransactOpts   // Transaction auth options to use throughout this session
}

// IPermissionManagerCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IPermissionManagerCallerSession struct {
	Contract *IPermissionManagerCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts             // Call options to use throughout this session
}

// IPermissionManagerTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IPermissionManagerTransactorSession struct {
	Contract     *IPermissionManagerTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts             // Transaction auth options to use throughout this session
}

// IPermissionManagerRaw is an auto generated low-level Go binding around an Ethereum contract.
type IPermissionManagerRaw struct {
	Contract *IPermissionManager // Generic contract binding to access the raw methods on
}

// IPermissionManagerCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IPermissionManagerCallerRaw struct {
	Contract *IPermissionManagerCaller // Generic read-only contract binding to access the raw methods on
}

// IPermissionManagerTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IPermissionManagerTransactorRaw struct {
	Contract *IPermissionManagerTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIPermissionManager creates a new instance of IPermissionManager, bound to a specific deployed contract.
func NewIPermissionManager(address common.Address, backend bind.ContractBackend) (*IPermissionManager, error) {
	contract, err := bindIPermissionManager(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IPermissionManager{IPermissionManagerCaller: IPermissionManagerCaller{contract: contract}, IPermissionManagerTransactor: IPermissionManagerTransactor{contract: contract}, IPermissionManagerFilterer: IPermissionManagerFilterer{contract: contract}}, nil
}

// NewIPermissionManagerCaller creates a new read-only instance of IPermissionManager, bound to a specific deployed contract.
func NewIPermissionManagerCaller(address common.Address, caller bind.ContractCaller) (*IPermissionManagerCaller, error) {
	contract, err := bindIPermissionManager(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IPermissionManagerCaller{contract: contract}, nil
}

// NewIPermissionManagerTransactor creates a new write-only instance of IPermissionManager, bound to a specific deployed contract.
func NewIPermissionManagerTransactor(address common.Address, transactor bind.ContractTransactor) (*IPermissionManagerTransactor, error) {
	contract, err := bindIPermissionManager(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IPermissionManagerTransactor{contract: contract}, nil
}

// NewIPermissionManagerFilterer creates a new log filterer instance of IPermissionManager, bound to a specific deployed contract.
func NewIPermissionManagerFilterer(address common.Address, filterer bind.ContractFilterer) (*IPermissionManagerFilterer, error) {
	contract, err := bindIPermissionManager(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IPermissionManagerFilterer{contract: contract}, nil
}

// bindIPermissionManager binds a generic wrapper to an already deployed contract.
func bindIPermissionManager(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IPermissionManagerMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IPermissionManager *IPermissionManagerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IPermissionManager.Contract.IPermissionManagerCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IPermissionManager *IPermissionManagerRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IPermissionManager.Contract.IPermissionManagerTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IPermissionManager *IPermissionManagerRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IPermissionManager.Contract.IPermissionManagerTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IPermissionManager *IPermissionManagerCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IPermissionManager.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IPermissionManager *IPermissionManagerTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IPermissionManager.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IPermissionManager *IPermissionManagerTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IPermissionManager.Contract.contract.Transact(opts, method, params...)
}
