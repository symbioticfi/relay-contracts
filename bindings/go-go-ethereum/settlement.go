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

// ISettlementExtraData is an auto generated low-level Go binding around an user-defined struct.
type ISettlementExtraData struct {
	Key   [32]byte
	Value [32]byte
}

// ISettlementValSetHeader is an auto generated low-level Go binding around an user-defined struct.
type ISettlementValSetHeader struct {
	Version            uint8
	RequiredKeyTag     uint8
	Epoch              *big.Int
	CaptureTimestamp   *big.Int
	QuorumThreshold    *big.Int
	TotalVotingPower   *big.Int
	ValidatorsSszMRoot [32]byte
}

// SettlementMetaData contains all meta data concerning the Settlement contract.
var SettlementMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"NETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK_IDENTIFIER\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint96\",\"internalType\":\"uint96\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VALIDATOR_SET_VERSION\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"commitValSetHeader\",\"inputs\":[{\"name\":\"header\",\"type\":\"tuple\",\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"extraData\",\"type\":\"tuple[]\",\"internalType\":\"structISettlement.ExtraData[]\",\"components\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"value\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"eip712Domain\",\"inputs\":[],\"outputs\":[{\"name\":\"fields\",\"type\":\"bytes1\",\"internalType\":\"bytes1\"},{\"name\":\"name\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"internalType\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"salt\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"extensions\",\"type\":\"uint256[]\",\"internalType\":\"uint256[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCaptureTimestampFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCaptureTimestampFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getExtraData\",\"inputs\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getExtraDataAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getLastCommittedHeaderEpoch\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getQuorumThresholdFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getQuorumThresholdFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredKeyTagFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredKeyTagFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSigVerifier\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSigVerifierAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTotalVotingPowerFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTotalVotingPowerFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"header\",\"type\":\"tuple\",\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValSetHeaderHash\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValSetHeaderHashAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValidatorsSszMRootFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValidatorsSszMRootFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVersionFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVersionFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"hashTypedDataV4CrossChain\",\"inputs\":[{\"name\":\"structHash\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isValSetHeaderCommittedAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setGenesis\",\"inputs\":[{\"name\":\"valSetHeader\",\"type\":\"tuple\",\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"extraData\",\"type\":\"tuple[]\",\"internalType\":\"structISettlement.ExtraData[]\",\"components\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"value\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setSigVerifier\",\"inputs\":[{\"name\":\"sigVerifier\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"staticDelegateCall\",\"inputs\":[{\"name\":\"target\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"data\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"verifyQuorumSig\",\"inputs\":[{\"name\":\"message\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"verifyQuorumSigAt\",\"inputs\":[{\"name\":\"message\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"CommitValSetHeader\",\"inputs\":[{\"name\":\"valSetHeader\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"extraData\",\"type\":\"tuple[]\",\"indexed\":false,\"internalType\":\"structISettlement.ExtraData[]\",\"components\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"value\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"EIP712DomainChanged\",\"inputs\":[],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitEIP712\",\"inputs\":[{\"name\":\"name\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"},{\"name\":\"version\",\"type\":\"string\",\"indexed\":false,\"internalType\":\"string\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitSigVerifier\",\"inputs\":[{\"name\":\"sigVerifier\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitSubnetwork\",\"inputs\":[{\"name\":\"network\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"},{\"name\":\"subnetworkId\",\"type\":\"uint96\",\"indexed\":false,\"internalType\":\"uint96\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetGenesis\",\"inputs\":[{\"name\":\"valSetHeader\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"extraData\",\"type\":\"tuple[]\",\"indexed\":false,\"internalType\":\"structISettlement.ExtraData[]\",\"components\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"value\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSigVerifier\",\"inputs\":[{\"name\":\"sigVerifier\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"CheckpointUnorderedInsertion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidKeyTag\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NetworkManager_InvalidNetwork\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_DuplicateExtraDataKey\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidCaptureTimestamp\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidEpoch\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidSigVerifier\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidValidatorsSszMRoot\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidVersion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_QuorumThresholdGtTotalVotingPower\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_ValSetHeaderAlreadyCommitted\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_VerificationFailed\",\"inputs\":[]}]",
}

// SettlementABI is the input ABI used to generate the binding from.
// Deprecated: Use SettlementMetaData.ABI instead.
var SettlementABI = SettlementMetaData.ABI

// Settlement is an auto generated Go binding around an Ethereum contract.
type Settlement struct {
	SettlementCaller     // Read-only binding to the contract
	SettlementTransactor // Write-only binding to the contract
	SettlementFilterer   // Log filterer for contract events
}

// SettlementCaller is an auto generated read-only Go binding around an Ethereum contract.
type SettlementCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// SettlementTransactor is an auto generated write-only Go binding around an Ethereum contract.
type SettlementTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// SettlementFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type SettlementFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// SettlementSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type SettlementSession struct {
	Contract     *Settlement       // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// SettlementCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type SettlementCallerSession struct {
	Contract *SettlementCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts     // Call options to use throughout this session
}

// SettlementTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type SettlementTransactorSession struct {
	Contract     *SettlementTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts     // Transaction auth options to use throughout this session
}

// SettlementRaw is an auto generated low-level Go binding around an Ethereum contract.
type SettlementRaw struct {
	Contract *Settlement // Generic contract binding to access the raw methods on
}

// SettlementCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type SettlementCallerRaw struct {
	Contract *SettlementCaller // Generic read-only contract binding to access the raw methods on
}

// SettlementTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type SettlementTransactorRaw struct {
	Contract *SettlementTransactor // Generic write-only contract binding to access the raw methods on
}

// NewSettlement creates a new instance of Settlement, bound to a specific deployed contract.
func NewSettlement(address common.Address, backend bind.ContractBackend) (*Settlement, error) {
	contract, err := bindSettlement(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &Settlement{SettlementCaller: SettlementCaller{contract: contract}, SettlementTransactor: SettlementTransactor{contract: contract}, SettlementFilterer: SettlementFilterer{contract: contract}}, nil
}

// NewSettlementCaller creates a new read-only instance of Settlement, bound to a specific deployed contract.
func NewSettlementCaller(address common.Address, caller bind.ContractCaller) (*SettlementCaller, error) {
	contract, err := bindSettlement(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &SettlementCaller{contract: contract}, nil
}

// NewSettlementTransactor creates a new write-only instance of Settlement, bound to a specific deployed contract.
func NewSettlementTransactor(address common.Address, transactor bind.ContractTransactor) (*SettlementTransactor, error) {
	contract, err := bindSettlement(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &SettlementTransactor{contract: contract}, nil
}

// NewSettlementFilterer creates a new log filterer instance of Settlement, bound to a specific deployed contract.
func NewSettlementFilterer(address common.Address, filterer bind.ContractFilterer) (*SettlementFilterer, error) {
	contract, err := bindSettlement(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &SettlementFilterer{contract: contract}, nil
}

// bindSettlement binds a generic wrapper to an already deployed contract.
func bindSettlement(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := SettlementMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_Settlement *SettlementRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _Settlement.Contract.SettlementCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_Settlement *SettlementRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _Settlement.Contract.SettlementTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_Settlement *SettlementRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _Settlement.Contract.SettlementTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_Settlement *SettlementCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _Settlement.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_Settlement *SettlementTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _Settlement.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_Settlement *SettlementTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _Settlement.Contract.contract.Transact(opts, method, params...)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_Settlement *SettlementCaller) NETWORK(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "NETWORK")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_Settlement *SettlementSession) NETWORK() (common.Address, error) {
	return _Settlement.Contract.NETWORK(&_Settlement.CallOpts)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_Settlement *SettlementCallerSession) NETWORK() (common.Address, error) {
	return _Settlement.Contract.NETWORK(&_Settlement.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_Settlement *SettlementCaller) SUBNETWORK(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "SUBNETWORK")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_Settlement *SettlementSession) SUBNETWORK() ([32]byte, error) {
	return _Settlement.Contract.SUBNETWORK(&_Settlement.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_Settlement *SettlementCallerSession) SUBNETWORK() ([32]byte, error) {
	return _Settlement.Contract.SUBNETWORK(&_Settlement.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_Settlement *SettlementCaller) SUBNETWORKIDENTIFIER(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "SUBNETWORK_IDENTIFIER")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_Settlement *SettlementSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _Settlement.Contract.SUBNETWORKIDENTIFIER(&_Settlement.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_Settlement *SettlementCallerSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _Settlement.Contract.SUBNETWORKIDENTIFIER(&_Settlement.CallOpts)
}

// VALIDATORSETVERSION is a free data retrieval call binding the contract method 0x321d7b8d.
//
// Solidity: function VALIDATOR_SET_VERSION() view returns(uint8)
func (_Settlement *SettlementCaller) VALIDATORSETVERSION(opts *bind.CallOpts) (uint8, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "VALIDATOR_SET_VERSION")

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// VALIDATORSETVERSION is a free data retrieval call binding the contract method 0x321d7b8d.
//
// Solidity: function VALIDATOR_SET_VERSION() view returns(uint8)
func (_Settlement *SettlementSession) VALIDATORSETVERSION() (uint8, error) {
	return _Settlement.Contract.VALIDATORSETVERSION(&_Settlement.CallOpts)
}

// VALIDATORSETVERSION is a free data retrieval call binding the contract method 0x321d7b8d.
//
// Solidity: function VALIDATOR_SET_VERSION() view returns(uint8)
func (_Settlement *SettlementCallerSession) VALIDATORSETVERSION() (uint8, error) {
	return _Settlement.Contract.VALIDATORSETVERSION(&_Settlement.CallOpts)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_Settlement *SettlementCaller) Eip712Domain(opts *bind.CallOpts) (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "eip712Domain")

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
func (_Settlement *SettlementSession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _Settlement.Contract.Eip712Domain(&_Settlement.CallOpts)
}

// Eip712Domain is a free data retrieval call binding the contract method 0x84b0196e.
//
// Solidity: function eip712Domain() view returns(bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
func (_Settlement *SettlementCallerSession) Eip712Domain() (struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              [32]byte
	Extensions        []*big.Int
}, error) {
	return _Settlement.Contract.Eip712Domain(&_Settlement.CallOpts)
}

// GetCaptureTimestampFromValSetHeader is a free data retrieval call binding the contract method 0xf4935d39.
//
// Solidity: function getCaptureTimestampFromValSetHeader() view returns(uint48)
func (_Settlement *SettlementCaller) GetCaptureTimestampFromValSetHeader(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getCaptureTimestampFromValSetHeader")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCaptureTimestampFromValSetHeader is a free data retrieval call binding the contract method 0xf4935d39.
//
// Solidity: function getCaptureTimestampFromValSetHeader() view returns(uint48)
func (_Settlement *SettlementSession) GetCaptureTimestampFromValSetHeader() (*big.Int, error) {
	return _Settlement.Contract.GetCaptureTimestampFromValSetHeader(&_Settlement.CallOpts)
}

// GetCaptureTimestampFromValSetHeader is a free data retrieval call binding the contract method 0xf4935d39.
//
// Solidity: function getCaptureTimestampFromValSetHeader() view returns(uint48)
func (_Settlement *SettlementCallerSession) GetCaptureTimestampFromValSetHeader() (*big.Int, error) {
	return _Settlement.Contract.GetCaptureTimestampFromValSetHeader(&_Settlement.CallOpts)
}

// GetCaptureTimestampFromValSetHeaderAt is a free data retrieval call binding the contract method 0x5485b549.
//
// Solidity: function getCaptureTimestampFromValSetHeaderAt(uint48 epoch) view returns(uint48)
func (_Settlement *SettlementCaller) GetCaptureTimestampFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getCaptureTimestampFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCaptureTimestampFromValSetHeaderAt is a free data retrieval call binding the contract method 0x5485b549.
//
// Solidity: function getCaptureTimestampFromValSetHeaderAt(uint48 epoch) view returns(uint48)
func (_Settlement *SettlementSession) GetCaptureTimestampFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _Settlement.Contract.GetCaptureTimestampFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetCaptureTimestampFromValSetHeaderAt is a free data retrieval call binding the contract method 0x5485b549.
//
// Solidity: function getCaptureTimestampFromValSetHeaderAt(uint48 epoch) view returns(uint48)
func (_Settlement *SettlementCallerSession) GetCaptureTimestampFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _Settlement.Contract.GetCaptureTimestampFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetExtraData is a free data retrieval call binding the contract method 0xecae6344.
//
// Solidity: function getExtraData(bytes32 key) view returns(bytes32)
func (_Settlement *SettlementCaller) GetExtraData(opts *bind.CallOpts, key [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getExtraData", key)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetExtraData is a free data retrieval call binding the contract method 0xecae6344.
//
// Solidity: function getExtraData(bytes32 key) view returns(bytes32)
func (_Settlement *SettlementSession) GetExtraData(key [32]byte) ([32]byte, error) {
	return _Settlement.Contract.GetExtraData(&_Settlement.CallOpts, key)
}

// GetExtraData is a free data retrieval call binding the contract method 0xecae6344.
//
// Solidity: function getExtraData(bytes32 key) view returns(bytes32)
func (_Settlement *SettlementCallerSession) GetExtraData(key [32]byte) ([32]byte, error) {
	return _Settlement.Contract.GetExtraData(&_Settlement.CallOpts, key)
}

// GetExtraDataAt is a free data retrieval call binding the contract method 0x52bb038a.
//
// Solidity: function getExtraDataAt(uint48 epoch, bytes32 key) view returns(bytes32)
func (_Settlement *SettlementCaller) GetExtraDataAt(opts *bind.CallOpts, epoch *big.Int, key [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getExtraDataAt", epoch, key)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetExtraDataAt is a free data retrieval call binding the contract method 0x52bb038a.
//
// Solidity: function getExtraDataAt(uint48 epoch, bytes32 key) view returns(bytes32)
func (_Settlement *SettlementSession) GetExtraDataAt(epoch *big.Int, key [32]byte) ([32]byte, error) {
	return _Settlement.Contract.GetExtraDataAt(&_Settlement.CallOpts, epoch, key)
}

// GetExtraDataAt is a free data retrieval call binding the contract method 0x52bb038a.
//
// Solidity: function getExtraDataAt(uint48 epoch, bytes32 key) view returns(bytes32)
func (_Settlement *SettlementCallerSession) GetExtraDataAt(epoch *big.Int, key [32]byte) ([32]byte, error) {
	return _Settlement.Contract.GetExtraDataAt(&_Settlement.CallOpts, epoch, key)
}

// GetLastCommittedHeaderEpoch is a free data retrieval call binding the contract method 0x65b0849b.
//
// Solidity: function getLastCommittedHeaderEpoch() view returns(uint48)
func (_Settlement *SettlementCaller) GetLastCommittedHeaderEpoch(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getLastCommittedHeaderEpoch")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetLastCommittedHeaderEpoch is a free data retrieval call binding the contract method 0x65b0849b.
//
// Solidity: function getLastCommittedHeaderEpoch() view returns(uint48)
func (_Settlement *SettlementSession) GetLastCommittedHeaderEpoch() (*big.Int, error) {
	return _Settlement.Contract.GetLastCommittedHeaderEpoch(&_Settlement.CallOpts)
}

// GetLastCommittedHeaderEpoch is a free data retrieval call binding the contract method 0x65b0849b.
//
// Solidity: function getLastCommittedHeaderEpoch() view returns(uint48)
func (_Settlement *SettlementCallerSession) GetLastCommittedHeaderEpoch() (*big.Int, error) {
	return _Settlement.Contract.GetLastCommittedHeaderEpoch(&_Settlement.CallOpts)
}

// GetQuorumThresholdFromValSetHeader is a free data retrieval call binding the contract method 0xe586b38e.
//
// Solidity: function getQuorumThresholdFromValSetHeader() view returns(uint256)
func (_Settlement *SettlementCaller) GetQuorumThresholdFromValSetHeader(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getQuorumThresholdFromValSetHeader")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetQuorumThresholdFromValSetHeader is a free data retrieval call binding the contract method 0xe586b38e.
//
// Solidity: function getQuorumThresholdFromValSetHeader() view returns(uint256)
func (_Settlement *SettlementSession) GetQuorumThresholdFromValSetHeader() (*big.Int, error) {
	return _Settlement.Contract.GetQuorumThresholdFromValSetHeader(&_Settlement.CallOpts)
}

// GetQuorumThresholdFromValSetHeader is a free data retrieval call binding the contract method 0xe586b38e.
//
// Solidity: function getQuorumThresholdFromValSetHeader() view returns(uint256)
func (_Settlement *SettlementCallerSession) GetQuorumThresholdFromValSetHeader() (*big.Int, error) {
	return _Settlement.Contract.GetQuorumThresholdFromValSetHeader(&_Settlement.CallOpts)
}

// GetQuorumThresholdFromValSetHeaderAt is a free data retrieval call binding the contract method 0x1d86bd88.
//
// Solidity: function getQuorumThresholdFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_Settlement *SettlementCaller) GetQuorumThresholdFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getQuorumThresholdFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetQuorumThresholdFromValSetHeaderAt is a free data retrieval call binding the contract method 0x1d86bd88.
//
// Solidity: function getQuorumThresholdFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_Settlement *SettlementSession) GetQuorumThresholdFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _Settlement.Contract.GetQuorumThresholdFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetQuorumThresholdFromValSetHeaderAt is a free data retrieval call binding the contract method 0x1d86bd88.
//
// Solidity: function getQuorumThresholdFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_Settlement *SettlementCallerSession) GetQuorumThresholdFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _Settlement.Contract.GetQuorumThresholdFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetRequiredKeyTagFromValSetHeader is a free data retrieval call binding the contract method 0xb91a434a.
//
// Solidity: function getRequiredKeyTagFromValSetHeader() view returns(uint8)
func (_Settlement *SettlementCaller) GetRequiredKeyTagFromValSetHeader(opts *bind.CallOpts) (uint8, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getRequiredKeyTagFromValSetHeader")

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetRequiredKeyTagFromValSetHeader is a free data retrieval call binding the contract method 0xb91a434a.
//
// Solidity: function getRequiredKeyTagFromValSetHeader() view returns(uint8)
func (_Settlement *SettlementSession) GetRequiredKeyTagFromValSetHeader() (uint8, error) {
	return _Settlement.Contract.GetRequiredKeyTagFromValSetHeader(&_Settlement.CallOpts)
}

// GetRequiredKeyTagFromValSetHeader is a free data retrieval call binding the contract method 0xb91a434a.
//
// Solidity: function getRequiredKeyTagFromValSetHeader() view returns(uint8)
func (_Settlement *SettlementCallerSession) GetRequiredKeyTagFromValSetHeader() (uint8, error) {
	return _Settlement.Contract.GetRequiredKeyTagFromValSetHeader(&_Settlement.CallOpts)
}

// GetRequiredKeyTagFromValSetHeaderAt is a free data retrieval call binding the contract method 0xe4378ed2.
//
// Solidity: function getRequiredKeyTagFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_Settlement *SettlementCaller) GetRequiredKeyTagFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (uint8, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getRequiredKeyTagFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetRequiredKeyTagFromValSetHeaderAt is a free data retrieval call binding the contract method 0xe4378ed2.
//
// Solidity: function getRequiredKeyTagFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_Settlement *SettlementSession) GetRequiredKeyTagFromValSetHeaderAt(epoch *big.Int) (uint8, error) {
	return _Settlement.Contract.GetRequiredKeyTagFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetRequiredKeyTagFromValSetHeaderAt is a free data retrieval call binding the contract method 0xe4378ed2.
//
// Solidity: function getRequiredKeyTagFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_Settlement *SettlementCallerSession) GetRequiredKeyTagFromValSetHeaderAt(epoch *big.Int) (uint8, error) {
	return _Settlement.Contract.GetRequiredKeyTagFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetSigVerifier is a free data retrieval call binding the contract method 0x5b28556d.
//
// Solidity: function getSigVerifier() view returns(address)
func (_Settlement *SettlementCaller) GetSigVerifier(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getSigVerifier")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetSigVerifier is a free data retrieval call binding the contract method 0x5b28556d.
//
// Solidity: function getSigVerifier() view returns(address)
func (_Settlement *SettlementSession) GetSigVerifier() (common.Address, error) {
	return _Settlement.Contract.GetSigVerifier(&_Settlement.CallOpts)
}

// GetSigVerifier is a free data retrieval call binding the contract method 0x5b28556d.
//
// Solidity: function getSigVerifier() view returns(address)
func (_Settlement *SettlementCallerSession) GetSigVerifier() (common.Address, error) {
	return _Settlement.Contract.GetSigVerifier(&_Settlement.CallOpts)
}

// GetSigVerifierAt is a free data retrieval call binding the contract method 0xa54ce263.
//
// Solidity: function getSigVerifierAt(uint48 epoch, bytes hint) view returns(address)
func (_Settlement *SettlementCaller) GetSigVerifierAt(opts *bind.CallOpts, epoch *big.Int, hint []byte) (common.Address, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getSigVerifierAt", epoch, hint)

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetSigVerifierAt is a free data retrieval call binding the contract method 0xa54ce263.
//
// Solidity: function getSigVerifierAt(uint48 epoch, bytes hint) view returns(address)
func (_Settlement *SettlementSession) GetSigVerifierAt(epoch *big.Int, hint []byte) (common.Address, error) {
	return _Settlement.Contract.GetSigVerifierAt(&_Settlement.CallOpts, epoch, hint)
}

// GetSigVerifierAt is a free data retrieval call binding the contract method 0xa54ce263.
//
// Solidity: function getSigVerifierAt(uint48 epoch, bytes hint) view returns(address)
func (_Settlement *SettlementCallerSession) GetSigVerifierAt(epoch *big.Int, hint []byte) (common.Address, error) {
	return _Settlement.Contract.GetSigVerifierAt(&_Settlement.CallOpts, epoch, hint)
}

// GetTotalVotingPowerFromValSetHeader is a free data retrieval call binding the contract method 0xc38de37f.
//
// Solidity: function getTotalVotingPowerFromValSetHeader() view returns(uint256)
func (_Settlement *SettlementCaller) GetTotalVotingPowerFromValSetHeader(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getTotalVotingPowerFromValSetHeader")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTotalVotingPowerFromValSetHeader is a free data retrieval call binding the contract method 0xc38de37f.
//
// Solidity: function getTotalVotingPowerFromValSetHeader() view returns(uint256)
func (_Settlement *SettlementSession) GetTotalVotingPowerFromValSetHeader() (*big.Int, error) {
	return _Settlement.Contract.GetTotalVotingPowerFromValSetHeader(&_Settlement.CallOpts)
}

// GetTotalVotingPowerFromValSetHeader is a free data retrieval call binding the contract method 0xc38de37f.
//
// Solidity: function getTotalVotingPowerFromValSetHeader() view returns(uint256)
func (_Settlement *SettlementCallerSession) GetTotalVotingPowerFromValSetHeader() (*big.Int, error) {
	return _Settlement.Contract.GetTotalVotingPowerFromValSetHeader(&_Settlement.CallOpts)
}

// GetTotalVotingPowerFromValSetHeaderAt is a free data retrieval call binding the contract method 0xf7e5b491.
//
// Solidity: function getTotalVotingPowerFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_Settlement *SettlementCaller) GetTotalVotingPowerFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getTotalVotingPowerFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTotalVotingPowerFromValSetHeaderAt is a free data retrieval call binding the contract method 0xf7e5b491.
//
// Solidity: function getTotalVotingPowerFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_Settlement *SettlementSession) GetTotalVotingPowerFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _Settlement.Contract.GetTotalVotingPowerFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetTotalVotingPowerFromValSetHeaderAt is a free data retrieval call binding the contract method 0xf7e5b491.
//
// Solidity: function getTotalVotingPowerFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_Settlement *SettlementCallerSession) GetTotalVotingPowerFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _Settlement.Contract.GetTotalVotingPowerFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetValSetHeader is a free data retrieval call binding the contract method 0xadc91fc8.
//
// Solidity: function getValSetHeader() view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header)
func (_Settlement *SettlementCaller) GetValSetHeader(opts *bind.CallOpts) (ISettlementValSetHeader, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getValSetHeader")

	if err != nil {
		return *new(ISettlementValSetHeader), err
	}

	out0 := *abi.ConvertType(out[0], new(ISettlementValSetHeader)).(*ISettlementValSetHeader)

	return out0, err

}

// GetValSetHeader is a free data retrieval call binding the contract method 0xadc91fc8.
//
// Solidity: function getValSetHeader() view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header)
func (_Settlement *SettlementSession) GetValSetHeader() (ISettlementValSetHeader, error) {
	return _Settlement.Contract.GetValSetHeader(&_Settlement.CallOpts)
}

// GetValSetHeader is a free data retrieval call binding the contract method 0xadc91fc8.
//
// Solidity: function getValSetHeader() view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header)
func (_Settlement *SettlementCallerSession) GetValSetHeader() (ISettlementValSetHeader, error) {
	return _Settlement.Contract.GetValSetHeader(&_Settlement.CallOpts)
}

// GetValSetHeaderAt is a free data retrieval call binding the contract method 0x4addaee7.
//
// Solidity: function getValSetHeaderAt(uint48 epoch) view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_Settlement *SettlementCaller) GetValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (ISettlementValSetHeader, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getValSetHeaderAt", epoch)

	if err != nil {
		return *new(ISettlementValSetHeader), err
	}

	out0 := *abi.ConvertType(out[0], new(ISettlementValSetHeader)).(*ISettlementValSetHeader)

	return out0, err

}

// GetValSetHeaderAt is a free data retrieval call binding the contract method 0x4addaee7.
//
// Solidity: function getValSetHeaderAt(uint48 epoch) view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_Settlement *SettlementSession) GetValSetHeaderAt(epoch *big.Int) (ISettlementValSetHeader, error) {
	return _Settlement.Contract.GetValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetValSetHeaderAt is a free data retrieval call binding the contract method 0x4addaee7.
//
// Solidity: function getValSetHeaderAt(uint48 epoch) view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_Settlement *SettlementCallerSession) GetValSetHeaderAt(epoch *big.Int) (ISettlementValSetHeader, error) {
	return _Settlement.Contract.GetValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetValSetHeaderHash is a free data retrieval call binding the contract method 0x32624bf3.
//
// Solidity: function getValSetHeaderHash() view returns(bytes32)
func (_Settlement *SettlementCaller) GetValSetHeaderHash(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getValSetHeaderHash")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetValSetHeaderHash is a free data retrieval call binding the contract method 0x32624bf3.
//
// Solidity: function getValSetHeaderHash() view returns(bytes32)
func (_Settlement *SettlementSession) GetValSetHeaderHash() ([32]byte, error) {
	return _Settlement.Contract.GetValSetHeaderHash(&_Settlement.CallOpts)
}

// GetValSetHeaderHash is a free data retrieval call binding the contract method 0x32624bf3.
//
// Solidity: function getValSetHeaderHash() view returns(bytes32)
func (_Settlement *SettlementCallerSession) GetValSetHeaderHash() ([32]byte, error) {
	return _Settlement.Contract.GetValSetHeaderHash(&_Settlement.CallOpts)
}

// GetValSetHeaderHashAt is a free data retrieval call binding the contract method 0xf35d12a3.
//
// Solidity: function getValSetHeaderHashAt(uint48 epoch) view returns(bytes32)
func (_Settlement *SettlementCaller) GetValSetHeaderHashAt(opts *bind.CallOpts, epoch *big.Int) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getValSetHeaderHashAt", epoch)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetValSetHeaderHashAt is a free data retrieval call binding the contract method 0xf35d12a3.
//
// Solidity: function getValSetHeaderHashAt(uint48 epoch) view returns(bytes32)
func (_Settlement *SettlementSession) GetValSetHeaderHashAt(epoch *big.Int) ([32]byte, error) {
	return _Settlement.Contract.GetValSetHeaderHashAt(&_Settlement.CallOpts, epoch)
}

// GetValSetHeaderHashAt is a free data retrieval call binding the contract method 0xf35d12a3.
//
// Solidity: function getValSetHeaderHashAt(uint48 epoch) view returns(bytes32)
func (_Settlement *SettlementCallerSession) GetValSetHeaderHashAt(epoch *big.Int) ([32]byte, error) {
	return _Settlement.Contract.GetValSetHeaderHashAt(&_Settlement.CallOpts, epoch)
}

// GetValidatorsSszMRootFromValSetHeader is a free data retrieval call binding the contract method 0x0167166e.
//
// Solidity: function getValidatorsSszMRootFromValSetHeader() view returns(bytes32)
func (_Settlement *SettlementCaller) GetValidatorsSszMRootFromValSetHeader(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getValidatorsSszMRootFromValSetHeader")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetValidatorsSszMRootFromValSetHeader is a free data retrieval call binding the contract method 0x0167166e.
//
// Solidity: function getValidatorsSszMRootFromValSetHeader() view returns(bytes32)
func (_Settlement *SettlementSession) GetValidatorsSszMRootFromValSetHeader() ([32]byte, error) {
	return _Settlement.Contract.GetValidatorsSszMRootFromValSetHeader(&_Settlement.CallOpts)
}

// GetValidatorsSszMRootFromValSetHeader is a free data retrieval call binding the contract method 0x0167166e.
//
// Solidity: function getValidatorsSszMRootFromValSetHeader() view returns(bytes32)
func (_Settlement *SettlementCallerSession) GetValidatorsSszMRootFromValSetHeader() ([32]byte, error) {
	return _Settlement.Contract.GetValidatorsSszMRootFromValSetHeader(&_Settlement.CallOpts)
}

// GetValidatorsSszMRootFromValSetHeaderAt is a free data retrieval call binding the contract method 0x230ae408.
//
// Solidity: function getValidatorsSszMRootFromValSetHeaderAt(uint48 epoch) view returns(bytes32)
func (_Settlement *SettlementCaller) GetValidatorsSszMRootFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getValidatorsSszMRootFromValSetHeaderAt", epoch)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetValidatorsSszMRootFromValSetHeaderAt is a free data retrieval call binding the contract method 0x230ae408.
//
// Solidity: function getValidatorsSszMRootFromValSetHeaderAt(uint48 epoch) view returns(bytes32)
func (_Settlement *SettlementSession) GetValidatorsSszMRootFromValSetHeaderAt(epoch *big.Int) ([32]byte, error) {
	return _Settlement.Contract.GetValidatorsSszMRootFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetValidatorsSszMRootFromValSetHeaderAt is a free data retrieval call binding the contract method 0x230ae408.
//
// Solidity: function getValidatorsSszMRootFromValSetHeaderAt(uint48 epoch) view returns(bytes32)
func (_Settlement *SettlementCallerSession) GetValidatorsSszMRootFromValSetHeaderAt(epoch *big.Int) ([32]byte, error) {
	return _Settlement.Contract.GetValidatorsSszMRootFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetVersionFromValSetHeader is a free data retrieval call binding the contract method 0xd2df9fb6.
//
// Solidity: function getVersionFromValSetHeader() view returns(uint8)
func (_Settlement *SettlementCaller) GetVersionFromValSetHeader(opts *bind.CallOpts) (uint8, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getVersionFromValSetHeader")

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetVersionFromValSetHeader is a free data retrieval call binding the contract method 0xd2df9fb6.
//
// Solidity: function getVersionFromValSetHeader() view returns(uint8)
func (_Settlement *SettlementSession) GetVersionFromValSetHeader() (uint8, error) {
	return _Settlement.Contract.GetVersionFromValSetHeader(&_Settlement.CallOpts)
}

// GetVersionFromValSetHeader is a free data retrieval call binding the contract method 0xd2df9fb6.
//
// Solidity: function getVersionFromValSetHeader() view returns(uint8)
func (_Settlement *SettlementCallerSession) GetVersionFromValSetHeader() (uint8, error) {
	return _Settlement.Contract.GetVersionFromValSetHeader(&_Settlement.CallOpts)
}

// GetVersionFromValSetHeaderAt is a free data retrieval call binding the contract method 0x548202ad.
//
// Solidity: function getVersionFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_Settlement *SettlementCaller) GetVersionFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (uint8, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "getVersionFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetVersionFromValSetHeaderAt is a free data retrieval call binding the contract method 0x548202ad.
//
// Solidity: function getVersionFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_Settlement *SettlementSession) GetVersionFromValSetHeaderAt(epoch *big.Int) (uint8, error) {
	return _Settlement.Contract.GetVersionFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// GetVersionFromValSetHeaderAt is a free data retrieval call binding the contract method 0x548202ad.
//
// Solidity: function getVersionFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_Settlement *SettlementCallerSession) GetVersionFromValSetHeaderAt(epoch *big.Int) (uint8, error) {
	return _Settlement.Contract.GetVersionFromValSetHeaderAt(&_Settlement.CallOpts, epoch)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_Settlement *SettlementCaller) HashTypedDataV4(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "hashTypedDataV4", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_Settlement *SettlementSession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _Settlement.Contract.HashTypedDataV4(&_Settlement.CallOpts, structHash)
}

// HashTypedDataV4 is a free data retrieval call binding the contract method 0x4980f288.
//
// Solidity: function hashTypedDataV4(bytes32 structHash) view returns(bytes32)
func (_Settlement *SettlementCallerSession) HashTypedDataV4(structHash [32]byte) ([32]byte, error) {
	return _Settlement.Contract.HashTypedDataV4(&_Settlement.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_Settlement *SettlementCaller) HashTypedDataV4CrossChain(opts *bind.CallOpts, structHash [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "hashTypedDataV4CrossChain", structHash)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_Settlement *SettlementSession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _Settlement.Contract.HashTypedDataV4CrossChain(&_Settlement.CallOpts, structHash)
}

// HashTypedDataV4CrossChain is a free data retrieval call binding the contract method 0x518dcf3b.
//
// Solidity: function hashTypedDataV4CrossChain(bytes32 structHash) view returns(bytes32)
func (_Settlement *SettlementCallerSession) HashTypedDataV4CrossChain(structHash [32]byte) ([32]byte, error) {
	return _Settlement.Contract.HashTypedDataV4CrossChain(&_Settlement.CallOpts, structHash)
}

// IsValSetHeaderCommittedAt is a free data retrieval call binding the contract method 0x5fa4bbd2.
//
// Solidity: function isValSetHeaderCommittedAt(uint48 epoch) view returns(bool)
func (_Settlement *SettlementCaller) IsValSetHeaderCommittedAt(opts *bind.CallOpts, epoch *big.Int) (bool, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "isValSetHeaderCommittedAt", epoch)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsValSetHeaderCommittedAt is a free data retrieval call binding the contract method 0x5fa4bbd2.
//
// Solidity: function isValSetHeaderCommittedAt(uint48 epoch) view returns(bool)
func (_Settlement *SettlementSession) IsValSetHeaderCommittedAt(epoch *big.Int) (bool, error) {
	return _Settlement.Contract.IsValSetHeaderCommittedAt(&_Settlement.CallOpts, epoch)
}

// IsValSetHeaderCommittedAt is a free data retrieval call binding the contract method 0x5fa4bbd2.
//
// Solidity: function isValSetHeaderCommittedAt(uint48 epoch) view returns(bool)
func (_Settlement *SettlementCallerSession) IsValSetHeaderCommittedAt(epoch *big.Int) (bool, error) {
	return _Settlement.Contract.IsValSetHeaderCommittedAt(&_Settlement.CallOpts, epoch)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0x1dc1898b.
//
// Solidity: function verifyQuorumSig(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_Settlement *SettlementCaller) VerifyQuorumSig(opts *bind.CallOpts, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "verifyQuorumSig", message, keyTag, quorumThreshold, proof)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0x1dc1898b.
//
// Solidity: function verifyQuorumSig(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_Settlement *SettlementSession) VerifyQuorumSig(message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _Settlement.Contract.VerifyQuorumSig(&_Settlement.CallOpts, message, keyTag, quorumThreshold, proof)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0x1dc1898b.
//
// Solidity: function verifyQuorumSig(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_Settlement *SettlementCallerSession) VerifyQuorumSig(message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _Settlement.Contract.VerifyQuorumSig(&_Settlement.CallOpts, message, keyTag, quorumThreshold, proof)
}

// VerifyQuorumSigAt is a free data retrieval call binding the contract method 0xacaa2269.
//
// Solidity: function verifyQuorumSigAt(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof, uint48 epoch, bytes hint) view returns(bool)
func (_Settlement *SettlementCaller) VerifyQuorumSigAt(opts *bind.CallOpts, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte, epoch *big.Int, hint []byte) (bool, error) {
	var out []interface{}
	err := _Settlement.contract.Call(opts, &out, "verifyQuorumSigAt", message, keyTag, quorumThreshold, proof, epoch, hint)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// VerifyQuorumSigAt is a free data retrieval call binding the contract method 0xacaa2269.
//
// Solidity: function verifyQuorumSigAt(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof, uint48 epoch, bytes hint) view returns(bool)
func (_Settlement *SettlementSession) VerifyQuorumSigAt(message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte, epoch *big.Int, hint []byte) (bool, error) {
	return _Settlement.Contract.VerifyQuorumSigAt(&_Settlement.CallOpts, message, keyTag, quorumThreshold, proof, epoch, hint)
}

// VerifyQuorumSigAt is a free data retrieval call binding the contract method 0xacaa2269.
//
// Solidity: function verifyQuorumSigAt(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof, uint48 epoch, bytes hint) view returns(bool)
func (_Settlement *SettlementCallerSession) VerifyQuorumSigAt(message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte, epoch *big.Int, hint []byte) (bool, error) {
	return _Settlement.Contract.VerifyQuorumSigAt(&_Settlement.CallOpts, message, keyTag, quorumThreshold, proof, epoch, hint)
}

// CommitValSetHeader is a paid mutator transaction binding the contract method 0x6f5f058e.
//
// Solidity: function commitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header, (bytes32,bytes32)[] extraData, bytes proof) returns()
func (_Settlement *SettlementTransactor) CommitValSetHeader(opts *bind.TransactOpts, header ISettlementValSetHeader, extraData []ISettlementExtraData, proof []byte) (*types.Transaction, error) {
	return _Settlement.contract.Transact(opts, "commitValSetHeader", header, extraData, proof)
}

// CommitValSetHeader is a paid mutator transaction binding the contract method 0x6f5f058e.
//
// Solidity: function commitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header, (bytes32,bytes32)[] extraData, bytes proof) returns()
func (_Settlement *SettlementSession) CommitValSetHeader(header ISettlementValSetHeader, extraData []ISettlementExtraData, proof []byte) (*types.Transaction, error) {
	return _Settlement.Contract.CommitValSetHeader(&_Settlement.TransactOpts, header, extraData, proof)
}

// CommitValSetHeader is a paid mutator transaction binding the contract method 0x6f5f058e.
//
// Solidity: function commitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header, (bytes32,bytes32)[] extraData, bytes proof) returns()
func (_Settlement *SettlementTransactorSession) CommitValSetHeader(header ISettlementValSetHeader, extraData []ISettlementExtraData, proof []byte) (*types.Transaction, error) {
	return _Settlement.Contract.CommitValSetHeader(&_Settlement.TransactOpts, header, extraData, proof)
}

// SetGenesis is a paid mutator transaction binding the contract method 0xec3be7e4.
//
// Solidity: function setGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData) returns()
func (_Settlement *SettlementTransactor) SetGenesis(opts *bind.TransactOpts, valSetHeader ISettlementValSetHeader, extraData []ISettlementExtraData) (*types.Transaction, error) {
	return _Settlement.contract.Transact(opts, "setGenesis", valSetHeader, extraData)
}

// SetGenesis is a paid mutator transaction binding the contract method 0xec3be7e4.
//
// Solidity: function setGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData) returns()
func (_Settlement *SettlementSession) SetGenesis(valSetHeader ISettlementValSetHeader, extraData []ISettlementExtraData) (*types.Transaction, error) {
	return _Settlement.Contract.SetGenesis(&_Settlement.TransactOpts, valSetHeader, extraData)
}

// SetGenesis is a paid mutator transaction binding the contract method 0xec3be7e4.
//
// Solidity: function setGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData) returns()
func (_Settlement *SettlementTransactorSession) SetGenesis(valSetHeader ISettlementValSetHeader, extraData []ISettlementExtraData) (*types.Transaction, error) {
	return _Settlement.Contract.SetGenesis(&_Settlement.TransactOpts, valSetHeader, extraData)
}

// SetSigVerifier is a paid mutator transaction binding the contract method 0xbd7e9980.
//
// Solidity: function setSigVerifier(address sigVerifier) returns()
func (_Settlement *SettlementTransactor) SetSigVerifier(opts *bind.TransactOpts, sigVerifier common.Address) (*types.Transaction, error) {
	return _Settlement.contract.Transact(opts, "setSigVerifier", sigVerifier)
}

// SetSigVerifier is a paid mutator transaction binding the contract method 0xbd7e9980.
//
// Solidity: function setSigVerifier(address sigVerifier) returns()
func (_Settlement *SettlementSession) SetSigVerifier(sigVerifier common.Address) (*types.Transaction, error) {
	return _Settlement.Contract.SetSigVerifier(&_Settlement.TransactOpts, sigVerifier)
}

// SetSigVerifier is a paid mutator transaction binding the contract method 0xbd7e9980.
//
// Solidity: function setSigVerifier(address sigVerifier) returns()
func (_Settlement *SettlementTransactorSession) SetSigVerifier(sigVerifier common.Address) (*types.Transaction, error) {
	return _Settlement.Contract.SetSigVerifier(&_Settlement.TransactOpts, sigVerifier)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_Settlement *SettlementTransactor) StaticDelegateCall(opts *bind.TransactOpts, target common.Address, data []byte) (*types.Transaction, error) {
	return _Settlement.contract.Transact(opts, "staticDelegateCall", target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_Settlement *SettlementSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _Settlement.Contract.StaticDelegateCall(&_Settlement.TransactOpts, target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_Settlement *SettlementTransactorSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _Settlement.Contract.StaticDelegateCall(&_Settlement.TransactOpts, target, data)
}

// SettlementCommitValSetHeaderIterator is returned from FilterCommitValSetHeader and is used to iterate over the raw logs and unpacked data for CommitValSetHeader events raised by the Settlement contract.
type SettlementCommitValSetHeaderIterator struct {
	Event *SettlementCommitValSetHeader // Event containing the contract specifics and raw log

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
func (it *SettlementCommitValSetHeaderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(SettlementCommitValSetHeader)
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
		it.Event = new(SettlementCommitValSetHeader)
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
func (it *SettlementCommitValSetHeaderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *SettlementCommitValSetHeaderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// SettlementCommitValSetHeader represents a CommitValSetHeader event raised by the Settlement contract.
type SettlementCommitValSetHeader struct {
	ValSetHeader ISettlementValSetHeader
	ExtraData    []ISettlementExtraData
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterCommitValSetHeader is a free log retrieval operation binding the contract event 0x9ed1f51eddfff95a70fd993c30da7d26fc67bda21c9145aafc7d0a510a405558.
//
// Solidity: event CommitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_Settlement *SettlementFilterer) FilterCommitValSetHeader(opts *bind.FilterOpts) (*SettlementCommitValSetHeaderIterator, error) {

	logs, sub, err := _Settlement.contract.FilterLogs(opts, "CommitValSetHeader")
	if err != nil {
		return nil, err
	}
	return &SettlementCommitValSetHeaderIterator{contract: _Settlement.contract, event: "CommitValSetHeader", logs: logs, sub: sub}, nil
}

// WatchCommitValSetHeader is a free log subscription operation binding the contract event 0x9ed1f51eddfff95a70fd993c30da7d26fc67bda21c9145aafc7d0a510a405558.
//
// Solidity: event CommitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_Settlement *SettlementFilterer) WatchCommitValSetHeader(opts *bind.WatchOpts, sink chan<- *SettlementCommitValSetHeader) (event.Subscription, error) {

	logs, sub, err := _Settlement.contract.WatchLogs(opts, "CommitValSetHeader")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(SettlementCommitValSetHeader)
				if err := _Settlement.contract.UnpackLog(event, "CommitValSetHeader", log); err != nil {
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

// ParseCommitValSetHeader is a log parse operation binding the contract event 0x9ed1f51eddfff95a70fd993c30da7d26fc67bda21c9145aafc7d0a510a405558.
//
// Solidity: event CommitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_Settlement *SettlementFilterer) ParseCommitValSetHeader(log types.Log) (*SettlementCommitValSetHeader, error) {
	event := new(SettlementCommitValSetHeader)
	if err := _Settlement.contract.UnpackLog(event, "CommitValSetHeader", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// SettlementEIP712DomainChangedIterator is returned from FilterEIP712DomainChanged and is used to iterate over the raw logs and unpacked data for EIP712DomainChanged events raised by the Settlement contract.
type SettlementEIP712DomainChangedIterator struct {
	Event *SettlementEIP712DomainChanged // Event containing the contract specifics and raw log

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
func (it *SettlementEIP712DomainChangedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(SettlementEIP712DomainChanged)
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
		it.Event = new(SettlementEIP712DomainChanged)
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
func (it *SettlementEIP712DomainChangedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *SettlementEIP712DomainChangedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// SettlementEIP712DomainChanged represents a EIP712DomainChanged event raised by the Settlement contract.
type SettlementEIP712DomainChanged struct {
	Raw types.Log // Blockchain specific contextual infos
}

// FilterEIP712DomainChanged is a free log retrieval operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_Settlement *SettlementFilterer) FilterEIP712DomainChanged(opts *bind.FilterOpts) (*SettlementEIP712DomainChangedIterator, error) {

	logs, sub, err := _Settlement.contract.FilterLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return &SettlementEIP712DomainChangedIterator{contract: _Settlement.contract, event: "EIP712DomainChanged", logs: logs, sub: sub}, nil
}

// WatchEIP712DomainChanged is a free log subscription operation binding the contract event 0x0a6387c9ea3628b88a633bb4f3b151770f70085117a15f9bf3787cda53f13d31.
//
// Solidity: event EIP712DomainChanged()
func (_Settlement *SettlementFilterer) WatchEIP712DomainChanged(opts *bind.WatchOpts, sink chan<- *SettlementEIP712DomainChanged) (event.Subscription, error) {

	logs, sub, err := _Settlement.contract.WatchLogs(opts, "EIP712DomainChanged")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(SettlementEIP712DomainChanged)
				if err := _Settlement.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
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
func (_Settlement *SettlementFilterer) ParseEIP712DomainChanged(log types.Log) (*SettlementEIP712DomainChanged, error) {
	event := new(SettlementEIP712DomainChanged)
	if err := _Settlement.contract.UnpackLog(event, "EIP712DomainChanged", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// SettlementInitEIP712Iterator is returned from FilterInitEIP712 and is used to iterate over the raw logs and unpacked data for InitEIP712 events raised by the Settlement contract.
type SettlementInitEIP712Iterator struct {
	Event *SettlementInitEIP712 // Event containing the contract specifics and raw log

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
func (it *SettlementInitEIP712Iterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(SettlementInitEIP712)
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
		it.Event = new(SettlementInitEIP712)
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
func (it *SettlementInitEIP712Iterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *SettlementInitEIP712Iterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// SettlementInitEIP712 represents a InitEIP712 event raised by the Settlement contract.
type SettlementInitEIP712 struct {
	Name    string
	Version string
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitEIP712 is a free log retrieval operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_Settlement *SettlementFilterer) FilterInitEIP712(opts *bind.FilterOpts) (*SettlementInitEIP712Iterator, error) {

	logs, sub, err := _Settlement.contract.FilterLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return &SettlementInitEIP712Iterator{contract: _Settlement.contract, event: "InitEIP712", logs: logs, sub: sub}, nil
}

// WatchInitEIP712 is a free log subscription operation binding the contract event 0x98790bb3996c909e6f4279ffabdfe70fa6c0d49b8fa04656d6161decfc442e0a.
//
// Solidity: event InitEIP712(string name, string version)
func (_Settlement *SettlementFilterer) WatchInitEIP712(opts *bind.WatchOpts, sink chan<- *SettlementInitEIP712) (event.Subscription, error) {

	logs, sub, err := _Settlement.contract.WatchLogs(opts, "InitEIP712")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(SettlementInitEIP712)
				if err := _Settlement.contract.UnpackLog(event, "InitEIP712", log); err != nil {
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
func (_Settlement *SettlementFilterer) ParseInitEIP712(log types.Log) (*SettlementInitEIP712, error) {
	event := new(SettlementInitEIP712)
	if err := _Settlement.contract.UnpackLog(event, "InitEIP712", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// SettlementInitSigVerifierIterator is returned from FilterInitSigVerifier and is used to iterate over the raw logs and unpacked data for InitSigVerifier events raised by the Settlement contract.
type SettlementInitSigVerifierIterator struct {
	Event *SettlementInitSigVerifier // Event containing the contract specifics and raw log

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
func (it *SettlementInitSigVerifierIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(SettlementInitSigVerifier)
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
		it.Event = new(SettlementInitSigVerifier)
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
func (it *SettlementInitSigVerifierIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *SettlementInitSigVerifierIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// SettlementInitSigVerifier represents a InitSigVerifier event raised by the Settlement contract.
type SettlementInitSigVerifier struct {
	SigVerifier common.Address
	Raw         types.Log // Blockchain specific contextual infos
}

// FilterInitSigVerifier is a free log retrieval operation binding the contract event 0x8c698070f0c9ef92ff032a24e5c83ef7783fd360fde9c6af8ed5fca9fa5abbb7.
//
// Solidity: event InitSigVerifier(address sigVerifier)
func (_Settlement *SettlementFilterer) FilterInitSigVerifier(opts *bind.FilterOpts) (*SettlementInitSigVerifierIterator, error) {

	logs, sub, err := _Settlement.contract.FilterLogs(opts, "InitSigVerifier")
	if err != nil {
		return nil, err
	}
	return &SettlementInitSigVerifierIterator{contract: _Settlement.contract, event: "InitSigVerifier", logs: logs, sub: sub}, nil
}

// WatchInitSigVerifier is a free log subscription operation binding the contract event 0x8c698070f0c9ef92ff032a24e5c83ef7783fd360fde9c6af8ed5fca9fa5abbb7.
//
// Solidity: event InitSigVerifier(address sigVerifier)
func (_Settlement *SettlementFilterer) WatchInitSigVerifier(opts *bind.WatchOpts, sink chan<- *SettlementInitSigVerifier) (event.Subscription, error) {

	logs, sub, err := _Settlement.contract.WatchLogs(opts, "InitSigVerifier")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(SettlementInitSigVerifier)
				if err := _Settlement.contract.UnpackLog(event, "InitSigVerifier", log); err != nil {
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

// ParseInitSigVerifier is a log parse operation binding the contract event 0x8c698070f0c9ef92ff032a24e5c83ef7783fd360fde9c6af8ed5fca9fa5abbb7.
//
// Solidity: event InitSigVerifier(address sigVerifier)
func (_Settlement *SettlementFilterer) ParseInitSigVerifier(log types.Log) (*SettlementInitSigVerifier, error) {
	event := new(SettlementInitSigVerifier)
	if err := _Settlement.contract.UnpackLog(event, "InitSigVerifier", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// SettlementInitSubnetworkIterator is returned from FilterInitSubnetwork and is used to iterate over the raw logs and unpacked data for InitSubnetwork events raised by the Settlement contract.
type SettlementInitSubnetworkIterator struct {
	Event *SettlementInitSubnetwork // Event containing the contract specifics and raw log

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
func (it *SettlementInitSubnetworkIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(SettlementInitSubnetwork)
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
		it.Event = new(SettlementInitSubnetwork)
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
func (it *SettlementInitSubnetworkIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *SettlementInitSubnetworkIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// SettlementInitSubnetwork represents a InitSubnetwork event raised by the Settlement contract.
type SettlementInitSubnetwork struct {
	Network      common.Address
	SubnetworkId *big.Int
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterInitSubnetwork is a free log retrieval operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_Settlement *SettlementFilterer) FilterInitSubnetwork(opts *bind.FilterOpts) (*SettlementInitSubnetworkIterator, error) {

	logs, sub, err := _Settlement.contract.FilterLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return &SettlementInitSubnetworkIterator{contract: _Settlement.contract, event: "InitSubnetwork", logs: logs, sub: sub}, nil
}

// WatchInitSubnetwork is a free log subscription operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_Settlement *SettlementFilterer) WatchInitSubnetwork(opts *bind.WatchOpts, sink chan<- *SettlementInitSubnetwork) (event.Subscription, error) {

	logs, sub, err := _Settlement.contract.WatchLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(SettlementInitSubnetwork)
				if err := _Settlement.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
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

// ParseInitSubnetwork is a log parse operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_Settlement *SettlementFilterer) ParseInitSubnetwork(log types.Log) (*SettlementInitSubnetwork, error) {
	event := new(SettlementInitSubnetwork)
	if err := _Settlement.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// SettlementInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the Settlement contract.
type SettlementInitializedIterator struct {
	Event *SettlementInitialized // Event containing the contract specifics and raw log

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
func (it *SettlementInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(SettlementInitialized)
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
		it.Event = new(SettlementInitialized)
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
func (it *SettlementInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *SettlementInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// SettlementInitialized represents a Initialized event raised by the Settlement contract.
type SettlementInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_Settlement *SettlementFilterer) FilterInitialized(opts *bind.FilterOpts) (*SettlementInitializedIterator, error) {

	logs, sub, err := _Settlement.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &SettlementInitializedIterator{contract: _Settlement.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_Settlement *SettlementFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *SettlementInitialized) (event.Subscription, error) {

	logs, sub, err := _Settlement.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(SettlementInitialized)
				if err := _Settlement.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_Settlement *SettlementFilterer) ParseInitialized(log types.Log) (*SettlementInitialized, error) {
	event := new(SettlementInitialized)
	if err := _Settlement.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// SettlementSetGenesisIterator is returned from FilterSetGenesis and is used to iterate over the raw logs and unpacked data for SetGenesis events raised by the Settlement contract.
type SettlementSetGenesisIterator struct {
	Event *SettlementSetGenesis // Event containing the contract specifics and raw log

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
func (it *SettlementSetGenesisIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(SettlementSetGenesis)
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
		it.Event = new(SettlementSetGenesis)
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
func (it *SettlementSetGenesisIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *SettlementSetGenesisIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// SettlementSetGenesis represents a SetGenesis event raised by the Settlement contract.
type SettlementSetGenesis struct {
	ValSetHeader ISettlementValSetHeader
	ExtraData    []ISettlementExtraData
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterSetGenesis is a free log retrieval operation binding the contract event 0xd4b7365d7a7dd369f40b249f48684bd7e51524b3ab56a9eb188ac339d574bbc0.
//
// Solidity: event SetGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_Settlement *SettlementFilterer) FilterSetGenesis(opts *bind.FilterOpts) (*SettlementSetGenesisIterator, error) {

	logs, sub, err := _Settlement.contract.FilterLogs(opts, "SetGenesis")
	if err != nil {
		return nil, err
	}
	return &SettlementSetGenesisIterator{contract: _Settlement.contract, event: "SetGenesis", logs: logs, sub: sub}, nil
}

// WatchSetGenesis is a free log subscription operation binding the contract event 0xd4b7365d7a7dd369f40b249f48684bd7e51524b3ab56a9eb188ac339d574bbc0.
//
// Solidity: event SetGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_Settlement *SettlementFilterer) WatchSetGenesis(opts *bind.WatchOpts, sink chan<- *SettlementSetGenesis) (event.Subscription, error) {

	logs, sub, err := _Settlement.contract.WatchLogs(opts, "SetGenesis")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(SettlementSetGenesis)
				if err := _Settlement.contract.UnpackLog(event, "SetGenesis", log); err != nil {
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

// ParseSetGenesis is a log parse operation binding the contract event 0xd4b7365d7a7dd369f40b249f48684bd7e51524b3ab56a9eb188ac339d574bbc0.
//
// Solidity: event SetGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_Settlement *SettlementFilterer) ParseSetGenesis(log types.Log) (*SettlementSetGenesis, error) {
	event := new(SettlementSetGenesis)
	if err := _Settlement.contract.UnpackLog(event, "SetGenesis", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// SettlementSetSigVerifierIterator is returned from FilterSetSigVerifier and is used to iterate over the raw logs and unpacked data for SetSigVerifier events raised by the Settlement contract.
type SettlementSetSigVerifierIterator struct {
	Event *SettlementSetSigVerifier // Event containing the contract specifics and raw log

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
func (it *SettlementSetSigVerifierIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(SettlementSetSigVerifier)
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
		it.Event = new(SettlementSetSigVerifier)
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
func (it *SettlementSetSigVerifierIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *SettlementSetSigVerifierIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// SettlementSetSigVerifier represents a SetSigVerifier event raised by the Settlement contract.
type SettlementSetSigVerifier struct {
	SigVerifier common.Address
	Raw         types.Log // Blockchain specific contextual infos
}

// FilterSetSigVerifier is a free log retrieval operation binding the contract event 0x3cb2fcfd41e182e933eb967bdeaac4f8ff69c80b6fd24fea9561dfbdec127942.
//
// Solidity: event SetSigVerifier(address sigVerifier)
func (_Settlement *SettlementFilterer) FilterSetSigVerifier(opts *bind.FilterOpts) (*SettlementSetSigVerifierIterator, error) {

	logs, sub, err := _Settlement.contract.FilterLogs(opts, "SetSigVerifier")
	if err != nil {
		return nil, err
	}
	return &SettlementSetSigVerifierIterator{contract: _Settlement.contract, event: "SetSigVerifier", logs: logs, sub: sub}, nil
}

// WatchSetSigVerifier is a free log subscription operation binding the contract event 0x3cb2fcfd41e182e933eb967bdeaac4f8ff69c80b6fd24fea9561dfbdec127942.
//
// Solidity: event SetSigVerifier(address sigVerifier)
func (_Settlement *SettlementFilterer) WatchSetSigVerifier(opts *bind.WatchOpts, sink chan<- *SettlementSetSigVerifier) (event.Subscription, error) {

	logs, sub, err := _Settlement.contract.WatchLogs(opts, "SetSigVerifier")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(SettlementSetSigVerifier)
				if err := _Settlement.contract.UnpackLog(event, "SetSigVerifier", log); err != nil {
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

// ParseSetSigVerifier is a log parse operation binding the contract event 0x3cb2fcfd41e182e933eb967bdeaac4f8ff69c80b6fd24fea9561dfbdec127942.
//
// Solidity: event SetSigVerifier(address sigVerifier)
func (_Settlement *SettlementFilterer) ParseSetSigVerifier(log types.Log) (*SettlementSetSigVerifier, error) {
	event := new(SettlementSetSigVerifier)
	if err := _Settlement.contract.UnpackLog(event, "SetSigVerifier", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}
