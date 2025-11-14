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

// IKeyRegistryKeyRegistryInitParams is an auto generated low-level Go binding around an user-defined struct.
type IKeyRegistryKeyRegistryInitParams struct {
	OzEip712InitParams IOzEIP712OzEIP712InitParams
}

// IKeyRegistryOperatorWithKeys is an auto generated low-level Go binding around an user-defined struct.
type IKeyRegistryOperatorWithKeys struct {
	Operator common.Address
	Keys     []IKeyRegistryKey
}

// IOzEIP712OzEIP712InitParams is an auto generated low-level Go binding around an user-defined struct.
type IOzEIP712OzEIP712InitParams struct {
	Name    string
	Version string
}

// KeyRegistryMetaData contains all meta data concerning the KeyRegistry contract.
var KeyRegistryMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"__KeyRegistry_init\",\"inputs\":[{\"name\":\"keyRegistryInitParams\",\"type\":\"tuple\",\"internalType\":\"structIKeyRegistry.KeyRegistryInitParams\",\"components\":[{\"name\":\"ozEip712InitParams\",\"type\":\"tuple\",\"internalType\":\"structIOzEIP712.OzEIP712InitParams\",\"components\":[{\"name\":\"name\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"internalType\":\"string\"}]}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"eip712Domain\",\"inputs\":[],\"outputs\":[{\"name\":\"fields\",\"type\":\"bytes1\",\"internalType\":\"bytes1\"},{\"name\":\"name\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"salt\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"extensions\",\"type\":\"uint256[]\",\"internalType\":\"uint256[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKey\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeyAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeys\",\"inputs\":[],\"outputs\":[{\"name\":\"operatorsKeys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.OperatorWithKeys[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"keys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeys\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"keys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"operatorsKeys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.OperatorWithKeys[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"keys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"keys\",\"type\":\"tuple[]\",\"internalType\":\"structIKeyRegistry.Key[]\",\"components\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"payload\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysOperatorsLength\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperator\",\"inputs\":[{\"name\":\"key\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4CrossChain\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"multicall\",\"inputs\":[{\"name\":\"data\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"results\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setKey\",\"inputs\":[{\"name\":\"tag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"key\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"EIP712DomainChanged\",\"inputs\":[],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitEIP712\",\"inputs\":[{\"name\":\"name\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetKey\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"tag\",\"type\":\"uint8\",\"indexed\":true,\"internalType\":\"uint8\"},{\"name\":\"key\",\"type\":\"bytes\",\"indexed\":true,\"internalType\":\"bytes\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"indexed\":false,\"internalType\":\"bytes\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"AddressEmptyCode\",\"inputs\":[{\"name\":\"target\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"type\":\"error\",\"name\":\"CheckpointUnorderedInsertion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"FailedCall\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidDSTLength\",\"inputs\":[{\"name\":\"\",\"type\":\"bytes\",\"internalType\":\"bytes\"}]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidKeyTag\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyBlsBls12381_InvalidBytes\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyBlsBls12381_InvalidKey\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyBlsBn254_InvalidBytes\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyBlsBn254_InvalidKey\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyEcdsaSecp256k1_InvalidBytes\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyRegistry_AlreadyUsed\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyRegistry_InvalidKeySignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"KeyRegistry_InvalidKeyType\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigBlsBls12381_InvalidMessageLength\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigBlsBn254_InvalidMessageLength\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigEcdsaSecp256k1_InvalidMessageLength\",\"inputs\":[]}]",
}

// KeyRegistryABI is the input ABI used to generate the binding from.
// Deprecated: Use KeyRegistryMetaData.ABI instead.
var KeyRegistryABI = KeyRegistryMetaData.ABI

// KeyRegistry is an auto generated Go binding around an Ethereum contract.
type KeyRegistry struct {
	KeyRegistryCaller     // Read-only binding to the contract
	KeyRegistryTransactor // Write-only binding to the contract
	KeyRegistryFilterer   // Log filterer for contract events
}

// KeyRegistryCaller is an auto generated read-only Go binding around an Ethereum contract.
type KeyRegistryCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// KeyRegistryTransactor is an auto generated write-only Go binding around an Ethereum contract.
type KeyRegistryTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// KeyRegistryFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type KeyRegistryFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// KeyRegistrySession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type KeyRegistrySession struct {
	Contract     *KeyRegistry      // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// KeyRegistryCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type KeyRegistryCallerSession struct {
	Contract *KeyRegistryCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts      // Call options to use throughout this session
}

// KeyRegistryTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type KeyRegistryTransactorSession struct {
	Contract     *KeyRegistryTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts      // Transaction auth options to use throughout this session
}

// KeyRegistryRaw is an auto generated low-level Go binding around an Ethereum contract.
type KeyRegistryRaw struct {
	Contract *KeyRegistry // Generic contract binding to access the raw methods on
}

// KeyRegistryCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type KeyRegistryCallerRaw struct {
	Contract *KeyRegistryCaller // Generic read-only contract binding to access the raw methods on
}

// KeyRegistryTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type KeyRegistryTransactorRaw struct {
	Contract *KeyRegistryTransactor // Generic write-only contract binding to access the raw methods on
}

// NewKeyRegistry creates a new instance of KeyRegistry, bound to a specific deployed contract.
func NewKeyRegistry(address common.Address, backend bind.ContractBackend) (*KeyRegistry, error) {
	contract, err := bindKeyRegistry(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &KeyRegistry{KeyRegistryCaller: KeyRegistryCaller{contract: contract}, KeyRegistryTransactor: KeyRegistryTransactor{contract: contract}, KeyRegistryFilterer: KeyRegistryFilterer{contract: contract}}, nil
}

// NewKeyRegistryCaller creates a new read-only instance of KeyRegistry, bound to a specific deployed contract.
func NewKeyRegistryCaller(address common.Address, caller bind.ContractCaller) (*KeyRegistryCaller, error) {
	contract, err := bindKeyRegistry(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &KeyRegistryCaller{contract: contract}, nil
}

// NewKeyRegistryTransactor creates a new write-only instance of KeyRegistry, bound to a specific deployed contract.
func NewKeyRegistryTransactor(address common.Address, transactor bind.ContractTransactor) (*KeyRegistryTransactor, error) {
	contract, err := bindKeyRegistry(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &KeyRegistryTransactor{contract: contract}, nil
}

// NewKeyRegistryFilterer creates a new log filterer instance of KeyRegistry, bound to a specific deployed contract.
func NewKeyRegistryFilterer(address common.Address, filterer bind.ContractFilterer) (*KeyRegistryFilterer, error) {
	contract, err := bindKeyRegistry(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &KeyRegistryFilterer{contract: contract}, nil
}

// bindKeyRegistry binds a generic wrapper to an already deployed contract.
func bindKeyRegistry(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := KeyRegistryMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_KeyRegistry *KeyRegistryRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _KeyRegistry.Contract.KeyRegistryCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_KeyRegistry *KeyRegistryRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _KeyRegistry.Contract.KeyRegistryTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_KeyRegistry *KeyRegistryRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _KeyRegistry.Contract.KeyRegistryTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_KeyRegistry *KeyRegistryCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _KeyRegistry.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_KeyRegistry *KeyRegistryTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _KeyRegistry.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_KeyRegistry *KeyRegistryTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _KeyRegistry.Contract.contract.Transact(opts, method, params...)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_KeyRegistry *KeyRegistryCaller) Eip712Domain(opts *bind.CallOpts) (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "eip712Domain")

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
func (_KeyRegistry *KeyRegistrySession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _KeyRegistry.Contract.Eip712Domain(&_KeyRegistry.CallOpts)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_KeyRegistry *KeyRegistryCallerSession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _KeyRegistry.Contract.Eip712Domain(&_KeyRegistry.CallOpts)
}

// GetKey is a free data retrieval call binding the contract method 0xb6e1a1e2.
//
// Solidity: function getKey(address operator, uint8 tag) view returns(bytes)
func (_KeyRegistry *KeyRegistryCaller) GetKey(opts *bind.CallOpts, operator common.Address, tag uint8) ([]byte, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKey", operator, tag)

	if err != nil {
		return *new([]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([]byte)).(*[]byte)

	return out0, err

}

// GetKey is a free data retrieval call binding the contract method 0xb6e1a1e2.
//
// Solidity: function getKey(address operator, uint8 tag) view returns(bytes)
func (_KeyRegistry *KeyRegistrySession) GetKey(operator common.Address, tag uint8) ([]byte, error) {
	return _KeyRegistry.Contract.GetKey(&_KeyRegistry.CallOpts, operator, tag)
}

// GetKey is a free data retrieval call binding the contract method 0xb6e1a1e2.
//
// Solidity: function getKey(address operator, uint8 tag) view returns(bytes)
func (_KeyRegistry *KeyRegistryCallerSession) GetKey(operator common.Address, tag uint8) ([]byte, error) {
	return _KeyRegistry.Contract.GetKey(&_KeyRegistry.CallOpts, operator, tag)
}

// GetKeyAt is a free data retrieval call binding the contract method 0xb1dab20f.
//
// Solidity: function getKeyAt(address operator, uint8 tag, uint48 timestamp) view returns(bytes)
func (_KeyRegistry *KeyRegistryCaller) GetKeyAt(opts *bind.CallOpts, operator common.Address, tag uint8, timestamp *big.Int) ([]byte, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKeyAt", operator, tag, timestamp)

	if err != nil {
		return *new([]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([]byte)).(*[]byte)

	return out0, err

}

// GetKeyAt is a free data retrieval call binding the contract method 0xb1dab20f.
//
// Solidity: function getKeyAt(address operator, uint8 tag, uint48 timestamp) view returns(bytes)
func (_KeyRegistry *KeyRegistrySession) GetKeyAt(operator common.Address, tag uint8, timestamp *big.Int) ([]byte, error) {
	return _KeyRegistry.Contract.GetKeyAt(&_KeyRegistry.CallOpts, operator, tag, timestamp)
}

// GetKeyAt is a free data retrieval call binding the contract method 0xb1dab20f.
//
// Solidity: function getKeyAt(address operator, uint8 tag, uint48 timestamp) view returns(bytes)
func (_KeyRegistry *KeyRegistryCallerSession) GetKeyAt(operator common.Address, tag uint8, timestamp *big.Int) ([]byte, error) {
	return _KeyRegistry.Contract.GetKeyAt(&_KeyRegistry.CallOpts, operator, tag, timestamp)
}

// GetKeys is a free data retrieval call binding the contract method 0x2150c518.
//
// Solidity: function getKeys() view returns((address,(uint8,bytes)[])[] operatorsKeys)
func (_KeyRegistry *KeyRegistryCaller) GetKeys(opts *bind.CallOpts) ([]IKeyRegistryOperatorWithKeys, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKeys")

	if err != nil {
		return *new([]IKeyRegistryOperatorWithKeys), err
	}

	out0 := *abi.ConvertType(out[0], new([]IKeyRegistryOperatorWithKeys)).(*[]IKeyRegistryOperatorWithKeys)

	return out0, err

}

// GetKeys is a free data retrieval call binding the contract method 0x2150c518.
//
// Solidity: function getKeys() view returns((address,(uint8,bytes)[])[] operatorsKeys)
func (_KeyRegistry *KeyRegistrySession) GetKeys() ([]IKeyRegistryOperatorWithKeys, error) {
	return _KeyRegistry.Contract.GetKeys(&_KeyRegistry.CallOpts)
}

// GetKeys is a free data retrieval call binding the contract method 0x2150c518.
//
// Solidity: function getKeys() view returns((address,(uint8,bytes)[])[] operatorsKeys)
func (_KeyRegistry *KeyRegistryCallerSession) GetKeys() ([]IKeyRegistryOperatorWithKeys, error) {
	return _KeyRegistry.Contract.GetKeys(&_KeyRegistry.CallOpts)
}

// GetKeys0 is a free data retrieval call binding the contract method 0x34e80c34.
//
// Solidity: function getKeys(address operator) view returns((uint8,bytes)[] keys)
func (_KeyRegistry *KeyRegistryCaller) GetKeys0(opts *bind.CallOpts, operator common.Address) ([]IKeyRegistryKey, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKeys0", operator)

	if err != nil {
		return *new([]IKeyRegistryKey), err
	}

	out0 := *abi.ConvertType(out[0], new([]IKeyRegistryKey)).(*[]IKeyRegistryKey)

	return out0, err

}

// GetKeys0 is a free data retrieval call binding the contract method 0x34e80c34.
//
// Solidity: function getKeys(address operator) view returns((uint8,bytes)[] keys)
func (_KeyRegistry *KeyRegistrySession) GetKeys0(operator common.Address) ([]IKeyRegistryKey, error) {
	return _KeyRegistry.Contract.GetKeys0(&_KeyRegistry.CallOpts, operator)
}

// GetKeys0 is a free data retrieval call binding the contract method 0x34e80c34.
//
// Solidity: function getKeys(address operator) view returns((uint8,bytes)[] keys)
func (_KeyRegistry *KeyRegistryCallerSession) GetKeys0(operator common.Address) ([]IKeyRegistryKey, error) {
	return _KeyRegistry.Contract.GetKeys0(&_KeyRegistry.CallOpts, operator)
}

// GetKeysAt is a free data retrieval call binding the contract method 0x256d1be5.
//
// Solidity: function getKeysAt(uint48 timestamp) view returns((address,(uint8,bytes)[])[] operatorsKeys)
func (_KeyRegistry *KeyRegistryCaller) GetKeysAt(opts *bind.CallOpts, timestamp *big.Int) ([]IKeyRegistryOperatorWithKeys, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKeysAt", timestamp)

	if err != nil {
		return *new([]IKeyRegistryOperatorWithKeys), err
	}

	out0 := *abi.ConvertType(out[0], new([]IKeyRegistryOperatorWithKeys)).(*[]IKeyRegistryOperatorWithKeys)

	return out0, err

}

// GetKeysAt is a free data retrieval call binding the contract method 0x256d1be5.
//
// Solidity: function getKeysAt(uint48 timestamp) view returns((address,(uint8,bytes)[])[] operatorsKeys)
func (_KeyRegistry *KeyRegistrySession) GetKeysAt(timestamp *big.Int) ([]IKeyRegistryOperatorWithKeys, error) {
	return _KeyRegistry.Contract.GetKeysAt(&_KeyRegistry.CallOpts, timestamp)
}

// GetKeysAt is a free data retrieval call binding the contract method 0x256d1be5.
//
// Solidity: function getKeysAt(uint48 timestamp) view returns((address,(uint8,bytes)[])[] operatorsKeys)
func (_KeyRegistry *KeyRegistryCallerSession) GetKeysAt(timestamp *big.Int) ([]IKeyRegistryOperatorWithKeys, error) {
	return _KeyRegistry.Contract.GetKeysAt(&_KeyRegistry.CallOpts, timestamp)
}

// GetKeysAt0 is a free data retrieval call binding the contract method 0x26cb1f1c.
//
// Solidity: function getKeysAt(address operator, uint48 timestamp) view returns((uint8,bytes)[] keys)
func (_KeyRegistry *KeyRegistryCaller) GetKeysAt0(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]IKeyRegistryKey, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKeysAt0", operator, timestamp)

	if err != nil {
		return *new([]IKeyRegistryKey), err
	}

	out0 := *abi.ConvertType(out[0], new([]IKeyRegistryKey)).(*[]IKeyRegistryKey)

	return out0, err

}

// GetKeysAt0 is a free data retrieval call binding the contract method 0x26cb1f1c.
//
// Solidity: function getKeysAt(address operator, uint48 timestamp) view returns((uint8,bytes)[] keys)
func (_KeyRegistry *KeyRegistrySession) GetKeysAt0(operator common.Address, timestamp *big.Int) ([]IKeyRegistryKey, error) {
	return _KeyRegistry.Contract.GetKeysAt0(&_KeyRegistry.CallOpts, operator, timestamp)
}

// GetKeysAt0 is a free data retrieval call binding the contract method 0x26cb1f1c.
//
// Solidity: function getKeysAt(address operator, uint48 timestamp) view returns((uint8,bytes)[] keys)
func (_KeyRegistry *KeyRegistryCallerSession) GetKeysAt0(operator common.Address, timestamp *big.Int) ([]IKeyRegistryKey, error) {
	return _KeyRegistry.Contract.GetKeysAt0(&_KeyRegistry.CallOpts, operator, timestamp)
}

// GetKeysOperators is a free data retrieval call binding the contract method 0x20d268de.
//
// Solidity: function getKeysOperators() view returns(address[])
func (_KeyRegistry *KeyRegistryCaller) GetKeysOperators(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKeysOperators")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetKeysOperators is a free data retrieval call binding the contract method 0x20d268de.
//
// Solidity: function getKeysOperators() view returns(address[])
func (_KeyRegistry *KeyRegistrySession) GetKeysOperators() ([]common.Address, error) {
	return _KeyRegistry.Contract.GetKeysOperators(&_KeyRegistry.CallOpts)
}

// GetKeysOperators is a free data retrieval call binding the contract method 0x20d268de.
//
// Solidity: function getKeysOperators() view returns(address[])
func (_KeyRegistry *KeyRegistryCallerSession) GetKeysOperators() ([]common.Address, error) {
	return _KeyRegistry.Contract.GetKeysOperators(&_KeyRegistry.CallOpts)
}

// GetKeysOperatorsAt is a free data retrieval call binding the contract method 0xf493b5f3.
//
// Solidity: function getKeysOperatorsAt(uint48 timestamp) view returns(address[])
func (_KeyRegistry *KeyRegistryCaller) GetKeysOperatorsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKeysOperatorsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetKeysOperatorsAt is a free data retrieval call binding the contract method 0xf493b5f3.
//
// Solidity: function getKeysOperatorsAt(uint48 timestamp) view returns(address[])
func (_KeyRegistry *KeyRegistrySession) GetKeysOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _KeyRegistry.Contract.GetKeysOperatorsAt(&_KeyRegistry.CallOpts, timestamp)
}

// GetKeysOperatorsAt is a free data retrieval call binding the contract method 0xf493b5f3.
//
// Solidity: function getKeysOperatorsAt(uint48 timestamp) view returns(address[])
func (_KeyRegistry *KeyRegistryCallerSession) GetKeysOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _KeyRegistry.Contract.GetKeysOperatorsAt(&_KeyRegistry.CallOpts, timestamp)
}

// GetKeysOperatorsLength is a free data retrieval call binding the contract method 0xd201ab93.
//
// Solidity: function getKeysOperatorsLength() view returns(uint256)
func (_KeyRegistry *KeyRegistryCaller) GetKeysOperatorsLength(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getKeysOperatorsLength")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetKeysOperatorsLength is a free data retrieval call binding the contract method 0xd201ab93.
//
// Solidity: function getKeysOperatorsLength() view returns(uint256)
func (_KeyRegistry *KeyRegistrySession) GetKeysOperatorsLength() (*big.Int, error) {
	return _KeyRegistry.Contract.GetKeysOperatorsLength(&_KeyRegistry.CallOpts)
}

// GetKeysOperatorsLength is a free data retrieval call binding the contract method 0xd201ab93.
//
// Solidity: function getKeysOperatorsLength() view returns(uint256)
func (_KeyRegistry *KeyRegistryCallerSession) GetKeysOperatorsLength() (*big.Int, error) {
	return _KeyRegistry.Contract.GetKeysOperatorsLength(&_KeyRegistry.CallOpts)
}

// GetOperator is a free data retrieval call binding the contract method 0x9eaffa96.
//
// Solidity: function getOperator(bytes key) view returns(address)
func (_KeyRegistry *KeyRegistryCaller) GetOperator(opts *bind.CallOpts, key []byte) (common.Address, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "getOperator", key)

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetOperator is a free data retrieval call binding the contract method 0x9eaffa96.
//
// Solidity: function getOperator(bytes key) view returns(address)
func (_KeyRegistry *KeyRegistrySession) GetOperator(key []byte) (common.Address, error) {
	return _KeyRegistry.Contract.GetOperator(&_KeyRegistry.CallOpts, key)
}

// GetOperator is a free data retrieval call binding the contract method 0x9eaffa96.
//
// Solidity: function getOperator(bytes key) view returns(address)
func (_KeyRegistry *KeyRegistryCallerSession) GetOperator(key []byte) (common.Address, error) {
	return _KeyRegistry.Contract.GetOperator(&_KeyRegistry.CallOpts, key)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_KeyRegistry *KeyRegistryCaller) HashTypedDataV4(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "hashTypedDataV4", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_KeyRegistry *KeyRegistrySession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _KeyRegistry.Contract.HashTypedDataV4(&_KeyRegistry.CallOpts, structHash)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_KeyRegistry *KeyRegistryCallerSession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _KeyRegistry.Contract.HashTypedDataV4(&_KeyRegistry.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_KeyRegistry *KeyRegistryCaller) HashTypedDataV4CrossChain(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _KeyRegistry.contract.Call(opts, &out, "hashTypedDataV4CrossChain", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_KeyRegistry *KeyRegistrySession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _KeyRegistry.Contract.HashTypedDataV4CrossChain(&_KeyRegistry.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_KeyRegistry *KeyRegistryCallerSession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _KeyRegistry.Contract.HashTypedDataV4CrossChain(&_KeyRegistry.CallOpts, structHash)
}

// KeyRegistryInit is a paid mutator transaction binding the contract method 0x529e712d.
//
// Solidity: function __KeyRegistry_init(((string,string)) keyRegistryInitParams) returns()
func (_KeyRegistry *KeyRegistryTransactor) KeyRegistryInit(opts *bind.TransactOpts, keyRegistryInitParams IKeyRegistryKeyRegistryInitParams) (*types.Transaction, error) {
	return _KeyRegistry.contract.Transact(opts, "__KeyRegistry_init", keyRegistryInitParams)
}

// KeyRegistryInit is a paid mutator transaction binding the contract method 0x529e712d.
//
// Solidity: function __KeyRegistry_init(((string,string)) keyRegistryInitParams) returns()
func (_KeyRegistry *KeyRegistrySession) KeyRegistryInit(keyRegistryInitParams IKeyRegistryKeyRegistryInitParams) (*types.Transaction, error) {
	return _KeyRegistry.Contract.KeyRegistryInit(&_KeyRegistry.TransactOpts, keyRegistryInitParams)
}

// KeyRegistryInit is a paid mutator transaction binding the contract method 0x529e712d.
//
// Solidity: function __KeyRegistry_init(((string,string)) keyRegistryInitParams) returns()
func (_KeyRegistry *KeyRegistryTransactorSession) KeyRegistryInit(keyRegistryInitParams IKeyRegistryKeyRegistryInitParams) (*types.Transaction, error) {
	return _KeyRegistry.Contract.KeyRegistryInit(&_KeyRegistry.TransactOpts, keyRegistryInitParams)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_KeyRegistry *KeyRegistryTransactor) Multicall(opts *bind.TransactOpts, data [][]byte) (*types.Transaction, error) {
	return _KeyRegistry.contract.Transact(opts, "multicall", data)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_KeyRegistry *KeyRegistrySession) Multicall(data [][]byte) (*types.Transaction, error) {
	return _KeyRegistry.Contract.Multicall(&_KeyRegistry.TransactOpts, data)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_KeyRegistry *KeyRegistryTransactorSession) Multicall(data [][]byte) (*types.Transaction, error) {
	return _KeyRegistry.Contract.Multicall(&_KeyRegistry.TransactOpts, data)
}

// SetKey is a paid mutator transaction binding the contract method 0xc1ef9aca.
//
// Solidity: function setKey(uint8 tag, bytes key, bytes signature, bytes extraData) returns()
func (_KeyRegistry *KeyRegistryTransactor) SetKey(opts *bind.TransactOpts, tag uint8, key []byte, signature []byte, extraData []byte) (*types.Transaction, error) {
	return _KeyRegistry.contract.Transact(opts, "setKey", tag, key, signature, extraData)
}

// SetKey is a paid mutator transaction binding the contract method 0xc1ef9aca.
//
// Solidity: function setKey(uint8 tag, bytes key, bytes signature, bytes extraData) returns()
func (_KeyRegistry *KeyRegistrySession) SetKey(tag uint8, key []byte, signature []byte, extraData []byte) (*types.Transaction, error) {
	return _KeyRegistry.Contract.SetKey(&_KeyRegistry.TransactOpts, tag, key, signature, extraData)
}

// SetKey is a paid mutator transaction binding the contract method 0xc1ef9aca.
//
// Solidity: function setKey(uint8 tag, bytes key, bytes signature, bytes extraData) returns()
func (_KeyRegistry *KeyRegistryTransactorSession) SetKey(tag uint8, key []byte, signature []byte, extraData []byte) (*types.Transaction, error) {
	return _KeyRegistry.Contract.SetKey(&_KeyRegistry.TransactOpts, tag, key, signature, extraData)
}

// KeyRegistryEIP712DomainChangedIterator is returned from FilterEIP712DomainChanged and is used to iterate over the raw logs and unpacked data for EIP712DomainChanged events raised by the KeyRegistry contract.
type KeyRegistryEIP712DomainChangedIterator struct {
	Event *KeyRegistryEIP712DomainChanged // Event containing the contract specifics and raw log

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
func (it *KeyRegistryEIP712DomainChangedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(KeyRegistryEIP712DomainChanged)
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
		it.Event = new(KeyRegistryEIP712DomainChanged)
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
func (it *KeyRegistryEIP712DomainChangedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *KeyRegistryEIP712DomainChangedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// KeyRegistryEIP712DomainChanged represents a EIP712DomainChanged event raised by the KeyRegistry contract.
type KeyRegistryEIP712DomainChanged struct {
	Raw types.Log // Blockchain specific contextual infos
}

// FilterEIP712DomainChanged is a free log retrieval operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_KeyRegistry *KeyRegistryFilterer) FilterEIP712DomainChanged(opts *bind.FilterOpts) (*KeyRegistryEIP712DomainChangedIterator, error) {

	logs, sub, err := _KeyRegistry.contract.FilterLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return &KeyRegistryEIP712DomainChangedIterator{contract: _KeyRegistry.contract, event: "EIP712DomainChanged", logs: logs, sub: sub}, nil
}

// WatchEIP712DomainChanged is a free log subscription operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_KeyRegistry *KeyRegistryFilterer) WatchEIP712DomainChanged(opts *bind.WatchOpts, sink chan<- *KeyRegistryEIP712DomainChanged) (event.Subscription, error) {

	logs, sub, err := _KeyRegistry.contract.WatchLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(KeyRegistryEIP712DomainChanged)
				if err := _KeyRegistry.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
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
func (_KeyRegistry *KeyRegistryFilterer) ParseEIP712DomainChanged(log types.Log) (*KeyRegistryEIP712DomainChanged, error) {
	event := new(KeyRegistryEIP712DomainChanged)
	if err := _KeyRegistry.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// KeyRegistryInitEIP712Iterator is returned from FilterInitEIP712 and is used to iterate over the raw logs and unpacked data for InitEIP712 events raised by the KeyRegistry contract.
type KeyRegistryInitEIP712Iterator struct {
	Event *KeyRegistryInitEIP712 // Event containing the contract specifics and raw log

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
func (it *KeyRegistryInitEIP712Iterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(KeyRegistryInitEIP712)
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
		it.Event = new(KeyRegistryInitEIP712)
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
func (it *KeyRegistryInitEIP712Iterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *KeyRegistryInitEIP712Iterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// KeyRegistryInitEIP712 represents a InitEIP712 event raised by the KeyRegistry contract.
type KeyRegistryInitEIP712 struct {
	Name    string
	Version string
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitEIP712 is a free log retrieval operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_KeyRegistry *KeyRegistryFilterer) FilterInitEIP712(opts *bind.FilterOpts) (*KeyRegistryInitEIP712Iterator, error) {

	logs, sub, err := _KeyRegistry.contract.FilterLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return &KeyRegistryInitEIP712Iterator{contract: _KeyRegistry.contract, event: "InitEIP712", logs: logs, sub: sub}, nil
}

// WatchInitEIP712 is a free log subscription operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_KeyRegistry *KeyRegistryFilterer) WatchInitEIP712(opts *bind.WatchOpts, sink chan<- *KeyRegistryInitEIP712) (event.Subscription, error) {

	logs, sub, err := _KeyRegistry.contract.WatchLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(KeyRegistryInitEIP712)
				if err := _KeyRegistry.contract.UnpackLog(event, "InitEIP712", log); err != nil {
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
func (_KeyRegistry *KeyRegistryFilterer) ParseInitEIP712(log types.Log) (*KeyRegistryInitEIP712, error) {
	event := new(KeyRegistryInitEIP712)
	if err := _KeyRegistry.contract.UnpackLog(event, "InitEIP712", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// KeyRegistryInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the KeyRegistry contract.
type KeyRegistryInitializedIterator struct {
	Event *KeyRegistryInitialized // Event containing the contract specifics and raw log

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
func (it *KeyRegistryInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(KeyRegistryInitialized)
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
		it.Event = new(KeyRegistryInitialized)
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
func (it *KeyRegistryInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *KeyRegistryInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// KeyRegistryInitialized represents a Initialized event raised by the KeyRegistry contract.
type KeyRegistryInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_KeyRegistry *KeyRegistryFilterer) FilterInitialized(opts *bind.FilterOpts) (*KeyRegistryInitializedIterator, error) {

	logs, sub, err := _KeyRegistry.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &KeyRegistryInitializedIterator{contract: _KeyRegistry.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_KeyRegistry *KeyRegistryFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *KeyRegistryInitialized) (event.Subscription, error) {

	logs, sub, err := _KeyRegistry.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(KeyRegistryInitialized)
				if err := _KeyRegistry.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_KeyRegistry *KeyRegistryFilterer) ParseInitialized(log types.Log) (*KeyRegistryInitialized, error) {
	event := new(KeyRegistryInitialized)
	if err := _KeyRegistry.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// KeyRegistrySetKeyIterator is returned from FilterSetKey and is used to iterate over the raw logs and unpacked data for SetKey events raised by the KeyRegistry contract.
type KeyRegistrySetKeyIterator struct {
	Event *KeyRegistrySetKey // Event containing the contract specifics and raw log

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
func (it *KeyRegistrySetKeyIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(KeyRegistrySetKey)
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
		it.Event = new(KeyRegistrySetKey)
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
func (it *KeyRegistrySetKeyIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *KeyRegistrySetKeyIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// KeyRegistrySetKey represents a SetKey event raised by the KeyRegistry contract.
type KeyRegistrySetKey struct {
	Operator  common.Address
	Tag       uint8
	Key       common.Hash
	ExtraData []byte
	Raw       types.Log // Blockchain specific contextual infos
}

// FilterSetKey is a free log retrieval operation binding the contract event 0x980cfe4e76cbf6d3ba24c2161089e5e1b2f98e31821b6afdf5a4d596bee91fcd.
//
// Solidity: event SetKey(address indexed operator, uint8 indexed tag, bytes indexed key, bytes extraData)
func (_KeyRegistry *KeyRegistryFilterer) FilterSetKey(opts *bind.FilterOpts, operator []common.Address, tag []uint8, key [][]byte) (*KeyRegistrySetKeyIterator, error) {

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

	logs, sub, err := _KeyRegistry.contract.FilterLogs(opts, "SetKey", operatorRule, tagRule, keyRule)
	if err != nil {
		return nil, err
	}
	return &KeyRegistrySetKeyIterator{contract: _KeyRegistry.contract, event: "SetKey", logs: logs, sub: sub}, nil
}

// WatchSetKey is a free log subscription operation binding the contract event 0x980cfe4e76cbf6d3ba24c2161089e5e1b2f98e31821b6afdf5a4d596bee91fcd.
//
// Solidity: event SetKey(address indexed operator, uint8 indexed tag, bytes indexed key, bytes extraData)
func (_KeyRegistry *KeyRegistryFilterer) WatchSetKey(opts *bind.WatchOpts, sink chan<- *KeyRegistrySetKey, operator []common.Address, tag []uint8, key [][]byte) (event.Subscription, error) {

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

	logs, sub, err := _KeyRegistry.contract.WatchLogs(opts, "SetKey", operatorRule, tagRule, keyRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(KeyRegistrySetKey)
				if err := _KeyRegistry.contract.UnpackLog(event, "SetKey", log); err != nil {
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
func (_KeyRegistry *KeyRegistryFilterer) ParseSetKey(log types.Log) (*KeyRegistrySetKey, error) {
	event := new(KeyRegistrySetKey)
	if err := _KeyRegistry.contract.UnpackLog(event, "SetKey", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
