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

// PricedTokensChainlinkVPCalcMetaData contains all meta data concerning the PricedTokensChainlinkVPCalc contract.
var PricedTokensChainlinkVPCalcMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getTokenHops\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[2]\",\"internalType\":\"address[2]\"},{\"name\":\"\",\"type\":\"bool[2]\",\"internalType\":\"bool[2]\"},{\"name\":\"\",\"type\":\"uint48[2]\",\"internalType\":\"uint48[2]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokenHopsAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[2]\",\"internalType\":\"address[2]\"},{\"name\":\"\",\"type\":\"bool[2]\",\"internalType\":\"bool[2]\"},{\"name\":\"\",\"type\":\"uint48[2]\",\"internalType\":\"uint48[2]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokenPrice\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokenPriceAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setTokenHops\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"aggregators\",\"type\":\"address[2]\",\"internalType\":\"address[2]\"},{\"name\":\"inverts\",\"type\":\"bool[2]\",\"internalType\":\"bool[2]\"},{\"name\":\"stalenessDurations\",\"type\":\"uint48[2]\",\"internalType\":\"uint48[2]\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"stakeToVotingPower\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"stakeToVotingPowerAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetTokenHops\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"aggregators\",\"type\":\"address[2]\",\"indexed\":false,\"internalType\":\"address[2]\"},{\"name\":\"inverts\",\"type\":\"bool[2]\",\"indexed\":false,\"internalType\":\"bool[2]\"},{\"name\":\"stalenessDurations\",\"type\":\"uint48[2]\",\"indexed\":false,\"internalType\":\"uint48[2]\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"CheckpointUnorderedInsertion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"PricedTokensChainlinkVPCalc_InvalidAggregator\",\"inputs\":[]}]",
}

// PricedTokensChainlinkVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use PricedTokensChainlinkVPCalcMetaData.ABI instead.
var PricedTokensChainlinkVPCalcABI = PricedTokensChainlinkVPCalcMetaData.ABI

// PricedTokensChainlinkVPCalc is an auto generated Go binding around an Ethereum contract.
type PricedTokensChainlinkVPCalc struct {
	PricedTokensChainlinkVPCalcCaller     // Read-only binding to the contract
	PricedTokensChainlinkVPCalcTransactor // Write-only binding to the contract
	PricedTokensChainlinkVPCalcFilterer   // Log filterer for contract events
}

// PricedTokensChainlinkVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type PricedTokensChainlinkVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// PricedTokensChainlinkVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type PricedTokensChainlinkVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// PricedTokensChainlinkVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type PricedTokensChainlinkVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// PricedTokensChainlinkVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type PricedTokensChainlinkVPCalcSession struct {
	Contract     *PricedTokensChainlinkVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts                // Call options to use throughout this session
	TransactOpts bind.TransactOpts            // Transaction auth options to use throughout this session
}

// PricedTokensChainlinkVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type PricedTokensChainlinkVPCalcCallerSession struct {
	Contract *PricedTokensChainlinkVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                      // Call options to use throughout this session
}

// PricedTokensChainlinkVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type PricedTokensChainlinkVPCalcTransactorSession struct {
	Contract     *PricedTokensChainlinkVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                      // Transaction auth options to use throughout this session
}

// PricedTokensChainlinkVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type PricedTokensChainlinkVPCalcRaw struct {
	Contract *PricedTokensChainlinkVPCalc // Generic contract binding to access the raw methods on
}

// PricedTokensChainlinkVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type PricedTokensChainlinkVPCalcCallerRaw struct {
	Contract *PricedTokensChainlinkVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// PricedTokensChainlinkVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type PricedTokensChainlinkVPCalcTransactorRaw struct {
	Contract *PricedTokensChainlinkVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewPricedTokensChainlinkVPCalc creates a new instance of PricedTokensChainlinkVPCalc, bound to a specific deployed contract.
func NewPricedTokensChainlinkVPCalc(address common.Address, backend bind.ContractBackend) (*PricedTokensChainlinkVPCalc, error) {
	contract, err := bindPricedTokensChainlinkVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &PricedTokensChainlinkVPCalc{PricedTokensChainlinkVPCalcCaller: PricedTokensChainlinkVPCalcCaller{contract: contract}, PricedTokensChainlinkVPCalcTransactor: PricedTokensChainlinkVPCalcTransactor{contract: contract}, PricedTokensChainlinkVPCalcFilterer: PricedTokensChainlinkVPCalcFilterer{contract: contract}}, nil
}

// NewPricedTokensChainlinkVPCalcCaller creates a new read-only instance of PricedTokensChainlinkVPCalc, bound to a specific deployed contract.
func NewPricedTokensChainlinkVPCalcCaller(address common.Address, caller bind.ContractCaller) (*PricedTokensChainlinkVPCalcCaller, error) {
	contract, err := bindPricedTokensChainlinkVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &PricedTokensChainlinkVPCalcCaller{contract: contract}, nil
}

// NewPricedTokensChainlinkVPCalcTransactor creates a new write-only instance of PricedTokensChainlinkVPCalc, bound to a specific deployed contract.
func NewPricedTokensChainlinkVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*PricedTokensChainlinkVPCalcTransactor, error) {
	contract, err := bindPricedTokensChainlinkVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &PricedTokensChainlinkVPCalcTransactor{contract: contract}, nil
}

// NewPricedTokensChainlinkVPCalcFilterer creates a new log filterer instance of PricedTokensChainlinkVPCalc, bound to a specific deployed contract.
func NewPricedTokensChainlinkVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*PricedTokensChainlinkVPCalcFilterer, error) {
	contract, err := bindPricedTokensChainlinkVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &PricedTokensChainlinkVPCalcFilterer{contract: contract}, nil
}

// bindPricedTokensChainlinkVPCalc binds a generic wrapper to an already deployed contract.
func bindPricedTokensChainlinkVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := PricedTokensChainlinkVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _PricedTokensChainlinkVPCalc.Contract.PricedTokensChainlinkVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _PricedTokensChainlinkVPCalc.Contract.PricedTokensChainlinkVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _PricedTokensChainlinkVPCalc.Contract.PricedTokensChainlinkVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _PricedTokensChainlinkVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _PricedTokensChainlinkVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _PricedTokensChainlinkVPCalc.Contract.contract.Transact(opts, method, params...)
}

// GetTokenHops is a free data retrieval call binding the contract method 0xada1528b.
//
// Solidity: function getTokenHops(address token) view returns(address[2], bool[2], uint48[2])
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCaller) GetTokenHops(opts *bind.CallOpts, token common.Address) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	var out []interface{}
	err := _PricedTokensChainlinkVPCalc.contract.Call(opts, &out, "getTokenHops", token)

	if err != nil {
		return *new([2]common.Address), *new([2]bool), *new([2]*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new([2]common.Address)).(*[2]common.Address)
	out1 := *abi.ConvertType(out[1], new([2]bool)).(*[2]bool)
	out2 := *abi.ConvertType(out[2], new([2]*big.Int)).(*[2]*big.Int)

	return out0, out1, out2, err

}

// GetTokenHops is a free data retrieval call binding the contract method 0xada1528b.
//
// Solidity: function getTokenHops(address token) view returns(address[2], bool[2], uint48[2])
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcSession) GetTokenHops(token common.Address) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.GetTokenHops(&_PricedTokensChainlinkVPCalc.CallOpts, token)
}

// GetTokenHops is a free data retrieval call binding the contract method 0xada1528b.
//
// Solidity: function getTokenHops(address token) view returns(address[2], bool[2], uint48[2])
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCallerSession) GetTokenHops(token common.Address) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.GetTokenHops(&_PricedTokensChainlinkVPCalc.CallOpts, token)
}

// GetTokenHopsAt is a free data retrieval call binding the contract method 0x9a2500e4.
//
// Solidity: function getTokenHopsAt(address token, uint48 timestamp) view returns(address[2], bool[2], uint48[2])
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCaller) GetTokenHopsAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	var out []interface{}
	err := _PricedTokensChainlinkVPCalc.contract.Call(opts, &out, "getTokenHopsAt", token, timestamp)

	if err != nil {
		return *new([2]common.Address), *new([2]bool), *new([2]*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new([2]common.Address)).(*[2]common.Address)
	out1 := *abi.ConvertType(out[1], new([2]bool)).(*[2]bool)
	out2 := *abi.ConvertType(out[2], new([2]*big.Int)).(*[2]*big.Int)

	return out0, out1, out2, err

}

// GetTokenHopsAt is a free data retrieval call binding the contract method 0x9a2500e4.
//
// Solidity: function getTokenHopsAt(address token, uint48 timestamp) view returns(address[2], bool[2], uint48[2])
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcSession) GetTokenHopsAt(token common.Address, timestamp *big.Int) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.GetTokenHopsAt(&_PricedTokensChainlinkVPCalc.CallOpts, token, timestamp)
}

// GetTokenHopsAt is a free data retrieval call binding the contract method 0x9a2500e4.
//
// Solidity: function getTokenHopsAt(address token, uint48 timestamp) view returns(address[2], bool[2], uint48[2])
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCallerSession) GetTokenHopsAt(token common.Address, timestamp *big.Int) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.GetTokenHopsAt(&_PricedTokensChainlinkVPCalc.CallOpts, token, timestamp)
}

// GetTokenPrice is a free data retrieval call binding the contract method 0xd02641a0.
//
// Solidity: function getTokenPrice(address token) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCaller) GetTokenPrice(opts *bind.CallOpts, token common.Address) (*big.Int, error) {
	var out []interface{}
	err := _PricedTokensChainlinkVPCalc.contract.Call(opts, &out, "getTokenPrice", token)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTokenPrice is a free data retrieval call binding the contract method 0xd02641a0.
//
// Solidity: function getTokenPrice(address token) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcSession) GetTokenPrice(token common.Address) (*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.GetTokenPrice(&_PricedTokensChainlinkVPCalc.CallOpts, token)
}

// GetTokenPrice is a free data retrieval call binding the contract method 0xd02641a0.
//
// Solidity: function getTokenPrice(address token) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCallerSession) GetTokenPrice(token common.Address) (*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.GetTokenPrice(&_PricedTokensChainlinkVPCalc.CallOpts, token)
}

// GetTokenPriceAt is a free data retrieval call binding the contract method 0x34e45be7.
//
// Solidity: function getTokenPriceAt(address token, uint48 timestamp) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCaller) GetTokenPriceAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _PricedTokensChainlinkVPCalc.contract.Call(opts, &out, "getTokenPriceAt", token, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTokenPriceAt is a free data retrieval call binding the contract method 0x34e45be7.
//
// Solidity: function getTokenPriceAt(address token, uint48 timestamp) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcSession) GetTokenPriceAt(token common.Address, timestamp *big.Int) (*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.GetTokenPriceAt(&_PricedTokensChainlinkVPCalc.CallOpts, token, timestamp)
}

// GetTokenPriceAt is a free data retrieval call binding the contract method 0x34e45be7.
//
// Solidity: function getTokenPriceAt(address token, uint48 timestamp) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCallerSession) GetTokenPriceAt(token common.Address, timestamp *big.Int) (*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.GetTokenPriceAt(&_PricedTokensChainlinkVPCalc.CallOpts, token, timestamp)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCaller) StakeToVotingPower(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	var out []interface{}
	err := _PricedTokensChainlinkVPCalc.contract.Call(opts, &out, "stakeToVotingPower", vault, stake, extraData)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.StakeToVotingPower(&_PricedTokensChainlinkVPCalc.CallOpts, vault, stake, extraData)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCallerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.StakeToVotingPower(&_PricedTokensChainlinkVPCalc.CallOpts, vault, stake, extraData)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCaller) StakeToVotingPowerAt(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _PricedTokensChainlinkVPCalc.contract.Call(opts, &out, "stakeToVotingPowerAt", vault, stake, extraData, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.StakeToVotingPowerAt(&_PricedTokensChainlinkVPCalc.CallOpts, vault, stake, extraData, timestamp)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcCallerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _PricedTokensChainlinkVPCalc.Contract.StakeToVotingPowerAt(&_PricedTokensChainlinkVPCalc.CallOpts, vault, stake, extraData, timestamp)
}

// SetTokenHops is a paid mutator transaction binding the contract method 0x5ea05180.
//
// Solidity: function setTokenHops(address token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations) returns()
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcTransactor) SetTokenHops(opts *bind.TransactOpts, token common.Address, aggregators [2]common.Address, inverts [2]bool, stalenessDurations [2]*big.Int) (*types.Transaction, error) {
	return _PricedTokensChainlinkVPCalc.contract.Transact(opts, "setTokenHops", token, aggregators, inverts, stalenessDurations)
}

// SetTokenHops is a paid mutator transaction binding the contract method 0x5ea05180.
//
// Solidity: function setTokenHops(address token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations) returns()
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcSession) SetTokenHops(token common.Address, aggregators [2]common.Address, inverts [2]bool, stalenessDurations [2]*big.Int) (*types.Transaction, error) {
	return _PricedTokensChainlinkVPCalc.Contract.SetTokenHops(&_PricedTokensChainlinkVPCalc.TransactOpts, token, aggregators, inverts, stalenessDurations)
}

// SetTokenHops is a paid mutator transaction binding the contract method 0x5ea05180.
//
// Solidity: function setTokenHops(address token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations) returns()
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcTransactorSession) SetTokenHops(token common.Address, aggregators [2]common.Address, inverts [2]bool, stalenessDurations [2]*big.Int) (*types.Transaction, error) {
	return _PricedTokensChainlinkVPCalc.Contract.SetTokenHops(&_PricedTokensChainlinkVPCalc.TransactOpts, token, aggregators, inverts, stalenessDurations)
}

// PricedTokensChainlinkVPCalcInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the PricedTokensChainlinkVPCalc contract.
type PricedTokensChainlinkVPCalcInitializedIterator struct {
	Event *PricedTokensChainlinkVPCalcInitialized // Event containing the contract specifics and raw log

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
func (it *PricedTokensChainlinkVPCalcInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(PricedTokensChainlinkVPCalcInitialized)
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
		it.Event = new(PricedTokensChainlinkVPCalcInitialized)
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
func (it *PricedTokensChainlinkVPCalcInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *PricedTokensChainlinkVPCalcInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// PricedTokensChainlinkVPCalcInitialized represents a Initialized event raised by the PricedTokensChainlinkVPCalc contract.
type PricedTokensChainlinkVPCalcInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcFilterer) FilterInitialized(opts *bind.FilterOpts) (*PricedTokensChainlinkVPCalcInitializedIterator, error) {

	logs, sub, err := _PricedTokensChainlinkVPCalc.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &PricedTokensChainlinkVPCalcInitializedIterator{contract: _PricedTokensChainlinkVPCalc.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *PricedTokensChainlinkVPCalcInitialized) (event.Subscription, error) {

	logs, sub, err := _PricedTokensChainlinkVPCalc.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(PricedTokensChainlinkVPCalcInitialized)
				if err := _PricedTokensChainlinkVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcFilterer) ParseInitialized(log types.Log) (*PricedTokensChainlinkVPCalcInitialized, error) {
	event := new(PricedTokensChainlinkVPCalcInitialized)
	if err := _PricedTokensChainlinkVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// PricedTokensChainlinkVPCalcSetTokenHopsIterator is returned from FilterSetTokenHops and is used to iterate over the raw logs and unpacked data for SetTokenHops events raised by the PricedTokensChainlinkVPCalc contract.
type PricedTokensChainlinkVPCalcSetTokenHopsIterator struct {
	Event *PricedTokensChainlinkVPCalcSetTokenHops // Event containing the contract specifics and raw log

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
func (it *PricedTokensChainlinkVPCalcSetTokenHopsIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(PricedTokensChainlinkVPCalcSetTokenHops)
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
		it.Event = new(PricedTokensChainlinkVPCalcSetTokenHops)
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
func (it *PricedTokensChainlinkVPCalcSetTokenHopsIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *PricedTokensChainlinkVPCalcSetTokenHopsIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// PricedTokensChainlinkVPCalcSetTokenHops represents a SetTokenHops event raised by the PricedTokensChainlinkVPCalc contract.
type PricedTokensChainlinkVPCalcSetTokenHops struct {
	Token              common.Address
	Aggregators        [2]common.Address
	Inverts            [2]bool
	StalenessDurations [2]*big.Int
	Raw                types.Log // Blockchain specific contextual infos
}

// FilterSetTokenHops is a free log retrieval operation binding the contract event 0x562b7959dfb06653f0de65e009b91661b62dc2c2cf3e94ae44e696ba0d426c52.
//
// Solidity: event SetTokenHops(address indexed token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcFilterer) FilterSetTokenHops(opts *bind.FilterOpts, token []common.Address) (*PricedTokensChainlinkVPCalcSetTokenHopsIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _PricedTokensChainlinkVPCalc.contract.FilterLogs(opts, "SetTokenHops", tokenRule)
	if err != nil {
		return nil, err
	}
	return &PricedTokensChainlinkVPCalcSetTokenHopsIterator{contract: _PricedTokensChainlinkVPCalc.contract, event: "SetTokenHops", logs: logs, sub: sub}, nil
}

// WatchSetTokenHops is a free log subscription operation binding the contract event 0x562b7959dfb06653f0de65e009b91661b62dc2c2cf3e94ae44e696ba0d426c52.
//
// Solidity: event SetTokenHops(address indexed token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcFilterer) WatchSetTokenHops(opts *bind.WatchOpts, sink chan<- *PricedTokensChainlinkVPCalcSetTokenHops, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _PricedTokensChainlinkVPCalc.contract.WatchLogs(opts, "SetTokenHops", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(PricedTokensChainlinkVPCalcSetTokenHops)
				if err := _PricedTokensChainlinkVPCalc.contract.UnpackLog(event, "SetTokenHops", log); err != nil {
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

// ParseSetTokenHops is a log parse operation binding the contract event 0x562b7959dfb06653f0de65e009b91661b62dc2c2cf3e94ae44e696ba0d426c52.
//
// Solidity: event SetTokenHops(address indexed token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations)
func (_PricedTokensChainlinkVPCalc *PricedTokensChainlinkVPCalcFilterer) ParseSetTokenHops(log types.Log) (*PricedTokensChainlinkVPCalcSetTokenHops, error) {
	event := new(PricedTokensChainlinkVPCalcSetTokenHops)
	if err := _PricedTokensChainlinkVPCalc.contract.UnpackLog(event, "SetTokenHops", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
