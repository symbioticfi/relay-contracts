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

// VotingPowerCalcManagerMetaData contains all meta data concerning the VotingPowerCalcManager contract.
var VotingPowerCalcManagerMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"stakeToVotingPower\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"power\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"stakeToVotingPowerAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"power\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]}]",
}

// VotingPowerCalcManagerABI is the input ABI used to generate the binding from.
// Deprecated: Use VotingPowerCalcManagerMetaData.ABI instead.
var VotingPowerCalcManagerABI = VotingPowerCalcManagerMetaData.ABI

// VotingPowerCalcManager is an auto generated Go binding around an Ethereum contract.
type VotingPowerCalcManager struct {
	VotingPowerCalcManagerCaller     // Read-only binding to the contract
	VotingPowerCalcManagerTransactor // Write-only binding to the contract
	VotingPowerCalcManagerFilterer   // Log filterer for contract events
}

// VotingPowerCalcManagerCaller is an auto generated read-only Go binding around an Ethereum contract.
type VotingPowerCalcManagerCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// VotingPowerCalcManagerTransactor is an auto generated write-only Go binding around an Ethereum contract.
type VotingPowerCalcManagerTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// VotingPowerCalcManagerFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type VotingPowerCalcManagerFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// VotingPowerCalcManagerSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type VotingPowerCalcManagerSession struct {
	Contract     *VotingPowerCalcManager // Generic contract binding to set the session for
	CallOpts     bind.CallOpts           // Call options to use throughout this session
	TransactOpts bind.TransactOpts       // Transaction auth options to use throughout this session
}

// VotingPowerCalcManagerCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type VotingPowerCalcManagerCallerSession struct {
	Contract *VotingPowerCalcManagerCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                 // Call options to use throughout this session
}

// VotingPowerCalcManagerTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type VotingPowerCalcManagerTransactorSession struct {
	Contract     *VotingPowerCalcManagerTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                 // Transaction auth options to use throughout this session
}

// VotingPowerCalcManagerRaw is an auto generated low-level Go binding around an Ethereum contract.
type VotingPowerCalcManagerRaw struct {
	Contract *VotingPowerCalcManager // Generic contract binding to access the raw methods on
}

// VotingPowerCalcManagerCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type VotingPowerCalcManagerCallerRaw struct {
	Contract *VotingPowerCalcManagerCaller // Generic read-only contract binding to access the raw methods on
}

// VotingPowerCalcManagerTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type VotingPowerCalcManagerTransactorRaw struct {
	Contract *VotingPowerCalcManagerTransactor // Generic write-only contract binding to access the raw methods on
}

// NewVotingPowerCalcManager creates a new instance of VotingPowerCalcManager, bound to a specific deployed contract.
func NewVotingPowerCalcManager(address common.Address, backend bind.ContractBackend) (*VotingPowerCalcManager, error) {
	contract, err := bindVotingPowerCalcManager(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &VotingPowerCalcManager{VotingPowerCalcManagerCaller: VotingPowerCalcManagerCaller{contract: contract}, VotingPowerCalcManagerTransactor: VotingPowerCalcManagerTransactor{contract: contract}, VotingPowerCalcManagerFilterer: VotingPowerCalcManagerFilterer{contract: contract}}, nil
}

// NewVotingPowerCalcManagerCaller creates a new read-only instance of VotingPowerCalcManager, bound to a specific deployed contract.
func NewVotingPowerCalcManagerCaller(address common.Address, caller bind.ContractCaller) (*VotingPowerCalcManagerCaller, error) {
	contract, err := bindVotingPowerCalcManager(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &VotingPowerCalcManagerCaller{contract: contract}, nil
}

// NewVotingPowerCalcManagerTransactor creates a new write-only instance of VotingPowerCalcManager, bound to a specific deployed contract.
func NewVotingPowerCalcManagerTransactor(address common.Address, transactor bind.ContractTransactor) (*VotingPowerCalcManagerTransactor, error) {
	contract, err := bindVotingPowerCalcManager(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &VotingPowerCalcManagerTransactor{contract: contract}, nil
}

// NewVotingPowerCalcManagerFilterer creates a new log filterer instance of VotingPowerCalcManager, bound to a specific deployed contract.
func NewVotingPowerCalcManagerFilterer(address common.Address, filterer bind.ContractFilterer) (*VotingPowerCalcManagerFilterer, error) {
	contract, err := bindVotingPowerCalcManager(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &VotingPowerCalcManagerFilterer{contract: contract}, nil
}

// bindVotingPowerCalcManager binds a generic wrapper to an already deployed contract.
func bindVotingPowerCalcManager(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := VotingPowerCalcManagerMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_VotingPowerCalcManager *VotingPowerCalcManagerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _VotingPowerCalcManager.Contract.VotingPowerCalcManagerCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_VotingPowerCalcManager *VotingPowerCalcManagerRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _VotingPowerCalcManager.Contract.VotingPowerCalcManagerTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_VotingPowerCalcManager *VotingPowerCalcManagerRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _VotingPowerCalcManager.Contract.VotingPowerCalcManagerTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_VotingPowerCalcManager *VotingPowerCalcManagerCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _VotingPowerCalcManager.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_VotingPowerCalcManager *VotingPowerCalcManagerTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _VotingPowerCalcManager.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_VotingPowerCalcManager *VotingPowerCalcManagerTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _VotingPowerCalcManager.Contract.contract.Transact(opts, method, params...)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256 power)
func (_VotingPowerCalcManager *VotingPowerCalcManagerCaller) StakeToVotingPower(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	var out []interface{}
	err := _VotingPowerCalcManager.contract.Call(opts, &out, "stakeToVotingPower", vault, stake, extraData)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256 power)
func (_VotingPowerCalcManager *VotingPowerCalcManagerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _VotingPowerCalcManager.Contract.StakeToVotingPower(&_VotingPowerCalcManager.CallOpts, vault, stake, extraData)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256 power)
func (_VotingPowerCalcManager *VotingPowerCalcManagerCallerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _VotingPowerCalcManager.Contract.StakeToVotingPower(&_VotingPowerCalcManager.CallOpts, vault, stake, extraData)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256 power)
func (_VotingPowerCalcManager *VotingPowerCalcManagerCaller) StakeToVotingPowerAt(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _VotingPowerCalcManager.contract.Call(opts, &out, "stakeToVotingPowerAt", vault, stake, extraData, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256 power)
func (_VotingPowerCalcManager *VotingPowerCalcManagerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _VotingPowerCalcManager.Contract.StakeToVotingPowerAt(&_VotingPowerCalcManager.CallOpts, vault, stake, extraData, timestamp)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256 power)
func (_VotingPowerCalcManager *VotingPowerCalcManagerCallerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _VotingPowerCalcManager.Contract.StakeToVotingPowerAt(&_VotingPowerCalcManager.CallOpts, vault, stake, extraData, timestamp)
}

// VotingPowerCalcManagerInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the VotingPowerCalcManager contract.
type VotingPowerCalcManagerInitializedIterator struct {
	Event *VotingPowerCalcManagerInitialized // Event containing the contract specifics and raw log

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
func (it *VotingPowerCalcManagerInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(VotingPowerCalcManagerInitialized)
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
		it.Event = new(VotingPowerCalcManagerInitialized)
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
func (it *VotingPowerCalcManagerInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *VotingPowerCalcManagerInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// VotingPowerCalcManagerInitialized represents a Initialized event raised by the VotingPowerCalcManager contract.
type VotingPowerCalcManagerInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_VotingPowerCalcManager *VotingPowerCalcManagerFilterer) FilterInitialized(opts *bind.FilterOpts) (*VotingPowerCalcManagerInitializedIterator, error) {

	logs, sub, err := _VotingPowerCalcManager.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &VotingPowerCalcManagerInitializedIterator{contract: _VotingPowerCalcManager.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_VotingPowerCalcManager *VotingPowerCalcManagerFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *VotingPowerCalcManagerInitialized) (event.Subscription, error) {

	logs, sub, err := _VotingPowerCalcManager.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(VotingPowerCalcManagerInitialized)
				if err := _VotingPowerCalcManager.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_VotingPowerCalcManager *VotingPowerCalcManagerFilterer) ParseInitialized(log types.Log) (*VotingPowerCalcManagerInitialized, error) {
	event := new(VotingPowerCalcManagerInitialized)
	if err := _VotingPowerCalcManager.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
