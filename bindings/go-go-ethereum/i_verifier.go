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

// IVerifierMetaData contains all meta data concerning the IVerifier contract.
var IVerifierMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"verifyProof\",\"inputs\":[{\"name\":\"proof\",\"type\":\"uint256[8]\",\"internalType\":\"uint256[8]\"},{\"name\":\"commitments\",\"type\":\"uint256[2]\",\"internalType\":\"uint256[2]\"},{\"name\":\"commitmentPok\",\"type\":\"uint256[2]\",\"internalType\":\"uint256[2]\"},{\"name\":\"input\",\"type\":\"uint256[1]\",\"internalType\":\"uint256[1]\"}],\"outputs\":[],\"stateMutability\":\"view\"}]",
}

// IVerifierABI is the input ABI used to generate the binding from.
// Deprecated: Use IVerifierMetaData.ABI instead.
var IVerifierABI = IVerifierMetaData.ABI

// IVerifier is an auto generated Go binding around an Ethereum contract.
type IVerifier struct {
	IVerifierCaller     // Read-only binding to the contract
	IVerifierTransactor // Write-only binding to the contract
	IVerifierFilterer   // Log filterer for contract events
}

// IVerifierCaller is an auto generated read-only Go binding around an Ethereum contract.
type IVerifierCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVerifierTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IVerifierTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVerifierFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IVerifierFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVerifierSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IVerifierSession struct {
	Contract     *IVerifier        // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IVerifierCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IVerifierCallerSession struct {
	Contract *IVerifierCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts    // Call options to use throughout this session
}

// IVerifierTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IVerifierTransactorSession struct {
	Contract     *IVerifierTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts    // Transaction auth options to use throughout this session
}

// IVerifierRaw is an auto generated low-level Go binding around an Ethereum contract.
type IVerifierRaw struct {
	Contract *IVerifier // Generic contract binding to access the raw methods on
}

// IVerifierCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IVerifierCallerRaw struct {
	Contract *IVerifierCaller // Generic read-only contract binding to access the raw methods on
}

// IVerifierTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IVerifierTransactorRaw struct {
	Contract *IVerifierTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIVerifier creates a new instance of IVerifier, bound to a specific deployed contract.
func NewIVerifier(address common.Address, backend bind.ContractBackend) (*IVerifier, error) {
	contract, err := bindIVerifier(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IVerifier{IVerifierCaller: IVerifierCaller{contract: contract}, IVerifierTransactor: IVerifierTransactor{contract: contract}, IVerifierFilterer: IVerifierFilterer{contract: contract}}, nil
}

// NewIVerifierCaller creates a new read-only instance of IVerifier, bound to a specific deployed contract.
func NewIVerifierCaller(address common.Address, caller bind.ContractCaller) (*IVerifierCaller, error) {
	contract, err := bindIVerifier(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IVerifierCaller{contract: contract}, nil
}

// NewIVerifierTransactor creates a new write-only instance of IVerifier, bound to a specific deployed contract.
func NewIVerifierTransactor(address common.Address, transactor bind.ContractTransactor) (*IVerifierTransactor, error) {
	contract, err := bindIVerifier(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IVerifierTransactor{contract: contract}, nil
}

// NewIVerifierFilterer creates a new log filterer instance of IVerifier, bound to a specific deployed contract.
func NewIVerifierFilterer(address common.Address, filterer bind.ContractFilterer) (*IVerifierFilterer, error) {
	contract, err := bindIVerifier(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IVerifierFilterer{contract: contract}, nil
}

// bindIVerifier binds a generic wrapper to an already deployed contract.
func bindIVerifier(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IVerifierMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IVerifier *IVerifierRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IVerifier.Contract.IVerifierCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IVerifier *IVerifierRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVerifier.Contract.IVerifierTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IVerifier *IVerifierRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IVerifier.Contract.IVerifierTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IVerifier *IVerifierCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IVerifier.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IVerifier *IVerifierTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVerifier.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IVerifier *IVerifierTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IVerifier.Contract.contract.Transact(opts, method, params...)
}

// VerifyProof is a free data retrieval call binding the contract method 0x43db3c72.
//
// Solidity: function verifyProof(uint256[8] proof, uint256[2] commitments, uint256[2] commitmentPok, uint256[1] input) view returns()
func (_IVerifier *IVerifierCaller) VerifyProof(opts *bind.CallOpts, proof [8]*big.Int, commitments [2]*big.Int, commitmentPok [2]*big.Int, input [1]*big.Int) error {
	var out []interface{}
	err := _IVerifier.contract.Call(opts, &out, "verifyProof", proof, commitments, commitmentPok, input)

	if err != nil {
		return err
	}

	return err

}

// VerifyProof is a free data retrieval call binding the contract method 0x43db3c72.
//
// Solidity: function verifyProof(uint256[8] proof, uint256[2] commitments, uint256[2] commitmentPok, uint256[1] input) view returns()
func (_IVerifier *IVerifierSession) VerifyProof(proof [8]*big.Int, commitments [2]*big.Int, commitmentPok [2]*big.Int, input [1]*big.Int) error {
	return _IVerifier.Contract.VerifyProof(&_IVerifier.CallOpts, proof, commitments, commitmentPok, input)
}

// VerifyProof is a free data retrieval call binding the contract method 0x43db3c72.
//
// Solidity: function verifyProof(uint256[8] proof, uint256[2] commitments, uint256[2] commitmentPok, uint256[1] input) view returns()
func (_IVerifier *IVerifierCallerSession) VerifyProof(proof [8]*big.Int, commitments [2]*big.Int, commitmentPok [2]*big.Int, input [1]*big.Int) error {
	return _IVerifier.Contract.VerifyProof(&_IVerifier.CallOpts, proof, commitments, commitmentPok, input)
}
