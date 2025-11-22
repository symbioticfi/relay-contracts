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

// IOperatorsJailMetaData contains all meta data concerning the IOperatorsJail contract.
var IOperatorsJailMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getOperatorJailedUntil\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorJailed\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"jailOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"duration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unjailOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"JailOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnjailOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"OperatorsJail_AlreadyJailed\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OperatorsJail_InvalidDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OperatorsJail_OperatorJailed\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OperatorsJail_OperatorNotJailed\",\"inputs\":[]}]",
}

// IOperatorsJailABI is the input ABI used to generate the binding from.
// Deprecated: Use IOperatorsJailMetaData.ABI instead.
var IOperatorsJailABI = IOperatorsJailMetaData.ABI

// IOperatorsJail is an auto generated Go binding around an Ethereum contract.
type IOperatorsJail struct {
	IOperatorsJailCaller     // Read-only binding to the contract
	IOperatorsJailTransactor // Write-only binding to the contract
	IOperatorsJailFilterer   // Log filterer for contract events
}

// IOperatorsJailCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOperatorsJailCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsJailTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOperatorsJailTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsJailFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOperatorsJailFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsJailSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOperatorsJailSession struct {
	Contract     *IOperatorsJail   // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IOperatorsJailCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOperatorsJailCallerSession struct {
	Contract *IOperatorsJailCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts         // Call options to use throughout this session
}

// IOperatorsJailTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOperatorsJailTransactorSession struct {
	Contract     *IOperatorsJailTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts         // Transaction auth options to use throughout this session
}

// IOperatorsJailRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOperatorsJailRaw struct {
	Contract *IOperatorsJail // Generic contract binding to access the raw methods on
}

// IOperatorsJailCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOperatorsJailCallerRaw struct {
	Contract *IOperatorsJailCaller // Generic read-only contract binding to access the raw methods on
}

// IOperatorsJailTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOperatorsJailTransactorRaw struct {
	Contract *IOperatorsJailTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOperatorsJail creates a new instance of IOperatorsJail, bound to a specific deployed contract.
func NewIOperatorsJail(address common.Address, backend bind.ContractBackend) (*IOperatorsJail, error) {
	contract, err := bindIOperatorsJail(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOperatorsJail{IOperatorsJailCaller: IOperatorsJailCaller{contract: contract}, IOperatorsJailTransactor: IOperatorsJailTransactor{contract: contract}, IOperatorsJailFilterer: IOperatorsJailFilterer{contract: contract}}, nil
}

// NewIOperatorsJailCaller creates a new read-only instance of IOperatorsJail, bound to a specific deployed contract.
func NewIOperatorsJailCaller(address common.Address, caller bind.ContractCaller) (*IOperatorsJailCaller, error) {
	contract, err := bindIOperatorsJail(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorsJailCaller{contract: contract}, nil
}

// NewIOperatorsJailTransactor creates a new write-only instance of IOperatorsJail, bound to a specific deployed contract.
func NewIOperatorsJailTransactor(address common.Address, transactor bind.ContractTransactor) (*IOperatorsJailTransactor, error) {
	contract, err := bindIOperatorsJail(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorsJailTransactor{contract: contract}, nil
}

// NewIOperatorsJailFilterer creates a new log filterer instance of IOperatorsJail, bound to a specific deployed contract.
func NewIOperatorsJailFilterer(address common.Address, filterer bind.ContractFilterer) (*IOperatorsJailFilterer, error) {
	contract, err := bindIOperatorsJail(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOperatorsJailFilterer{contract: contract}, nil
}

// bindIOperatorsJail binds a generic wrapper to an already deployed contract.
func bindIOperatorsJail(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOperatorsJailMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorsJail *IOperatorsJailRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorsJail.Contract.IOperatorsJailCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorsJail *IOperatorsJailRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsJail.Contract.IOperatorsJailTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorsJail *IOperatorsJailRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorsJail.Contract.IOperatorsJailTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorsJail *IOperatorsJailCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorsJail.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorsJail *IOperatorsJailTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsJail.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorsJail *IOperatorsJailTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorsJail.Contract.contract.Transact(opts, method, params...)
}

// GetOperatorJailedUntil is a free data retrieval call binding the contract method 0xf610a0ad.
//
// Solidity: function getOperatorJailedUntil(address operator) view returns(uint48)
func (_IOperatorsJail *IOperatorsJailCaller) GetOperatorJailedUntil(opts *bind.CallOpts, operator common.Address) (*big.Int, error) {
	var out []interface{}
	err := _IOperatorsJail.contract.Call(opts, &out, "getOperatorJailedUntil", operator)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetOperatorJailedUntil is a free data retrieval call binding the contract method 0xf610a0ad.
//
// Solidity: function getOperatorJailedUntil(address operator) view returns(uint48)
func (_IOperatorsJail *IOperatorsJailSession) GetOperatorJailedUntil(operator common.Address) (*big.Int, error) {
	return _IOperatorsJail.Contract.GetOperatorJailedUntil(&_IOperatorsJail.CallOpts, operator)
}

// GetOperatorJailedUntil is a free data retrieval call binding the contract method 0xf610a0ad.
//
// Solidity: function getOperatorJailedUntil(address operator) view returns(uint48)
func (_IOperatorsJail *IOperatorsJailCallerSession) GetOperatorJailedUntil(operator common.Address) (*big.Int, error) {
	return _IOperatorsJail.Contract.GetOperatorJailedUntil(&_IOperatorsJail.CallOpts, operator)
}

// IsOperatorJailed is a free data retrieval call binding the contract method 0xa8601cd6.
//
// Solidity: function isOperatorJailed(address operator) view returns(bool)
func (_IOperatorsJail *IOperatorsJailCaller) IsOperatorJailed(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsJail.contract.Call(opts, &out, "isOperatorJailed", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorJailed is a free data retrieval call binding the contract method 0xa8601cd6.
//
// Solidity: function isOperatorJailed(address operator) view returns(bool)
func (_IOperatorsJail *IOperatorsJailSession) IsOperatorJailed(operator common.Address) (bool, error) {
	return _IOperatorsJail.Contract.IsOperatorJailed(&_IOperatorsJail.CallOpts, operator)
}

// IsOperatorJailed is a free data retrieval call binding the contract method 0xa8601cd6.
//
// Solidity: function isOperatorJailed(address operator) view returns(bool)
func (_IOperatorsJail *IOperatorsJailCallerSession) IsOperatorJailed(operator common.Address) (bool, error) {
	return _IOperatorsJail.Contract.IsOperatorJailed(&_IOperatorsJail.CallOpts, operator)
}

// JailOperator is a paid mutator transaction binding the contract method 0x3f6afb54.
//
// Solidity: function jailOperator(address operator, uint48 duration) returns()
func (_IOperatorsJail *IOperatorsJailTransactor) JailOperator(opts *bind.TransactOpts, operator common.Address, duration *big.Int) (*types.Transaction, error) {
	return _IOperatorsJail.contract.Transact(opts, "jailOperator", operator, duration)
}

// JailOperator is a paid mutator transaction binding the contract method 0x3f6afb54.
//
// Solidity: function jailOperator(address operator, uint48 duration) returns()
func (_IOperatorsJail *IOperatorsJailSession) JailOperator(operator common.Address, duration *big.Int) (*types.Transaction, error) {
	return _IOperatorsJail.Contract.JailOperator(&_IOperatorsJail.TransactOpts, operator, duration)
}

// JailOperator is a paid mutator transaction binding the contract method 0x3f6afb54.
//
// Solidity: function jailOperator(address operator, uint48 duration) returns()
func (_IOperatorsJail *IOperatorsJailTransactorSession) JailOperator(operator common.Address, duration *big.Int) (*types.Transaction, error) {
	return _IOperatorsJail.Contract.JailOperator(&_IOperatorsJail.TransactOpts, operator, duration)
}

// UnjailOperator is a paid mutator transaction binding the contract method 0x8a27163f.
//
// Solidity: function unjailOperator(address operator) returns()
func (_IOperatorsJail *IOperatorsJailTransactor) UnjailOperator(opts *bind.TransactOpts, operator common.Address) (*types.Transaction, error) {
	return _IOperatorsJail.contract.Transact(opts, "unjailOperator", operator)
}

// UnjailOperator is a paid mutator transaction binding the contract method 0x8a27163f.
//
// Solidity: function unjailOperator(address operator) returns()
func (_IOperatorsJail *IOperatorsJailSession) UnjailOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsJail.Contract.UnjailOperator(&_IOperatorsJail.TransactOpts, operator)
}

// UnjailOperator is a paid mutator transaction binding the contract method 0x8a27163f.
//
// Solidity: function unjailOperator(address operator) returns()
func (_IOperatorsJail *IOperatorsJailTransactorSession) UnjailOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsJail.Contract.UnjailOperator(&_IOperatorsJail.TransactOpts, operator)
}

// IOperatorsJailJailOperatorIterator is returned from FilterJailOperator and is used to iterate over the raw logs and unpacked data for JailOperator events raised by the IOperatorsJail contract.
type IOperatorsJailJailOperatorIterator struct {
	Event *IOperatorsJailJailOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsJailJailOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsJailJailOperator)
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
		it.Event = new(IOperatorsJailJailOperator)
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
func (it *IOperatorsJailJailOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsJailJailOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsJailJailOperator represents a JailOperator event raised by the IOperatorsJail contract.
type IOperatorsJailJailOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterJailOperator is a free log retrieval operation binding the contract event 0x3707052e1730565f654fad2dd6d28b21c56fe3ca30eb8c14b4b54725108b93c8.
//
// Solidity: event JailOperator(address indexed operator)
func (_IOperatorsJail *IOperatorsJailFilterer) FilterJailOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsJailJailOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsJail.contract.FilterLogs(opts, "JailOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsJailJailOperatorIterator{contract: _IOperatorsJail.contract, event: "JailOperator", logs: logs, sub: sub}, nil
}

// WatchJailOperator is a free log subscription operation binding the contract event 0x3707052e1730565f654fad2dd6d28b21c56fe3ca30eb8c14b4b54725108b93c8.
//
// Solidity: event JailOperator(address indexed operator)
func (_IOperatorsJail *IOperatorsJailFilterer) WatchJailOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsJailJailOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsJail.contract.WatchLogs(opts, "JailOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsJailJailOperator)
				if err := _IOperatorsJail.contract.UnpackLog(event, "JailOperator", log); err != nil {
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

// ParseJailOperator is a log parse operation binding the contract event 0x3707052e1730565f654fad2dd6d28b21c56fe3ca30eb8c14b4b54725108b93c8.
//
// Solidity: event JailOperator(address indexed operator)
func (_IOperatorsJail *IOperatorsJailFilterer) ParseJailOperator(log types.Log) (*IOperatorsJailJailOperator, error) {
	event := new(IOperatorsJailJailOperator)
	if err := _IOperatorsJail.contract.UnpackLog(event, "JailOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsJailUnjailOperatorIterator is returned from FilterUnjailOperator and is used to iterate over the raw logs and unpacked data for UnjailOperator events raised by the IOperatorsJail contract.
type IOperatorsJailUnjailOperatorIterator struct {
	Event *IOperatorsJailUnjailOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsJailUnjailOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsJailUnjailOperator)
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
		it.Event = new(IOperatorsJailUnjailOperator)
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
func (it *IOperatorsJailUnjailOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsJailUnjailOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsJailUnjailOperator represents a UnjailOperator event raised by the IOperatorsJail contract.
type IOperatorsJailUnjailOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnjailOperator is a free log retrieval operation binding the contract event 0x79327a2267c5934e3dbaf1b50b9a76f5b69b5eddda884faf6e8990d71df369e6.
//
// Solidity: event UnjailOperator(address indexed operator)
func (_IOperatorsJail *IOperatorsJailFilterer) FilterUnjailOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsJailUnjailOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsJail.contract.FilterLogs(opts, "UnjailOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsJailUnjailOperatorIterator{contract: _IOperatorsJail.contract, event: "UnjailOperator", logs: logs, sub: sub}, nil
}

// WatchUnjailOperator is a free log subscription operation binding the contract event 0x79327a2267c5934e3dbaf1b50b9a76f5b69b5eddda884faf6e8990d71df369e6.
//
// Solidity: event UnjailOperator(address indexed operator)
func (_IOperatorsJail *IOperatorsJailFilterer) WatchUnjailOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsJailUnjailOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsJail.contract.WatchLogs(opts, "UnjailOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsJailUnjailOperator)
				if err := _IOperatorsJail.contract.UnpackLog(event, "UnjailOperator", log); err != nil {
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

// ParseUnjailOperator is a log parse operation binding the contract event 0x79327a2267c5934e3dbaf1b50b9a76f5b69b5eddda884faf6e8990d71df369e6.
//
// Solidity: event UnjailOperator(address indexed operator)
func (_IOperatorsJail *IOperatorsJailFilterer) ParseUnjailOperator(log types.Log) (*IOperatorsJailUnjailOperator, error) {
	event := new(IOperatorsJailUnjailOperator)
	if err := _IOperatorsJail.contract.UnpackLog(event, "UnjailOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
