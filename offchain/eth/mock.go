package eth

import (
	"context"
	"math/big"

	"github.com/ethereum/go-ethereum/common"
)

// MockEthClient implements IEthClient interface for testing
type MockEthClient struct {
	// Mock return values
	MockMasterConfig           *MasterConfig
	MockValSetConfig           *ValSetConfig
	MockCurrentPhase           Phase
	MockCurrentValsetTimestamp *big.Int
	MockCaptureTimestamp       *big.Int
	MockIsGenesisSet           bool
	MockVotingPowers           []OperatorVotingPower
	MockRequiredKeys           []OperatorWithKeys
	MockRequiredKeyTag         uint8
	MockQuorumThreshold        *big.Int
	MockCurrentEpoch           *big.Int
	MockSubnetwork             []byte
	MockEip712Domain           *Eip712Domain
	MockError                  error
}

// NewMockEthClient creates a new mock client with default values
func NewMockEthClient() *MockEthClient {
	return &MockEthClient{
		MockMasterConfig: &MasterConfig{
			VotingPowerProviders: []CrossChainAddress{
				{
					Address: common.HexToAddress("0x1111111111111111111111111111111111111111"),
					ChainId: 1,
				},
			},
			KeysProvider: CrossChainAddress{
				Address: common.HexToAddress("0x2222222222222222222222222222222222222222"),
				ChainId: 1,
			},
			Replicas: []CrossChainAddress{
				{
					Address: common.HexToAddress("0x3333333333333333333333333333333333333333"),
					ChainId: 1,
				},
			},
		},
		MockValSetConfig: &ValSetConfig{
			// Add mock ValSetConfig data here
		},
		MockCurrentPhase:           COMMIT,
		MockCurrentValsetTimestamp: big.NewInt(1000),
		MockCaptureTimestamp:       big.NewInt(900),
		MockIsGenesisSet:           true,
		MockVotingPowers:           createMockVotingPowers(5),
		MockRequiredKeys:           createMockRequiredKeys(5),
		MockRequiredKeyTag:         1,               // BLS key tag
		MockQuorumThreshold:        big.NewInt(667), // 2/3 of 1000
		MockCurrentEpoch:           big.NewInt(42),
		MockSubnetwork:             []byte{0x01, 0x02, 0x03, 0x04},
		MockEip712Domain: &Eip712Domain{
			Name:    "TestDomain",
			Version: "1",
		},
	}
}

// createMockVotingPowers creates mock voting powers for testing
func createMockVotingPowers(count int) []OperatorVotingPower {
	votingPowers := make([]OperatorVotingPower, count)

	for i := 0; i < count; i++ {
		vaults := make([]VaultVotingPower, 2)
		for j := 0; j < 2; j++ {
			vaults[j] = VaultVotingPower{
				Vault:       common.HexToAddress(generateMockAddress(i*10 + j)),
				VotingPower: big.NewInt(int64(100 + i*10 + j*5)),
			}
		}

		votingPowers[i] = OperatorVotingPower{
			Operator: common.HexToAddress(generateMockAddress(i + 100)),
			Vaults:   vaults,
		}
	}

	return votingPowers
}

// createMockRequiredKeys creates mock required keys for testing
func createMockRequiredKeys(count int) []OperatorWithKeys {
	operatorsWithKeys := make([]OperatorWithKeys, count)

	for i := 0; i < count; i++ {
		// Create BLS key
		blsKey := Key{
			Tag:     1, // BLS key tag
			Payload: make([]byte, 48),
		}
		// Just put some dummy data in the payload
		for j := 0; j < len(blsKey.Payload); j++ {
			blsKey.Payload[j] = byte(i + j)
		}

		// Create ECDSA key
		ecdsaKey := Key{
			Tag:     2, // ECDSA key tag
			Payload: make([]byte, 33),
		}
		// Just put some dummy data in the payload
		for j := 0; j < len(ecdsaKey.Payload); j++ {
			ecdsaKey.Payload[j] = byte(i + j + 100)
		}

		operatorsWithKeys[i] = OperatorWithKeys{
			Operator: common.HexToAddress(generateMockAddress(i + 100)),
			Keys:     []Key{blsKey, ecdsaKey},
		}
	}

	return operatorsWithKeys
}

// generateMockAddress creates a mock Ethereum address for testing
func generateMockAddress(seed int) string {
	return "0x" + padLeft(intToHex(seed), 40, '0')
}

// intToHex converts an integer to a hex string
func intToHex(n int) string {
	const hexChars = "0123456789abcdef"
	if n == 0 {
		return "0"
	}

	var result string
	for n > 0 {
		result = string(hexChars[n%16]) + result
		n /= 16
	}
	return result
}

// padLeft pads a string with a character to a specific length
func padLeft(str string, length int, pad byte) string {
	if len(str) >= length {
		return str
	}

	padding := make([]byte, length-len(str))
	for i := range padding {
		padding[i] = pad
	}

	return string(padding) + str
}

// GetMasterConfig mocks the GetMasterConfig method
func (m *MockEthClient) GetMasterConfig(ctx context.Context, timestamp *big.Int) (*MasterConfig, error) {
	return m.MockMasterConfig, m.MockError
}

// GetValSetConfig mocks the GetValSetConfig method
func (m *MockEthClient) GetValSetConfig(ctx context.Context, timestamp *big.Int) (*ValSetConfig, error) {
	return m.MockValSetConfig, m.MockError
}

// GetIsGenesisSet mocks the GetIsGenesisSet method
func (m *MockEthClient) GetIsGenesisSet(ctx context.Context) (bool, error) {
	return m.MockIsGenesisSet, m.MockError
}

// GetCurrentEpoch mocks the GetCurrentEpoch method
func (m *MockEthClient) GetCurrentEpoch(ctx context.Context) (*big.Int, error) {
	return m.MockCurrentEpoch, m.MockError
}

// GetCurrentPhase mocks the GetCurrentPhase method
func (m *MockEthClient) GetCurrentPhase(ctx context.Context) (Phase, error) {
	return m.MockCurrentPhase, m.MockError
}

// GetCurrentValsetTimestamp mocks the GetCurrentValsetTimestamp method
func (m *MockEthClient) GetCurrentValsetTimestamp(ctx context.Context) (*big.Int, error) {
	return m.MockCurrentValsetTimestamp, m.MockError
}

// GetCaptureTimestamp mocks the GetCaptureTimestamp method
func (m *MockEthClient) GetCaptureTimestamp(ctx context.Context) (*big.Int, error) {
	return m.MockCaptureTimestamp, m.MockError
}

// GetVotingPowers mocks the GetVotingPowers method
func (m *MockEthClient) GetVotingPowers(ctx context.Context, address common.Address, timestamp *big.Int) ([]OperatorVotingPower, error) {
	return m.MockVotingPowers, m.MockError
}

// GetRequiredKeys mocks the GetRequiredKeys method
func (m *MockEthClient) GetRequiredKeys(ctx context.Context, address common.Address, timestamp *big.Int) ([]OperatorWithKeys, error) {
	return m.MockRequiredKeys, m.MockError
}

// GetRequiredKeyTag mocks the GetRequiredKeyTag method
func (m *MockEthClient) GetRequiredKeyTag(ctx context.Context, timestamp *big.Int) (uint8, error) {
	return m.MockRequiredKeyTag, m.MockError
}

// GetQuorumThreshold mocks the GetQuorumThreshold method
func (m *MockEthClient) GetQuorumThreshold(ctx context.Context, timestamp *big.Int, keyTag uint8) (*big.Int, error) {
	return m.MockQuorumThreshold, m.MockError
}

// GetSubnetwork mocks the GetSubnetwork method
func (m *MockEthClient) GetSubnetwork(ctx context.Context) ([]byte, error) {
	return m.MockSubnetwork, m.MockError
}

// GetEip712Domain mocks the GetEip712Domain method
func (m *MockEthClient) GetEip712Domain(ctx context.Context) (*Eip712Domain, error) {
	return m.MockEip712Domain, m.MockError
}
