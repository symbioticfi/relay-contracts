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

namespace Symbiotic.Relay.ISettlement.abi.ContractDefinition
{


    public partial class ISettlement.abiDeployment : ISettlement.abiDeploymentBase
    {
        public ISettlement.abiDeployment() : base(BYTECODE) { }
        public ISettlement.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class ISettlement.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public ISettlement.abiDeploymentBase() : base(BYTECODE) { }
        public ISettlement.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class ValidatorSetVersionFunction : ValidatorSetVersionFunctionBase { }

    [Function("VALIDATOR_SET_VERSION", "uint8")]
    public class ValidatorSetVersionFunctionBase : FunctionMessage
    {

    }

    public partial class CommitValSetHeaderFunction : CommitValSetHeaderFunctionBase { }

    [Function("commitValSetHeader")]
    public class CommitValSetHeaderFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "header", 1)]
        public virtual ValSetHeader Header { get; set; }
        [Parameter("tuple[]", "extraData", 2)]
        public virtual List<ExtraData> ExtraData { get; set; }
        [Parameter("bytes", "proof", 3)]
        public virtual byte[] Proof { get; set; }
    }

    public partial class GetCaptureTimestampFromValSetHeaderFunction : GetCaptureTimestampFromValSetHeaderFunctionBase { }

    [Function("getCaptureTimestampFromValSetHeader", "uint48")]
    public class GetCaptureTimestampFromValSetHeaderFunctionBase : FunctionMessage
    {

    }

    public partial class GetCaptureTimestampFromValSetHeaderAtFunction : GetCaptureTimestampFromValSetHeaderAtFunctionBase { }

    [Function("getCaptureTimestampFromValSetHeaderAt", "uint48")]
    public class GetCaptureTimestampFromValSetHeaderAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetExtraDataFunction : GetExtraDataFunctionBase { }

    [Function("getExtraData", "bytes32")]
    public class GetExtraDataFunctionBase : FunctionMessage
    {
        [Parameter("bytes32", "key", 1)]
        public virtual byte[] Key { get; set; }
    }

    public partial class GetExtraDataAtFunction : GetExtraDataAtFunctionBase { }

    [Function("getExtraDataAt", "bytes32")]
    public class GetExtraDataAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
        [Parameter("bytes32", "key", 2)]
        public virtual byte[] Key { get; set; }
    }

    public partial class GetLastCommittedHeaderEpochFunction : GetLastCommittedHeaderEpochFunctionBase { }

    [Function("getLastCommittedHeaderEpoch", "uint48")]
    public class GetLastCommittedHeaderEpochFunctionBase : FunctionMessage
    {

    }

    public partial class GetQuorumThresholdFromValSetHeaderFunction : GetQuorumThresholdFromValSetHeaderFunctionBase { }

    [Function("getQuorumThresholdFromValSetHeader", "uint256")]
    public class GetQuorumThresholdFromValSetHeaderFunctionBase : FunctionMessage
    {

    }

    public partial class GetQuorumThresholdFromValSetHeaderAtFunction : GetQuorumThresholdFromValSetHeaderAtFunctionBase { }

    [Function("getQuorumThresholdFromValSetHeaderAt", "uint256")]
    public class GetQuorumThresholdFromValSetHeaderAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetRequiredKeyTagFromValSetHeaderFunction : GetRequiredKeyTagFromValSetHeaderFunctionBase { }

    [Function("getRequiredKeyTagFromValSetHeader", "uint8")]
    public class GetRequiredKeyTagFromValSetHeaderFunctionBase : FunctionMessage
    {

    }

    public partial class GetRequiredKeyTagFromValSetHeaderAtFunction : GetRequiredKeyTagFromValSetHeaderAtFunctionBase { }

    [Function("getRequiredKeyTagFromValSetHeaderAt", "uint8")]
    public class GetRequiredKeyTagFromValSetHeaderAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetSigVerifierFunction : GetSigVerifierFunctionBase { }

    [Function("getSigVerifier", "address")]
    public class GetSigVerifierFunctionBase : FunctionMessage
    {

    }

    public partial class GetSigVerifierAtFunction : GetSigVerifierAtFunctionBase { }

    [Function("getSigVerifierAt", "address")]
    public class GetSigVerifierAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
        [Parameter("bytes", "hint", 2)]
        public virtual byte[] Hint { get; set; }
    }

    public partial class GetTotalVotingPowerFromValSetHeaderFunction : GetTotalVotingPowerFromValSetHeaderFunctionBase { }

    [Function("getTotalVotingPowerFromValSetHeader", "uint256")]
    public class GetTotalVotingPowerFromValSetHeaderFunctionBase : FunctionMessage
    {

    }

    public partial class GetTotalVotingPowerFromValSetHeaderAtFunction : GetTotalVotingPowerFromValSetHeaderAtFunctionBase { }

    [Function("getTotalVotingPowerFromValSetHeaderAt", "uint256")]
    public class GetTotalVotingPowerFromValSetHeaderAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetValSetHeaderFunction : GetValSetHeaderFunctionBase { }

    [Function("getValSetHeader", typeof(GetValSetHeaderOutputDTO))]
    public class GetValSetHeaderFunctionBase : FunctionMessage
    {

    }

    public partial class GetValSetHeaderAtFunction : GetValSetHeaderAtFunctionBase { }

    [Function("getValSetHeaderAt", typeof(GetValSetHeaderAtOutputDTO))]
    public class GetValSetHeaderAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetValSetHeaderHashFunction : GetValSetHeaderHashFunctionBase { }

    [Function("getValSetHeaderHash", "bytes32")]
    public class GetValSetHeaderHashFunctionBase : FunctionMessage
    {

    }

    public partial class GetValSetHeaderHashAtFunction : GetValSetHeaderHashAtFunctionBase { }

    [Function("getValSetHeaderHashAt", "bytes32")]
    public class GetValSetHeaderHashAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetValidatorsSszMRootFromValSetHeaderFunction : GetValidatorsSszMRootFromValSetHeaderFunctionBase { }

    [Function("getValidatorsSszMRootFromValSetHeader", "bytes32")]
    public class GetValidatorsSszMRootFromValSetHeaderFunctionBase : FunctionMessage
    {

    }

    public partial class GetValidatorsSszMRootFromValSetHeaderAtFunction : GetValidatorsSszMRootFromValSetHeaderAtFunctionBase { }

    [Function("getValidatorsSszMRootFromValSetHeaderAt", "bytes32")]
    public class GetValidatorsSszMRootFromValSetHeaderAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetVersionFromValSetHeaderFunction : GetVersionFromValSetHeaderFunctionBase { }

    [Function("getVersionFromValSetHeader", "uint8")]
    public class GetVersionFromValSetHeaderFunctionBase : FunctionMessage
    {

    }

    public partial class GetVersionFromValSetHeaderAtFunction : GetVersionFromValSetHeaderAtFunctionBase { }

    [Function("getVersionFromValSetHeaderAt", "uint8")]
    public class GetVersionFromValSetHeaderAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class IsValSetHeaderCommittedAtFunction : IsValSetHeaderCommittedAtFunctionBase { }

    [Function("isValSetHeaderCommittedAt", "bool")]
    public class IsValSetHeaderCommittedAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class SetGenesisFunction : SetGenesisFunctionBase { }

    [Function("setGenesis")]
    public class SetGenesisFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "valSetHeader", 1)]
        public virtual ValSetHeader ValSetHeader { get; set; }
        [Parameter("tuple[]", "extraData", 2)]
        public virtual List<ExtraData> ExtraData { get; set; }
    }

    public partial class SetSigVerifierFunction : SetSigVerifierFunctionBase { }

    [Function("setSigVerifier")]
    public class SetSigVerifierFunctionBase : FunctionMessage
    {
        [Parameter("address", "sigVerifier", 1)]
        public virtual string SigVerifier { get; set; }
    }

    public partial class VerifyQuorumSigFunction : VerifyQuorumSigFunctionBase { }

    [Function("verifyQuorumSig", "bool")]
    public class VerifyQuorumSigFunctionBase : FunctionMessage
    {
        [Parameter("bytes", "message", 1)]
        public virtual byte[] Message { get; set; }
        [Parameter("uint8", "keyTag", 2)]
        public virtual byte KeyTag { get; set; }
        [Parameter("uint256", "quorumThreshold", 3)]
        public virtual BigInteger QuorumThreshold { get; set; }
        [Parameter("bytes", "proof", 4)]
        public virtual byte[] Proof { get; set; }
    }

    public partial class VerifyQuorumSigAtFunction : VerifyQuorumSigAtFunctionBase { }

    [Function("verifyQuorumSigAt", "bool")]
    public class VerifyQuorumSigAtFunctionBase : FunctionMessage
    {
        [Parameter("bytes", "message", 1)]
        public virtual byte[] Message { get; set; }
        [Parameter("uint8", "keyTag", 2)]
        public virtual byte KeyTag { get; set; }
        [Parameter("uint256", "quorumThreshold", 3)]
        public virtual BigInteger QuorumThreshold { get; set; }
        [Parameter("bytes", "proof", 4)]
        public virtual byte[] Proof { get; set; }
        [Parameter("uint48", "epoch", 5)]
        public virtual ulong Epoch { get; set; }
        [Parameter("bytes", "hint", 6)]
        public virtual byte[] Hint { get; set; }
    }

    public partial class CommitValSetHeaderEventDTO : CommitValSetHeaderEventDTOBase { }

    [Event("CommitValSetHeader")]
    public class CommitValSetHeaderEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "valSetHeader", 1, false )]
        public virtual ValSetHeader ValSetHeader { get; set; }
        [Parameter("tuple[]", "extraData", 2, false )]
        public virtual List<ExtraData> ExtraData { get; set; }
    }

    public partial class InitSigVerifierEventDTO : InitSigVerifierEventDTOBase { }

    [Event("InitSigVerifier")]
    public class InitSigVerifierEventDTOBase : IEventDTO
    {
        [Parameter("address", "sigVerifier", 1, false )]
        public virtual string SigVerifier { get; set; }
    }

    public partial class SetGenesisEventDTO : SetGenesisEventDTOBase { }

    [Event("SetGenesis")]
    public class SetGenesisEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "valSetHeader", 1, false )]
        public virtual ValSetHeader ValSetHeader { get; set; }
        [Parameter("tuple[]", "extraData", 2, false )]
        public virtual List<ExtraData> ExtraData { get; set; }
    }

    public partial class SetSigVerifierEventDTO : SetSigVerifierEventDTOBase { }

    [Event("SetSigVerifier")]
    public class SetSigVerifierEventDTOBase : IEventDTO
    {
        [Parameter("address", "sigVerifier", 1, false )]
        public virtual string SigVerifier { get; set; }
    }

    public partial class SettlementDuplicateextradatakeyError : SettlementDuplicateextradatakeyErrorBase { }
    [Error("Settlement_DuplicateExtraDataKey")]
    public class SettlementDuplicateextradatakeyErrorBase : IErrorDTO
    {
    }

    public partial class SettlementInvalidcapturetimestampError : SettlementInvalidcapturetimestampErrorBase { }
    [Error("Settlement_InvalidCaptureTimestamp")]
    public class SettlementInvalidcapturetimestampErrorBase : IErrorDTO
    {
    }

    public partial class SettlementInvalidepochError : SettlementInvalidepochErrorBase { }
    [Error("Settlement_InvalidEpoch")]
    public class SettlementInvalidepochErrorBase : IErrorDTO
    {
    }

    public partial class SettlementInvalidsigverifierError : SettlementInvalidsigverifierErrorBase { }
    [Error("Settlement_InvalidSigVerifier")]
    public class SettlementInvalidsigverifierErrorBase : IErrorDTO
    {
    }

    public partial class SettlementInvalidvalidatorssszmrootError : SettlementInvalidvalidatorssszmrootErrorBase { }
    [Error("Settlement_InvalidValidatorsSszMRoot")]
    public class SettlementInvalidvalidatorssszmrootErrorBase : IErrorDTO
    {
    }

    public partial class SettlementInvalidversionError : SettlementInvalidversionErrorBase { }
    [Error("Settlement_InvalidVersion")]
    public class SettlementInvalidversionErrorBase : IErrorDTO
    {
    }

    public partial class SettlementQuorumthresholdgttotalvotingpowerError : SettlementQuorumthresholdgttotalvotingpowerErrorBase { }
    [Error("Settlement_QuorumThresholdGtTotalVotingPower")]
    public class SettlementQuorumthresholdgttotalvotingpowerErrorBase : IErrorDTO
    {
    }

    public partial class SettlementValsetheaderalreadycommittedError : SettlementValsetheaderalreadycommittedErrorBase { }
    [Error("Settlement_ValSetHeaderAlreadyCommitted")]
    public class SettlementValsetheaderalreadycommittedErrorBase : IErrorDTO
    {
    }

    public partial class SettlementVerificationfailedError : SettlementVerificationfailedErrorBase { }
    [Error("Settlement_VerificationFailed")]
    public class SettlementVerificationfailedErrorBase : IErrorDTO
    {
    }

    public partial class ValidatorSetVersionOutputDTO : ValidatorSetVersionOutputDTOBase { }

    [FunctionOutput]
    public class ValidatorSetVersionOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8", "", 1)]
        public virtual byte ReturnValue1 { get; set; }
    }



    public partial class GetCaptureTimestampFromValSetHeaderOutputDTO : GetCaptureTimestampFromValSetHeaderOutputDTOBase { }

    [FunctionOutput]
    public class GetCaptureTimestampFromValSetHeaderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetCaptureTimestampFromValSetHeaderAtOutputDTO : GetCaptureTimestampFromValSetHeaderAtOutputDTOBase { }

    [FunctionOutput]
    public class GetCaptureTimestampFromValSetHeaderAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetExtraDataOutputDTO : GetExtraDataOutputDTOBase { }

    [FunctionOutput]
    public class GetExtraDataOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class GetExtraDataAtOutputDTO : GetExtraDataAtOutputDTOBase { }

    [FunctionOutput]
    public class GetExtraDataAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class GetLastCommittedHeaderEpochOutputDTO : GetLastCommittedHeaderEpochOutputDTOBase { }

    [FunctionOutput]
    public class GetLastCommittedHeaderEpochOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetQuorumThresholdFromValSetHeaderOutputDTO : GetQuorumThresholdFromValSetHeaderOutputDTOBase { }

    [FunctionOutput]
    public class GetQuorumThresholdFromValSetHeaderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetQuorumThresholdFromValSetHeaderAtOutputDTO : GetQuorumThresholdFromValSetHeaderAtOutputDTOBase { }

    [FunctionOutput]
    public class GetQuorumThresholdFromValSetHeaderAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetRequiredKeyTagFromValSetHeaderOutputDTO : GetRequiredKeyTagFromValSetHeaderOutputDTOBase { }

    [FunctionOutput]
    public class GetRequiredKeyTagFromValSetHeaderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8", "", 1)]
        public virtual byte ReturnValue1 { get; set; }
    }

    public partial class GetRequiredKeyTagFromValSetHeaderAtOutputDTO : GetRequiredKeyTagFromValSetHeaderAtOutputDTOBase { }

    [FunctionOutput]
    public class GetRequiredKeyTagFromValSetHeaderAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8", "", 1)]
        public virtual byte ReturnValue1 { get; set; }
    }

    public partial class GetSigVerifierOutputDTO : GetSigVerifierOutputDTOBase { }

    [FunctionOutput]
    public class GetSigVerifierOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class GetSigVerifierAtOutputDTO : GetSigVerifierAtOutputDTOBase { }

    [FunctionOutput]
    public class GetSigVerifierAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class GetTotalVotingPowerFromValSetHeaderOutputDTO : GetTotalVotingPowerFromValSetHeaderOutputDTOBase { }

    [FunctionOutput]
    public class GetTotalVotingPowerFromValSetHeaderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetTotalVotingPowerFromValSetHeaderAtOutputDTO : GetTotalVotingPowerFromValSetHeaderAtOutputDTOBase { }

    [FunctionOutput]
    public class GetTotalVotingPowerFromValSetHeaderAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetValSetHeaderOutputDTO : GetValSetHeaderOutputDTOBase { }

    [FunctionOutput]
    public class GetValSetHeaderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple", "", 1)]
        public virtual ValSetHeader ReturnValue1 { get; set; }
    }

    public partial class GetValSetHeaderAtOutputDTO : GetValSetHeaderAtOutputDTOBase { }

    [FunctionOutput]
    public class GetValSetHeaderAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple", "", 1)]
        public virtual ValSetHeader ReturnValue1 { get; set; }
    }

    public partial class GetValSetHeaderHashOutputDTO : GetValSetHeaderHashOutputDTOBase { }

    [FunctionOutput]
    public class GetValSetHeaderHashOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class GetValSetHeaderHashAtOutputDTO : GetValSetHeaderHashAtOutputDTOBase { }

    [FunctionOutput]
    public class GetValSetHeaderHashAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class GetValidatorsSszMRootFromValSetHeaderOutputDTO : GetValidatorsSszMRootFromValSetHeaderOutputDTOBase { }

    [FunctionOutput]
    public class GetValidatorsSszMRootFromValSetHeaderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class GetValidatorsSszMRootFromValSetHeaderAtOutputDTO : GetValidatorsSszMRootFromValSetHeaderAtOutputDTOBase { }

    [FunctionOutput]
    public class GetValidatorsSszMRootFromValSetHeaderAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class GetVersionFromValSetHeaderOutputDTO : GetVersionFromValSetHeaderOutputDTOBase { }

    [FunctionOutput]
    public class GetVersionFromValSetHeaderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8", "", 1)]
        public virtual byte ReturnValue1 { get; set; }
    }

    public partial class GetVersionFromValSetHeaderAtOutputDTO : GetVersionFromValSetHeaderAtOutputDTOBase { }

    [FunctionOutput]
    public class GetVersionFromValSetHeaderAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8", "", 1)]
        public virtual byte ReturnValue1 { get; set; }
    }

    public partial class IsValSetHeaderCommittedAtOutputDTO : IsValSetHeaderCommittedAtOutputDTOBase { }

    [FunctionOutput]
    public class IsValSetHeaderCommittedAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }





    public partial class VerifyQuorumSigOutputDTO : VerifyQuorumSigOutputDTOBase { }

    [FunctionOutput]
    public class VerifyQuorumSigOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class VerifyQuorumSigAtOutputDTO : VerifyQuorumSigAtOutputDTOBase { }

    [FunctionOutput]
    public class VerifyQuorumSigAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }
}
