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

// NormalizedTokenDecimalsVPCalcMetaData contains all meta data concerning the NormalizedTokenDecimalsVPCalc contract.
var NormalizedTokenDecimalsVPCalcMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"stakeToVotingPower\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"stakeToVotingPowerAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]}]",
}

// NormalizedTokenDecimalsVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use NormalizedTokenDecimalsVPCalcMetaData.ABI instead.
var NormalizedTokenDecimalsVPCalcABI = NormalizedTokenDecimalsVPCalcMetaData.ABI

// NormalizedTokenDecimalsVPCalc is an auto generated Go binding around an Ethereum contract.
type NormalizedTokenDecimalsVPCalc struct {
	NormalizedTokenDecimalsVPCalcCaller     // Read-only binding to the contract
	NormalizedTokenDecimalsVPCalcTransactor // Write-only binding to the contract
	NormalizedTokenDecimalsVPCalcFilterer   // Log filterer for contract events
}

// NormalizedTokenDecimalsVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type NormalizedTokenDecimalsVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// NormalizedTokenDecimalsVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type NormalizedTokenDecimalsVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// NormalizedTokenDecimalsVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type NormalizedTokenDecimalsVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// NormalizedTokenDecimalsVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type NormalizedTokenDecimalsVPCalcSession struct {
	Contract     *NormalizedTokenDecimalsVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts                  // Call options to use throughout this session
	TransactOpts bind.TransactOpts              // Transaction auth options to use throughout this session
}

// NormalizedTokenDecimalsVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type NormalizedTokenDecimalsVPCalcCallerSession struct {
	Contract *NormalizedTokenDecimalsVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                        // Call options to use throughout this session
}

// NormalizedTokenDecimalsVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type NormalizedTokenDecimalsVPCalcTransactorSession struct {
	Contract     *NormalizedTokenDecimalsVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                        // Transaction auth options to use throughout this session
}

// NormalizedTokenDecimalsVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type NormalizedTokenDecimalsVPCalcRaw struct {
	Contract *NormalizedTokenDecimalsVPCalc // Generic contract binding to access the raw methods on
}

// NormalizedTokenDecimalsVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type NormalizedTokenDecimalsVPCalcCallerRaw struct {
	Contract *NormalizedTokenDecimalsVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// NormalizedTokenDecimalsVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type NormalizedTokenDecimalsVPCalcTransactorRaw struct {
	Contract *NormalizedTokenDecimalsVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewNormalizedTokenDecimalsVPCalc creates a new instance of NormalizedTokenDecimalsVPCalc, bound to a specific deployed contract.
func NewNormalizedTokenDecimalsVPCalc(address common.Address, backend bind.ContractBackend) (*NormalizedTokenDecimalsVPCalc, error) {
	contract, err := bindNormalizedTokenDecimalsVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &NormalizedTokenDecimalsVPCalc{NormalizedTokenDecimalsVPCalcCaller: NormalizedTokenDecimalsVPCalcCaller{contract: contract}, NormalizedTokenDecimalsVPCalcTransactor: NormalizedTokenDecimalsVPCalcTransactor{contract: contract}, NormalizedTokenDecimalsVPCalcFilterer: NormalizedTokenDecimalsVPCalcFilterer{contract: contract}}, nil
}

// NewNormalizedTokenDecimalsVPCalcCaller creates a new read-only instance of NormalizedTokenDecimalsVPCalc, bound to a specific deployed contract.
func NewNormalizedTokenDecimalsVPCalcCaller(address common.Address, caller bind.ContractCaller) (*NormalizedTokenDecimalsVPCalcCaller, error) {
	contract, err := bindNormalizedTokenDecimalsVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &NormalizedTokenDecimalsVPCalcCaller{contract: contract}, nil
}

// NewNormalizedTokenDecimalsVPCalcTransactor creates a new write-only instance of NormalizedTokenDecimalsVPCalc, bound to a specific deployed contract.
func NewNormalizedTokenDecimalsVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*NormalizedTokenDecimalsVPCalcTransactor, error) {
	contract, err := bindNormalizedTokenDecimalsVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &NormalizedTokenDecimalsVPCalcTransactor{contract: contract}, nil
}

// NewNormalizedTokenDecimalsVPCalcFilterer creates a new log filterer instance of NormalizedTokenDecimalsVPCalc, bound to a specific deployed contract.
func NewNormalizedTokenDecimalsVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*NormalizedTokenDecimalsVPCalcFilterer, error) {
	contract, err := bindNormalizedTokenDecimalsVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &NormalizedTokenDecimalsVPCalcFilterer{contract: contract}, nil
}

// bindNormalizedTokenDecimalsVPCalc binds a generic wrapper to an already deployed contract.
func bindNormalizedTokenDecimalsVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := NormalizedTokenDecimalsVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _NormalizedTokenDecimalsVPCalc.Contract.NormalizedTokenDecimalsVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _NormalizedTokenDecimalsVPCalc.Contract.NormalizedTokenDecimalsVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _NormalizedTokenDecimalsVPCalc.Contract.NormalizedTokenDecimalsVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _NormalizedTokenDecimalsVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _NormalizedTokenDecimalsVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _NormalizedTokenDecimalsVPCalc.Contract.contract.Transact(opts, method, params...)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcCaller) StakeToVotingPower(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	var out []interface{}
	err := _NormalizedTokenDecimalsVPCalc.contract.Call(opts, &out, "stakeToVotingPower", vault, stake, extraData)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _NormalizedTokenDecimalsVPCalc.Contract.StakeToVotingPower(&_NormalizedTokenDecimalsVPCalc.CallOpts, vault, stake, extraData)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcCallerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _NormalizedTokenDecimalsVPCalc.Contract.StakeToVotingPower(&_NormalizedTokenDecimalsVPCalc.CallOpts, vault, stake, extraData)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcCaller) StakeToVotingPowerAt(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _NormalizedTokenDecimalsVPCalc.contract.Call(opts, &out, "stakeToVotingPowerAt", vault, stake, extraData, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _NormalizedTokenDecimalsVPCalc.Contract.StakeToVotingPowerAt(&_NormalizedTokenDecimalsVPCalc.CallOpts, vault, stake, extraData, timestamp)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcCallerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _NormalizedTokenDecimalsVPCalc.Contract.StakeToVotingPowerAt(&_NormalizedTokenDecimalsVPCalc.CallOpts, vault, stake, extraData, timestamp)
}

// NormalizedTokenDecimalsVPCalcInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the NormalizedTokenDecimalsVPCalc contract.
type NormalizedTokenDecimalsVPCalcInitializedIterator struct {
	Event *NormalizedTokenDecimalsVPCalcInitialized // Event containing the contract specifics and raw log

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
func (it *NormalizedTokenDecimalsVPCalcInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(NormalizedTokenDecimalsVPCalcInitialized)
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
		it.Event = new(NormalizedTokenDecimalsVPCalcInitialized)
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
func (it *NormalizedTokenDecimalsVPCalcInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *NormalizedTokenDecimalsVPCalcInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// NormalizedTokenDecimalsVPCalcInitialized represents a Initialized event raised by the NormalizedTokenDecimalsVPCalc contract.
type NormalizedTokenDecimalsVPCalcInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcFilterer) FilterInitialized(opts *bind.FilterOpts) (*NormalizedTokenDecimalsVPCalcInitializedIterator, error) {

	logs, sub, err := _NormalizedTokenDecimalsVPCalc.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &NormalizedTokenDecimalsVPCalcInitializedIterator{contract: _NormalizedTokenDecimalsVPCalc.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *NormalizedTokenDecimalsVPCalcInitialized) (event.Subscription, error) {

	logs, sub, err := _NormalizedTokenDecimalsVPCalc.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(NormalizedTokenDecimalsVPCalcInitialized)
				if err := _NormalizedTokenDecimalsVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_NormalizedTokenDecimalsVPCalc *NormalizedTokenDecimalsVPCalcFilterer) ParseInitialized(log types.Log) (*NormalizedTokenDecimalsVPCalcInitialized, error) {
	event := new(NormalizedTokenDecimalsVPCalcInitialized)
	if err := _NormalizedTokenDecimalsVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
