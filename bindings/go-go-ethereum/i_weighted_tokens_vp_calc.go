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

// IWeightedTokensVPCalcMetaData contains all meta data concerning the IWeightedTokensVPCalc contract.
var IWeightedTokensVPCalcMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getTokenWeight\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokenWeightAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setTokenWeight\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"weight\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"SetTokenWeight\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"weight\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"WeightedTokensVPCalc_TooLargeWeight\",\"inputs\":[]}]",
}

// IWeightedTokensVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use IWeightedTokensVPCalcMetaData.ABI instead.
var IWeightedTokensVPCalcABI = IWeightedTokensVPCalcMetaData.ABI

// IWeightedTokensVPCalc is an auto generated Go binding around an Ethereum contract.
type IWeightedTokensVPCalc struct {
	IWeightedTokensVPCalcCaller     // Read-only binding to the contract
	IWeightedTokensVPCalcTransactor // Write-only binding to the contract
	IWeightedTokensVPCalcFilterer   // Log filterer for contract events
}

// IWeightedTokensVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type IWeightedTokensVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IWeightedTokensVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IWeightedTokensVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IWeightedTokensVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IWeightedTokensVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IWeightedTokensVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IWeightedTokensVPCalcSession struct {
	Contract     *IWeightedTokensVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts          // Call options to use throughout this session
	TransactOpts bind.TransactOpts      // Transaction auth options to use throughout this session
}

// IWeightedTokensVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IWeightedTokensVPCalcCallerSession struct {
	Contract *IWeightedTokensVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                // Call options to use throughout this session
}

// IWeightedTokensVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IWeightedTokensVPCalcTransactorSession struct {
	Contract     *IWeightedTokensVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                // Transaction auth options to use throughout this session
}

// IWeightedTokensVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type IWeightedTokensVPCalcRaw struct {
	Contract *IWeightedTokensVPCalc // Generic contract binding to access the raw methods on
}

// IWeightedTokensVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IWeightedTokensVPCalcCallerRaw struct {
	Contract *IWeightedTokensVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// IWeightedTokensVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IWeightedTokensVPCalcTransactorRaw struct {
	Contract *IWeightedTokensVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIWeightedTokensVPCalc creates a new instance of IWeightedTokensVPCalc, bound to a specific deployed contract.
func NewIWeightedTokensVPCalc(address common.Address, backend bind.ContractBackend) (*IWeightedTokensVPCalc, error) {
	contract, err := bindIWeightedTokensVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IWeightedTokensVPCalc{IWeightedTokensVPCalcCaller: IWeightedTokensVPCalcCaller{contract: contract}, IWeightedTokensVPCalcTransactor: IWeightedTokensVPCalcTransactor{contract: contract}, IWeightedTokensVPCalcFilterer: IWeightedTokensVPCalcFilterer{contract: contract}}, nil
}

// NewIWeightedTokensVPCalcCaller creates a new read-only instance of IWeightedTokensVPCalc, bound to a specific deployed contract.
func NewIWeightedTokensVPCalcCaller(address common.Address, caller bind.ContractCaller) (*IWeightedTokensVPCalcCaller, error) {
	contract, err := bindIWeightedTokensVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IWeightedTokensVPCalcCaller{contract: contract}, nil
}

// NewIWeightedTokensVPCalcTransactor creates a new write-only instance of IWeightedTokensVPCalc, bound to a specific deployed contract.
func NewIWeightedTokensVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*IWeightedTokensVPCalcTransactor, error) {
	contract, err := bindIWeightedTokensVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IWeightedTokensVPCalcTransactor{contract: contract}, nil
}

// NewIWeightedTokensVPCalcFilterer creates a new log filterer instance of IWeightedTokensVPCalc, bound to a specific deployed contract.
func NewIWeightedTokensVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*IWeightedTokensVPCalcFilterer, error) {
	contract, err := bindIWeightedTokensVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IWeightedTokensVPCalcFilterer{contract: contract}, nil
}

// bindIWeightedTokensVPCalc binds a generic wrapper to an already deployed contract.
func bindIWeightedTokensVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IWeightedTokensVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IWeightedTokensVPCalc.Contract.IWeightedTokensVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IWeightedTokensVPCalc.Contract.IWeightedTokensVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IWeightedTokensVPCalc.Contract.IWeightedTokensVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IWeightedTokensVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IWeightedTokensVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IWeightedTokensVPCalc.Contract.contract.Transact(opts, method, params...)
}

// GetTokenWeight is a free data retrieval call binding the contract method 0x250aa683.
//
// Solidity: function getTokenWeight(address token) view returns(uint208)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcCaller) GetTokenWeight(opts *bind.CallOpts, token common.Address) (*big.Int, error) {
	var out []interface{}
	err := _IWeightedTokensVPCalc.contract.Call(opts, &out, "getTokenWeight", token)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTokenWeight is a free data retrieval call binding the contract method 0x250aa683.
//
// Solidity: function getTokenWeight(address token) view returns(uint208)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcSession) GetTokenWeight(token common.Address) (*big.Int, error) {
	return _IWeightedTokensVPCalc.Contract.GetTokenWeight(&_IWeightedTokensVPCalc.CallOpts, token)
}

// GetTokenWeight is a free data retrieval call binding the contract method 0x250aa683.
//
// Solidity: function getTokenWeight(address token) view returns(uint208)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcCallerSession) GetTokenWeight(token common.Address) (*big.Int, error) {
	return _IWeightedTokensVPCalc.Contract.GetTokenWeight(&_IWeightedTokensVPCalc.CallOpts, token)
}

// GetTokenWeightAt is a free data retrieval call binding the contract method 0x8ca7a5c9.
//
// Solidity: function getTokenWeightAt(address token, uint48 timestamp) view returns(uint208)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcCaller) GetTokenWeightAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IWeightedTokensVPCalc.contract.Call(opts, &out, "getTokenWeightAt", token, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTokenWeightAt is a free data retrieval call binding the contract method 0x8ca7a5c9.
//
// Solidity: function getTokenWeightAt(address token, uint48 timestamp) view returns(uint208)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcSession) GetTokenWeightAt(token common.Address, timestamp *big.Int) (*big.Int, error) {
	return _IWeightedTokensVPCalc.Contract.GetTokenWeightAt(&_IWeightedTokensVPCalc.CallOpts, token, timestamp)
}

// GetTokenWeightAt is a free data retrieval call binding the contract method 0x8ca7a5c9.
//
// Solidity: function getTokenWeightAt(address token, uint48 timestamp) view returns(uint208)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcCallerSession) GetTokenWeightAt(token common.Address, timestamp *big.Int) (*big.Int, error) {
	return _IWeightedTokensVPCalc.Contract.GetTokenWeightAt(&_IWeightedTokensVPCalc.CallOpts, token, timestamp)
}

// SetTokenWeight is a paid mutator transaction binding the contract method 0x7d4d1521.
//
// Solidity: function setTokenWeight(address token, uint208 weight) returns()
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcTransactor) SetTokenWeight(opts *bind.TransactOpts, token common.Address, weight *big.Int) (*types.Transaction, error) {
	return _IWeightedTokensVPCalc.contract.Transact(opts, "setTokenWeight", token, weight)
}

// SetTokenWeight is a paid mutator transaction binding the contract method 0x7d4d1521.
//
// Solidity: function setTokenWeight(address token, uint208 weight) returns()
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcSession) SetTokenWeight(token common.Address, weight *big.Int) (*types.Transaction, error) {
	return _IWeightedTokensVPCalc.Contract.SetTokenWeight(&_IWeightedTokensVPCalc.TransactOpts, token, weight)
}

// SetTokenWeight is a paid mutator transaction binding the contract method 0x7d4d1521.
//
// Solidity: function setTokenWeight(address token, uint208 weight) returns()
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcTransactorSession) SetTokenWeight(token common.Address, weight *big.Int) (*types.Transaction, error) {
	return _IWeightedTokensVPCalc.Contract.SetTokenWeight(&_IWeightedTokensVPCalc.TransactOpts, token, weight)
}

// IWeightedTokensVPCalcSetTokenWeightIterator is returned from FilterSetTokenWeight and is used to iterate over the raw logs and unpacked data for SetTokenWeight events raised by the IWeightedTokensVPCalc contract.
type IWeightedTokensVPCalcSetTokenWeightIterator struct {
	Event *IWeightedTokensVPCalcSetTokenWeight // Event containing the contract specifics and raw log

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
func (it *IWeightedTokensVPCalcSetTokenWeightIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IWeightedTokensVPCalcSetTokenWeight)
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
		it.Event = new(IWeightedTokensVPCalcSetTokenWeight)
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
func (it *IWeightedTokensVPCalcSetTokenWeightIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IWeightedTokensVPCalcSetTokenWeightIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IWeightedTokensVPCalcSetTokenWeight represents a SetTokenWeight event raised by the IWeightedTokensVPCalc contract.
type IWeightedTokensVPCalcSetTokenWeight struct {
	Token  common.Address
	Weight *big.Int
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetTokenWeight is a free log retrieval operation binding the contract event 0x2cda4a20f5fdbac0eecc2936dc177539fcd152bafa12f214b4205287e12a145d.
//
// Solidity: event SetTokenWeight(address indexed token, uint208 weight)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcFilterer) FilterSetTokenWeight(opts *bind.FilterOpts, token []common.Address) (*IWeightedTokensVPCalcSetTokenWeightIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IWeightedTokensVPCalc.contract.FilterLogs(opts, "SetTokenWeight", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IWeightedTokensVPCalcSetTokenWeightIterator{contract: _IWeightedTokensVPCalc.contract, event: "SetTokenWeight", logs: logs, sub: sub}, nil
}

// WatchSetTokenWeight is a free log subscription operation binding the contract event 0x2cda4a20f5fdbac0eecc2936dc177539fcd152bafa12f214b4205287e12a145d.
//
// Solidity: event SetTokenWeight(address indexed token, uint208 weight)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcFilterer) WatchSetTokenWeight(opts *bind.WatchOpts, sink chan<- *IWeightedTokensVPCalcSetTokenWeight, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IWeightedTokensVPCalc.contract.WatchLogs(opts, "SetTokenWeight", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IWeightedTokensVPCalcSetTokenWeight)
				if err := _IWeightedTokensVPCalc.contract.UnpackLog(event, "SetTokenWeight", log); err != nil {
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

// ParseSetTokenWeight is a log parse operation binding the contract event 0x2cda4a20f5fdbac0eecc2936dc177539fcd152bafa12f214b4205287e12a145d.
//
// Solidity: event SetTokenWeight(address indexed token, uint208 weight)
func (_IWeightedTokensVPCalc *IWeightedTokensVPCalcFilterer) ParseSetTokenWeight(log types.Log) (*IWeightedTokensVPCalcSetTokenWeight, error) {
	event := new(IWeightedTokensVPCalcSetTokenWeight)
	if err := _IWeightedTokensVPCalc.contract.UnpackLog(event, "SetTokenWeight", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
