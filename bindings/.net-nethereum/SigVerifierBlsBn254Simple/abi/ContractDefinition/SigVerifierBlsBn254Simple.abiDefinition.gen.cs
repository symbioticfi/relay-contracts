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

namespace Symbiotic.Relay.SigVerifierBlsBn254Simple.abi.ContractDefinition
{


    public partial class SigVerifierBlsBn254Simple.abiDeployment : SigVerifierBlsBn254Simple.abiDeploymentBase
    {
        public SigVerifierBlsBn254Simple.abiDeployment() : base(BYTECODE) { }
        public SigVerifierBlsBn254Simple.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class SigVerifierBlsBn254Simple.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public SigVerifierBlsBn254Simple.abiDeploymentBase() : base(BYTECODE) { }
        public SigVerifierBlsBn254Simple.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class AggregatedPublicKeyG1HashFunction : AggregatedPublicKeyG1HashFunctionBase { }

    [Function("AGGREGATED_PUBLIC_KEY_G1_HASH", "bytes32")]
    public class AggregatedPublicKeyG1HashFunctionBase : FunctionMessage
    {

    }

    public partial class MaxValidatorsFunction : MaxValidatorsFunctionBase { }

    [Function("MAX_VALIDATORS", "uint256")]
    public class MaxValidatorsFunctionBase : FunctionMessage
    {

    }

    public partial class ValidatorSetHashKeccak256HashFunction : ValidatorSetHashKeccak256HashFunctionBase { }

    [Function("VALIDATOR_SET_HASH_KECCAK256_HASH", "bytes32")]
    public class ValidatorSetHashKeccak256HashFunctionBase : FunctionMessage
    {

    }

    public partial class VerificationTypeFunction : VerificationTypeFunctionBase { }

    [Function("VERIFICATION_TYPE", "uint32")]
    public class VerificationTypeFunctionBase : FunctionMessage
    {

    }

    public partial class VerifyQuorumSigFunction : VerifyQuorumSigFunctionBase { }

    [Function("verifyQuorumSig", "bool")]
    public class VerifyQuorumSigFunctionBase : FunctionMessage
    {
        [Parameter("address", "settlement", 1)]
        public virtual string Settlement { get; set; }
        [Parameter("uint48", "epoch", 2)]
        public virtual ulong Epoch { get; set; }
        [Parameter("bytes", "message", 3)]
        public virtual byte[] Message { get; set; }
        [Parameter("uint8", "keyTag", 4)]
        public virtual byte KeyTag { get; set; }
        [Parameter("uint256", "quorumThreshold", 5)]
        public virtual BigInteger QuorumThreshold { get; set; }
        [Parameter("bytes", "proof", 6)]
        public virtual byte[] Proof { get; set; }
    }

    public partial class InvalidKeyTagError : InvalidKeyTagErrorBase { }
    [Error("InvalidKeyTag")]
    public class InvalidKeyTagErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254simpleInvalidmessagelengthError : Sigverifierblsbn254simpleInvalidmessagelengthErrorBase { }
    [Error("SigVerifierBlsBn254Simple_InvalidMessageLength")]
    public class Sigverifierblsbn254simpleInvalidmessagelengthErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254simpleInvalidnonsignerindexError : Sigverifierblsbn254simpleInvalidnonsignerindexErrorBase { }
    [Error("SigVerifierBlsBn254Simple_InvalidNonSignerIndex")]
    public class Sigverifierblsbn254simpleInvalidnonsignerindexErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254simpleInvalidnonsignersorderError : Sigverifierblsbn254simpleInvalidnonsignersorderErrorBase { }
    [Error("SigVerifierBlsBn254Simple_InvalidNonSignersOrder")]
    public class Sigverifierblsbn254simpleInvalidnonsignersorderErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254simpleInvalidprooflengthError : Sigverifierblsbn254simpleInvalidprooflengthErrorBase { }
    [Error("SigVerifierBlsBn254Simple_InvalidProofLength")]
    public class Sigverifierblsbn254simpleInvalidprooflengthErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254simpleInvalidproofoffsetError : Sigverifierblsbn254simpleInvalidproofoffsetErrorBase { }
    [Error("SigVerifierBlsBn254Simple_InvalidProofOffset")]
    public class Sigverifierblsbn254simpleInvalidproofoffsetErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254simpleToomanyvalidatorsError : Sigverifierblsbn254simpleToomanyvalidatorsErrorBase { }
    [Error("SigVerifierBlsBn254Simple_TooManyValidators")]
    public class Sigverifierblsbn254simpleToomanyvalidatorsErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254simpleUnsupportedkeytagError : Sigverifierblsbn254simpleUnsupportedkeytagErrorBase { }
    [Error("SigVerifierBlsBn254Simple_UnsupportedKeyTag")]
    public class Sigverifierblsbn254simpleUnsupportedkeytagErrorBase : IErrorDTO
    {
    }

    public partial class AggregatedPublicKeyG1HashOutputDTO : AggregatedPublicKeyG1HashOutputDTOBase { }

    [FunctionOutput]
    public class AggregatedPublicKeyG1HashOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class MaxValidatorsOutputDTO : MaxValidatorsOutputDTOBase { }

    [FunctionOutput]
    public class MaxValidatorsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class ValidatorSetHashKeccak256HashOutputDTO : ValidatorSetHashKeccak256HashOutputDTOBase { }

    [FunctionOutput]
    public class ValidatorSetHashKeccak256HashOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class VerificationTypeOutputDTO : VerificationTypeOutputDTOBase { }

    [FunctionOutput]
    public class VerificationTypeOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint32", "", 1)]
        public virtual uint ReturnValue1 { get; set; }
    }

    public partial class VerifyQuorumSigOutputDTO : VerifyQuorumSigOutputDTOBase { }

    [FunctionOutput]
    public class VerifyQuorumSigOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }
}
