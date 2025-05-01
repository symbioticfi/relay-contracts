package aggregation

import (
	"context"
	"fmt"
	"offchain-middleware/bls"
	"offchain-middleware/eth"
	"offchain-middleware/proof"
	"offchain-middleware/storage"
	"offchain-middleware/valset"
	"offchain-middleware/valset/types"
)

// AggregatorService coordinates the P2P and ETH services
type Aggregation struct {
	storage         *storage.Storage
	ethClient       eth.IEthClient
	valsetGenerator *valset.ValsetGenerator
	valsetDeriver   *valset.ValsetDeriver
}

// NewAggregation creates a new aggregation
func NewAggregation(ethClient eth.IEthClient, storage *storage.Storage, valsetGenerator *valset.ValsetGenerator, valsetDeriver *valset.ValsetDeriver) (*Aggregation, error) {
	return &Aggregation{
		ethClient:       ethClient,
		storage:         storage,
		valsetGenerator: valsetGenerator,
		valsetDeriver:   valsetDeriver,
	}, nil
}

func (a *Aggregation) AggregateSignatures(ctx context.Context, messageHash []byte) ([]byte, []byte, error) {
	valsetTimestamp, err := a.ethClient.GetCurrentValsetTimestamp(ctx)
	if err != nil {
		return nil, nil, fmt.Errorf("failed to get current valset timestamp: %w", err)
	}

	valset, err := a.valsetDeriver.GetValidatorSet(ctx, valsetTimestamp)
	if err != nil {
		return nil, nil, fmt.Errorf("failed to get validator set: %w", err)
	}

	requiredKeyTag, err := a.ethClient.GetRequiredKeyTag(ctx, valsetTimestamp)
	if err != nil {
		return nil, nil, fmt.Errorf("failed to get required key tag: %w", err)
	}

	// Create a mapping from public key to validator
	pubKeyToValidator := make(map[string]*types.Validator)
	for i := range valset.Validators {
		validator := valset.Validators[i]
		if !validator.IsActive {
			continue
		}

		for _, key := range validator.Keys {
			if key.Tag != requiredKeyTag {
				continue
			}

			pubKeyToValidator[string(key.Payload)] = validator
		}
	}

	pubKeys, sigs := a.storage.GetSignatures(string(messageHash))
	var signers []*types.Validator
	signature := bls.ZeroG1()

	for i, pubKey := range pubKeys {
		validator, ok := pubKeyToValidator[string(pubKey)]
		if !ok {
			continue
		}

		signers = append(signers, validator)
		signature = signature.Add(bls.DeserializeG1(sigs[i]))
	}

	// TODO: check if we have enough signatures, we can do it

	validatorsData := proof.ToValidatorsData(signers, requiredKeyTag)

	proof, err := proof.Prove(validatorsData)
	if err != nil {
		return nil, nil, fmt.Errorf("failed to prove: %w", err)
	}

	return signature.Marshal(), proof, nil
}
