package eth

import (
	"context"
	"crypto/ecdsa"
	"fmt"
	"math/big"
	"strings"

	"github.com/ethereum/go-ethereum"
	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/ethereum/go-ethereum/ethclient"
)

// Contract related constants
const (
	contractABI = `[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"messageHash","type":"bytes32"},{"indexed":false,"internalType":"bytes","name":"signature","type":"bytes"},{"indexed":false,"internalType":"uint256","name":"timestamp","type":"uint256"}],"name":"AggregatedSignatureSubmitted","type":"event"},{"inputs":[{"internalType":"bytes32","name":"messageHash","type":"bytes32"},{"internalType":"bytes","name":"signature","type":"bytes"}],"name":"submitAggregatedSignature","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"processedMessages","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"}]`
)

var (
	GET_MASTER_CONFIG_FUNCTION            = "getMasterConfigAt"
	GET_VALSET_CONFIG_FUNCTION            = "getValSetConfigAt"
	GET_IS_GENESIS_SET_FUNCTION           = "isGenesisSet"
	GET_CURRENT_EPOCH_FUNCTION            = "getCurrentEpoch"
	GET_CURRENT_PHASE_FUNCTION            = "getCurrentPhase"
	GET_CURRENT_VALSET_TIMESTAMP_FUNCTION = "getCurrentValsetTimestamp"
	GET_CAPTURE_TIMESTAMP_FUNCTION        = "getCaptureTimestamp"
	GET_VOTING_POWERS_FUNCTION            = "getVotingPowersAt"
	GET_REQUIRED_KEYS_FUNCTION            = "getRequiredKeysAt"
	GET_REQUIRED_KEY_TAG_FUNCTION         = "getRequiredKeyTagAt"
	GET_QUORUM_THRESHOLD_FUNCTION         = "getQuorumThresholdAt"
	GET_SUBNETWORK_FUNCTION               = "SUBNETWORK"
	GET_EIP_712_DOMAIN_FUNCTION           = "eip712Domain"
)

type IEthClient interface {
	GetMasterConfig(ctx context.Context, timestamp *big.Int) (*MasterConfig, error)
	GetValSetConfig(ctx context.Context, timestamp *big.Int) (*ValSetConfig, error)
	GetIsGenesisSet(ctx context.Context) (bool, error)
	GetCurrentEpoch(ctx context.Context) (*big.Int, error)
	GetCurrentPhase(ctx context.Context) (Phase, error)
	GetCurrentValsetTimestamp(ctx context.Context) (*big.Int, error)
	GetCaptureTimestamp(ctx context.Context) (*big.Int, error)
	GetVotingPowers(ctx context.Context, address common.Address, timestamp *big.Int) ([]OperatorVotingPower, error)
	GetRequiredKeys(ctx context.Context, address common.Address, timestamp *big.Int) ([]OperatorWithKeys, error)
	GetRequiredKeyTag(ctx context.Context, timestamp *big.Int) (uint8, error)
	GetQuorumThreshold(ctx context.Context, timestamp *big.Int, keyTag uint8) (*big.Int, error)
	GetSubnetwork(ctx context.Context) ([]byte, error)
	GetEip712Domain(ctx context.Context) (*Eip712Domain, error)
}

type EthClient struct {
	client                *ethclient.Client
	masterContractAddress common.Address
	contractABI           abi.ABI
	privateKey            *ecdsa.PrivateKey // could be nil for read-only access
}

func NewEthClient(rpcUrl string, contractAddress string, privateKey []byte) (*EthClient, error) {
	contractABI, err := abi.JSON(strings.NewReader(contractABI))
	if err != nil {
		return nil, fmt.Errorf("failed to parse contract ABI: %w", err)
	}

	client, err := ethclient.Dial(rpcUrl)
	if err != nil {
		return nil, fmt.Errorf("failed to connect to Ethereum client: %w", err)
	}

	pk, err := crypto.ToECDSA(privateKey)
	if err != nil {
		return nil, fmt.Errorf("failed to convert private key: %w", err)
	}
	// get epoch start and duration

	return &EthClient{
		client:                client,
		masterContractAddress: common.HexToAddress(contractAddress),
		contractABI:           contractABI,
		privateKey:            pk,
	}, nil
}

func GeneratePrivateKey() ([]byte, error) {
	pk, err := crypto.GenerateKey()
	if err != nil {
		return nil, fmt.Errorf("failed to generate private key: %w", err)
	}
	return crypto.FromECDSA(pk), nil
}

func (e *EthClient) Commit(messageHash string, signature []byte) error {
	return nil
}

func (e *EthClient) GetMasterConfig(ctx context.Context, timestamp *big.Int) (*MasterConfig, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_MASTER_CONFIG_FUNCTION, timestamp, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	var masterConfig MasterConfig
	err = e.contractABI.UnpackIntoInterface(&masterConfig, GET_MASTER_CONFIG_FUNCTION, result)
	if err != nil {
		return nil, fmt.Errorf("failed to unpack master config: %w", err)
	}

	return &masterConfig, nil
}

func (e *EthClient) GetValSetConfig(ctx context.Context, timestamp *big.Int) (*ValSetConfig, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_VALSET_CONFIG_FUNCTION, timestamp, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	var valSetConfig ValSetConfig
	err = e.contractABI.UnpackIntoInterface(&valSetConfig, GET_VALSET_CONFIG_FUNCTION, result)
	if err != nil {
		return nil, fmt.Errorf("failed to unpack val set config: %w", err)
	}

	return &valSetConfig, nil
}

func (e *EthClient) GetIsGenesisSet(ctx context.Context) (bool, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_IS_GENESIS_SET_FUNCTION)
	if err != nil {
		return false, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return false, fmt.Errorf("failed to call contract: %w", err)
	}

	isGenesisSet := new(big.Int).SetBytes(result).Uint64()
	return isGenesisSet == 1, nil
}

func (e *EthClient) GetCurrentEpoch(ctx context.Context) (*big.Int, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_CURRENT_EPOCH_FUNCTION)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	epoch := new(big.Int).SetBytes(result)
	return epoch, nil
}

func (e *EthClient) GetCurrentPhase(ctx context.Context) (Phase, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_CURRENT_PHASE_FUNCTION)
	if err != nil {
		return 0, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return 0, fmt.Errorf("failed to call contract: %w", err)
	}

	phase := new(big.Int).SetBytes(result).Uint64()
	return Phase(phase), nil
}

func (e *EthClient) GetCurrentValsetTimestamp(ctx context.Context) (*big.Int, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_CURRENT_VALSET_TIMESTAMP_FUNCTION)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	timestamp := new(big.Int).SetBytes(result)
	return timestamp, nil
}

func (e *EthClient) GetCaptureTimestamp(ctx context.Context) (*big.Int, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_CAPTURE_TIMESTAMP_FUNCTION)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	timestamp := new(big.Int).SetBytes(result)
	return timestamp, nil
}

func (e *EthClient) GetVotingPowers(ctx context.Context, address common.Address, timestamp *big.Int) ([]OperatorVotingPower, error) {
	callMsg, err := constructCallMsg(address, e.contractABI, GET_VOTING_POWERS_FUNCTION, nil, timestamp, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	var votingPowers []OperatorVotingPower
	err = e.contractABI.UnpackIntoInterface(&votingPowers, GET_VOTING_POWERS_FUNCTION, result)
	if err != nil {
		return nil, fmt.Errorf("failed to unpack voting powers: %w", err)
	}

	return votingPowers, nil
}

func (e *EthClient) GetRequiredKeys(ctx context.Context, address common.Address, timestamp *big.Int) ([]OperatorWithKeys, error) {
	callMsg, err := constructCallMsg(address, e.contractABI, GET_REQUIRED_KEYS_FUNCTION, timestamp, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	var requiredKeys []OperatorWithKeys
	err = e.contractABI.UnpackIntoInterface(&requiredKeys, GET_REQUIRED_KEYS_FUNCTION, result)
	if err != nil {
		return nil, fmt.Errorf("failed to unpack required keys: %w", err)
	}

	return requiredKeys, nil
}

func (e *EthClient) GetRequiredKeyTag(ctx context.Context, timestamp *big.Int) (uint8, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_REQUIRED_KEY_TAG_FUNCTION, timestamp, nil)
	if err != nil {
		return 0, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return 0, fmt.Errorf("failed to call contract: %w", err)
	}

	var keyTag uint8
	err = e.contractABI.UnpackIntoInterface(&keyTag, GET_REQUIRED_KEY_TAG_FUNCTION, result)
	if err != nil {
		return 0, fmt.Errorf("failed to unpack key tag: %w", err)
	}

	return keyTag, nil
}

func (e *EthClient) GetQuorumThreshold(ctx context.Context, timestamp *big.Int, keyTag uint8) (*big.Int, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_QUORUM_THRESHOLD_FUNCTION, keyTag, timestamp, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	return new(big.Int).SetBytes(result), nil
}

func (e *EthClient) GetSubnetwork(ctx context.Context) ([]byte, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_SUBNETWORK_FUNCTION)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	return result, nil
}

func (e *EthClient) GetEip712Domain(ctx context.Context) (*Eip712Domain, error) {
	callMsg, err := constructCallMsg(e.masterContractAddress, e.contractABI, GET_EIP_712_DOMAIN_FUNCTION)
	if err != nil {
		return nil, fmt.Errorf("failed to construct call msg: %w", err)
	}

	result, err := e.callContract(ctx, callMsg)
	if err != nil {
		return nil, fmt.Errorf("failed to call contract: %w", err)
	}

	var eip712Domain Eip712Domain
	err = e.contractABI.UnpackIntoInterface(&eip712Domain, GET_EIP_712_DOMAIN_FUNCTION, result)
	if err != nil {
		return nil, fmt.Errorf("failed to unpack eip712 domain: %w", err)
	}

	return &eip712Domain, nil
}

func (e *EthClient) callContract(ctx context.Context, callMsg ethereum.CallMsg) (result []byte, err error) {
	return e.client.CallContract(ctx, callMsg, nil)
}

func constructCallMsg(contractAddress common.Address, abi abi.ABI, method string, args ...interface{}) (ethereum.CallMsg, error) {
	data, err := abi.Pack(method, args...)
	if err != nil {
		return ethereum.CallMsg{}, fmt.Errorf("failed to pack method: %w", err)
	}

	return ethereum.CallMsg{
		To:   &contractAddress,
		Data: data,
	}, nil
}
