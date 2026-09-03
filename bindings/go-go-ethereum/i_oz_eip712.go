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

// IOzEIP712MetaData contains all meta data concerning the IOzEIP712 contract.
var IOzEIP712MetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"eip712Domain\",\"inputs\":[],\"outputs\":[{\"name\":\"fields\",\"type\":\"bytes1\",\"internalType\":\"bytes1\"},{\"name\":\"name\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"salt\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"extensions\",\"type\":\"uint256[]\",\"internalType\":\"uint256[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4CrossChain\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"EIP712DomainChanged\",\"inputs\":[],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitEIP712\",\"inputs\":[{\"name\":\"name\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"}],\"anonymous\":false}]",
}

// IOzEIP712ABI is the input ABI used to generate the binding from.
// Deprecated: Use IOzEIP712MetaData.ABI instead.
var IOzEIP712ABI = IOzEIP712MetaData.ABI

// IOzEIP712 is an auto generated Go binding around an Ethereum contract.
type IOzEIP712 struct {
	IOzEIP712Caller     // Read-only binding to the contract
	IOzEIP712Transactor // Write-only binding to the contract
	IOzEIP712Filterer   // Log filterer for contract events
}

// IOzEIP712Caller is an auto generated read-only Go binding around an Ethereum contract.
type IOzEIP712Caller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzEIP712Transactor is an auto generated write-only Go binding around an Ethereum contract.
type IOzEIP712Transactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzEIP712Filterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOzEIP712Filterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzEIP712Session is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOzEIP712Session struct {
	Contract     *IOzEIP712        // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IOzEIP712CallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOzEIP712CallerSession struct {
	Contract *IOzEIP712Caller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts    // Call options to use throughout this session
}

// IOzEIP712TransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOzEIP712TransactorSession struct {
	Contract     *IOzEIP712Transactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts    // Transaction auth options to use throughout this session
}

// IOzEIP712Raw is an auto generated low-level Go binding around an Ethereum contract.
type IOzEIP712Raw struct {
	Contract *IOzEIP712 // Generic contract binding to access the raw methods on
}

// IOzEIP712CallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOzEIP712CallerRaw struct {
	Contract *IOzEIP712Caller // Generic read-only contract binding to access the raw methods on
}

// IOzEIP712TransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOzEIP712TransactorRaw struct {
	Contract *IOzEIP712Transactor // Generic write-only contract binding to access the raw methods on
}

// NewIOzEIP712 creates a new instance of IOzEIP712, bound to a specific deployed contract.
func NewIOzEIP712(address common.Address, backend bind.ContractBackend) (*IOzEIP712, error) {
	contract, err := bindIOzEIP712(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOzEIP712{IOzEIP712Caller: IOzEIP712Caller{contract: contract}, IOzEIP712Transactor: IOzEIP712Transactor{contract: contract}, IOzEIP712Filterer: IOzEIP712Filterer{contract: contract}}, nil
}

// NewIOzEIP712Caller creates a new read-only instance of IOzEIP712, bound to a specific deployed contract.
func NewIOzEIP712Caller(address common.Address, caller bind.ContractCaller) (*IOzEIP712Caller, error) {
	contract, err := bindIOzEIP712(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOzEIP712Caller{contract: contract}, nil
}

// NewIOzEIP712Transactor creates a new write-only instance of IOzEIP712, bound to a specific deployed contract.
func NewIOzEIP712Transactor(address common.Address, transactor bind.ContractTransactor) (*IOzEIP712Transactor, error) {
	contract, err := bindIOzEIP712(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOzEIP712Transactor{contract: contract}, nil
}

// NewIOzEIP712Filterer creates a new log filterer instance of IOzEIP712, bound to a specific deployed contract.
func NewIOzEIP712Filterer(address common.Address, filterer bind.ContractFilterer) (*IOzEIP712Filterer, error) {
	contract, err := bindIOzEIP712(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOzEIP712Filterer{contract: contract}, nil
}

// bindIOzEIP712 binds a generic wrapper to an already deployed contract.
func bindIOzEIP712(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOzEIP712MetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOzEIP712 *IOzEIP712Raw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOzEIP712.Contract.IOzEIP712Caller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOzEIP712 *IOzEIP712Raw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOzEIP712.Contract.IOzEIP712Transactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOzEIP712 *IOzEIP712Raw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOzEIP712.Contract.IOzEIP712Transactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOzEIP712 *IOzEIP712CallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOzEIP712.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOzEIP712 *IOzEIP712TransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOzEIP712.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOzEIP712 *IOzEIP712TransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOzEIP712.Contract.contract.Transact(opts, method, params...)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_IOzEIP712 *IOzEIP712Caller) Eip712Domain(opts *bind.CallOpts) (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	var out []interface{}
	err := _IOzEIP712.contract.Call(opts, &out, "eip712Domain")

	outstruct := new(struct {
		Fields            [1]byte
		Name              string
		Version           string
		ChainId           *big.Int
		VerifyingContract common.Address
		Salt              [32]byte
		Extensions        []*big.Int
	})
	if err != nil {
		return *outstruct, err
	}

	outstruct.Fields = *abi.ConvertType(out[0], new([1]byte)).(*[1]byte)
	outstruct.Name = *abi.ConvertType(out[1], new(string)).(*string)
	outstruct.Version = *abi.ConvertType(out[2], new(string)).(*string)
	outstruct.ChainId = *abi.ConvertType(out[3], new(*big.Int)).(**big.Int)
	outstruct.VerifyingContract = *abi.ConvertType(out[4], new(common.Address)).(*common.Address)
	outstruct.Salt = *abi.ConvertType(out[5], new([32]byte)).(*[32]byte)
	outstruct.Extensions = *abi.ConvertType(out[6], new([]*big.Int)).(*[]*big.Int)

	return *outstruct, err

}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_IOzEIP712 *IOzEIP712Session) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _IOzEIP712.Contract.Eip712Domain(&_IOzEIP712.CallOpts)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_IOzEIP712 *IOzEIP712CallerSession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _IOzEIP712.Contract.Eip712Domain(&_IOzEIP712.CallOpts)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_IOzEIP712 *IOzEIP712Caller) HashTypedDataV4(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _IOzEIP712.contract.Call(opts, &out, "hashTypedDataV4", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_IOzEIP712 *IOzEIP712Session) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _IOzEIP712.Contract.HashTypedDataV4(&_IOzEIP712.CallOpts, structHash)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_IOzEIP712 *IOzEIP712CallerSession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _IOzEIP712.Contract.HashTypedDataV4(&_IOzEIP712.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_IOzEIP712 *IOzEIP712Caller) HashTypedDataV4CrossChain(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _IOzEIP712.contract.Call(opts, &out, "hashTypedDataV4CrossChain", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_IOzEIP712 *IOzEIP712Session) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _IOzEIP712.Contract.HashTypedDataV4CrossChain(&_IOzEIP712.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_IOzEIP712 *IOzEIP712CallerSession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _IOzEIP712.Contract.HashTypedDataV4CrossChain(&_IOzEIP712.CallOpts, structHash)
}

// IOzEIP712EIP712DomainChangedIterator is returned from FilterEIP712DomainChanged and is used to iterate over the raw logs and unpacked data for EIP712DomainChanged events raised by the IOzEIP712 contract.
type IOzEIP712EIP712DomainChangedIterator struct {
	Event *IOzEIP712EIP712DomainChanged // Event containing the contract specifics and raw log

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
func (it *IOzEIP712EIP712DomainChangedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOzEIP712EIP712DomainChanged)
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
		it.Event = new(IOzEIP712EIP712DomainChanged)
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
func (it *IOzEIP712EIP712DomainChangedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOzEIP712EIP712DomainChangedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOzEIP712EIP712DomainChanged represents a EIP712DomainChanged event raised by the IOzEIP712 contract.
type IOzEIP712EIP712DomainChanged struct {
	Raw types.Log // Blockchain specific contextual infos
}

// FilterEIP712DomainChanged is a free log retrieval operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_IOzEIP712 *IOzEIP712Filterer) FilterEIP712DomainChanged(opts *bind.FilterOpts) (*IOzEIP712EIP712DomainChangedIterator, error) {

	logs, sub, err := _IOzEIP712.contract.FilterLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return &IOzEIP712EIP712DomainChangedIterator{contract: _IOzEIP712.contract, event: "EIP712DomainChanged", logs: logs, sub: sub}, nil
}

// WatchEIP712DomainChanged is a free log subscription operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_IOzEIP712 *IOzEIP712Filterer) WatchEIP712DomainChanged(opts *bind.WatchOpts, sink chan<- *IOzEIP712EIP712DomainChanged) (event.Subscription, error) {

	logs, sub, err := _IOzEIP712.contract.WatchLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOzEIP712EIP712DomainChanged)
				if err := _IOzEIP712.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
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

// ParseEIP712DomainChanged is a log parse operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_IOzEIP712 *IOzEIP712Filterer) ParseEIP712DomainChanged(log types.Log) (*IOzEIP712EIP712DomainChanged, error) {
	event := new(IOzEIP712EIP712DomainChanged)
	if err := _IOzEIP712.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOzEIP712InitEIP712Iterator is returned from FilterInitEIP712 and is used to iterate over the raw logs and unpacked data for InitEIP712 events raised by the IOzEIP712 contract.
type IOzEIP712InitEIP712Iterator struct {
	Event *IOzEIP712InitEIP712 // Event containing the contract specifics and raw log

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
func (it *IOzEIP712InitEIP712Iterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOzEIP712InitEIP712)
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
		it.Event = new(IOzEIP712InitEIP712)
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
func (it *IOzEIP712InitEIP712Iterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOzEIP712InitEIP712Iterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOzEIP712InitEIP712 represents a InitEIP712 event raised by the IOzEIP712 contract.
type IOzEIP712InitEIP712 struct {
	Name    string
	Version string
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitEIP712 is a free log retrieval operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_IOzEIP712 *IOzEIP712Filterer) FilterInitEIP712(opts *bind.FilterOpts) (*IOzEIP712InitEIP712Iterator, error) {

	logs, sub, err := _IOzEIP712.contract.FilterLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return &IOzEIP712InitEIP712Iterator{contract: _IOzEIP712.contract, event: "InitEIP712", logs: logs, sub: sub}, nil
}

// WatchInitEIP712 is a free log subscription operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_IOzEIP712 *IOzEIP712Filterer) WatchInitEIP712(opts *bind.WatchOpts, sink chan<- *IOzEIP712InitEIP712) (event.Subscription, error) {

	logs, sub, err := _IOzEIP712.contract.WatchLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOzEIP712InitEIP712)
				if err := _IOzEIP712.contract.UnpackLog(event, "InitEIP712", log); err != nil {
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

// ParseInitEIP712 is a log parse operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_IOzEIP712 *IOzEIP712Filterer) ParseInitEIP712(log types.Log) (*IOzEIP712InitEIP712, error) {
	event := new(IOzEIP712InitEIP712)
	if err := _IOzEIP712.contract.UnpackLog(event, "InitEIP712", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
