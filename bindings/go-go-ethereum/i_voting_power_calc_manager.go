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

// IVotingPowerCalcManagerMetaData contains all meta data concerning the IVotingPowerCalcManager contract.
var IVotingPowerCalcManagerMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"stakeToVotingPower\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"stakeToVotingPowerAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"}]",
}

// IVotingPowerCalcManagerABI is the input ABI used to generate the binding from.
// Deprecated: Use IVotingPowerCalcManagerMetaData.ABI instead.
var IVotingPowerCalcManagerABI = IVotingPowerCalcManagerMetaData.ABI

// IVotingPowerCalcManager is an auto generated Go binding around an Ethereum contract.
type IVotingPowerCalcManager struct {
	IVotingPowerCalcManagerCaller     // Read-only binding to the contract
	IVotingPowerCalcManagerTransactor // Write-only binding to the contract
	IVotingPowerCalcManagerFilterer   // Log filterer for contract events
}

// IVotingPowerCalcManagerCaller is an auto generated read-only Go binding around an Ethereum contract.
type IVotingPowerCalcManagerCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVotingPowerCalcManagerTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IVotingPowerCalcManagerTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVotingPowerCalcManagerFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IVotingPowerCalcManagerFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVotingPowerCalcManagerSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IVotingPowerCalcManagerSession struct {
	Contract     *IVotingPowerCalcManager // Generic contract binding to set the session for
	CallOpts     bind.CallOpts            // Call options to use throughout this session
	TransactOpts bind.TransactOpts        // Transaction auth options to use throughout this session
}

// IVotingPowerCalcManagerCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IVotingPowerCalcManagerCallerSession struct {
	Contract *IVotingPowerCalcManagerCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                  // Call options to use throughout this session
}

// IVotingPowerCalcManagerTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IVotingPowerCalcManagerTransactorSession struct {
	Contract     *IVotingPowerCalcManagerTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                  // Transaction auth options to use throughout this session
}

// IVotingPowerCalcManagerRaw is an auto generated low-level Go binding around an Ethereum contract.
type IVotingPowerCalcManagerRaw struct {
	Contract *IVotingPowerCalcManager // Generic contract binding to access the raw methods on
}

// IVotingPowerCalcManagerCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IVotingPowerCalcManagerCallerRaw struct {
	Contract *IVotingPowerCalcManagerCaller // Generic read-only contract binding to access the raw methods on
}

// IVotingPowerCalcManagerTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IVotingPowerCalcManagerTransactorRaw struct {
	Contract *IVotingPowerCalcManagerTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIVotingPowerCalcManager creates a new instance of IVotingPowerCalcManager, bound to a specific deployed contract.
func NewIVotingPowerCalcManager(address common.Address, backend bind.ContractBackend) (*IVotingPowerCalcManager, error) {
	contract, err := bindIVotingPowerCalcManager(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerCalcManager{IVotingPowerCalcManagerCaller: IVotingPowerCalcManagerCaller{contract: contract}, IVotingPowerCalcManagerTransactor: IVotingPowerCalcManagerTransactor{contract: contract}, IVotingPowerCalcManagerFilterer: IVotingPowerCalcManagerFilterer{contract: contract}}, nil
}

// NewIVotingPowerCalcManagerCaller creates a new read-only instance of IVotingPowerCalcManager, bound to a specific deployed contract.
func NewIVotingPowerCalcManagerCaller(address common.Address, caller bind.ContractCaller) (*IVotingPowerCalcManagerCaller, error) {
	contract, err := bindIVotingPowerCalcManager(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerCalcManagerCaller{contract: contract}, nil
}

// NewIVotingPowerCalcManagerTransactor creates a new write-only instance of IVotingPowerCalcManager, bound to a specific deployed contract.
func NewIVotingPowerCalcManagerTransactor(address common.Address, transactor bind.ContractTransactor) (*IVotingPowerCalcManagerTransactor, error) {
	contract, err := bindIVotingPowerCalcManager(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerCalcManagerTransactor{contract: contract}, nil
}

// NewIVotingPowerCalcManagerFilterer creates a new log filterer instance of IVotingPowerCalcManager, bound to a specific deployed contract.
func NewIVotingPowerCalcManagerFilterer(address common.Address, filterer bind.ContractFilterer) (*IVotingPowerCalcManagerFilterer, error) {
	contract, err := bindIVotingPowerCalcManager(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerCalcManagerFilterer{contract: contract}, nil
}

// bindIVotingPowerCalcManager binds a generic wrapper to an already deployed contract.
func bindIVotingPowerCalcManager(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IVotingPowerCalcManagerMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IVotingPowerCalcManager.Contract.IVotingPowerCalcManagerCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVotingPowerCalcManager.Contract.IVotingPowerCalcManagerTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IVotingPowerCalcManager.Contract.IVotingPowerCalcManagerTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IVotingPowerCalcManager.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVotingPowerCalcManager.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IVotingPowerCalcManager.Contract.contract.Transact(opts, method, params...)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerCaller) StakeToVotingPower(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	var out []interface{}
	err := _IVotingPowerCalcManager.contract.Call(opts, &out, "stakeToVotingPower", vault, stake, extraData)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _IVotingPowerCalcManager.Contract.StakeToVotingPower(&_IVotingPowerCalcManager.CallOpts, vault, stake, extraData)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerCallerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _IVotingPowerCalcManager.Contract.StakeToVotingPower(&_IVotingPowerCalcManager.CallOpts, vault, stake, extraData)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerCaller) StakeToVotingPowerAt(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IVotingPowerCalcManager.contract.Call(opts, &out, "stakeToVotingPowerAt", vault, stake, extraData, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _IVotingPowerCalcManager.Contract.StakeToVotingPowerAt(&_IVotingPowerCalcManager.CallOpts, vault, stake, extraData, timestamp)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_IVotingPowerCalcManager *IVotingPowerCalcManagerCallerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _IVotingPowerCalcManager.Contract.StakeToVotingPowerAt(&_IVotingPowerCalcManager.CallOpts, vault, stake, extraData, timestamp)
}
