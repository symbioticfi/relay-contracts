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
	ABI: "[{\"type\":\"function\",\"name\":\"eip712Domain\",\"inputs\":[],\"outputs\":[{\"name\":\"fields\",\"type\":\"bytes1\",\"internalType\":\"bytes1\"},{\"name\":\"name\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"salt\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"extensions\",\"type\":\"uint256[]\",\"internalType\":\"uint256[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKey\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeyAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeys\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.OperatorWithKeys[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"keys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeys\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.OperatorWithKeys[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"keys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperatorsLength\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperator\",\"inputs\":[{\"name\":\"key\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4CrossChain\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setKey\",\"inputs\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"key\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"EIP712DomainChanged\",\"inputs\":[],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitEIP712\",\"inputs\":[{\"name\":\"name\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetKey\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"indexed\":true,\"internalType\":\"uint8\"},{\"name\":\"key\",\"type\":\"bytes\",\"indexed\":true,\"internalType\":\"bytes\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"indexed\":false,\"internalType\":\"bytes\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"KeyRegistry_AlreadyUsed\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyRegistry_InvalidKeySignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyRegistry_InvalidKeyType\",\"inputs\":[]}]",
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

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_IKeyRegistry *IKeyRegistryCaller) Eip712Domain(opts *bind.CallOpts) (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "eip712Domain")

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
func (_IKeyRegistry *IKeyRegistrySession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _IKeyRegistry.Contract.Eip712Domain(&_IKeyRegistry.CallOpts)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_IKeyRegistry *IKeyRegistryCallerSession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _IKeyRegistry.Contract.Eip712Domain(&_IKeyRegistry.CallOpts)
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

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_IKeyRegistry *IKeyRegistryCaller) HashTypedDataV4(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "hashTypedDataV4", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_IKeyRegistry *IKeyRegistrySession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _IKeyRegistry.Contract.HashTypedDataV4(&_IKeyRegistry.CallOpts, structHash)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_IKeyRegistry *IKeyRegistryCallerSession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _IKeyRegistry.Contract.HashTypedDataV4(&_IKeyRegistry.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_IKeyRegistry *IKeyRegistryCaller) HashTypedDataV4CrossChain(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _IKeyRegistry.contract.Call(opts, &out, "hashTypedDataV4CrossChain", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_IKeyRegistry *IKeyRegistrySession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _IKeyRegistry.Contract.HashTypedDataV4CrossChain(&_IKeyRegistry.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_IKeyRegistry *IKeyRegistryCallerSession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _IKeyRegistry.Contract.HashTypedDataV4CrossChain(&_IKeyRegistry.CallOpts, structHash)
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

// IKeyRegistryEIP712DomainChangedIterator is returned from FilterEIP712DomainChanged and is used to iterate over the raw logs and unpacked data for EIP712DomainChanged events raised by the IKeyRegistry contract.
type IKeyRegistryEIP712DomainChangedIterator struct {
	Event *IKeyRegistryEIP712DomainChanged // Event containing the contract specifics and raw log

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
func (it *IKeyRegistryEIP712DomainChangedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IKeyRegistryEIP712DomainChanged)
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
		it.Event = new(IKeyRegistryEIP712DomainChanged)
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
func (it *IKeyRegistryEIP712DomainChangedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IKeyRegistryEIP712DomainChangedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IKeyRegistryEIP712DomainChanged represents a EIP712DomainChanged event raised by the IKeyRegistry contract.
type IKeyRegistryEIP712DomainChanged struct {
	Raw types.Log // Blockchain specific contextual infos
}

// FilterEIP712DomainChanged is a free log retrieval operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_IKeyRegistry *IKeyRegistryFilterer) FilterEIP712DomainChanged(opts *bind.FilterOpts) (*IKeyRegistryEIP712DomainChangedIterator, error) {

	logs, sub, err := _IKeyRegistry.contract.FilterLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return &IKeyRegistryEIP712DomainChangedIterator{contract: _IKeyRegistry.contract, event: "EIP712DomainChanged", logs: logs, sub: sub}, nil
}

// WatchEIP712DomainChanged is a free log subscription operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_IKeyRegistry *IKeyRegistryFilterer) WatchEIP712DomainChanged(opts *bind.WatchOpts, sink chan<- *IKeyRegistryEIP712DomainChanged) (event.Subscription, error) {

	logs, sub, err := _IKeyRegistry.contract.WatchLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IKeyRegistryEIP712DomainChanged)
				if err := _IKeyRegistry.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
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
func (_IKeyRegistry *IKeyRegistryFilterer) ParseEIP712DomainChanged(log types.Log) (*IKeyRegistryEIP712DomainChanged, error) {
	event := new(IKeyRegistryEIP712DomainChanged)
	if err := _IKeyRegistry.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IKeyRegistryInitEIP712Iterator is returned from FilterInitEIP712 and is used to iterate over the raw logs and unpacked data for InitEIP712 events raised by the IKeyRegistry contract.
type IKeyRegistryInitEIP712Iterator struct {
	Event *IKeyRegistryInitEIP712 // Event containing the contract specifics and raw log

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
func (it *IKeyRegistryInitEIP712Iterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IKeyRegistryInitEIP712)
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
		it.Event = new(IKeyRegistryInitEIP712)
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
func (it *IKeyRegistryInitEIP712Iterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IKeyRegistryInitEIP712Iterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IKeyRegistryInitEIP712 represents a InitEIP712 event raised by the IKeyRegistry contract.
type IKeyRegistryInitEIP712 struct {
	Name    string
	Version string
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitEIP712 is a free log retrieval operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_IKeyRegistry *IKeyRegistryFilterer) FilterInitEIP712(opts *bind.FilterOpts) (*IKeyRegistryInitEIP712Iterator, error) {

	logs, sub, err := _IKeyRegistry.contract.FilterLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return &IKeyRegistryInitEIP712Iterator{contract: _IKeyRegistry.contract, event: "InitEIP712", logs: logs, sub: sub}, nil
}

// WatchInitEIP712 is a free log subscription operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_IKeyRegistry *IKeyRegistryFilterer) WatchInitEIP712(opts *bind.WatchOpts, sink chan<- *IKeyRegistryInitEIP712) (event.Subscription, error) {

	logs, sub, err := _IKeyRegistry.contract.WatchLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IKeyRegistryInitEIP712)
				if err := _IKeyRegistry.contract.UnpackLog(event, "InitEIP712", log); err != nil {
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
func (_IKeyRegistry *IKeyRegistryFilterer) ParseInitEIP712(log types.Log) (*IKeyRegistryInitEIP712, error) {
	event := new(IKeyRegistryInitEIP712)
	if err := _IKeyRegistry.contract.UnpackLog(event, "InitEIP712", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
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
