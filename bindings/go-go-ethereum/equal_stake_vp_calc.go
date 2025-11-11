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

// EqualStakeVPCalcMetaData contains all meta data concerning the EqualStakeVPCalc contract.
var EqualStakeVPCalcMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"stakeToVotingPower\",\"inputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"stakeToVotingPowerAt\",\"inputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]}]",
}

// EqualStakeVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use EqualStakeVPCalcMetaData.ABI instead.
var EqualStakeVPCalcABI = EqualStakeVPCalcMetaData.ABI

// EqualStakeVPCalc is an auto generated Go binding around an Ethereum contract.
type EqualStakeVPCalc struct {
	EqualStakeVPCalcCaller     // Read-only binding to the contract
	EqualStakeVPCalcTransactor // Write-only binding to the contract
	EqualStakeVPCalcFilterer   // Log filterer for contract events
}

// EqualStakeVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type EqualStakeVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// EqualStakeVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type EqualStakeVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// EqualStakeVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type EqualStakeVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// EqualStakeVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type EqualStakeVPCalcSession struct {
	Contract     *EqualStakeVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// EqualStakeVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type EqualStakeVPCalcCallerSession struct {
	Contract *EqualStakeVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts           // Call options to use throughout this session
}

// EqualStakeVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type EqualStakeVPCalcTransactorSession struct {
	Contract     *EqualStakeVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts           // Transaction auth options to use throughout this session
}

// EqualStakeVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type EqualStakeVPCalcRaw struct {
	Contract *EqualStakeVPCalc // Generic contract binding to access the raw methods on
}

// EqualStakeVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type EqualStakeVPCalcCallerRaw struct {
	Contract *EqualStakeVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// EqualStakeVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type EqualStakeVPCalcTransactorRaw struct {
	Contract *EqualStakeVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewEqualStakeVPCalc creates a new instance of EqualStakeVPCalc, bound to a specific deployed contract.
func NewEqualStakeVPCalc(address common.Address, backend bind.ContractBackend) (*EqualStakeVPCalc, error) {
	contract, err := bindEqualStakeVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &EqualStakeVPCalc{EqualStakeVPCalcCaller: EqualStakeVPCalcCaller{contract: contract}, EqualStakeVPCalcTransactor: EqualStakeVPCalcTransactor{contract: contract}, EqualStakeVPCalcFilterer: EqualStakeVPCalcFilterer{contract: contract}}, nil
}

// NewEqualStakeVPCalcCaller creates a new read-only instance of EqualStakeVPCalc, bound to a specific deployed contract.
func NewEqualStakeVPCalcCaller(address common.Address, caller bind.ContractCaller) (*EqualStakeVPCalcCaller, error) {
	contract, err := bindEqualStakeVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &EqualStakeVPCalcCaller{contract: contract}, nil
}

// NewEqualStakeVPCalcTransactor creates a new write-only instance of EqualStakeVPCalc, bound to a specific deployed contract.
func NewEqualStakeVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*EqualStakeVPCalcTransactor, error) {
	contract, err := bindEqualStakeVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &EqualStakeVPCalcTransactor{contract: contract}, nil
}

// NewEqualStakeVPCalcFilterer creates a new log filterer instance of EqualStakeVPCalc, bound to a specific deployed contract.
func NewEqualStakeVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*EqualStakeVPCalcFilterer, error) {
	contract, err := bindEqualStakeVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &EqualStakeVPCalcFilterer{contract: contract}, nil
}

// bindEqualStakeVPCalc binds a generic wrapper to an already deployed contract.
func bindEqualStakeVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := EqualStakeVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_EqualStakeVPCalc *EqualStakeVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _EqualStakeVPCalc.Contract.EqualStakeVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_EqualStakeVPCalc *EqualStakeVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _EqualStakeVPCalc.Contract.EqualStakeVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_EqualStakeVPCalc *EqualStakeVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _EqualStakeVPCalc.Contract.EqualStakeVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_EqualStakeVPCalc *EqualStakeVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _EqualStakeVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_EqualStakeVPCalc *EqualStakeVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _EqualStakeVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_EqualStakeVPCalc *EqualStakeVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _EqualStakeVPCalc.Contract.contract.Transact(opts, method, params...)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address , uint256 stake, bytes ) view returns(uint256)
func (_EqualStakeVPCalc *EqualStakeVPCalcCaller) StakeToVotingPower(opts *bind.CallOpts, arg0 common.Address, stake *big.Int, arg2 []byte) (*big.Int, error) {
	var out []interface{}
	err := _EqualStakeVPCalc.contract.Call(opts, &out, "stakeToVotingPower", arg0, stake, arg2)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address , uint256 stake, bytes ) view returns(uint256)
func (_EqualStakeVPCalc *EqualStakeVPCalcSession) StakeToVotingPower(arg0 common.Address, stake *big.Int, arg2 []byte) (*big.Int, error) {
	return _EqualStakeVPCalc.Contract.StakeToVotingPower(&_EqualStakeVPCalc.CallOpts, arg0, stake, arg2)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address , uint256 stake, bytes ) view returns(uint256)
func (_EqualStakeVPCalc *EqualStakeVPCalcCallerSession) StakeToVotingPower(arg0 common.Address, stake *big.Int, arg2 []byte) (*big.Int, error) {
	return _EqualStakeVPCalc.Contract.StakeToVotingPower(&_EqualStakeVPCalc.CallOpts, arg0, stake, arg2)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address , uint256 stake, bytes , uint48 ) view returns(uint256)
func (_EqualStakeVPCalc *EqualStakeVPCalcCaller) StakeToVotingPowerAt(opts *bind.CallOpts, arg0 common.Address, stake *big.Int, arg2 []byte, arg3 *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _EqualStakeVPCalc.contract.Call(opts, &out, "stakeToVotingPowerAt", arg0, stake, arg2, arg3)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address , uint256 stake, bytes , uint48 ) view returns(uint256)
func (_EqualStakeVPCalc *EqualStakeVPCalcSession) StakeToVotingPowerAt(arg0 common.Address, stake *big.Int, arg2 []byte, arg3 *big.Int) (*big.Int, error) {
	return _EqualStakeVPCalc.Contract.StakeToVotingPowerAt(&_EqualStakeVPCalc.CallOpts, arg0, stake, arg2, arg3)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address , uint256 stake, bytes , uint48 ) view returns(uint256)
func (_EqualStakeVPCalc *EqualStakeVPCalcCallerSession) StakeToVotingPowerAt(arg0 common.Address, stake *big.Int, arg2 []byte, arg3 *big.Int) (*big.Int, error) {
	return _EqualStakeVPCalc.Contract.StakeToVotingPowerAt(&_EqualStakeVPCalc.CallOpts, arg0, stake, arg2, arg3)
}

// EqualStakeVPCalcInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the EqualStakeVPCalc contract.
type EqualStakeVPCalcInitializedIterator struct {
	Event *EqualStakeVPCalcInitialized // Event containing the contract specifics and raw log

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
func (it *EqualStakeVPCalcInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(EqualStakeVPCalcInitialized)
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
		it.Event = new(EqualStakeVPCalcInitialized)
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
func (it *EqualStakeVPCalcInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *EqualStakeVPCalcInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// EqualStakeVPCalcInitialized represents a Initialized event raised by the EqualStakeVPCalc contract.
type EqualStakeVPCalcInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_EqualStakeVPCalc *EqualStakeVPCalcFilterer) FilterInitialized(opts *bind.FilterOpts) (*EqualStakeVPCalcInitializedIterator, error) {

	logs, sub, err := _EqualStakeVPCalc.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &EqualStakeVPCalcInitializedIterator{contract: _EqualStakeVPCalc.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_EqualStakeVPCalc *EqualStakeVPCalcFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *EqualStakeVPCalcInitialized) (event.Subscription, error) {

	logs, sub, err := _EqualStakeVPCalc.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(EqualStakeVPCalcInitialized)
				if err := _EqualStakeVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_EqualStakeVPCalc *EqualStakeVPCalcFilterer) ParseInitialized(log types.Log) (*EqualStakeVPCalcInitialized, error) {
	event := new(EqualStakeVPCalcInitialized)
	if err := _EqualStakeVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
