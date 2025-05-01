package valset

import (
	"context"
	"fmt"
	"maps"
	"math/big"
	"offchain-middleware/eth"
	"offchain-middleware/valset/types"
	"slices"
	"sort"
)

const VALSET_VERSION = 1

// ValsetDeriver coordinates the ETH services
type ValsetDeriver struct {
	ethClient eth.IEthClient
}

// NewValsetDeriver creates a new valset deriver
func NewValsetDeriver(ethClient eth.IEthClient) (*ValsetDeriver, error) {
	return &ValsetDeriver{
		ethClient: ethClient,
	}, nil
}

func (v ValsetDeriver) GetValidatorSet(ctx context.Context, timestamp *big.Int) (*types.ValidatorSet, error) {
	if timestamp == nil {
		var err error
		timestamp, err = v.ethClient.GetCaptureTimestamp(ctx)
		if err != nil {
			return nil, fmt.Errorf("failed to get capture timestamp: %w", err)
		}
	}

	masterConfig, err := v.ethClient.GetMasterConfig(ctx, timestamp)
	if err != nil {
		return nil, fmt.Errorf("failed to get master config: %w", err)
	}

	valSetConfig, err := v.ethClient.GetValSetConfig(ctx, timestamp)
	if err != nil {
		return nil, fmt.Errorf("failed to get val set config: %w", err)
	}

	// Get voting powers from all voting power providers
	var allVotingPowers []eth.OperatorVotingPower
	for _, provider := range masterConfig.VotingPowerProviders {
		votingPowers, err := v.ethClient.GetVotingPowers(ctx, provider.Address, timestamp)
		if err != nil {
			return nil, fmt.Errorf("failed to get voting powers from provider %s: %w", provider.Address.Hex(), err)
		}
		allVotingPowers = append(allVotingPowers, votingPowers...)
	}

	// Get required keys from the keys provider
	requiredKeys, err := v.ethClient.GetRequiredKeys(ctx, masterConfig.KeysProvider.Address, timestamp)
	if err != nil {
		return nil, fmt.Errorf("failed to get required keys: %w", err)
	}

	// Create validators map to consolidate voting powers and keys
	validatorsMap := make(map[string]*types.Validator)

	// Process voting powers
	for _, vp := range allVotingPowers {
		operatorAddr := vp.Operator.Hex()
		if _, exists := validatorsMap[operatorAddr]; !exists {
			validatorsMap[operatorAddr] = &types.Validator{
				Operator:    vp.Operator,
				VotingPower: big.NewInt(0),
				IsActive:    true, // Default to active, will filter later
				Keys:        []*types.Key{},
				Vaults:      []*types.Vault{},
			}
		}

		// Add vaults and their voting powers
		for _, vault := range vp.Vaults {
			validatorsMap[operatorAddr].VotingPower = new(big.Int).Add(
				validatorsMap[operatorAddr].VotingPower,
				vault.VotingPower,
			)

			// Add vault to validator's vaults
			validatorsMap[operatorAddr].Vaults = append(validatorsMap[operatorAddr].Vaults, &types.Vault{
				Vault:       vault.Vault,
				VotingPower: vault.VotingPower,
			})
		}
	}

	// Process required keys
	for _, rk := range requiredKeys {
		operatorAddr := rk.Operator.Hex()
		if validator, exists := validatorsMap[operatorAddr]; exists {
			// Add all keys for this operator
			for _, key := range rk.Keys {
				validator.Keys = append(validator.Keys, &types.Key{
					Tag:     key.Tag,
					Payload: key.Payload,
				})
			}
		}
	}

	validators := slices.Collect(maps.Values(validatorsMap))
	// Sort validators by voting power in descending order
	sort.Slice(validators, func(i, j int) bool {
		// Compare voting powers (higher first)
		return validators[i].VotingPower.Cmp(validators[j].VotingPower) > 0
	})

	// Apply filters from valSetConfig
	totalActiveVotingPower := big.NewInt(0)
	totalActive := 0

	for i := range validators {
		totalActive++
		// Check minimum voting power if configured
		if valSetConfig.MinInclusionVotingPower.Int64() != 0 {
			if validators[i].VotingPower.Cmp(valSetConfig.MinInclusionVotingPower) < 0 {
				validators[i].IsActive = false
			}
		}

		// Check if validator has at least one key
		if len(validators[i].Keys) == 0 {
			validators[i].IsActive = false
		}

		if valSetConfig.MaxValidatorsCount.Int64() != 0 {
			if totalActive > int(valSetConfig.MaxValidatorsCount.Int64()) {
				validators[i].IsActive = false
			}

			if !validators[i].IsActive {
				totalActive--
			}
		}

		// Cap voting power to max if configured
		if valSetConfig.MaxVotingPower.Int64() != 0 {
			if validators[i].VotingPower.Cmp(valSetConfig.MaxVotingPower) > 0 {
				validators[i].VotingPower = new(big.Int).Set(valSetConfig.MaxVotingPower)
			}
		}

		// Add to total active voting power if validator is active
		if validators[i].IsActive {
			totalActiveVotingPower = new(big.Int).Add(totalActiveVotingPower, validators[i].VotingPower)
		}
	}

	// Create the validator set
	validatorSet := types.ValidatorSet{
		Version:                VALSET_VERSION,
		TotalActiveVotingPower: totalActiveVotingPower,
		Validators:             validators,
	}

	return &validatorSet, nil
}
