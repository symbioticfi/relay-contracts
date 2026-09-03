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

// IEqualStakeVPCalcMetaData contains all meta data concerning the IEqualStakeVPCalc contract.
var IEqualStakeVPCalcMetaData = &bind.MetaData{
	ABI: "[]",
}

// IEqualStakeVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use IEqualStakeVPCalcMetaData.ABI instead.
var IEqualStakeVPCalcABI = IEqualStakeVPCalcMetaData.ABI

// IEqualStakeVPCalc is an auto generated Go binding around an Ethereum contract.
type IEqualStakeVPCalc struct {
	IEqualStakeVPCalcCaller     // Read-only binding to the contract
	IEqualStakeVPCalcTransactor // Write-only binding to the contract
	IEqualStakeVPCalcFilterer   // Log filterer for contract events
}

// IEqualStakeVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type IEqualStakeVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IEqualStakeVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IEqualStakeVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IEqualStakeVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IEqualStakeVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IEqualStakeVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IEqualStakeVPCalcSession struct {
	Contract     *IEqualStakeVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts      // Call options to use throughout this session
	TransactOpts bind.TransactOpts  // Transaction auth options to use throughout this session
}

// IEqualStakeVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IEqualStakeVPCalcCallerSession struct {
	Contract *IEqualStakeVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts            // Call options to use throughout this session
}

// IEqualStakeVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IEqualStakeVPCalcTransactorSession struct {
	Contract     *IEqualStakeVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts            // Transaction auth options to use throughout this session
}

// IEqualStakeVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type IEqualStakeVPCalcRaw struct {
	Contract *IEqualStakeVPCalc // Generic contract binding to access the raw methods on
}

// IEqualStakeVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IEqualStakeVPCalcCallerRaw struct {
	Contract *IEqualStakeVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// IEqualStakeVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IEqualStakeVPCalcTransactorRaw struct {
	Contract *IEqualStakeVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIEqualStakeVPCalc creates a new instance of IEqualStakeVPCalc, bound to a specific deployed contract.
func NewIEqualStakeVPCalc(address common.Address, backend bind.ContractBackend) (*IEqualStakeVPCalc, error) {
	contract, err := bindIEqualStakeVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IEqualStakeVPCalc{IEqualStakeVPCalcCaller: IEqualStakeVPCalcCaller{contract: contract}, IEqualStakeVPCalcTransactor: IEqualStakeVPCalcTransactor{contract: contract}, IEqualStakeVPCalcFilterer: IEqualStakeVPCalcFilterer{contract: contract}}, nil
}

// NewIEqualStakeVPCalcCaller creates a new read-only instance of IEqualStakeVPCalc, bound to a specific deployed contract.
func NewIEqualStakeVPCalcCaller(address common.Address, caller bind.ContractCaller) (*IEqualStakeVPCalcCaller, error) {
	contract, err := bindIEqualStakeVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IEqualStakeVPCalcCaller{contract: contract}, nil
}

// NewIEqualStakeVPCalcTransactor creates a new write-only instance of IEqualStakeVPCalc, bound to a specific deployed contract.
func NewIEqualStakeVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*IEqualStakeVPCalcTransactor, error) {
	contract, err := bindIEqualStakeVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IEqualStakeVPCalcTransactor{contract: contract}, nil
}

// NewIEqualStakeVPCalcFilterer creates a new log filterer instance of IEqualStakeVPCalc, bound to a specific deployed contract.
func NewIEqualStakeVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*IEqualStakeVPCalcFilterer, error) {
	contract, err := bindIEqualStakeVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IEqualStakeVPCalcFilterer{contract: contract}, nil
}

// bindIEqualStakeVPCalc binds a generic wrapper to an already deployed contract.
func bindIEqualStakeVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IEqualStakeVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IEqualStakeVPCalc *IEqualStakeVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IEqualStakeVPCalc.Contract.IEqualStakeVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IEqualStakeVPCalc *IEqualStakeVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IEqualStakeVPCalc.Contract.IEqualStakeVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IEqualStakeVPCalc *IEqualStakeVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IEqualStakeVPCalc.Contract.IEqualStakeVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IEqualStakeVPCalc *IEqualStakeVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IEqualStakeVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IEqualStakeVPCalc *IEqualStakeVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IEqualStakeVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IEqualStakeVPCalc *IEqualStakeVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IEqualStakeVPCalc.Contract.contract.Transact(opts, method, params...)
}
