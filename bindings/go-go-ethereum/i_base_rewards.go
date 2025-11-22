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

// IBaseRewardsMetaData contains all meta data concerning the IBaseRewards contract.
var IBaseRewardsMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"distributeOperatorRewards\",\"inputs\":[{\"name\":\"operatorRewards\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"amount\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"root\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"distributeStakerRewards\",\"inputs\":[{\"name\":\"stakerRewards\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"amount\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"data\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"getRewarder\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setRewarder\",\"inputs\":[{\"name\":\"rewarder\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"DistributeOperatorRewards\",\"inputs\":[{\"name\":\"operatorRewards\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"amount\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"},{\"name\":\"root\",\"type\":\"bytes32\",\"indexed\":false,\"internalType\":\"bytes32\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"DistributeStakerRewards\",\"inputs\":[{\"name\":\"stakerRewards\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"amount\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"},{\"name\":\"data\",\"type\":\"bytes\",\"indexed\":false,\"internalType\":\"bytes\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetRewarder\",\"inputs\":[{\"name\":\"rewarder\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"BaseRewards_NotRewarder\",\"inputs\":[]}]",
}

// IBaseRewardsABI is the input ABI used to generate the binding from.
// Deprecated: Use IBaseRewardsMetaData.ABI instead.
var IBaseRewardsABI = IBaseRewardsMetaData.ABI

// IBaseRewards is an auto generated Go binding around an Ethereum contract.
type IBaseRewards struct {
	IBaseRewardsCaller     // Read-only binding to the contract
	IBaseRewardsTransactor // Write-only binding to the contract
	IBaseRewardsFilterer   // Log filterer for contract events
}

// IBaseRewardsCaller is an auto generated read-only Go binding around an Ethereum contract.
type IBaseRewardsCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseRewardsTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IBaseRewardsTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseRewardsFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IBaseRewardsFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseRewardsSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IBaseRewardsSession struct {
	Contract     *IBaseRewards     // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IBaseRewardsCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IBaseRewardsCallerSession struct {
	Contract *IBaseRewardsCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts       // Call options to use throughout this session
}

// IBaseRewardsTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IBaseRewardsTransactorSession struct {
	Contract     *IBaseRewardsTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts       // Transaction auth options to use throughout this session
}

// IBaseRewardsRaw is an auto generated low-level Go binding around an Ethereum contract.
type IBaseRewardsRaw struct {
	Contract *IBaseRewards // Generic contract binding to access the raw methods on
}

// IBaseRewardsCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IBaseRewardsCallerRaw struct {
	Contract *IBaseRewardsCaller // Generic read-only contract binding to access the raw methods on
}

// IBaseRewardsTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IBaseRewardsTransactorRaw struct {
	Contract *IBaseRewardsTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIBaseRewards creates a new instance of IBaseRewards, bound to a specific deployed contract.
func NewIBaseRewards(address common.Address, backend bind.ContractBackend) (*IBaseRewards, error) {
	contract, err := bindIBaseRewards(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IBaseRewards{IBaseRewardsCaller: IBaseRewardsCaller{contract: contract}, IBaseRewardsTransactor: IBaseRewardsTransactor{contract: contract}, IBaseRewardsFilterer: IBaseRewardsFilterer{contract: contract}}, nil
}

// NewIBaseRewardsCaller creates a new read-only instance of IBaseRewards, bound to a specific deployed contract.
func NewIBaseRewardsCaller(address common.Address, caller bind.ContractCaller) (*IBaseRewardsCaller, error) {
	contract, err := bindIBaseRewards(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IBaseRewardsCaller{contract: contract}, nil
}

// NewIBaseRewardsTransactor creates a new write-only instance of IBaseRewards, bound to a specific deployed contract.
func NewIBaseRewardsTransactor(address common.Address, transactor bind.ContractTransactor) (*IBaseRewardsTransactor, error) {
	contract, err := bindIBaseRewards(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IBaseRewardsTransactor{contract: contract}, nil
}

// NewIBaseRewardsFilterer creates a new log filterer instance of IBaseRewards, bound to a specific deployed contract.
func NewIBaseRewardsFilterer(address common.Address, filterer bind.ContractFilterer) (*IBaseRewardsFilterer, error) {
	contract, err := bindIBaseRewards(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IBaseRewardsFilterer{contract: contract}, nil
}

// bindIBaseRewards binds a generic wrapper to an already deployed contract.
func bindIBaseRewards(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IBaseRewardsMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IBaseRewards *IBaseRewardsRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IBaseRewards.Contract.IBaseRewardsCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IBaseRewards *IBaseRewardsRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseRewards.Contract.IBaseRewardsTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IBaseRewards *IBaseRewardsRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IBaseRewards.Contract.IBaseRewardsTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IBaseRewards *IBaseRewardsCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IBaseRewards.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IBaseRewards *IBaseRewardsTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseRewards.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IBaseRewards *IBaseRewardsTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IBaseRewards.Contract.contract.Transact(opts, method, params...)
}

// GetRewarder is a free data retrieval call binding the contract method 0x9015dcc9.
//
// Solidity: function getRewarder() view returns(address)
func (_IBaseRewards *IBaseRewardsCaller) GetRewarder(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IBaseRewards.contract.Call(opts, &out, "getRewarder")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetRewarder is a free data retrieval call binding the contract method 0x9015dcc9.
//
// Solidity: function getRewarder() view returns(address)
func (_IBaseRewards *IBaseRewardsSession) GetRewarder() (common.Address, error) {
	return _IBaseRewards.Contract.GetRewarder(&_IBaseRewards.CallOpts)
}

// GetRewarder is a free data retrieval call binding the contract method 0x9015dcc9.
//
// Solidity: function getRewarder() view returns(address)
func (_IBaseRewards *IBaseRewardsCallerSession) GetRewarder() (common.Address, error) {
	return _IBaseRewards.Contract.GetRewarder(&_IBaseRewards.CallOpts)
}

// DistributeOperatorRewards is a paid mutator transaction binding the contract method 0x0565b492.
//
// Solidity: function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) returns()
func (_IBaseRewards *IBaseRewardsTransactor) DistributeOperatorRewards(opts *bind.TransactOpts, operatorRewards common.Address, token common.Address, amount *big.Int, root [32]byte) (*types.Transaction, error) {
	return _IBaseRewards.contract.Transact(opts, "distributeOperatorRewards", operatorRewards, token, amount, root)
}

// DistributeOperatorRewards is a paid mutator transaction binding the contract method 0x0565b492.
//
// Solidity: function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) returns()
func (_IBaseRewards *IBaseRewardsSession) DistributeOperatorRewards(operatorRewards common.Address, token common.Address, amount *big.Int, root [32]byte) (*types.Transaction, error) {
	return _IBaseRewards.Contract.DistributeOperatorRewards(&_IBaseRewards.TransactOpts, operatorRewards, token, amount, root)
}

// DistributeOperatorRewards is a paid mutator transaction binding the contract method 0x0565b492.
//
// Solidity: function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) returns()
func (_IBaseRewards *IBaseRewardsTransactorSession) DistributeOperatorRewards(operatorRewards common.Address, token common.Address, amount *big.Int, root [32]byte) (*types.Transaction, error) {
	return _IBaseRewards.Contract.DistributeOperatorRewards(&_IBaseRewards.TransactOpts, operatorRewards, token, amount, root)
}

// DistributeStakerRewards is a paid mutator transaction binding the contract method 0x675f0454.
//
// Solidity: function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes data) returns()
func (_IBaseRewards *IBaseRewardsTransactor) DistributeStakerRewards(opts *bind.TransactOpts, stakerRewards common.Address, token common.Address, amount *big.Int, data []byte) (*types.Transaction, error) {
	return _IBaseRewards.contract.Transact(opts, "distributeStakerRewards", stakerRewards, token, amount, data)
}

// DistributeStakerRewards is a paid mutator transaction binding the contract method 0x675f0454.
//
// Solidity: function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes data) returns()
func (_IBaseRewards *IBaseRewardsSession) DistributeStakerRewards(stakerRewards common.Address, token common.Address, amount *big.Int, data []byte) (*types.Transaction, error) {
	return _IBaseRewards.Contract.DistributeStakerRewards(&_IBaseRewards.TransactOpts, stakerRewards, token, amount, data)
}

// DistributeStakerRewards is a paid mutator transaction binding the contract method 0x675f0454.
//
// Solidity: function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes data) returns()
func (_IBaseRewards *IBaseRewardsTransactorSession) DistributeStakerRewards(stakerRewards common.Address, token common.Address, amount *big.Int, data []byte) (*types.Transaction, error) {
	return _IBaseRewards.Contract.DistributeStakerRewards(&_IBaseRewards.TransactOpts, stakerRewards, token, amount, data)
}

// SetRewarder is a paid mutator transaction binding the contract method 0x3a6462e4.
//
// Solidity: function setRewarder(address rewarder) returns()
func (_IBaseRewards *IBaseRewardsTransactor) SetRewarder(opts *bind.TransactOpts, rewarder common.Address) (*types.Transaction, error) {
	return _IBaseRewards.contract.Transact(opts, "setRewarder", rewarder)
}

// SetRewarder is a paid mutator transaction binding the contract method 0x3a6462e4.
//
// Solidity: function setRewarder(address rewarder) returns()
func (_IBaseRewards *IBaseRewardsSession) SetRewarder(rewarder common.Address) (*types.Transaction, error) {
	return _IBaseRewards.Contract.SetRewarder(&_IBaseRewards.TransactOpts, rewarder)
}

// SetRewarder is a paid mutator transaction binding the contract method 0x3a6462e4.
//
// Solidity: function setRewarder(address rewarder) returns()
func (_IBaseRewards *IBaseRewardsTransactorSession) SetRewarder(rewarder common.Address) (*types.Transaction, error) {
	return _IBaseRewards.Contract.SetRewarder(&_IBaseRewards.TransactOpts, rewarder)
}

// IBaseRewardsDistributeOperatorRewardsIterator is returned from FilterDistributeOperatorRewards and is used to iterate over the raw logs and unpacked data for DistributeOperatorRewards events raised by the IBaseRewards contract.
type IBaseRewardsDistributeOperatorRewardsIterator struct {
	Event *IBaseRewardsDistributeOperatorRewards // Event containing the contract specifics and raw log

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
func (it *IBaseRewardsDistributeOperatorRewardsIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseRewardsDistributeOperatorRewards)
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
		it.Event = new(IBaseRewardsDistributeOperatorRewards)
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
func (it *IBaseRewardsDistributeOperatorRewardsIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseRewardsDistributeOperatorRewardsIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseRewardsDistributeOperatorRewards represents a DistributeOperatorRewards event raised by the IBaseRewards contract.
type IBaseRewardsDistributeOperatorRewards struct {
	OperatorRewards common.Address
	Token           common.Address
	Amount          *big.Int
	Root            [32]byte
	Raw             types.Log // Blockchain specific contextual infos
}

// FilterDistributeOperatorRewards is a free log retrieval operation binding the contract event 0x6807d3da0b50376be0aeedbc9afa9fc1299a13f9de94c8c0edc2f3d5eb649102.
//
// Solidity: event DistributeOperatorRewards(address indexed operatorRewards, address indexed token, uint256 amount, bytes32 root)
func (_IBaseRewards *IBaseRewardsFilterer) FilterDistributeOperatorRewards(opts *bind.FilterOpts, operatorRewards []common.Address, token []common.Address) (*IBaseRewardsDistributeOperatorRewardsIterator, error) {

	var operatorRewardsRule []interface{}
	for _, operatorRewardsItem := range operatorRewards {
		operatorRewardsRule = append(operatorRewardsRule, operatorRewardsItem)
	}
	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IBaseRewards.contract.FilterLogs(opts, "DistributeOperatorRewards", operatorRewardsRule, tokenRule)
	if err != nil {
		return nil, err
	}
	return &IBaseRewardsDistributeOperatorRewardsIterator{contract: _IBaseRewards.contract, event: "DistributeOperatorRewards", logs: logs, sub: sub}, nil
}

// WatchDistributeOperatorRewards is a free log subscription operation binding the contract event 0x6807d3da0b50376be0aeedbc9afa9fc1299a13f9de94c8c0edc2f3d5eb649102.
//
// Solidity: event DistributeOperatorRewards(address indexed operatorRewards, address indexed token, uint256 amount, bytes32 root)
func (_IBaseRewards *IBaseRewardsFilterer) WatchDistributeOperatorRewards(opts *bind.WatchOpts, sink chan<- *IBaseRewardsDistributeOperatorRewards, operatorRewards []common.Address, token []common.Address) (event.Subscription, error) {

	var operatorRewardsRule []interface{}
	for _, operatorRewardsItem := range operatorRewards {
		operatorRewardsRule = append(operatorRewardsRule, operatorRewardsItem)
	}
	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IBaseRewards.contract.WatchLogs(opts, "DistributeOperatorRewards", operatorRewardsRule, tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseRewardsDistributeOperatorRewards)
				if err := _IBaseRewards.contract.UnpackLog(event, "DistributeOperatorRewards", log); err != nil {
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

// ParseDistributeOperatorRewards is a log parse operation binding the contract event 0x6807d3da0b50376be0aeedbc9afa9fc1299a13f9de94c8c0edc2f3d5eb649102.
//
// Solidity: event DistributeOperatorRewards(address indexed operatorRewards, address indexed token, uint256 amount, bytes32 root)
func (_IBaseRewards *IBaseRewardsFilterer) ParseDistributeOperatorRewards(log types.Log) (*IBaseRewardsDistributeOperatorRewards, error) {
	event := new(IBaseRewardsDistributeOperatorRewards)
	if err := _IBaseRewards.contract.UnpackLog(event, "DistributeOperatorRewards", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseRewardsDistributeStakerRewardsIterator is returned from FilterDistributeStakerRewards and is used to iterate over the raw logs and unpacked data for DistributeStakerRewards events raised by the IBaseRewards contract.
type IBaseRewardsDistributeStakerRewardsIterator struct {
	Event *IBaseRewardsDistributeStakerRewards // Event containing the contract specifics and raw log

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
func (it *IBaseRewardsDistributeStakerRewardsIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseRewardsDistributeStakerRewards)
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
		it.Event = new(IBaseRewardsDistributeStakerRewards)
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
func (it *IBaseRewardsDistributeStakerRewardsIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseRewardsDistributeStakerRewardsIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseRewardsDistributeStakerRewards represents a DistributeStakerRewards event raised by the IBaseRewards contract.
type IBaseRewardsDistributeStakerRewards struct {
	StakerRewards common.Address
	Token         common.Address
	Amount        *big.Int
	Data          []byte
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterDistributeStakerRewards is a free log retrieval operation binding the contract event 0x0e084062018d66c3e4ce67c62a1229c36a4dea6acdb22596d34d9551d9227333.
//
// Solidity: event DistributeStakerRewards(address indexed stakerRewards, address indexed token, uint256 amount, bytes data)
func (_IBaseRewards *IBaseRewardsFilterer) FilterDistributeStakerRewards(opts *bind.FilterOpts, stakerRewards []common.Address, token []common.Address) (*IBaseRewardsDistributeStakerRewardsIterator, error) {

	var stakerRewardsRule []interface{}
	for _, stakerRewardsItem := range stakerRewards {
		stakerRewardsRule = append(stakerRewardsRule, stakerRewardsItem)
	}
	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IBaseRewards.contract.FilterLogs(opts, "DistributeStakerRewards", stakerRewardsRule, tokenRule)
	if err != nil {
		return nil, err
	}
	return &IBaseRewardsDistributeStakerRewardsIterator{contract: _IBaseRewards.contract, event: "DistributeStakerRewards", logs: logs, sub: sub}, nil
}

// WatchDistributeStakerRewards is a free log subscription operation binding the contract event 0x0e084062018d66c3e4ce67c62a1229c36a4dea6acdb22596d34d9551d9227333.
//
// Solidity: event DistributeStakerRewards(address indexed stakerRewards, address indexed token, uint256 amount, bytes data)
func (_IBaseRewards *IBaseRewardsFilterer) WatchDistributeStakerRewards(opts *bind.WatchOpts, sink chan<- *IBaseRewardsDistributeStakerRewards, stakerRewards []common.Address, token []common.Address) (event.Subscription, error) {

	var stakerRewardsRule []interface{}
	for _, stakerRewardsItem := range stakerRewards {
		stakerRewardsRule = append(stakerRewardsRule, stakerRewardsItem)
	}
	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IBaseRewards.contract.WatchLogs(opts, "DistributeStakerRewards", stakerRewardsRule, tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseRewardsDistributeStakerRewards)
				if err := _IBaseRewards.contract.UnpackLog(event, "DistributeStakerRewards", log); err != nil {
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

// ParseDistributeStakerRewards is a log parse operation binding the contract event 0x0e084062018d66c3e4ce67c62a1229c36a4dea6acdb22596d34d9551d9227333.
//
// Solidity: event DistributeStakerRewards(address indexed stakerRewards, address indexed token, uint256 amount, bytes data)
func (_IBaseRewards *IBaseRewardsFilterer) ParseDistributeStakerRewards(log types.Log) (*IBaseRewardsDistributeStakerRewards, error) {
	event := new(IBaseRewardsDistributeStakerRewards)
	if err := _IBaseRewards.contract.UnpackLog(event, "DistributeStakerRewards", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseRewardsSetRewarderIterator is returned from FilterSetRewarder and is used to iterate over the raw logs and unpacked data for SetRewarder events raised by the IBaseRewards contract.
type IBaseRewardsSetRewarderIterator struct {
	Event *IBaseRewardsSetRewarder // Event containing the contract specifics and raw log

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
func (it *IBaseRewardsSetRewarderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseRewardsSetRewarder)
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
		it.Event = new(IBaseRewardsSetRewarder)
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
func (it *IBaseRewardsSetRewarderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseRewardsSetRewarderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseRewardsSetRewarder represents a SetRewarder event raised by the IBaseRewards contract.
type IBaseRewardsSetRewarder struct {
	Rewarder common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterSetRewarder is a free log retrieval operation binding the contract event 0xcf0aff36caea97f7ad632b334936cb196014c193ac1a790b578f12a70d9836db.
//
// Solidity: event SetRewarder(address rewarder)
func (_IBaseRewards *IBaseRewardsFilterer) FilterSetRewarder(opts *bind.FilterOpts) (*IBaseRewardsSetRewarderIterator, error) {

	logs, sub, err := _IBaseRewards.contract.FilterLogs(opts, "SetRewarder")
	if err != nil {
		return nil, err
	}
	return &IBaseRewardsSetRewarderIterator{contract: _IBaseRewards.contract, event: "SetRewarder", logs: logs, sub: sub}, nil
}

// WatchSetRewarder is a free log subscription operation binding the contract event 0xcf0aff36caea97f7ad632b334936cb196014c193ac1a790b578f12a70d9836db.
//
// Solidity: event SetRewarder(address rewarder)
func (_IBaseRewards *IBaseRewardsFilterer) WatchSetRewarder(opts *bind.WatchOpts, sink chan<- *IBaseRewardsSetRewarder) (event.Subscription, error) {

	logs, sub, err := _IBaseRewards.contract.WatchLogs(opts, "SetRewarder")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseRewardsSetRewarder)
				if err := _IBaseRewards.contract.UnpackLog(event, "SetRewarder", log); err != nil {
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

// ParseSetRewarder is a log parse operation binding the contract event 0xcf0aff36caea97f7ad632b334936cb196014c193ac1a790b578f12a70d9836db.
//
// Solidity: event SetRewarder(address rewarder)
func (_IBaseRewards *IBaseRewardsFilterer) ParseSetRewarder(log types.Log) (*IBaseRewardsSetRewarder, error) {
	event := new(IBaseRewardsSetRewarder)
	if err := _IBaseRewards.contract.UnpackLog(event, "SetRewarder", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
