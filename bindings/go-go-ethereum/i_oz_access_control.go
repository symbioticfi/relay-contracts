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

// IOzAccessControlMetaData contains all meta data concerning the IOzAccessControl contract.
var IOzAccessControlMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getRole\",\"inputs\":[{\"name\":\"selector\",\"type\":\"bytes4\",\"internalType\":\"bytes4\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"SetSelectorRole\",\"inputs\":[{\"name\":\"selector\",\"type\":\"bytes4\",\"indexed\":true,\"internalType\":\"bytes4\"},{\"name\":\"role\",\"type\":\"bytes32\",\"indexed\":true,\"internalType\":\"bytes32\"}],\"anonymous\":false}]",
}

// IOzAccessControlABI is the input ABI used to generate the binding from.
// Deprecated: Use IOzAccessControlMetaData.ABI instead.
var IOzAccessControlABI = IOzAccessControlMetaData.ABI

// IOzAccessControl is an auto generated Go binding around an Ethereum contract.
type IOzAccessControl struct {
	IOzAccessControlCaller     // Read-only binding to the contract
	IOzAccessControlTransactor // Write-only binding to the contract
	IOzAccessControlFilterer   // Log filterer for contract events
}

// IOzAccessControlCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOzAccessControlCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzAccessControlTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOzAccessControlTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzAccessControlFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOzAccessControlFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzAccessControlSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOzAccessControlSession struct {
	Contract     *IOzAccessControl // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IOzAccessControlCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOzAccessControlCallerSession struct {
	Contract *IOzAccessControlCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts           // Call options to use throughout this session
}

// IOzAccessControlTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOzAccessControlTransactorSession struct {
	Contract     *IOzAccessControlTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts           // Transaction auth options to use throughout this session
}

// IOzAccessControlRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOzAccessControlRaw struct {
	Contract *IOzAccessControl // Generic contract binding to access the raw methods on
}

// IOzAccessControlCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOzAccessControlCallerRaw struct {
	Contract *IOzAccessControlCaller // Generic read-only contract binding to access the raw methods on
}

// IOzAccessControlTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOzAccessControlTransactorRaw struct {
	Contract *IOzAccessControlTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOzAccessControl creates a new instance of IOzAccessControl, bound to a specific deployed contract.
func NewIOzAccessControl(address common.Address, backend bind.ContractBackend) (*IOzAccessControl, error) {
	contract, err := bindIOzAccessControl(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOzAccessControl{IOzAccessControlCaller: IOzAccessControlCaller{contract: contract}, IOzAccessControlTransactor: IOzAccessControlTransactor{contract: contract}, IOzAccessControlFilterer: IOzAccessControlFilterer{contract: contract}}, nil
}

// NewIOzAccessControlCaller creates a new read-only instance of IOzAccessControl, bound to a specific deployed contract.
func NewIOzAccessControlCaller(address common.Address, caller bind.ContractCaller) (*IOzAccessControlCaller, error) {
	contract, err := bindIOzAccessControl(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOzAccessControlCaller{contract: contract}, nil
}

// NewIOzAccessControlTransactor creates a new write-only instance of IOzAccessControl, bound to a specific deployed contract.
func NewIOzAccessControlTransactor(address common.Address, transactor bind.ContractTransactor) (*IOzAccessControlTransactor, error) {
	contract, err := bindIOzAccessControl(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOzAccessControlTransactor{contract: contract}, nil
}

// NewIOzAccessControlFilterer creates a new log filterer instance of IOzAccessControl, bound to a specific deployed contract.
func NewIOzAccessControlFilterer(address common.Address, filterer bind.ContractFilterer) (*IOzAccessControlFilterer, error) {
	contract, err := bindIOzAccessControl(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOzAccessControlFilterer{contract: contract}, nil
}

// bindIOzAccessControl binds a generic wrapper to an already deployed contract.
func bindIOzAccessControl(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOzAccessControlMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOzAccessControl *IOzAccessControlRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOzAccessControl.Contract.IOzAccessControlCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOzAccessControl *IOzAccessControlRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOzAccessControl.Contract.IOzAccessControlTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOzAccessControl *IOzAccessControlRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOzAccessControl.Contract.IOzAccessControlTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOzAccessControl *IOzAccessControlCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOzAccessControl.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOzAccessControl *IOzAccessControlTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOzAccessControl.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOzAccessControl *IOzAccessControlTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOzAccessControl.Contract.contract.Transact(opts, method, params...)
}

// GetRole is a free data retrieval call binding the contract method 0xa846156d.
//
// Solidity: function getRole(bytes4 selector) view returns(bytes32)
func (_IOzAccessControl *IOzAccessControlCaller) GetRole(opts *bind.CallOpts, selector [4]byte) ([32]byte, error) {
	var out []interface{}
	err := _IOzAccessControl.contract.Call(opts, &out, "getRole", selector)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetRole is a free data retrieval call binding the contract method 0xa846156d.
//
// Solidity: function getRole(bytes4 selector) view returns(bytes32)
func (_IOzAccessControl *IOzAccessControlSession) GetRole(selector [4]byte) ([32]byte, error) {
	return _IOzAccessControl.Contract.GetRole(&_IOzAccessControl.CallOpts, selector)
}

// GetRole is a free data retrieval call binding the contract method 0xa846156d.
//
// Solidity: function getRole(bytes4 selector) view returns(bytes32)
func (_IOzAccessControl *IOzAccessControlCallerSession) GetRole(selector [4]byte) ([32]byte, error) {
	return _IOzAccessControl.Contract.GetRole(&_IOzAccessControl.CallOpts, selector)
}

// IOzAccessControlSetSelectorRoleIterator is returned from FilterSetSelectorRole and is used to iterate over the raw logs and unpacked data for SetSelectorRole events raised by the IOzAccessControl contract.
type IOzAccessControlSetSelectorRoleIterator struct {
	Event *IOzAccessControlSetSelectorRole // Event containing the contract specifics and raw log

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
func (it *IOzAccessControlSetSelectorRoleIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOzAccessControlSetSelectorRole)
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
		it.Event = new(IOzAccessControlSetSelectorRole)
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
func (it *IOzAccessControlSetSelectorRoleIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOzAccessControlSetSelectorRoleIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOzAccessControlSetSelectorRole represents a SetSelectorRole event raised by the IOzAccessControl contract.
type IOzAccessControlSetSelectorRole struct {
	Selector [4]byte
	Role     [32]byte
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterSetSelectorRole is a free log retrieval operation binding the contract event 0x205ddee47edfee0f39b93f29e45a801cd7c9cffe0ca9a2da19e547227b2a0504.
//
// Solidity: event SetSelectorRole(bytes4 indexed selector, bytes32 indexed role)
func (_IOzAccessControl *IOzAccessControlFilterer) FilterSetSelectorRole(opts *bind.FilterOpts, selector [][4]byte, role [][32]byte) (*IOzAccessControlSetSelectorRoleIterator, error) {

	var selectorRule []interface{}
	for _, selectorItem := range selector {
		selectorRule = append(selectorRule, selectorItem)
	}
	var roleRule []interface{}
	for _, roleItem := range role {
		roleRule = append(roleRule, roleItem)
	}

	logs, sub, err := _IOzAccessControl.contract.FilterLogs(opts, "SetSelectorRole", selectorRule, roleRule)
	if err != nil {
		return nil, err
	}
	return &IOzAccessControlSetSelectorRoleIterator{contract: _IOzAccessControl.contract, event: "SetSelectorRole", logs: logs, sub: sub}, nil
}

// WatchSetSelectorRole is a free log subscription operation binding the contract event 0x205ddee47edfee0f39b93f29e45a801cd7c9cffe0ca9a2da19e547227b2a0504.
//
// Solidity: event SetSelectorRole(bytes4 indexed selector, bytes32 indexed role)
func (_IOzAccessControl *IOzAccessControlFilterer) WatchSetSelectorRole(opts *bind.WatchOpts, sink chan<- *IOzAccessControlSetSelectorRole, selector [][4]byte, role [][32]byte) (event.Subscription, error) {

	var selectorRule []interface{}
	for _, selectorItem := range selector {
		selectorRule = append(selectorRule, selectorItem)
	}
	var roleRule []interface{}
	for _, roleItem := range role {
		roleRule = append(roleRule, roleItem)
	}

	logs, sub, err := _IOzAccessControl.contract.WatchLogs(opts, "SetSelectorRole", selectorRule, roleRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOzAccessControlSetSelectorRole)
				if err := _IOzAccessControl.contract.UnpackLog(event, "SetSelectorRole", log); err != nil {
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

// ParseSetSelectorRole is a log parse operation binding the contract event 0x205ddee47edfee0f39b93f29e45a801cd7c9cffe0ca9a2da19e547227b2a0504.
//
// Solidity: event SetSelectorRole(bytes4 indexed selector, bytes32 indexed role)
func (_IOzAccessControl *IOzAccessControlFilterer) ParseSetSelectorRole(log types.Log) (*IOzAccessControlSetSelectorRole, error) {
	event := new(IOzAccessControlSetSelectorRole)
	if err := _IOzAccessControl.contract.UnpackLog(event, "SetSelectorRole", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
