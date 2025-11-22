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

// IKeyRegistryKey is an auto generated low-level Go binding around an user-defined struct.
type IKeyRegistryKey struct {
	Tag     uint8
	Payload []byte
}

// IKeyRegistryOperatorWithKeys is an auto generated low-level Go binding around an user-defined struct.
type IKeyRegistryOperatorWithKeys struct {
	Operator common.Address
	Keys     []IKeyRegistryKey
}

// IKeyRegistryMetaData contains all meta data concerning the IKeyRegistry contract.
var IKeyRegistryMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getKey\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeyAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeys\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.OperatorWithKeys[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"keys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeys\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.OperatorWithKeys[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"keys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperatorsLength\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperator\",\"inputs\":[{\"name\":\"key\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setKey\",\"inputs\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"key\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"SetKey\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"indexed\":true,\"internalType\":\"uint8\"},{\"name\":\"key\",\"type\":\"bytes\",\"indexed\":true,\"internalType\":\"bytes\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"indexed\":false,\"internalType\":\"bytes\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"KeyRegistry_AlreadyUsed\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyRegistry_InvalidKeySignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyRegistry_InvalidKeyType\",\"inputs\":[]}]",
}

// IKeyRegistryABI is the input ABI used to generate the binding from.
// Deprecated: Use IKeyRegistryMetaData.ABI instead.
var IKeyRegistryABI = IKeyRegistryMetaData.ABI

// IKeyRegistry is an auto generated Go binding around an Ethereum contract.
type IKeyRegistry struct {
	IKeyRegistryCaller     // Read-only binding to the contract
	IKeyRegistryTransactor // Write-only binding to the contract
	IKeyRegistryFilterer   // Log filterer for contract events
}

// IKeyRegistryCaller is an auto generated read-only Go binding around an Ethereum contract.
type IKeyRegistryCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IKeyRegistryTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IKeyRegistryTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IKeyRegistryFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IKeyRegistryFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IKeyRegistrySession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IKeyRegistrySession struct {
	Contract     *IKeyRegistry     // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IKeyRegistryCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IKeyRegistryCallerSession struct {
	Contract *IKeyRegistryCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts       // Call options to use throughout this session
}

// IKeyRegistryTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IKeyRegistryTransactorSession struct {
	Contract     *IKeyRegistryTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts       // Transaction auth options to use throughout this session
}

// IKeyRegistryRaw is an auto generated low-level Go binding around an Ethereum contract.
type IKeyRegistryRaw struct {
	Contract *IKeyRegistry // Generic contract binding to access the raw methods on
}

// IKeyRegistryCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IKeyRegistryCallerRaw struct {
	Contract *IKeyRegistryCaller // Generic read-only contract binding to access the raw methods on
}

// IKeyRegistryTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IKeyRegistryTransactorRaw struct {
	Contract *IKeyRegistryTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIKeyRegistry creates a new instance of IKeyRegistry, bound to a specific deployed contract.
func NewIKeyRegistry(address common.Address, backend bind.ContractBackend) (*IKeyRegistry, error) {
	contract, err := bindIKeyRegistry(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IKeyRegistry{IKeyRegistryCaller: IKeyRegistryCaller{contract: contract}, IKeyRegistryTransactor: IKeyRegistryTransactor{contract: contract}, IKeyRegistryFilterer: IKeyRegistryFilterer{contract: contract}}, nil
}

// NewIKeyRegistryCaller creates a new read-only instance of IKeyRegistry, bound to a specific deployed contract.
func NewIKeyRegistryCaller(address common.Address, caller bind.ContractCaller) (*IKeyRegistryCaller, error) {
	contract, err := bindIKeyRegistry(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IKeyRegistryCaller{contract: contract}, nil
}

// NewIKeyRegistryTransactor creates a new write-only instance of IKeyRegistry, bound to a specific deployed contract.
func NewIKeyRegistryTransactor(address common.Address, transactor bind.ContractTransactor) (*IKeyRegistryTransactor, error) {
	contract, err := bindIKeyRegistry(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IKeyRegistryTransactor{contract: contract}, nil
}

// NewIKeyRegistryFilterer creates a new log filterer instance of IKeyRegistry, bound to a specific deployed contract.
func NewIKeyRegistryFilterer(address common.Address, filterer bind.ContractFilterer) (*IKeyRegistryFilterer, error) {
	contract, err := bindIKeyRegistry(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IKeyRegistryFilterer{contract: contract}, nil
}

// bindIKeyRegistry binds a generic wrapper to an already deployed contract.
func bindIKeyRegistry(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IKeyRegistryMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IKeyRegistry *IKeyRegistryRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IKeyRegistry.Contract.IKeyRegistryCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IKeyRegistry *IKeyRegistryRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IKeyRegistry.Contract.IKeyRegistryTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IKeyRegistry *IKeyRegistryRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IKeyRegistry.Contract.IKeyRegistryTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IKeyRegistry *IKeyRegistryCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IKeyRegistry.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IKeyRegistry *IKeyRegistryTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IKeyRegistry.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IKeyRegistry *IKeyRegistryTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IKeyRegistry.Contract.contract.Transact(opts, method, params...)
}

// GetKey is a free data retrieval call binding the contract method 0xb6e1a1e2.
//
// Solidity: function getKey(address operator, uint8 tag) view returns(bytes)
func (_IKeyRegistry *IKeyRegistryCaller) GetKey(opts *bind.CallOpts, operator common.Address, tag uint8) ([]byte, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKey", operator, tag)

	if err != nil {
		return *new([]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([]byte)).(*[]byte)

	return out0, err

}

// GetKey is a free data retrieval call binding the contract method 0xb6e1a1e2.
//
// Solidity: function getKey(address operator, uint8 tag) view returns(bytes)
func (_IKeyRegistry *IKeyRegistrySession) GetKey(operator common.Address, tag uint8) ([]byte, error) {
	return _IKeyRegistry.Contract.GetKey(&_IKeyRegistry.CallOpts, operator, tag)
}

// GetKey is a free data retrieval call binding the contract method 0xb6e1a1e2.
//
// Solidity: function getKey(address operator, uint8 tag) view returns(bytes)
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKey(operator common.Address, tag uint8) ([]byte, error) {
	return _IKeyRegistry.Contract.GetKey(&_IKeyRegistry.CallOpts, operator, tag)
}

// GetKeyAt is a free data retrieval call binding the contract method 0xb1dab20f.
//
// Solidity: function getKeyAt(address operator, uint8 tag, uint48 timestamp) view returns(bytes)
func (_IKeyRegistry *IKeyRegistryCaller) GetKeyAt(opts *bind.CallOpts, operator common.Address, tag uint8, timestamp *big.Int) ([]byte, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKeyAt", operator, tag, timestamp)

	if err != nil {
		return *new([]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([]byte)).(*[]byte)

	return out0, err

}

// GetKeyAt is a free data retrieval call binding the contract method 0xb1dab20f.
//
// Solidity: function getKeyAt(address operator, uint8 tag, uint48 timestamp) view returns(bytes)
func (_IKeyRegistry *IKeyRegistrySession) GetKeyAt(operator common.Address, tag uint8, timestamp *big.Int) ([]byte, error) {
	return _IKeyRegistry.Contract.GetKeyAt(&_IKeyRegistry.CallOpts, operator, tag, timestamp)
}

// GetKeyAt is a free data retrieval call binding the contract method 0xb1dab20f.
//
// Solidity: function getKeyAt(address operator, uint8 tag, uint48 timestamp) view returns(bytes)
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKeyAt(operator common.Address, tag uint8, timestamp *big.Int) ([]byte, error) {
	return _IKeyRegistry.Contract.GetKeyAt(&_IKeyRegistry.CallOpts, operator, tag, timestamp)
}

// GetKeys is a free data retrieval call binding the contract method 0x2150c518.
//
// Solidity: function getKeys() view returns((address,(uint8,bytes)[])[])
func (_IKeyRegistry *IKeyRegistryCaller) GetKeys(opts *bind.CallOpts) ([]IKeyRegistryOperatorWithKeys, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKeys")

	if err != nil {
		return *new([]IKeyRegistryOperatorWithKeys), err
	}

	out0 := *abi.ConvertType(out[0], new([]IKeyRegistryOperatorWithKeys)).(*[]IKeyRegistryOperatorWithKeys)

	return out0, err

}

// GetKeys is a free data retrieval call binding the contract method 0x2150c518.
//
// Solidity: function getKeys() view returns((address,(uint8,bytes)[])[])
func (_IKeyRegistry *IKeyRegistrySession) GetKeys() ([]IKeyRegistryOperatorWithKeys, error) {
	return _IKeyRegistry.Contract.GetKeys(&_IKeyRegistry.CallOpts)
}

// GetKeys is a free data retrieval call binding the contract method 0x2150c518.
//
// Solidity: function getKeys() view returns((address,(uint8,bytes)[])[])
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKeys() ([]IKeyRegistryOperatorWithKeys, error) {
	return _IKeyRegistry.Contract.GetKeys(&_IKeyRegistry.CallOpts)
}

// GetKeys0 is a free data retrieval call binding the contract method 0x34e80c34.
//
// Solidity: function getKeys(address operator) view returns((uint8,bytes)[])
func (_IKeyRegistry *IKeyRegistryCaller) GetKeys0(opts *bind.CallOpts, operator common.Address) ([]IKeyRegistryKey, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKeys0", operator)

	if err != nil {
		return *new([]IKeyRegistryKey), err
	}

	out0 := *abi.ConvertType(out[0], new([]IKeyRegistryKey)).(*[]IKeyRegistryKey)

	return out0, err

}

// GetKeys0 is a free data retrieval call binding the contract method 0x34e80c34.
//
// Solidity: function getKeys(address operator) view returns((uint8,bytes)[])
func (_IKeyRegistry *IKeyRegistrySession) GetKeys0(operator common.Address) ([]IKeyRegistryKey, error) {
	return _IKeyRegistry.Contract.GetKeys0(&_IKeyRegistry.CallOpts, operator)
}

// GetKeys0 is a free data retrieval call binding the contract method 0x34e80c34.
//
// Solidity: function getKeys(address operator) view returns((uint8,bytes)[])
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKeys0(operator common.Address) ([]IKeyRegistryKey, error) {
	return _IKeyRegistry.Contract.GetKeys0(&_IKeyRegistry.CallOpts, operator)
}

// GetKeysAt is a free data retrieval call binding the contract method 0x256d1be5.
//
// Solidity: function getKeysAt(uint48 timestamp) view returns((address,(uint8,bytes)[])[])
func (_IKeyRegistry *IKeyRegistryCaller) GetKeysAt(opts *bind.CallOpts, timestamp *big.Int) ([]IKeyRegistryOperatorWithKeys, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKeysAt", timestamp)

	if err != nil {
		return *new([]IKeyRegistryOperatorWithKeys), err
	}

	out0 := *abi.ConvertType(out[0], new([]IKeyRegistryOperatorWithKeys)).(*[]IKeyRegistryOperatorWithKeys)

	return out0, err

}

// GetKeysAt is a free data retrieval call binding the contract method 0x256d1be5.
//
// Solidity: function getKeysAt(uint48 timestamp) view returns((address,(uint8,bytes)[])[])
func (_IKeyRegistry *IKeyRegistrySession) GetKeysAt(timestamp *big.Int) ([]IKeyRegistryOperatorWithKeys, error) {
	return _IKeyRegistry.Contract.GetKeysAt(&_IKeyRegistry.CallOpts, timestamp)
}

// GetKeysAt is a free data retrieval call binding the contract method 0x256d1be5.
//
// Solidity: function getKeysAt(uint48 timestamp) view returns((address,(uint8,bytes)[])[])
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKeysAt(timestamp *big.Int) ([]IKeyRegistryOperatorWithKeys, error) {
	return _IKeyRegistry.Contract.GetKeysAt(&_IKeyRegistry.CallOpts, timestamp)
}

// GetKeysAt0 is a free data retrieval call binding the contract method 0x26cb1f1c.
//
// Solidity: function getKeysAt(address operator, uint48 timestamp) view returns((uint8,bytes)[])
func (_IKeyRegistry *IKeyRegistryCaller) GetKeysAt0(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]IKeyRegistryKey, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKeysAt0", operator, timestamp)

	if err != nil {
		return *new([]IKeyRegistryKey), err
	}

	out0 := *abi.ConvertType(out[0], new([]IKeyRegistryKey)).(*[]IKeyRegistryKey)

	return out0, err

}

// GetKeysAt0 is a free data retrieval call binding the contract method 0x26cb1f1c.
//
// Solidity: function getKeysAt(address operator, uint48 timestamp) view returns((uint8,bytes)[])
func (_IKeyRegistry *IKeyRegistrySession) GetKeysAt0(operator common.Address, timestamp *big.Int) ([]IKeyRegistryKey, error) {
	return _IKeyRegistry.Contract.GetKeysAt0(&_IKeyRegistry.CallOpts, operator, timestamp)
}

// GetKeysAt0 is a free data retrieval call binding the contract method 0x26cb1f1c.
//
// Solidity: function getKeysAt(address operator, uint48 timestamp) view returns((uint8,bytes)[])
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKeysAt0(operator common.Address, timestamp *big.Int) ([]IKeyRegistryKey, error) {
	return _IKeyRegistry.Contract.GetKeysAt0(&_IKeyRegistry.CallOpts, operator, timestamp)
}

// GetKeysOperators is a free data retrieval call binding the contract method 0x20d268de.
//
// Solidity: function getKeysOperators() view returns(address[])
func (_IKeyRegistry *IKeyRegistryCaller) GetKeysOperators(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKeysOperators")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetKeysOperators is a free data retrieval call binding the contract method 0x20d268de.
//
// Solidity: function getKeysOperators() view returns(address[])
func (_IKeyRegistry *IKeyRegistrySession) GetKeysOperators() ([]common.Address, error) {
	return _IKeyRegistry.Contract.GetKeysOperators(&_IKeyRegistry.CallOpts)
}

// GetKeysOperators is a free data retrieval call binding the contract method 0x20d268de.
//
// Solidity: function getKeysOperators() view returns(address[])
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKeysOperators() ([]common.Address, error) {
	return _IKeyRegistry.Contract.GetKeysOperators(&_IKeyRegistry.CallOpts)
}

// GetKeysOperatorsAt is a free data retrieval call binding the contract method 0xf493b5f3.
//
// Solidity: function getKeysOperatorsAt(uint48 timestamp) view returns(address[])
func (_IKeyRegistry *IKeyRegistryCaller) GetKeysOperatorsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKeysOperatorsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetKeysOperatorsAt is a free data retrieval call binding the contract method 0xf493b5f3.
//
// Solidity: function getKeysOperatorsAt(uint48 timestamp) view returns(address[])
func (_IKeyRegistry *IKeyRegistrySession) GetKeysOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IKeyRegistry.Contract.GetKeysOperatorsAt(&_IKeyRegistry.CallOpts, timestamp)
}

// GetKeysOperatorsAt is a free data retrieval call binding the contract method 0xf493b5f3.
//
// Solidity: function getKeysOperatorsAt(uint48 timestamp) view returns(address[])
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKeysOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IKeyRegistry.Contract.GetKeysOperatorsAt(&_IKeyRegistry.CallOpts, timestamp)
}

// GetKeysOperatorsLength is a free data retrieval call binding the contract method 0xd201ab93.
//
// Solidity: function getKeysOperatorsLength() view returns(uint256)
func (_IKeyRegistry *IKeyRegistryCaller) GetKeysOperatorsLength(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getKeysOperatorsLength")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetKeysOperatorsLength is a free data retrieval call binding the contract method 0xd201ab93.
//
// Solidity: function getKeysOperatorsLength() view returns(uint256)
func (_IKeyRegistry *IKeyRegistrySession) GetKeysOperatorsLength() (*big.Int, error) {
	return _IKeyRegistry.Contract.GetKeysOperatorsLength(&_IKeyRegistry.CallOpts)
}

// GetKeysOperatorsLength is a free data retrieval call binding the contract method 0xd201ab93.
//
// Solidity: function getKeysOperatorsLength() view returns(uint256)
func (_IKeyRegistry *IKeyRegistryCallerSession) GetKeysOperatorsLength() (*big.Int, error) {
	return _IKeyRegistry.Contract.GetKeysOperatorsLength(&_IKeyRegistry.CallOpts)
}

// GetOperator is a free data retrieval call binding the contract method 0x9eaffa96.
//
// Solidity: function getOperator(bytes key) view returns(address)
func (_IKeyRegistry *IKeyRegistryCaller) GetOperator(opts *bind.CallOpts, key []byte) (common.Address, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "getOperator", key)

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetOperator is a free data retrieval call binding the contract method 0x9eaffa96.
//
// Solidity: function getOperator(bytes key) view returns(address)
func (_IKeyRegistry *IKeyRegistrySession) GetOperator(key []byte) (common.Address, error) {
	return _IKeyRegistry.Contract.GetOperator(&_IKeyRegistry.CallOpts, key)
}

// GetOperator is a free data retrieval call binding the contract method 0x9eaffa96.
//
// Solidity: function getOperator(bytes key) view returns(address)
func (_IKeyRegistry *IKeyRegistryCallerSession) GetOperator(key []byte) (common.Address, error) {
	return _IKeyRegistry.Contract.GetOperator(&_IKeyRegistry.CallOpts, key)
}

// SetKey is a paid mutator transaction binding the contract method 0xc1ef9aca.
//
// Solidity: function setKey(uint8 tag, bytes key, bytes signature, bytes extraData) returns()
func (_IKeyRegistry *IKeyRegistryTransactor) SetKey(opts *bind.TransactOpts, tag uint8, key []byte, signature []byte, extraData []byte) (*types.Transaction, error) {
	return _IKeyRegistry.contract.Transact(opts, "setKey", tag, key, signature, extraData)
}

// SetKey is a paid mutator transaction binding the contract method 0xc1ef9aca.
//
// Solidity: function setKey(uint8 tag, bytes key, bytes signature, bytes extraData) returns()
func (_IKeyRegistry *IKeyRegistrySession) SetKey(tag uint8, key []byte, signature []byte, extraData []byte) (*types.Transaction, error) {
	return _IKeyRegistry.Contract.SetKey(&_IKeyRegistry.TransactOpts, tag, key, signature, extraData)
}

// SetKey is a paid mutator transaction binding the contract method 0xc1ef9aca.
//
// Solidity: function setKey(uint8 tag, bytes key, bytes signature, bytes extraData) returns()
func (_IKeyRegistry *IKeyRegistryTransactorSession) SetKey(tag uint8, key []byte, signature []byte, extraData []byte) (*types.Transaction, error) {
	return _IKeyRegistry.Contract.SetKey(&_IKeyRegistry.TransactOpts, tag, key, signature, extraData)
}

// IKeyRegistrySetKeyIterator is returned from FilterSetKey and is used to iterate over the raw logs and unpacked data for SetKey events raised by the IKeyRegistry contract.
type IKeyRegistrySetKeyIterator struct {
	Event *IKeyRegistrySetKey // Event containing the contract specifics and raw log

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
func (it *IKeyRegistrySetKeyIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IKeyRegistrySetKey)
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
		it.Event = new(IKeyRegistrySetKey)
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
func (it *IKeyRegistrySetKeyIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IKeyRegistrySetKeyIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IKeyRegistrySetKey represents a SetKey event raised by the IKeyRegistry contract.
type IKeyRegistrySetKey struct {
	Operator  common.Address
	Tag       uint8
	Key       common.Hash
	ExtraData []byte
	Raw       types.Log // Blockchain specific contextual infos
}

// FilterSetKey is a free log retrieval operation binding the contract event 0x980cfe4e76cbf6d3ba24c2161089e5e1b2f98e31821b6afdf5a4d596bee91fcd.
//
// Solidity: event SetKey(address indexed operator, uint8 indexed tag, bytes indexed key, bytes extraData)
func (_IKeyRegistry *IKeyRegistryFilterer) FilterSetKey(opts *bind.FilterOpts, operator []common.Address, tag []uint8, key [][]byte) (*IKeyRegistrySetKeyIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var tagRule []interface{}
	for _, tagItem := range tag {
		tagRule = append(tagRule, tagItem)
	}
	var keyRule []interface{}
	for _, keyItem := range key {
		keyRule = append(keyRule, keyItem)
	}

	logs, sub, err := _IKeyRegistry.contract.FilterLogs(opts, "SetKey", operatorRule, tagRule, keyRule)
	if err != nil {
		return nil, err
	}
	return &IKeyRegistrySetKeyIterator{contract: _IKeyRegistry.contract, event: "SetKey", logs: logs, sub: sub}, nil
}

// WatchSetKey is a free log subscription operation binding the contract event 0x980cfe4e76cbf6d3ba24c2161089e5e1b2f98e31821b6afdf5a4d596bee91fcd.
//
// Solidity: event SetKey(address indexed operator, uint8 indexed tag, bytes indexed key, bytes extraData)
func (_IKeyRegistry *IKeyRegistryFilterer) WatchSetKey(opts *bind.WatchOpts, sink chan<- *IKeyRegistrySetKey, operator []common.Address, tag []uint8, key [][]byte) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var tagRule []interface{}
	for _, tagItem := range tag {
		tagRule = append(tagRule, tagItem)
	}
	var keyRule []interface{}
	for _, keyItem := range key {
		keyRule = append(keyRule, keyItem)
	}

	logs, sub, err := _IKeyRegistry.contract.WatchLogs(opts, "SetKey", operatorRule, tagRule, keyRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IKeyRegistrySetKey)
				if err := _IKeyRegistry.contract.UnpackLog(event, "SetKey", log); err != nil {
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

// ParseSetKey is a log parse operation binding the contract event 0x980cfe4e76cbf6d3ba24c2161089e5e1b2f98e31821b6afdf5a4d596bee91fcd.
//
// Solidity: event SetKey(address indexed operator, uint8 indexed tag, bytes indexed key, bytes extraData)
func (_IKeyRegistry *IKeyRegistryFilterer) ParseSetKey(log types.Log) (*IKeyRegistrySetKey, error) {
	event := new(IKeyRegistrySetKey)
	if err := _IKeyRegistry.contract.UnpackLog(event, "SetKey", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
