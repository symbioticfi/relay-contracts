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

// IPricedTokensChainlinkVPCalcMetaData contains all meta data concerning the IPricedTokensChainlinkVPCalc contract.
var IPricedTokensChainlinkVPCalcMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getTokenHops\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[2]\",\"internalType\":\"address[2]\"},{\"name\":\"\",\"type\":\"bool[2]\",\"internalType\":\"bool[2]\"},{\"name\":\"\",\"type\":\"uint48[2]\",\"internalType\":\"uint48[2]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokenHopsAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[2]\",\"internalType\":\"address[2]\"},{\"name\":\"\",\"type\":\"bool[2]\",\"internalType\":\"bool[2]\"},{\"name\":\"\",\"type\":\"uint48[2]\",\"internalType\":\"uint48[2]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokenPrice\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokenPriceAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setTokenHops\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"aggregators\",\"type\":\"address[2]\",\"internalType\":\"address[2]\"},{\"name\":\"inverts\",\"type\":\"bool[2]\",\"internalType\":\"bool[2]\"},{\"name\":\"stalenessDurations\",\"type\":\"uint48[2]\",\"internalType\":\"uint48[2]\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"SetTokenHops\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"aggregators\",\"type\":\"address[2]\",\"indexed\":false,\"internalType\":\"address[2]\"},{\"name\":\"inverts\",\"type\":\"bool[2]\",\"indexed\":false,\"internalType\":\"bool[2]\"},{\"name\":\"stalenessDurations\",\"type\":\"uint48[2]\",\"indexed\":false,\"internalType\":\"uint48[2]\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"PricedTokensChainlinkVPCalc_InvalidAggregator\",\"inputs\":[]}]",
}

// IPricedTokensChainlinkVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use IPricedTokensChainlinkVPCalcMetaData.ABI instead.
var IPricedTokensChainlinkVPCalcABI = IPricedTokensChainlinkVPCalcMetaData.ABI

// IPricedTokensChainlinkVPCalc is an auto generated Go binding around an Ethereum contract.
type IPricedTokensChainlinkVPCalc struct {
	IPricedTokensChainlinkVPCalcCaller     // Read-only binding to the contract
	IPricedTokensChainlinkVPCalcTransactor // Write-only binding to the contract
	IPricedTokensChainlinkVPCalcFilterer   // Log filterer for contract events
}

// IPricedTokensChainlinkVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type IPricedTokensChainlinkVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IPricedTokensChainlinkVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IPricedTokensChainlinkVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IPricedTokensChainlinkVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IPricedTokensChainlinkVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IPricedTokensChainlinkVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IPricedTokensChainlinkVPCalcSession struct {
	Contract     *IPricedTokensChainlinkVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts                 // Call options to use throughout this session
	TransactOpts bind.TransactOpts             // Transaction auth options to use throughout this session
}

// IPricedTokensChainlinkVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IPricedTokensChainlinkVPCalcCallerSession struct {
	Contract *IPricedTokensChainlinkVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                       // Call options to use throughout this session
}

// IPricedTokensChainlinkVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IPricedTokensChainlinkVPCalcTransactorSession struct {
	Contract     *IPricedTokensChainlinkVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                       // Transaction auth options to use throughout this session
}

// IPricedTokensChainlinkVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type IPricedTokensChainlinkVPCalcRaw struct {
	Contract *IPricedTokensChainlinkVPCalc // Generic contract binding to access the raw methods on
}

// IPricedTokensChainlinkVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IPricedTokensChainlinkVPCalcCallerRaw struct {
	Contract *IPricedTokensChainlinkVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// IPricedTokensChainlinkVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IPricedTokensChainlinkVPCalcTransactorRaw struct {
	Contract *IPricedTokensChainlinkVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIPricedTokensChainlinkVPCalc creates a new instance of IPricedTokensChainlinkVPCalc, bound to a specific deployed contract.
func NewIPricedTokensChainlinkVPCalc(address common.Address, backend bind.ContractBackend) (*IPricedTokensChainlinkVPCalc, error) {
	contract, err := bindIPricedTokensChainlinkVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IPricedTokensChainlinkVPCalc{IPricedTokensChainlinkVPCalcCaller: IPricedTokensChainlinkVPCalcCaller{contract: contract}, IPricedTokensChainlinkVPCalcTransactor: IPricedTokensChainlinkVPCalcTransactor{contract: contract}, IPricedTokensChainlinkVPCalcFilterer: IPricedTokensChainlinkVPCalcFilterer{contract: contract}}, nil
}

// NewIPricedTokensChainlinkVPCalcCaller creates a new read-only instance of IPricedTokensChainlinkVPCalc, bound to a specific deployed contract.
func NewIPricedTokensChainlinkVPCalcCaller(address common.Address, caller bind.ContractCaller) (*IPricedTokensChainlinkVPCalcCaller, error) {
	contract, err := bindIPricedTokensChainlinkVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IPricedTokensChainlinkVPCalcCaller{contract: contract}, nil
}

// NewIPricedTokensChainlinkVPCalcTransactor creates a new write-only instance of IPricedTokensChainlinkVPCalc, bound to a specific deployed contract.
func NewIPricedTokensChainlinkVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*IPricedTokensChainlinkVPCalcTransactor, error) {
	contract, err := bindIPricedTokensChainlinkVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IPricedTokensChainlinkVPCalcTransactor{contract: contract}, nil
}

// NewIPricedTokensChainlinkVPCalcFilterer creates a new log filterer instance of IPricedTokensChainlinkVPCalc, bound to a specific deployed contract.
func NewIPricedTokensChainlinkVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*IPricedTokensChainlinkVPCalcFilterer, error) {
	contract, err := bindIPricedTokensChainlinkVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IPricedTokensChainlinkVPCalcFilterer{contract: contract}, nil
}

// bindIPricedTokensChainlinkVPCalc binds a generic wrapper to an already deployed contract.
func bindIPricedTokensChainlinkVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IPricedTokensChainlinkVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IPricedTokensChainlinkVPCalc.Contract.IPricedTokensChainlinkVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.IPricedTokensChainlinkVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.IPricedTokensChainlinkVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IPricedTokensChainlinkVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.contract.Transact(opts, method, params...)
}

// GetTokenHops is a free data retrieval call binding the contract method 0xada1528b.
//
// Solidity: function getTokenHops(address token) view returns(address[2], bool[2], uint48[2])
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCaller) GetTokenHops(opts *bind.CallOpts, token common.Address) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	var out []interface{}
	err := _IPricedTokensChainlinkVPCalc.contract.Call(opts, &out, "getTokenHops", token)

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
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcSession) GetTokenHops(token common.Address) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.GetTokenHops(&_IPricedTokensChainlinkVPCalc.CallOpts, token)
}

// GetTokenHops is a free data retrieval call binding the contract method 0xada1528b.
//
// Solidity: function getTokenHops(address token) view returns(address[2], bool[2], uint48[2])
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCallerSession) GetTokenHops(token common.Address) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.GetTokenHops(&_IPricedTokensChainlinkVPCalc.CallOpts, token)
}

// GetTokenHopsAt is a free data retrieval call binding the contract method 0x9a2500e4.
//
// Solidity: function getTokenHopsAt(address token, uint48 timestamp) view returns(address[2], bool[2], uint48[2])
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCaller) GetTokenHopsAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	var out []interface{}
	err := _IPricedTokensChainlinkVPCalc.contract.Call(opts, &out, "getTokenHopsAt", token, timestamp)

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
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcSession) GetTokenHopsAt(token common.Address, timestamp *big.Int) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.GetTokenHopsAt(&_IPricedTokensChainlinkVPCalc.CallOpts, token, timestamp)
}

// GetTokenHopsAt is a free data retrieval call binding the contract method 0x9a2500e4.
//
// Solidity: function getTokenHopsAt(address token, uint48 timestamp) view returns(address[2], bool[2], uint48[2])
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCallerSession) GetTokenHopsAt(token common.Address, timestamp *big.Int) ([2]common.Address, [2]bool, [2]*big.Int, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.GetTokenHopsAt(&_IPricedTokensChainlinkVPCalc.CallOpts, token, timestamp)
}

// GetTokenPrice is a free data retrieval call binding the contract method 0xd02641a0.
//
// Solidity: function getTokenPrice(address token) view returns(uint256)
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCaller) GetTokenPrice(opts *bind.CallOpts, token common.Address) (*big.Int, error) {
	var out []interface{}
	err := _IPricedTokensChainlinkVPCalc.contract.Call(opts, &out, "getTokenPrice", token)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTokenPrice is a free data retrieval call binding the contract method 0xd02641a0.
//
// Solidity: function getTokenPrice(address token) view returns(uint256)
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcSession) GetTokenPrice(token common.Address) (*big.Int, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.GetTokenPrice(&_IPricedTokensChainlinkVPCalc.CallOpts, token)
}

// GetTokenPrice is a free data retrieval call binding the contract method 0xd02641a0.
//
// Solidity: function getTokenPrice(address token) view returns(uint256)
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCallerSession) GetTokenPrice(token common.Address) (*big.Int, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.GetTokenPrice(&_IPricedTokensChainlinkVPCalc.CallOpts, token)
}

// GetTokenPriceAt is a free data retrieval call binding the contract method 0x34e45be7.
//
// Solidity: function getTokenPriceAt(address token, uint48 timestamp) view returns(uint256)
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCaller) GetTokenPriceAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IPricedTokensChainlinkVPCalc.contract.Call(opts, &out, "getTokenPriceAt", token, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTokenPriceAt is a free data retrieval call binding the contract method 0x34e45be7.
//
// Solidity: function getTokenPriceAt(address token, uint48 timestamp) view returns(uint256)
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcSession) GetTokenPriceAt(token common.Address, timestamp *big.Int) (*big.Int, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.GetTokenPriceAt(&_IPricedTokensChainlinkVPCalc.CallOpts, token, timestamp)
}

// GetTokenPriceAt is a free data retrieval call binding the contract method 0x34e45be7.
//
// Solidity: function getTokenPriceAt(address token, uint48 timestamp) view returns(uint256)
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcCallerSession) GetTokenPriceAt(token common.Address, timestamp *big.Int) (*big.Int, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.GetTokenPriceAt(&_IPricedTokensChainlinkVPCalc.CallOpts, token, timestamp)
}

// SetTokenHops is a paid mutator transaction binding the contract method 0x5ea05180.
//
// Solidity: function setTokenHops(address token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations) returns()
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcTransactor) SetTokenHops(opts *bind.TransactOpts, token common.Address, aggregators [2]common.Address, inverts [2]bool, stalenessDurations [2]*big.Int) (*types.Transaction, error) {
	return _IPricedTokensChainlinkVPCalc.contract.Transact(opts, "setTokenHops", token, aggregators, inverts, stalenessDurations)
}

// SetTokenHops is a paid mutator transaction binding the contract method 0x5ea05180.
//
// Solidity: function setTokenHops(address token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations) returns()
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcSession) SetTokenHops(token common.Address, aggregators [2]common.Address, inverts [2]bool, stalenessDurations [2]*big.Int) (*types.Transaction, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.SetTokenHops(&_IPricedTokensChainlinkVPCalc.TransactOpts, token, aggregators, inverts, stalenessDurations)
}

// SetTokenHops is a paid mutator transaction binding the contract method 0x5ea05180.
//
// Solidity: function setTokenHops(address token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations) returns()
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcTransactorSession) SetTokenHops(token common.Address, aggregators [2]common.Address, inverts [2]bool, stalenessDurations [2]*big.Int) (*types.Transaction, error) {
	return _IPricedTokensChainlinkVPCalc.Contract.SetTokenHops(&_IPricedTokensChainlinkVPCalc.TransactOpts, token, aggregators, inverts, stalenessDurations)
}

// IPricedTokensChainlinkVPCalcSetTokenHopsIterator is returned from FilterSetTokenHops and is used to iterate over the raw logs and unpacked data for SetTokenHops events raised by the IPricedTokensChainlinkVPCalc contract.
type IPricedTokensChainlinkVPCalcSetTokenHopsIterator struct {
	Event *IPricedTokensChainlinkVPCalcSetTokenHops // Event containing the contract specifics and raw log

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
func (it *IPricedTokensChainlinkVPCalcSetTokenHopsIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IPricedTokensChainlinkVPCalcSetTokenHops)
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
		it.Event = new(IPricedTokensChainlinkVPCalcSetTokenHops)
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
func (it *IPricedTokensChainlinkVPCalcSetTokenHopsIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IPricedTokensChainlinkVPCalcSetTokenHopsIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IPricedTokensChainlinkVPCalcSetTokenHops represents a SetTokenHops event raised by the IPricedTokensChainlinkVPCalc contract.
type IPricedTokensChainlinkVPCalcSetTokenHops struct {
	Token              common.Address
	Aggregators        [2]common.Address
	Inverts            [2]bool
	StalenessDurations [2]*big.Int
	Raw                types.Log // Blockchain specific contextual infos
}

// FilterSetTokenHops is a free log retrieval operation binding the contract event 0x562b7959dfb06653f0de65e009b91661b62dc2c2cf3e94ae44e696ba0d426c52.
//
// Solidity: event SetTokenHops(address indexed token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations)
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcFilterer) FilterSetTokenHops(opts *bind.FilterOpts, token []common.Address) (*IPricedTokensChainlinkVPCalcSetTokenHopsIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IPricedTokensChainlinkVPCalc.contract.FilterLogs(opts, "SetTokenHops", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IPricedTokensChainlinkVPCalcSetTokenHopsIterator{contract: _IPricedTokensChainlinkVPCalc.contract, event: "SetTokenHops", logs: logs, sub: sub}, nil
}

// WatchSetTokenHops is a free log subscription operation binding the contract event 0x562b7959dfb06653f0de65e009b91661b62dc2c2cf3e94ae44e696ba0d426c52.
//
// Solidity: event SetTokenHops(address indexed token, address[2] aggregators, bool[2] inverts, uint48[2] stalenessDurations)
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcFilterer) WatchSetTokenHops(opts *bind.WatchOpts, sink chan<- *IPricedTokensChainlinkVPCalcSetTokenHops, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IPricedTokensChainlinkVPCalc.contract.WatchLogs(opts, "SetTokenHops", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IPricedTokensChainlinkVPCalcSetTokenHops)
				if err := _IPricedTokensChainlinkVPCalc.contract.UnpackLog(event, "SetTokenHops", log); err != nil {
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
func (_IPricedTokensChainlinkVPCalc *IPricedTokensChainlinkVPCalcFilterer) ParseSetTokenHops(log types.Log) (*IPricedTokensChainlinkVPCalcSetTokenHops, error) {
	event := new(IPricedTokensChainlinkVPCalcSetTokenHops)
	if err := _IPricedTokensChainlinkVPCalc.contract.UnpackLog(event, "SetTokenHops", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
