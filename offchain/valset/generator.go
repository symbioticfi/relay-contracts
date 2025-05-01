package valset

import (
	"context"
	"fmt"
	"log"
	"offchain-middleware/bls"
	"offchain-middleware/eth"
	"offchain-middleware/proof"
	"offchain-middleware/valset/types"

	"github.com/consensys/gnark-crypto/ecc/bn254"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/ethereum/go-ethereum/signer/core/apitypes"
	"github.com/karalabe/ssz"
)

// ValsetGenerator handles the generation of validator set headers
type ValsetGenerator struct {
	deriver   *ValsetDeriver
	ethClient eth.IEthClient
}

// NewValsetGenerator creates a new validator set generator
func NewValsetGenerator(deriver *ValsetDeriver, ethClient eth.IEthClient) (*ValsetGenerator, error) {
	return &ValsetGenerator{
		deriver:   deriver,
		ethClient: ethClient,
	}, nil
}

// GenerateValidatorSetHeader generates a validator set header for the current epoch
func (v ValsetGenerator) GenerateValidatorSetHeader(ctx context.Context) (*types.ValidatorSetHeader, error) {
	log.Println("Generating validator set header")

	timestamp, err := v.ethClient.GetCaptureTimestamp(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to get capture timestamp: %w", err)
	}

	validatorSet, err := v.deriver.GetValidatorSet(ctx, timestamp)
	if err != nil {
		return nil, fmt.Errorf("failed to get validator set: %w", err)
	}

	requiredKeyTag, err := v.ethClient.GetRequiredKeyTag(ctx, timestamp)
	if err != nil {
		return nil, fmt.Errorf("failed to get required key tag: %w", err)
	}

	log.Println("Processing validator set")

	tags := []uint8{uint8(len(validatorSet.Validators[0].Keys))}
	for _, key := range validatorSet.Validators[0].Keys {
		if key.Tag == requiredKeyTag {
			tags = append(tags, key.Tag)
		}
	}

	// Create aggregated pubkeys for each required key tag
	aggPubkeysG1 := make([]*bls.G1, len(tags))
	for i := range tags {
		aggPubkeysG1[i] = &bls.G1{G1Affine: new(bn254.G1Affine)}
	}

	for _, validator := range validatorSet.Validators {
		if !validator.IsActive {
			continue
		}

		for _, key := range validator.Keys {
			for i, tag := range tags {
				if key.Tag == tag {
					aggPubkeysG1[i] = aggPubkeysG1[i].Add(bls.DeserializeG1(key.Payload))
				}
			}
		}
	}

	sszMroot := ssz.HashSequential(validatorSet)

	// Use the first key tag for proof generation
	valset := proof.ToValidatorsData(validatorSet.Validators, requiredKeyTag)
	extraData := proof.HashValset(&valset)

	// Format all aggregated keys for the header
	formattedKeys := make([]types.G1, len(aggPubkeysG1))
	for i, key := range aggPubkeysG1 {
		formattedKeys[i] = types.FormatG1(key)
	}

	validatorSetHeader := &types.ValidatorSetHeader{
		ActiveAggregatedKeys:   formattedKeys,
		TotalActiveVotingPower: validatorSet.TotalActiveVotingPower,
		ValidatorsSszMRoot:     sszMroot,
		ExtraData:              extraData,
	}

	log.Println("Generated validator set header")

	return validatorSetHeader, nil
}

func (v ValsetGenerator) GenerateValidatorSetHeaderHash(ctx context.Context, validatorSetHeader *types.ValidatorSetHeader) ([]byte, error) {
	hash, err := types.Hash(validatorSetHeader)
	if err != nil {
		return nil, fmt.Errorf("failed to hash validator set header: %w", err)
	}

	domainEip712, err := v.ethClient.GetEip712Domain(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to get eip712 domain: %w", err)
	}

	domain := apitypes.TypedDataDomain{
		Name:    domainEip712.Name,
		Version: domainEip712.Version,
	}

	currentEpoch, err := v.ethClient.GetCurrentEpoch(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to get current epoch: %w", err)
	}

	subnetwork, err := v.ethClient.GetSubnetwork(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to get subnetwork: %w", err)
	}

	typedData := apitypes.TypedData{
		Types: apitypes.Types{
			"EIP712Domain": []apitypes.Type{
				{Name: "name", Type: "string"},
				{Name: "version", Type: "string"},
			},
			"ValSetHeaderCommit": []apitypes.Type{
				{Name: "Subnetwork", Type: "bytes32"},
				{Name: "Epoch", Type: "uint256"},
				{Name: "HeaderHash", Type: "bytes32"},
			},
		},
		Domain:      domain,
		PrimaryType: "ValSetHeaderCommit",
	}

	// Set up the message data
	message := map[string]interface{}{
		"Subnetwork": subnetwork,
		"Epoch":      currentEpoch,
		"HeaderHash": hash,
	}
	typedData.Message = message

	// 3. Calculate the hash of the EIP-712 message (ValSetHeaderCommit) type
	domainSeparator, err := typedData.HashStruct("EIP712Domain", typedData.Domain.Map())
	if err != nil {
		return nil, fmt.Errorf("error hashing domain: %w", err)
	}

	typeHash, err := typedData.HashStruct(typedData.PrimaryType, typedData.Message)
	if err != nil {
		return nil, fmt.Errorf("error hashing message: %w", err)
	}

	// 4. Calculate the final digest (to be signed)
	rawData := []byte(fmt.Sprintf("\x19\x01%s%s", string(domainSeparator), string(typeHash)))
	digest := crypto.Keccak256(rawData)

	return digest, nil
}
