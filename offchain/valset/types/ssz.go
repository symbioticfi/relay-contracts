package types

import (
	"github.com/karalabe/ssz"
)

func (key *Key) SizeSSZ(siz *ssz.Sizer, fixed bool) (size uint32) {
	size = 8 + 4
	if fixed {
		return size
	}
	size += ssz.SizeDynamicBytes(siz, key.Payload)
	return size
}

func (key *Key) DefineSSZ(codec *ssz.Codec) {
	ssz.DefineUint8(codec, &key.Tag)
	ssz.DefineDynamicBytesOffset(codec, &key.Payload, 64)
	ssz.DefineDynamicBytesContent(codec, &key.Payload, 64)
}

func (vault *Vault) SizeSSZ(_ *ssz.Sizer) uint32 {
	return 20 + 32
}

func (vault *Vault) DefineSSZ(codec *ssz.Codec) {
	ssz.DefineStaticBytes(codec, &vault.Vault)
	ssz.DefineUint256BigInt(codec, &vault.VotingPower)
}

func (validator *Validator) SizeSSZ(siz *ssz.Sizer, fixed bool) (size uint32) {
	size = 8 + 20 + 32 + 1 + 4 + 4
	if fixed {
		return size
	}
	size += ssz.SizeSliceOfDynamicObjects(siz, validator.Keys)
	size += ssz.SizeSliceOfStaticObjects(siz, validator.Vaults)
	return size
}

func (validator *Validator) DefineSSZ(codec *ssz.Codec) {
	// ssz.DefineUint8(codec, &validator.Version)
	ssz.DefineStaticBytes(codec, &validator.Operator)
	ssz.DefineUint256BigInt(codec, &validator.VotingPower)
	ssz.DefineBool(codec, &validator.IsActive)
	ssz.DefineSliceOfDynamicObjectsOffset(codec, &validator.Keys, 128)
	ssz.DefineSliceOfStaticObjectsOffset(codec, &validator.Vaults, 10)
	ssz.DefineSliceOfDynamicObjectsContent(codec, &validator.Keys, 128)
	ssz.DefineSliceOfStaticObjectsContent(codec, &validator.Vaults, 10)
}

func (valSet *ValidatorSet) SizeSSZ(siz *ssz.Sizer, fixed bool) (size uint32) {
	size = 4
	if fixed {
		return size
	}
	size += ssz.SizeSliceOfDynamicObjects(siz, valSet.Validators)
	return size
}

func (valSet *ValidatorSet) DefineSSZ(codec *ssz.Codec) {
	ssz.DefineSliceOfDynamicObjectsOffset(codec, &valSet.Validators, 10000)
	ssz.DefineSliceOfDynamicObjectsContent(codec, &valSet.Validators, 10000)
}
