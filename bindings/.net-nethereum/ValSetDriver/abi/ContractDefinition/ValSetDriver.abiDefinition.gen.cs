using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;
using Nethereum.RPC.Eth.DTOs;
using Nethereum.Contracts.CQS;
using Nethereum.Contracts;
using System.Threading;

namespace Symbiotic.Relay.ValSetDriver.abi.ContractDefinition
{


    public partial class ValSetDriver.abiDeployment : ValSetDriver.abiDeploymentBase
    {
        public ValSetDriver.abiDeployment() : base(BYTECODE) { }
        public ValSetDriver.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class ValSetDriver.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public ValSetDriver.abiDeploymentBase() : base(BYTECODE) { }
        public ValSetDriver.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class MaxQuorumThresholdFunction : MaxQuorumThresholdFunctionBase { }

    [Function("MAX_QUORUM_THRESHOLD", "uint248")]
    public class MaxQuorumThresholdFunctionBase : FunctionMessage
    {

    }

    public partial class NetworkFunction : NetworkFunctionBase { }

    [Function("NETWORK", "address")]
    public class NetworkFunctionBase : FunctionMessage
    {

    }

    public partial class SubnetworkFunction : SubnetworkFunctionBase { }

    [Function("SUBNETWORK", "bytes32")]
    public class SubnetworkFunctionBase : FunctionMessage
    {

    }

    public partial class SubnetworkIdentifierFunction : SubnetworkIdentifierFunctionBase { }

    [Function("SUBNETWORK_IDENTIFIER", "uint96")]
    public class SubnetworkIdentifierFunctionBase : FunctionMessage
    {

    }

    public partial class AddQuorumThresholdFunction : AddQuorumThresholdFunctionBase { }

    [Function("addQuorumThreshold")]
    public class AddQuorumThresholdFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "quorumThreshold", 1)]
        public virtual QuorumThreshold QuorumThreshold { get; set; }
    }

    public partial class AddSettlementFunction : AddSettlementFunctionBase { }

    [Function("addSettlement")]
    public class AddSettlementFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "settlement", 1)]
        public virtual CrossChainAddress Settlement { get; set; }
    }

    public partial class AddVotingPowerProviderFunction : AddVotingPowerProviderFunctionBase { }

    [Function("addVotingPowerProvider")]
    public class AddVotingPowerProviderFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "votingPowerProvider", 1)]
        public virtual CrossChainAddress VotingPowerProvider { get; set; }
    }

    public partial class GetCommitterSlotDurationFunction : GetCommitterSlotDurationFunctionBase { }

    [Function("getCommitterSlotDuration", "uint48")]
    public class GetCommitterSlotDurationFunctionBase : FunctionMessage
    {

    }

    public partial class GetCommitterSlotDurationAtFunction : GetCommitterSlotDurationAtFunctionBase { }

    [Function("getCommitterSlotDurationAt", "uint48")]
    public class GetCommitterSlotDurationAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetConfigFunction : GetConfigFunctionBase { }

    [Function("getConfig", typeof(GetConfigOutputDTO))]
    public class GetConfigFunctionBase : FunctionMessage
    {

    }

    public partial class GetConfigAtFunction : GetConfigAtFunctionBase { }

    [Function("getConfigAt", typeof(GetConfigAtOutputDTO))]
    public class GetConfigAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetCurrentEpochFunction : GetCurrentEpochFunctionBase { }

    [Function("getCurrentEpoch", "uint48")]
    public class GetCurrentEpochFunctionBase : FunctionMessage
    {

    }

    public partial class GetCurrentEpochDurationFunction : GetCurrentEpochDurationFunctionBase { }

    [Function("getCurrentEpochDuration", "uint48")]
    public class GetCurrentEpochDurationFunctionBase : FunctionMessage
    {

    }

    public partial class GetCurrentEpochStartFunction : GetCurrentEpochStartFunctionBase { }

    [Function("getCurrentEpochStart", "uint48")]
    public class GetCurrentEpochStartFunctionBase : FunctionMessage
    {

    }

    public partial class GetEpochDurationFunction : GetEpochDurationFunctionBase { }

    [Function("getEpochDuration", "uint48")]
    public class GetEpochDurationFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetEpochIndexFunction : GetEpochIndexFunctionBase { }

    [Function("getEpochIndex", "uint48")]
    public class GetEpochIndexFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetEpochStartFunction : GetEpochStartFunctionBase { }

    [Function("getEpochStart", "uint48")]
    public class GetEpochStartFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetKeysProviderFunction : GetKeysProviderFunctionBase { }

    [Function("getKeysProvider", typeof(GetKeysProviderOutputDTO))]
    public class GetKeysProviderFunctionBase : FunctionMessage
    {

    }

    public partial class GetKeysProviderAtFunction : GetKeysProviderAtFunctionBase { }

    [Function("getKeysProviderAt", typeof(GetKeysProviderAtOutputDTO))]
    public class GetKeysProviderAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetMaxValidatorsCountFunction : GetMaxValidatorsCountFunctionBase { }

    [Function("getMaxValidatorsCount", "uint208")]
    public class GetMaxValidatorsCountFunctionBase : FunctionMessage
    {

    }

    public partial class GetMaxValidatorsCountAtFunction : GetMaxValidatorsCountAtFunctionBase { }

    [Function("getMaxValidatorsCountAt", "uint208")]
    public class GetMaxValidatorsCountAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetMaxVotingPowerFunction : GetMaxVotingPowerFunctionBase { }

    [Function("getMaxVotingPower", "uint256")]
    public class GetMaxVotingPowerFunctionBase : FunctionMessage
    {

    }

    public partial class GetMaxVotingPowerAtFunction : GetMaxVotingPowerAtFunctionBase { }

    [Function("getMaxVotingPowerAt", "uint256")]
    public class GetMaxVotingPowerAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetMinInclusionVotingPowerFunction : GetMinInclusionVotingPowerFunctionBase { }

    [Function("getMinInclusionVotingPower", "uint256")]
    public class GetMinInclusionVotingPowerFunctionBase : FunctionMessage
    {

    }

    public partial class GetMinInclusionVotingPowerAtFunction : GetMinInclusionVotingPowerAtFunctionBase { }

    [Function("getMinInclusionVotingPowerAt", "uint256")]
    public class GetMinInclusionVotingPowerAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetNextEpochFunction : GetNextEpochFunctionBase { }

    [Function("getNextEpoch", "uint48")]
    public class GetNextEpochFunctionBase : FunctionMessage
    {

    }

    public partial class GetNextEpochDurationFunction : GetNextEpochDurationFunctionBase { }

    [Function("getNextEpochDuration", "uint48")]
    public class GetNextEpochDurationFunctionBase : FunctionMessage
    {

    }

    public partial class GetNextEpochStartFunction : GetNextEpochStartFunctionBase { }

    [Function("getNextEpochStart", "uint48")]
    public class GetNextEpochStartFunctionBase : FunctionMessage
    {

    }

    public partial class GetNumAggregatorsFunction : GetNumAggregatorsFunctionBase { }

    [Function("getNumAggregators", "uint208")]
    public class GetNumAggregatorsFunctionBase : FunctionMessage
    {

    }

    public partial class GetNumAggregatorsAtFunction : GetNumAggregatorsAtFunctionBase { }

    [Function("getNumAggregatorsAt", "uint208")]
    public class GetNumAggregatorsAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetNumCommittersFunction : GetNumCommittersFunctionBase { }

    [Function("getNumCommitters", "uint208")]
    public class GetNumCommittersFunctionBase : FunctionMessage
    {

    }

    public partial class GetNumCommittersAtFunction : GetNumCommittersAtFunctionBase { }

    [Function("getNumCommittersAt", "uint208")]
    public class GetNumCommittersAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetQuorumThresholdsFunction : GetQuorumThresholdsFunctionBase { }

    [Function("getQuorumThresholds", typeof(GetQuorumThresholdsOutputDTO))]
    public class GetQuorumThresholdsFunctionBase : FunctionMessage
    {

    }

    public partial class GetQuorumThresholdsAtFunction : GetQuorumThresholdsAtFunctionBase { }

    [Function("getQuorumThresholdsAt", typeof(GetQuorumThresholdsAtOutputDTO))]
    public class GetQuorumThresholdsAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetRequiredHeaderKeyTagFunction : GetRequiredHeaderKeyTagFunctionBase { }

    [Function("getRequiredHeaderKeyTag", "uint8")]
    public class GetRequiredHeaderKeyTagFunctionBase : FunctionMessage
    {

    }

    public partial class GetRequiredHeaderKeyTagAtFunction : GetRequiredHeaderKeyTagAtFunctionBase { }

    [Function("getRequiredHeaderKeyTagAt", "uint8")]
    public class GetRequiredHeaderKeyTagAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetRequiredKeyTagsFunction : GetRequiredKeyTagsFunctionBase { }

    [Function("getRequiredKeyTags", "uint8[]")]
    public class GetRequiredKeyTagsFunctionBase : FunctionMessage
    {

    }

    public partial class GetRequiredKeyTagsAtFunction : GetRequiredKeyTagsAtFunctionBase { }

    [Function("getRequiredKeyTagsAt", "uint8[]")]
    public class GetRequiredKeyTagsAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetSettlementsFunction : GetSettlementsFunctionBase { }

    [Function("getSettlements", typeof(GetSettlementsOutputDTO))]
    public class GetSettlementsFunctionBase : FunctionMessage
    {

    }

    public partial class GetSettlementsAtFunction : GetSettlementsAtFunctionBase { }

    [Function("getSettlementsAt", typeof(GetSettlementsAtOutputDTO))]
    public class GetSettlementsAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetVerificationTypeFunction : GetVerificationTypeFunctionBase { }

    [Function("getVerificationType", "uint32")]
    public class GetVerificationTypeFunctionBase : FunctionMessage
    {

    }

    public partial class GetVerificationTypeAtFunction : GetVerificationTypeAtFunctionBase { }

    [Function("getVerificationTypeAt", "uint32")]
    public class GetVerificationTypeAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetVotingPowerProvidersFunction : GetVotingPowerProvidersFunctionBase { }

    [Function("getVotingPowerProviders", typeof(GetVotingPowerProvidersOutputDTO))]
    public class GetVotingPowerProvidersFunctionBase : FunctionMessage
    {

    }

    public partial class GetVotingPowerProvidersAtFunction : GetVotingPowerProvidersAtFunctionBase { }

    [Function("getVotingPowerProvidersAt", typeof(GetVotingPowerProvidersAtOutputDTO))]
    public class GetVotingPowerProvidersAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class IsQuorumThresholdRegisteredFunction : IsQuorumThresholdRegisteredFunctionBase { }

    [Function("isQuorumThresholdRegistered", "bool")]
    public class IsQuorumThresholdRegisteredFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "quorumThreshold", 1)]
        public virtual QuorumThreshold QuorumThreshold { get; set; }
    }

    public partial class IsQuorumThresholdRegisteredAtFunction : IsQuorumThresholdRegisteredAtFunctionBase { }

    [Function("isQuorumThresholdRegisteredAt", "bool")]
    public class IsQuorumThresholdRegisteredAtFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "quorumThreshold", 1)]
        public virtual QuorumThreshold QuorumThreshold { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class IsSettlementRegisteredFunction : IsSettlementRegisteredFunctionBase { }

    [Function("isSettlementRegistered", "bool")]
    public class IsSettlementRegisteredFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "settlement", 1)]
        public virtual CrossChainAddress Settlement { get; set; }
    }

    public partial class IsSettlementRegisteredAtFunction : IsSettlementRegisteredAtFunctionBase { }

    [Function("isSettlementRegisteredAt", "bool")]
    public class IsSettlementRegisteredAtFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "settlement", 1)]
        public virtual CrossChainAddress Settlement { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class IsVotingPowerProviderRegisteredFunction : IsVotingPowerProviderRegisteredFunctionBase { }

    [Function("isVotingPowerProviderRegistered", "bool")]
    public class IsVotingPowerProviderRegisteredFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "votingPowerProvider", 1)]
        public virtual CrossChainAddress VotingPowerProvider { get; set; }
    }

    public partial class IsVotingPowerProviderRegisteredAtFunction : IsVotingPowerProviderRegisteredAtFunctionBase { }

    [Function("isVotingPowerProviderRegisteredAt", "bool")]
    public class IsVotingPowerProviderRegisteredAtFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "votingPowerProvider", 1)]
        public virtual CrossChainAddress VotingPowerProvider { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class MulticallFunction : MulticallFunctionBase { }

    [Function("multicall", "bytes[]")]
    public class MulticallFunctionBase : FunctionMessage
    {
        [Parameter("bytes[]", "data", 1)]
        public virtual List<byte[]> Data { get; set; }
    }

    public partial class RemoveQuorumThresholdFunction : RemoveQuorumThresholdFunctionBase { }

    [Function("removeQuorumThreshold")]
    public class RemoveQuorumThresholdFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "quorumThreshold", 1)]
        public virtual QuorumThreshold QuorumThreshold { get; set; }
    }

    public partial class RemoveSettlementFunction : RemoveSettlementFunctionBase { }

    [Function("removeSettlement")]
    public class RemoveSettlementFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "settlement", 1)]
        public virtual CrossChainAddress Settlement { get; set; }
    }

    public partial class RemoveVotingPowerProviderFunction : RemoveVotingPowerProviderFunctionBase { }

    [Function("removeVotingPowerProvider")]
    public class RemoveVotingPowerProviderFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "votingPowerProvider", 1)]
        public virtual CrossChainAddress VotingPowerProvider { get; set; }
    }

    public partial class SetCommitterSlotDurationFunction : SetCommitterSlotDurationFunctionBase { }

    [Function("setCommitterSlotDuration")]
    public class SetCommitterSlotDurationFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "slotDuration", 1)]
        public virtual ulong SlotDuration { get; set; }
    }

    public partial class SetEpochDurationFunction : SetEpochDurationFunctionBase { }

    [Function("setEpochDuration")]
    public class SetEpochDurationFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epochDuration", 1)]
        public virtual ulong EpochDuration { get; set; }
    }

    public partial class SetKeysProviderFunction : SetKeysProviderFunctionBase { }

    [Function("setKeysProvider")]
    public class SetKeysProviderFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "keysProvider", 1)]
        public virtual CrossChainAddress KeysProvider { get; set; }
    }

    public partial class SetMaxValidatorsCountFunction : SetMaxValidatorsCountFunctionBase { }

    [Function("setMaxValidatorsCount")]
    public class SetMaxValidatorsCountFunctionBase : FunctionMessage
    {
        [Parameter("uint208", "maxValidatorsCount", 1)]
        public virtual BigInteger MaxValidatorsCount { get; set; }
    }

    public partial class SetMaxVotingPowerFunction : SetMaxVotingPowerFunctionBase { }

    [Function("setMaxVotingPower")]
    public class SetMaxVotingPowerFunctionBase : FunctionMessage
    {
        [Parameter("uint256", "maxVotingPower", 1)]
        public virtual BigInteger MaxVotingPower { get; set; }
    }

    public partial class SetMinInclusionVotingPowerFunction : SetMinInclusionVotingPowerFunctionBase { }

    [Function("setMinInclusionVotingPower")]
    public class SetMinInclusionVotingPowerFunctionBase : FunctionMessage
    {
        [Parameter("uint256", "minInclusionVotingPower", 1)]
        public virtual BigInteger MinInclusionVotingPower { get; set; }
    }

    public partial class SetNumAggregatorsFunction : SetNumAggregatorsFunctionBase { }

    [Function("setNumAggregators")]
    public class SetNumAggregatorsFunctionBase : FunctionMessage
    {
        [Parameter("uint208", "numAggregators", 1)]
        public virtual BigInteger NumAggregators { get; set; }
    }

    public partial class SetNumCommittersFunction : SetNumCommittersFunctionBase { }

    [Function("setNumCommitters")]
    public class SetNumCommittersFunctionBase : FunctionMessage
    {
        [Parameter("uint208", "numCommitters", 1)]
        public virtual BigInteger NumCommitters { get; set; }
    }

    public partial class SetRequiredHeaderKeyTagFunction : SetRequiredHeaderKeyTagFunctionBase { }

    [Function("setRequiredHeaderKeyTag")]
    public class SetRequiredHeaderKeyTagFunctionBase : FunctionMessage
    {
        [Parameter("uint8", "requiredHeaderKeyTag", 1)]
        public virtual byte RequiredHeaderKeyTag { get; set; }
    }

    public partial class SetRequiredKeyTagsFunction : SetRequiredKeyTagsFunctionBase { }

    [Function("setRequiredKeyTags")]
    public class SetRequiredKeyTagsFunctionBase : FunctionMessage
    {
        [Parameter("uint8[]", "requiredKeyTags", 1)]
        public virtual List<byte> RequiredKeyTags { get; set; }
    }

    public partial class SetVerificationTypeFunction : SetVerificationTypeFunctionBase { }

    [Function("setVerificationType")]
    public class SetVerificationTypeFunctionBase : FunctionMessage
    {
        [Parameter("uint32", "verificationType", 1)]
        public virtual uint VerificationType { get; set; }
    }

    public partial class StaticDelegateCallFunction : StaticDelegateCallFunctionBase { }

    [Function("staticDelegateCall")]
    public class StaticDelegateCallFunctionBase : FunctionMessage
    {
        [Parameter("address", "target", 1)]
        public virtual string Target { get; set; }
        [Parameter("bytes", "data", 2)]
        public virtual byte[] Data { get; set; }
    }

    public partial class AddQuorumThresholdEventDTO : AddQuorumThresholdEventDTOBase { }

    [Event("AddQuorumThreshold")]
    public class AddQuorumThresholdEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "quorumThreshold", 1, false )]
        public virtual QuorumThreshold QuorumThreshold { get; set; }
    }

    public partial class AddSettlementEventDTO : AddSettlementEventDTOBase { }

    [Event("AddSettlement")]
    public class AddSettlementEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "settlement", 1, false )]
        public virtual CrossChainAddress Settlement { get; set; }
    }

    public partial class AddVotingPowerProviderEventDTO : AddVotingPowerProviderEventDTOBase { }

    [Event("AddVotingPowerProvider")]
    public class AddVotingPowerProviderEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "votingPowerProvider", 1, false )]
        public virtual CrossChainAddress VotingPowerProvider { get; set; }
    }

    public partial class InitEpochDurationEventDTO : InitEpochDurationEventDTOBase { }

    [Event("InitEpochDuration")]
    public class InitEpochDurationEventDTOBase : IEventDTO
    {
        [Parameter("uint48", "epochDuration", 1, false )]
        public virtual ulong EpochDuration { get; set; }
        [Parameter("uint48", "epochDurationTimestamp", 2, false )]
        public virtual ulong EpochDurationTimestamp { get; set; }
    }

    public partial class InitSubnetworkEventDTO : InitSubnetworkEventDTOBase { }

    [Event("InitSubnetwork")]
    public class InitSubnetworkEventDTOBase : IEventDTO
    {
        [Parameter("address", "network", 1, false )]
        public virtual string Network { get; set; }
        [Parameter("uint96", "subnetworkId", 2, false )]
        public virtual BigInteger SubnetworkId { get; set; }
    }

    public partial class InitializedEventDTO : InitializedEventDTOBase { }

    [Event("Initialized")]
    public class InitializedEventDTOBase : IEventDTO
    {
        [Parameter("uint64", "version", 1, false )]
        public virtual ulong Version { get; set; }
    }

    public partial class RemoveQuorumThresholdEventDTO : RemoveQuorumThresholdEventDTOBase { }

    [Event("RemoveQuorumThreshold")]
    public class RemoveQuorumThresholdEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "quorumThreshold", 1, false )]
        public virtual QuorumThreshold QuorumThreshold { get; set; }
    }

    public partial class RemoveSettlementEventDTO : RemoveSettlementEventDTOBase { }

    [Event("RemoveSettlement")]
    public class RemoveSettlementEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "settlement", 1, false )]
        public virtual CrossChainAddress Settlement { get; set; }
    }

    public partial class RemoveVotingPowerProviderEventDTO : RemoveVotingPowerProviderEventDTOBase { }

    [Event("RemoveVotingPowerProvider")]
    public class RemoveVotingPowerProviderEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "votingPowerProvider", 1, false )]
        public virtual CrossChainAddress VotingPowerProvider { get; set; }
    }

    public partial class SetCommitterSlotDurationEventDTO : SetCommitterSlotDurationEventDTOBase { }

    [Event("SetCommitterSlotDuration")]
    public class SetCommitterSlotDurationEventDTOBase : IEventDTO
    {
        [Parameter("uint48", "committerSlotDuration", 1, false )]
        public virtual ulong CommitterSlotDuration { get; set; }
    }

    public partial class SetEpochDurationEventDTO : SetEpochDurationEventDTOBase { }

    [Event("SetEpochDuration")]
    public class SetEpochDurationEventDTOBase : IEventDTO
    {
        [Parameter("uint48", "epochDuration", 1, false )]
        public virtual ulong EpochDuration { get; set; }
    }

    public partial class SetKeysProviderEventDTO : SetKeysProviderEventDTOBase { }

    [Event("SetKeysProvider")]
    public class SetKeysProviderEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "keysProvider", 1, false )]
        public virtual CrossChainAddress KeysProvider { get; set; }
    }

    public partial class SetMaxValidatorsCountEventDTO : SetMaxValidatorsCountEventDTOBase { }

    [Event("SetMaxValidatorsCount")]
    public class SetMaxValidatorsCountEventDTOBase : IEventDTO
    {
        [Parameter("uint208", "maxValidatorsCount", 1, false )]
        public virtual BigInteger MaxValidatorsCount { get; set; }
    }

    public partial class SetMaxVotingPowerEventDTO : SetMaxVotingPowerEventDTOBase { }

    [Event("SetMaxVotingPower")]
    public class SetMaxVotingPowerEventDTOBase : IEventDTO
    {
        [Parameter("uint256", "maxVotingPower", 1, false )]
        public virtual BigInteger MaxVotingPower { get; set; }
    }

    public partial class SetMinInclusionVotingPowerEventDTO : SetMinInclusionVotingPowerEventDTOBase { }

    [Event("SetMinInclusionVotingPower")]
    public class SetMinInclusionVotingPowerEventDTOBase : IEventDTO
    {
        [Parameter("uint256", "minInclusionVotingPower", 1, false )]
        public virtual BigInteger MinInclusionVotingPower { get; set; }
    }

    public partial class SetNumAggregatorsEventDTO : SetNumAggregatorsEventDTOBase { }

    [Event("SetNumAggregators")]
    public class SetNumAggregatorsEventDTOBase : IEventDTO
    {
        [Parameter("uint208", "numAggregators", 1, false )]
        public virtual BigInteger NumAggregators { get; set; }
    }

    public partial class SetNumCommittersEventDTO : SetNumCommittersEventDTOBase { }

    [Event("SetNumCommitters")]
    public class SetNumCommittersEventDTOBase : IEventDTO
    {
        [Parameter("uint208", "numCommitters", 1, false )]
        public virtual BigInteger NumCommitters { get; set; }
    }

    public partial class SetRequiredHeaderKeyTagEventDTO : SetRequiredHeaderKeyTagEventDTOBase { }

    [Event("SetRequiredHeaderKeyTag")]
    public class SetRequiredHeaderKeyTagEventDTOBase : IEventDTO
    {
        [Parameter("uint8", "requiredHeaderKeyTag", 1, false )]
        public virtual byte RequiredHeaderKeyTag { get; set; }
    }

    public partial class SetRequiredKeyTagsEventDTO : SetRequiredKeyTagsEventDTOBase { }

    [Event("SetRequiredKeyTags")]
    public class SetRequiredKeyTagsEventDTOBase : IEventDTO
    {
        [Parameter("uint8[]", "requiredKeyTags", 1, false )]
        public virtual List<byte> RequiredKeyTags { get; set; }
    }

    public partial class SetVerificationTypeEventDTO : SetVerificationTypeEventDTOBase { }

    [Event("SetVerificationType")]
    public class SetVerificationTypeEventDTOBase : IEventDTO
    {
        [Parameter("uint32", "verificationType", 1, false )]
        public virtual uint VerificationType { get; set; }
    }

    public partial class AddressEmptyCodeError : AddressEmptyCodeErrorBase { }

    [Error("AddressEmptyCode")]
    public class AddressEmptyCodeErrorBase : IErrorDTO
    {
        [Parameter("address", "target", 1)]
        public virtual string Target { get; set; }
    }

    public partial class CheckpointUnorderedInsertionError : CheckpointUnorderedInsertionErrorBase { }
    [Error("CheckpointUnorderedInsertion")]
    public class CheckpointUnorderedInsertionErrorBase : IErrorDTO
    {
    }

    public partial class DuplicateKeyTagError : DuplicateKeyTagErrorBase { }
    [Error("DuplicateKeyTag")]
    public class DuplicateKeyTagErrorBase : IErrorDTO
    {
    }

    public partial class EpochmanagerInvalidepochdurationError : EpochmanagerInvalidepochdurationErrorBase { }
    [Error("EpochManager_InvalidEpochDuration")]
    public class EpochmanagerInvalidepochdurationErrorBase : IErrorDTO
    {
    }

    public partial class EpochmanagerInvalidepochdurationtimestampError : EpochmanagerInvalidepochdurationtimestampErrorBase { }
    [Error("EpochManager_InvalidEpochDurationTimestamp")]
    public class EpochmanagerInvalidepochdurationtimestampErrorBase : IErrorDTO
    {
    }

    public partial class EpochmanagerToooldtimestampError : EpochmanagerToooldtimestampErrorBase { }
    [Error("EpochManager_TooOldTimestamp")]
    public class EpochmanagerToooldtimestampErrorBase : IErrorDTO
    {
    }

    public partial class FailedCallError : FailedCallErrorBase { }
    [Error("FailedCall")]
    public class FailedCallErrorBase : IErrorDTO
    {
    }

    public partial class InvalidInitializationError : InvalidInitializationErrorBase { }
    [Error("InvalidInitialization")]
    public class InvalidInitializationErrorBase : IErrorDTO
    {
    }

    public partial class InvalidKeyError : InvalidKeyErrorBase { }
    [Error("InvalidKey")]
    public class InvalidKeyErrorBase : IErrorDTO
    {
    }

    public partial class InvalidKeyTagError : InvalidKeyTagErrorBase { }
    [Error("InvalidKeyTag")]
    public class InvalidKeyTagErrorBase : IErrorDTO
    {
    }

    public partial class NetworkmanagerInvalidnetworkError : NetworkmanagerInvalidnetworkErrorBase { }
    [Error("NetworkManager_InvalidNetwork")]
    public class NetworkmanagerInvalidnetworkErrorBase : IErrorDTO
    {
    }

    public partial class NotInitializingError : NotInitializingErrorBase { }
    [Error("NotInitializing")]
    public class NotInitializingErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverChainalreadyaddedError : ValsetdriverChainalreadyaddedErrorBase { }
    [Error("ValSetDriver_ChainAlreadyAdded")]
    public class ValsetdriverChainalreadyaddedErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverInvalidcrosschainaddressError : ValsetdriverInvalidcrosschainaddressErrorBase { }
    [Error("ValSetDriver_InvalidCrossChainAddress")]
    public class ValsetdriverInvalidcrosschainaddressErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverInvalidmaxvalidatorscountError : ValsetdriverInvalidmaxvalidatorscountErrorBase { }
    [Error("ValSetDriver_InvalidMaxValidatorsCount")]
    public class ValsetdriverInvalidmaxvalidatorscountErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverInvalidquorumthresholdError : ValsetdriverInvalidquorumthresholdErrorBase { }
    [Error("ValSetDriver_InvalidQuorumThreshold")]
    public class ValsetdriverInvalidquorumthresholdErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverKeytagalreadyaddedError : ValsetdriverKeytagalreadyaddedErrorBase { }
    [Error("ValSetDriver_KeyTagAlreadyAdded")]
    public class ValsetdriverKeytagalreadyaddedErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverNotaddedError : ValsetdriverNotaddedErrorBase { }
    [Error("ValSetDriver_NotAdded")]
    public class ValsetdriverNotaddedErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverZerocommitterslotdurationError : ValsetdriverZerocommitterslotdurationErrorBase { }
    [Error("ValSetDriver_ZeroCommitterSlotDuration")]
    public class ValsetdriverZerocommitterslotdurationErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverZeronumaggregatorsError : ValsetdriverZeronumaggregatorsErrorBase { }
    [Error("ValSetDriver_ZeroNumAggregators")]
    public class ValsetdriverZeronumaggregatorsErrorBase : IErrorDTO
    {
    }

    public partial class ValsetdriverZeronumcommittersError : ValsetdriverZeronumcommittersErrorBase { }
    [Error("ValSetDriver_ZeroNumCommitters")]
    public class ValsetdriverZeronumcommittersErrorBase : IErrorDTO
    {
    }

    public partial class MaxQuorumThresholdOutputDTO : MaxQuorumThresholdOutputDTOBase { }

    [FunctionOutput]
    public class MaxQuorumThresholdOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint248", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class NetworkOutputDTO : NetworkOutputDTOBase { }

    [FunctionOutput]
    public class NetworkOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class SubnetworkOutputDTO : SubnetworkOutputDTOBase { }

    [FunctionOutput]
    public class SubnetworkOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class SubnetworkIdentifierOutputDTO : SubnetworkIdentifierOutputDTOBase { }

    [FunctionOutput]
    public class SubnetworkIdentifierOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint96", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }







    public partial class GetCommitterSlotDurationOutputDTO : GetCommitterSlotDurationOutputDTOBase { }

    [FunctionOutput]
    public class GetCommitterSlotDurationOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetCommitterSlotDurationAtOutputDTO : GetCommitterSlotDurationAtOutputDTOBase { }

    [FunctionOutput]
    public class GetCommitterSlotDurationAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetConfigOutputDTO : GetConfigOutputDTOBase { }

    [FunctionOutput]
    public class GetConfigOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple", "", 1)]
        public virtual Config ReturnValue1 { get; set; }
    }

    public partial class GetConfigAtOutputDTO : GetConfigAtOutputDTOBase { }

    [FunctionOutput]
    public class GetConfigAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple", "", 1)]
        public virtual Config ReturnValue1 { get; set; }
    }

    public partial class GetCurrentEpochOutputDTO : GetCurrentEpochOutputDTOBase { }

    [FunctionOutput]
    public class GetCurrentEpochOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetCurrentEpochDurationOutputDTO : GetCurrentEpochDurationOutputDTOBase { }

    [FunctionOutput]
    public class GetCurrentEpochDurationOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "epochDuration", 1)]
        public virtual ulong EpochDuration { get; set; }
    }

    public partial class GetCurrentEpochStartOutputDTO : GetCurrentEpochStartOutputDTOBase { }

    [FunctionOutput]
    public class GetCurrentEpochStartOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetEpochDurationOutputDTO : GetEpochDurationOutputDTOBase { }

    [FunctionOutput]
    public class GetEpochDurationOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "epochDuration", 1)]
        public virtual ulong EpochDuration { get; set; }
    }

    public partial class GetEpochIndexOutputDTO : GetEpochIndexOutputDTOBase { }

    [FunctionOutput]
    public class GetEpochIndexOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetEpochStartOutputDTO : GetEpochStartOutputDTOBase { }

    [FunctionOutput]
    public class GetEpochStartOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetKeysProviderOutputDTO : GetKeysProviderOutputDTOBase { }

    [FunctionOutput]
    public class GetKeysProviderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple", "", 1)]
        public virtual CrossChainAddress ReturnValue1 { get; set; }
    }

    public partial class GetKeysProviderAtOutputDTO : GetKeysProviderAtOutputDTOBase { }

    [FunctionOutput]
    public class GetKeysProviderAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple", "", 1)]
        public virtual CrossChainAddress ReturnValue1 { get; set; }
    }

    public partial class GetMaxValidatorsCountOutputDTO : GetMaxValidatorsCountOutputDTOBase { }

    [FunctionOutput]
    public class GetMaxValidatorsCountOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetMaxValidatorsCountAtOutputDTO : GetMaxValidatorsCountAtOutputDTOBase { }

    [FunctionOutput]
    public class GetMaxValidatorsCountAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetMaxVotingPowerOutputDTO : GetMaxVotingPowerOutputDTOBase { }

    [FunctionOutput]
    public class GetMaxVotingPowerOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetMaxVotingPowerAtOutputDTO : GetMaxVotingPowerAtOutputDTOBase { }

    [FunctionOutput]
    public class GetMaxVotingPowerAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetMinInclusionVotingPowerOutputDTO : GetMinInclusionVotingPowerOutputDTOBase { }

    [FunctionOutput]
    public class GetMinInclusionVotingPowerOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetMinInclusionVotingPowerAtOutputDTO : GetMinInclusionVotingPowerAtOutputDTOBase { }

    [FunctionOutput]
    public class GetMinInclusionVotingPowerAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetNextEpochOutputDTO : GetNextEpochOutputDTOBase { }

    [FunctionOutput]
    public class GetNextEpochOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetNextEpochDurationOutputDTO : GetNextEpochDurationOutputDTOBase { }

    [FunctionOutput]
    public class GetNextEpochDurationOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetNextEpochStartOutputDTO : GetNextEpochStartOutputDTOBase { }

    [FunctionOutput]
    public class GetNextEpochStartOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetNumAggregatorsOutputDTO : GetNumAggregatorsOutputDTOBase { }

    [FunctionOutput]
    public class GetNumAggregatorsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetNumAggregatorsAtOutputDTO : GetNumAggregatorsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetNumAggregatorsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetNumCommittersOutputDTO : GetNumCommittersOutputDTOBase { }

    [FunctionOutput]
    public class GetNumCommittersOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetNumCommittersAtOutputDTO : GetNumCommittersAtOutputDTOBase { }

    [FunctionOutput]
    public class GetNumCommittersAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetQuorumThresholdsOutputDTO : GetQuorumThresholdsOutputDTOBase { }

    [FunctionOutput]
    public class GetQuorumThresholdsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "quorumThresholds", 1)]
        public virtual List<QuorumThreshold> QuorumThresholds { get; set; }
    }

    public partial class GetQuorumThresholdsAtOutputDTO : GetQuorumThresholdsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetQuorumThresholdsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "quorumThresholds", 1)]
        public virtual List<QuorumThreshold> QuorumThresholds { get; set; }
    }

    public partial class GetRequiredHeaderKeyTagOutputDTO : GetRequiredHeaderKeyTagOutputDTOBase { }

    [FunctionOutput]
    public class GetRequiredHeaderKeyTagOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8", "", 1)]
        public virtual byte ReturnValue1 { get; set; }
    }

    public partial class GetRequiredHeaderKeyTagAtOutputDTO : GetRequiredHeaderKeyTagAtOutputDTOBase { }

    [FunctionOutput]
    public class GetRequiredHeaderKeyTagAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8", "", 1)]
        public virtual byte ReturnValue1 { get; set; }
    }

    public partial class GetRequiredKeyTagsOutputDTO : GetRequiredKeyTagsOutputDTOBase { }

    [FunctionOutput]
    public class GetRequiredKeyTagsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8[]", "requiredKeyTags", 1)]
        public virtual List<byte> RequiredKeyTags { get; set; }
    }

    public partial class GetRequiredKeyTagsAtOutputDTO : GetRequiredKeyTagsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetRequiredKeyTagsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8[]", "requiredKeyTags", 1)]
        public virtual List<byte> RequiredKeyTags { get; set; }
    }

    public partial class GetSettlementsOutputDTO : GetSettlementsOutputDTOBase { }

    [FunctionOutput]
    public class GetSettlementsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "settlements", 1)]
        public virtual List<CrossChainAddress> Settlements { get; set; }
    }

    public partial class GetSettlementsAtOutputDTO : GetSettlementsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetSettlementsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "settlements", 1)]
        public virtual List<CrossChainAddress> Settlements { get; set; }
    }

    public partial class GetVerificationTypeOutputDTO : GetVerificationTypeOutputDTOBase { }

    [FunctionOutput]
    public class GetVerificationTypeOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint32", "", 1)]
        public virtual uint ReturnValue1 { get; set; }
    }

    public partial class GetVerificationTypeAtOutputDTO : GetVerificationTypeAtOutputDTOBase { }

    [FunctionOutput]
    public class GetVerificationTypeAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint32", "", 1)]
        public virtual uint ReturnValue1 { get; set; }
    }

    public partial class GetVotingPowerProvidersOutputDTO : GetVotingPowerProvidersOutputDTOBase { }

    [FunctionOutput]
    public class GetVotingPowerProvidersOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "votingPowerProviders", 1)]
        public virtual List<CrossChainAddress> VotingPowerProviders { get; set; }
    }

    public partial class GetVotingPowerProvidersAtOutputDTO : GetVotingPowerProvidersAtOutputDTOBase { }

    [FunctionOutput]
    public class GetVotingPowerProvidersAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "votingPowerProviders", 1)]
        public virtual List<CrossChainAddress> VotingPowerProviders { get; set; }
    }

    public partial class IsQuorumThresholdRegisteredOutputDTO : IsQuorumThresholdRegisteredOutputDTOBase { }

    [FunctionOutput]
    public class IsQuorumThresholdRegisteredOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsQuorumThresholdRegisteredAtOutputDTO : IsQuorumThresholdRegisteredAtOutputDTOBase { }

    [FunctionOutput]
    public class IsQuorumThresholdRegisteredAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsSettlementRegisteredOutputDTO : IsSettlementRegisteredOutputDTOBase { }

    [FunctionOutput]
    public class IsSettlementRegisteredOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsSettlementRegisteredAtOutputDTO : IsSettlementRegisteredAtOutputDTOBase { }

    [FunctionOutput]
    public class IsSettlementRegisteredAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsVotingPowerProviderRegisteredOutputDTO : IsVotingPowerProviderRegisteredOutputDTOBase { }

    [FunctionOutput]
    public class IsVotingPowerProviderRegisteredOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsVotingPowerProviderRegisteredAtOutputDTO : IsVotingPowerProviderRegisteredAtOutputDTOBase { }

    [FunctionOutput]
    public class IsVotingPowerProviderRegisteredAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }
































}
