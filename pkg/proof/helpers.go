package proof

import (
	"bytes"
	"math/big"
	"sort"

	"github.com/consensys/gnark-crypto/ecc/bn254"
	mimc_native "github.com/consensys/gnark-crypto/ecc/bn254/fr/mimc"
	"github.com/consensys/gnark/frontend"
	"github.com/consensys/gnark/std/algebra/emulated/sw_bn254"
	"github.com/consensys/gnark/std/hash/mimc"
	"github.com/consensys/gnark/std/math/bits"
	"github.com/consensys/gnark/std/math/uints"
)

func (p ProofData) Marshal() []byte {
	var result bytes.Buffer

	result.Write(p.Proof)
	result.Write(p.Commitments)
	result.Write(p.CommitmentPok)
	signersAggVotingPowerBuffer := make([]byte, 32)
	p.SignersAggVotingPower.FillBytes(signersAggVotingPowerBuffer)
	result.Write(signersAggVotingPowerBuffer)

	return result.Bytes()
}

func hashAffineG1(h *mimc.MiMC, g1 *sw_bn254.G1Affine) {
	h.Write(g1.X.Limbs...)
	h.Write(g1.Y.Limbs...)
}

func hashAffineG2(h *mimc.MiMC, g2 *sw_bn254.G2Affine) {
	h.Write(g2.P.X.A0.Limbs...)
	h.Write(g2.P.X.A1.Limbs...)
	h.Write(g2.P.Y.A0.Limbs...)
	h.Write(g2.P.Y.A1.Limbs...)
}

func variableToBytes(api frontend.API, u64api *uints.BinaryField[uints.U64], variable frontend.Variable) []uints.U8 {
	res := make([]uints.U8, 32)
	hexVar := bits.ToBinary(api, variable, bits.WithNbDigits(256))
	for i := range 32 {
		res[i] = u64api.ByteValueOf(api.Add(
			api.Mul(1<<7, hexVar[8*(32-i)-1]),
			api.Mul(1<<6, hexVar[8*(32-i)-2]),
			api.Mul(1<<5, hexVar[8*(32-i)-3]),
			api.Mul(1<<4, hexVar[8*(32-i)-4]),
			api.Mul(1<<3, hexVar[8*(32-i)-5]),
			api.Mul(1<<2, hexVar[8*(32-i)-6]),
			api.Mul(1<<1, hexVar[8*(32-i)-7]),
			api.Mul(1<<0, hexVar[8*(32-i)-8]),
		))
	}

	return res
}

func keyToBytes(u64api *uints.BinaryField[uints.U64], key *sw_bn254.G1Affine) []uints.U8 {
	xLimbs := key.X.Limbs
	yLimbs := key.Y.Limbs

	result := limbsToBytes(u64api, xLimbs)
	return append(result, limbsToBytes(u64api, yLimbs)...)
}

func limbsToBytes(u64api *uints.BinaryField[uints.U64], limbs []frontend.Variable) []uints.U8 {
	result := make([]uints.U8, 0, len(limbs)*8)
	for i := range limbs {
		u64 := u64api.ValueOf(limbs[len(limbs)-1-i])
		result = append(result, u64api.UnpackMSB(u64)...)
	}
	return result
}

func HashValset(valset []ValidatorData) []byte {
	h := mimc_native.NewMiMC()
	zeroPoint := new(bn254.G1Affine)
	zeroPoint.SetInfinity()
	for i := range valset {
		if valset[i].Key.X.Cmp(&zeroPoint.X) == 0 && valset[i].Key.Y.Cmp(&zeroPoint.Y) == 0 {
			break
		}

		xBytes := valset[i].Key.X.Bytes()
		yBytes := valset[i].Key.Y.Bytes()

		// hash by limbs as it's done inside circuit
		h.Write(xBytes[24:32])
		h.Write(xBytes[16:24])
		h.Write(xBytes[8:16])
		h.Write(xBytes[0:8])

		h.Write(yBytes[24:32])
		h.Write(yBytes[16:24])
		h.Write(yBytes[8:16])
		h.Write(yBytes[0:8])

		votingPowerBuf := make([]byte, 32)
		valset[i].VotingPower.FillBytes(votingPowerBuf)
		h.Write(votingPowerBuf)

		//	outerHash.Write(innerHash.Sum(nil))
	}
	return h.Sum(nil)
}

func getPubkeyG1(pk *big.Int) bn254.G1Affine {
	_, _, g1Aff, _ := bn254.Generators()
	var p bn254.G1Affine
	p.ScalarMultiplication(&g1Aff, pk)
	return p
}

func getPubkeyG2(pk *big.Int) bn254.G2Affine {
	_, _, _, g2Aff := bn254.Generators()
	var p bn254.G2Affine
	p.ScalarMultiplication(&g2Aff, pk)
	return p
}

func getNonSignersData(valset []ValidatorData) (aggKey *bn254.G1Affine, aggVotingPower *big.Int, totalVotingPower *big.Int) { //nolint:unparam // maybe needed later
	aggVotingPower = big.NewInt(0)
	totalVotingPower = big.NewInt(0)
	aggKey = new(bn254.G1Affine)
	aggKey.SetInfinity()
	for i := range valset {
		if valset[i].IsNonSigner {
			aggKey = aggKey.Add(aggKey, &(valset)[i].Key)
			aggVotingPower = aggVotingPower.Add(aggVotingPower, valset[i].VotingPower)
		}
		totalVotingPower = totalVotingPower.Add(totalVotingPower, valset[i].VotingPower)
	}
	return aggKey, aggVotingPower, totalVotingPower
}

func getAggSignature(message bn254.G1Affine, valset *[]ValidatorData) (signature *bn254.G1Affine, aggKeyG2 *bn254.G2Affine, aggKeyG1 *bn254.G1Affine) {
	aggKeyG2 = new(bn254.G2Affine)
	aggKeyG2.SetInfinity()

	aggSignature := new(bn254.G1Affine)
	aggSignature.SetInfinity()

	aggKeyG1 = new(bn254.G1Affine)
	aggKeyG1.SetInfinity()

	for i := range *valset {
		if !(*valset)[i].IsNonSigner {
			aggKeyG2 = aggKeyG2.Add(aggKeyG2, &(*valset)[i].KeyG2)
			aggKeyG1 = aggKeyG1.Add(aggKeyG1, &(*valset)[i].Key)
			msg := bn254.G1Affine{X: message.X, Y: message.Y} // have to copy msg since ScalarMultiplication rewrite it
			sig := msg.ScalarMultiplication(&msg, (*valset)[i].PrivateKey)
			aggSignature = aggSignature.Add(aggSignature, sig)
		}
	}

	return aggSignature, aggKeyG2, aggKeyG1
}

func NormalizeValset(valset []ValidatorData) []ValidatorData {
	// Sort validators by key in ascending order
	sort.Slice(valset, func(i, j int) bool {
		// Compare keys (lower first)
		return valset[i].Key.X.Cmp(&valset[j].Key.X) < 0 || valset[i].Key.Y.Cmp(&valset[j].Key.Y) < 0
	})
	n := getOptimalN(len(valset))
	normalizedValset := make([]ValidatorData, n)
	for i := range n {
		if i < len(valset) {
			normalizedValset[i] = valset[i]
		} else {
			zeroPoint := new(bn254.G1Affine)
			zeroPoint.SetInfinity()
			zeroPointG2 := new(bn254.G2Affine)
			zeroPointG2.SetInfinity()
			normalizedValset[i] = ValidatorData{PrivateKey: big.NewInt(0), Key: *zeroPoint, KeyG2: *zeroPointG2, VotingPower: big.NewInt(0), IsNonSigner: false}
		}
	}
	return normalizedValset
}

func getOptimalN(valsetLength int) int {
	var capSize int
	for _, m := range MaxValidators {
		if m >= valsetLength {
			capSize = m
			break
		}
	}
	if capSize == 0 {
		return 0
	}
	return capSize
}
