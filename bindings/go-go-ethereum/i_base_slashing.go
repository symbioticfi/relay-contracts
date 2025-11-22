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

// IBaseSlashingMetaData contains all meta data concerning the IBaseSlashing contract.
var IBaseSlashingMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"executeSlashVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"slashIndex\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"hints\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"success\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"slashedAmount\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"getSlasher\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setSlasher\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"slashVault\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"amount\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"hints\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"success\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"response\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"ExecuteSlash\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"slashIndex\",\"type\":\"uint256\",\"indexed\":true,\"internalType\":\"uint256\"},{\"name\":\"success\",\"type\":\"bool\",\"indexed\":true,\"internalType\":\"bool\"},{\"name\":\"slashedAmount\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InstantSlash\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"success\",\"type\":\"bool\",\"indexed\":true,\"internalType\":\"bool\"},{\"name\":\"slashedAmount\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSlasher\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"VetoSlash\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"success\",\"type\":\"bool\",\"indexed\":true,\"internalType\":\"bool\"},{\"name\":\"slashIndex\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"BaseSlashing_NoSlasher\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"BaseSlashing_NoSlashing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"BaseSlashing_NotSlasher\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"BaseSlashing_NotVetoSlasher\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"BaseSlashing_UnknownSlasherType\",\"inputs\":[]}]",
}

// IBaseSlashingABI is the input ABI used to generate the binding from.
// Deprecated: Use IBaseSlashingMetaData.ABI instead.
var IBaseSlashingABI = IBaseSlashingMetaData.ABI

// IBaseSlashing is an auto generated Go binding around an Ethereum contract.
type IBaseSlashing struct {
	IBaseSlashingCaller     // Read-only binding to the contract
	IBaseSlashingTransactor // Write-only binding to the contract
	IBaseSlashingFilterer   // Log filterer for contract events
}

// IBaseSlashingCaller is an auto generated read-only Go binding around an Ethereum contract.
type IBaseSlashingCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseSlashingTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IBaseSlashingTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseSlashingFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IBaseSlashingFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseSlashingSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IBaseSlashingSession struct {
	Contract     *IBaseSlashing    // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IBaseSlashingCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IBaseSlashingCallerSession struct {
	Contract *IBaseSlashingCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts        // Call options to use throughout this session
}

// IBaseSlashingTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IBaseSlashingTransactorSession struct {
	Contract     *IBaseSlashingTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts        // Transaction auth options to use throughout this session
}

// IBaseSlashingRaw is an auto generated low-level Go binding around an Ethereum contract.
type IBaseSlashingRaw struct {
	Contract *IBaseSlashing // Generic contract binding to access the raw methods on
}

// IBaseSlashingCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IBaseSlashingCallerRaw struct {
	Contract *IBaseSlashingCaller // Generic read-only contract binding to access the raw methods on
}

// IBaseSlashingTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IBaseSlashingTransactorRaw struct {
	Contract *IBaseSlashingTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIBaseSlashing creates a new instance of IBaseSlashing, bound to a specific deployed contract.
func NewIBaseSlashing(address common.Address, backend bind.ContractBackend) (*IBaseSlashing, error) {
	contract, err := bindIBaseSlashing(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashing{IBaseSlashingCaller: IBaseSlashingCaller{contract: contract}, IBaseSlashingTransactor: IBaseSlashingTransactor{contract: contract}, IBaseSlashingFilterer: IBaseSlashingFilterer{contract: contract}}, nil
}

// NewIBaseSlashingCaller creates a new read-only instance of IBaseSlashing, bound to a specific deployed contract.
func NewIBaseSlashingCaller(address common.Address, caller bind.ContractCaller) (*IBaseSlashingCaller, error) {
	contract, err := bindIBaseSlashing(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingCaller{contract: contract}, nil
}

// NewIBaseSlashingTransactor creates a new write-only instance of IBaseSlashing, bound to a specific deployed contract.
func NewIBaseSlashingTransactor(address common.Address, transactor bind.ContractTransactor) (*IBaseSlashingTransactor, error) {
	contract, err := bindIBaseSlashing(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingTransactor{contract: contract}, nil
}

// NewIBaseSlashingFilterer creates a new log filterer instance of IBaseSlashing, bound to a specific deployed contract.
func NewIBaseSlashingFilterer(address common.Address, filterer bind.ContractFilterer) (*IBaseSlashingFilterer, error) {
	contract, err := bindIBaseSlashing(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingFilterer{contract: contract}, nil
}

// bindIBaseSlashing binds a generic wrapper to an already deployed contract.
func bindIBaseSlashing(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IBaseSlashingMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IBaseSlashing *IBaseSlashingRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IBaseSlashing.Contract.IBaseSlashingCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IBaseSlashing *IBaseSlashingRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.IBaseSlashingTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IBaseSlashing *IBaseSlashingRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.IBaseSlashingTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IBaseSlashing *IBaseSlashingCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IBaseSlashing.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IBaseSlashing *IBaseSlashingTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IBaseSlashing *IBaseSlashingTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.contract.Transact(opts, method, params...)
}

// GetSlasher is a free data retrieval call binding the contract method 0xd0c80f13.
//
// Solidity: function getSlasher() view returns(address)
func (_IBaseSlashing *IBaseSlashingCaller) GetSlasher(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getSlasher")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetSlasher is a free data retrieval call binding the contract method 0xd0c80f13.
//
// Solidity: function getSlasher() view returns(address)
func (_IBaseSlashing *IBaseSlashingSession) GetSlasher() (common.Address, error) {
	return _IBaseSlashing.Contract.GetSlasher(&_IBaseSlashing.CallOpts)
}

// GetSlasher is a free data retrieval call binding the contract method 0xd0c80f13.
//
// Solidity: function getSlasher() view returns(address)
func (_IBaseSlashing *IBaseSlashingCallerSession) GetSlasher() (common.Address, error) {
	return _IBaseSlashing.Contract.GetSlasher(&_IBaseSlashing.CallOpts)
}

// ExecuteSlashVault is a paid mutator transaction binding the contract method 0x393e152f.
//
// Solidity: function executeSlashVault(address vault, uint256 slashIndex, bytes hints) returns(bool success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingTransactor) ExecuteSlashVault(opts *bind.TransactOpts, vault common.Address, slashIndex *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "executeSlashVault", vault, slashIndex, hints)
}

// ExecuteSlashVault is a paid mutator transaction binding the contract method 0x393e152f.
//
// Solidity: function executeSlashVault(address vault, uint256 slashIndex, bytes hints) returns(bool success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingSession) ExecuteSlashVault(vault common.Address, slashIndex *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.ExecuteSlashVault(&_IBaseSlashing.TransactOpts, vault, slashIndex, hints)
}

// ExecuteSlashVault is a paid mutator transaction binding the contract method 0x393e152f.
//
// Solidity: function executeSlashVault(address vault, uint256 slashIndex, bytes hints) returns(bool success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingTransactorSession) ExecuteSlashVault(vault common.Address, slashIndex *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.ExecuteSlashVault(&_IBaseSlashing.TransactOpts, vault, slashIndex, hints)
}

// SetSlasher is a paid mutator transaction binding the contract method 0xaabc2496.
//
// Solidity: function setSlasher(address slasher) returns()
func (_IBaseSlashing *IBaseSlashingTransactor) SetSlasher(opts *bind.TransactOpts, slasher common.Address) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "setSlasher", slasher)
}

// SetSlasher is a paid mutator transaction binding the contract method 0xaabc2496.
//
// Solidity: function setSlasher(address slasher) returns()
func (_IBaseSlashing *IBaseSlashingSession) SetSlasher(slasher common.Address) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.SetSlasher(&_IBaseSlashing.TransactOpts, slasher)
}

// SetSlasher is a paid mutator transaction binding the contract method 0xaabc2496.
//
// Solidity: function setSlasher(address slasher) returns()
func (_IBaseSlashing *IBaseSlashingTransactorSession) SetSlasher(slasher common.Address) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.SetSlasher(&_IBaseSlashing.TransactOpts, slasher)
}

// SlashVault is a paid mutator transaction binding the contract method 0x260ce0bd.
//
// Solidity: function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes hints) returns(bool success, bytes response)
func (_IBaseSlashing *IBaseSlashingTransactor) SlashVault(opts *bind.TransactOpts, timestamp *big.Int, vault common.Address, operator common.Address, amount *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "slashVault", timestamp, vault, operator, amount, hints)
}

// SlashVault is a paid mutator transaction binding the contract method 0x260ce0bd.
//
// Solidity: function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes hints) returns(bool success, bytes response)
func (_IBaseSlashing *IBaseSlashingSession) SlashVault(timestamp *big.Int, vault common.Address, operator common.Address, amount *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.SlashVault(&_IBaseSlashing.TransactOpts, timestamp, vault, operator, amount, hints)
}

// SlashVault is a paid mutator transaction binding the contract method 0x260ce0bd.
//
// Solidity: function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes hints) returns(bool success, bytes response)
func (_IBaseSlashing *IBaseSlashingTransactorSession) SlashVault(timestamp *big.Int, vault common.Address, operator common.Address, amount *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.SlashVault(&_IBaseSlashing.TransactOpts, timestamp, vault, operator, amount, hints)
}

// IBaseSlashingExecuteSlashIterator is returned from FilterExecuteSlash and is used to iterate over the raw logs and unpacked data for ExecuteSlash events raised by the IBaseSlashing contract.
type IBaseSlashingExecuteSlashIterator struct {
	Event *IBaseSlashingExecuteSlash // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingExecuteSlashIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingExecuteSlash)
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
		it.Event = new(IBaseSlashingExecuteSlash)
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
func (it *IBaseSlashingExecuteSlashIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingExecuteSlashIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingExecuteSlash represents a ExecuteSlash event raised by the IBaseSlashing contract.
type IBaseSlashingExecuteSlash struct {
	Slasher       common.Address
	SlashIndex    *big.Int
	Success       bool
	SlashedAmount *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterExecuteSlash is a free log retrieval operation binding the contract event 0xeceffb66eab7d894b03042d8db748e6a430e9b61287b00451b206a03322a22be.
//
// Solidity: event ExecuteSlash(address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterExecuteSlash(opts *bind.FilterOpts, slasher []common.Address, slashIndex []*big.Int, success []bool) (*IBaseSlashingExecuteSlashIterator, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var slashIndexRule []interface{}
	for _, slashIndexItem := range slashIndex {
		slashIndexRule = append(slashIndexRule, slashIndexItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "ExecuteSlash", slasherRule, slashIndexRule, successRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingExecuteSlashIterator{contract: _IBaseSlashing.contract, event: "ExecuteSlash", logs: logs, sub: sub}, nil
}

// WatchExecuteSlash is a free log subscription operation binding the contract event 0xeceffb66eab7d894b03042d8db748e6a430e9b61287b00451b206a03322a22be.
//
// Solidity: event ExecuteSlash(address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchExecuteSlash(opts *bind.WatchOpts, sink chan<- *IBaseSlashingExecuteSlash, slasher []common.Address, slashIndex []*big.Int, success []bool) (event.Subscription, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var slashIndexRule []interface{}
	for _, slashIndexItem := range slashIndex {
		slashIndexRule = append(slashIndexRule, slashIndexItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "ExecuteSlash", slasherRule, slashIndexRule, successRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingExecuteSlash)
				if err := _IBaseSlashing.contract.UnpackLog(event, "ExecuteSlash", log); err != nil {
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

// ParseExecuteSlash is a log parse operation binding the contract event 0xeceffb66eab7d894b03042d8db748e6a430e9b61287b00451b206a03322a22be.
//
// Solidity: event ExecuteSlash(address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) ParseExecuteSlash(log types.Log) (*IBaseSlashingExecuteSlash, error) {
	event := new(IBaseSlashingExecuteSlash)
	if err := _IBaseSlashing.contract.UnpackLog(event, "ExecuteSlash", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingInstantSlashIterator is returned from FilterInstantSlash and is used to iterate over the raw logs and unpacked data for InstantSlash events raised by the IBaseSlashing contract.
type IBaseSlashingInstantSlashIterator struct {
	Event *IBaseSlashingInstantSlash // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingInstantSlashIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingInstantSlash)
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
		it.Event = new(IBaseSlashingInstantSlash)
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
func (it *IBaseSlashingInstantSlashIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingInstantSlashIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingInstantSlash represents a InstantSlash event raised by the IBaseSlashing contract.
type IBaseSlashingInstantSlash struct {
	Slasher       common.Address
	Operator      common.Address
	Success       bool
	SlashedAmount *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterInstantSlash is a free log retrieval operation binding the contract event 0x0aad709246d97ff10a8af5e6c1601ba0280ab5dba56b57540e121d0e04a3d9b1.
//
// Solidity: event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterInstantSlash(opts *bind.FilterOpts, slasher []common.Address, operator []common.Address, success []bool) (*IBaseSlashingInstantSlashIterator, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "InstantSlash", slasherRule, operatorRule, successRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingInstantSlashIterator{contract: _IBaseSlashing.contract, event: "InstantSlash", logs: logs, sub: sub}, nil
}

// WatchInstantSlash is a free log subscription operation binding the contract event 0x0aad709246d97ff10a8af5e6c1601ba0280ab5dba56b57540e121d0e04a3d9b1.
//
// Solidity: event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchInstantSlash(opts *bind.WatchOpts, sink chan<- *IBaseSlashingInstantSlash, slasher []common.Address, operator []common.Address, success []bool) (event.Subscription, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "InstantSlash", slasherRule, operatorRule, successRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingInstantSlash)
				if err := _IBaseSlashing.contract.UnpackLog(event, "InstantSlash", log); err != nil {
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

// ParseInstantSlash is a log parse operation binding the contract event 0x0aad709246d97ff10a8af5e6c1601ba0280ab5dba56b57540e121d0e04a3d9b1.
//
// Solidity: event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) ParseInstantSlash(log types.Log) (*IBaseSlashingInstantSlash, error) {
	event := new(IBaseSlashingInstantSlash)
	if err := _IBaseSlashing.contract.UnpackLog(event, "InstantSlash", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingSetSlasherIterator is returned from FilterSetSlasher and is used to iterate over the raw logs and unpacked data for SetSlasher events raised by the IBaseSlashing contract.
type IBaseSlashingSetSlasherIterator struct {
	Event *IBaseSlashingSetSlasher // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingSetSlasherIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingSetSlasher)
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
		it.Event = new(IBaseSlashingSetSlasher)
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
func (it *IBaseSlashingSetSlasherIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingSetSlasherIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingSetSlasher represents a SetSlasher event raised by the IBaseSlashing contract.
type IBaseSlashingSetSlasher struct {
	Slasher common.Address
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterSetSlasher is a free log retrieval operation binding the contract event 0xe7e4c932e03abddfe20f83af42c33627e816115c7ec2b168441f65dc14bfc3ba.
//
// Solidity: event SetSlasher(address slasher)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterSetSlasher(opts *bind.FilterOpts) (*IBaseSlashingSetSlasherIterator, error) {

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "SetSlasher")
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingSetSlasherIterator{contract: _IBaseSlashing.contract, event: "SetSlasher", logs: logs, sub: sub}, nil
}

// WatchSetSlasher is a free log subscription operation binding the contract event 0xe7e4c932e03abddfe20f83af42c33627e816115c7ec2b168441f65dc14bfc3ba.
//
// Solidity: event SetSlasher(address slasher)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchSetSlasher(opts *bind.WatchOpts, sink chan<- *IBaseSlashingSetSlasher) (event.Subscription, error) {

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "SetSlasher")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingSetSlasher)
				if err := _IBaseSlashing.contract.UnpackLog(event, "SetSlasher", log); err != nil {
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

// ParseSetSlasher is a log parse operation binding the contract event 0xe7e4c932e03abddfe20f83af42c33627e816115c7ec2b168441f65dc14bfc3ba.
//
// Solidity: event SetSlasher(address slasher)
func (_IBaseSlashing *IBaseSlashingFilterer) ParseSetSlasher(log types.Log) (*IBaseSlashingSetSlasher, error) {
	event := new(IBaseSlashingSetSlasher)
	if err := _IBaseSlashing.contract.UnpackLog(event, "SetSlasher", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingVetoSlashIterator is returned from FilterVetoSlash and is used to iterate over the raw logs and unpacked data for VetoSlash events raised by the IBaseSlashing contract.
type IBaseSlashingVetoSlashIterator struct {
	Event *IBaseSlashingVetoSlash // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingVetoSlashIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingVetoSlash)
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
		it.Event = new(IBaseSlashingVetoSlash)
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
func (it *IBaseSlashingVetoSlashIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingVetoSlashIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingVetoSlash represents a VetoSlash event raised by the IBaseSlashing contract.
type IBaseSlashingVetoSlash struct {
	Slasher    common.Address
	Operator   common.Address
	Success    bool
	SlashIndex *big.Int
	Raw        types.Log // Blockchain specific contextual infos
}

// FilterVetoSlash is a free log retrieval operation binding the contract event 0xdb0a74dbd84722062e6d4cf7a0fe6571ab288f67da21ce1c100dac3399e01ed4.
//
// Solidity: event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterVetoSlash(opts *bind.FilterOpts, slasher []common.Address, operator []common.Address, success []bool) (*IBaseSlashingVetoSlashIterator, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "VetoSlash", slasherRule, operatorRule, successRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingVetoSlashIterator{contract: _IBaseSlashing.contract, event: "VetoSlash", logs: logs, sub: sub}, nil
}

// WatchVetoSlash is a free log subscription operation binding the contract event 0xdb0a74dbd84722062e6d4cf7a0fe6571ab288f67da21ce1c100dac3399e01ed4.
//
// Solidity: event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchVetoSlash(opts *bind.WatchOpts, sink chan<- *IBaseSlashingVetoSlash, slasher []common.Address, operator []common.Address, success []bool) (event.Subscription, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "VetoSlash", slasherRule, operatorRule, successRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingVetoSlash)
				if err := _IBaseSlashing.contract.UnpackLog(event, "VetoSlash", log); err != nil {
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

// ParseVetoSlash is a log parse operation binding the contract event 0xdb0a74dbd84722062e6d4cf7a0fe6571ab288f67da21ce1c100dac3399e01ed4.
//
// Solidity: event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex)
func (_IBaseSlashing *IBaseSlashingFilterer) ParseVetoSlash(log types.Log) (*IBaseSlashingVetoSlash, error) {
	event := new(IBaseSlashingVetoSlash)
	if err := _IBaseSlashing.contract.UnpackLog(event, "VetoSlash", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
