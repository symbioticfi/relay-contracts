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

namespace Symbiotic.Relay.ISigVerifierBlsBn254ZK.abi.ContractDefinition
{


    public partial class ISigVerifierBlsBn254ZK.abiDeployment : ISigVerifierBlsBn254ZK.abiDeploymentBase
    {
        public ISigVerifierBlsBn254ZK.abiDeployment() : base(BYTECODE) { }
        public ISigVerifierBlsBn254ZK.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class ISigVerifierBlsBn254ZK.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public ISigVerifierBlsBn254ZK.abiDeploymentBase() : base(BYTECODE) { }
        public ISigVerifierBlsBn254ZK.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class TotalActiveValidatorsHashFunction : TotalActiveValidatorsHashFunctionBase { }

    [Function("TOTAL_ACTIVE_VALIDATORS_HASH", "bytes32")]
    public class TotalActiveValidatorsHashFunctionBase : FunctionMessage
    {

    }

    public partial class ValidatorSetHashMimcHashFunction : ValidatorSetHashMimcHashFunctionBase { }

    [Function("VALIDATOR_SET_HASH_MIMC_HASH", "bytes32")]
    public class ValidatorSetHashMimcHashFunctionBase : FunctionMessage
    {

    }

    public partial class VerificationTypeFunction : VerificationTypeFunctionBase { }

    [Function("VERIFICATION_TYPE", "uint32")]
    public class VerificationTypeFunctionBase : FunctionMessage
    {

    }

    public partial class MaxValidatorsFunction : MaxValidatorsFunctionBase { }

    [Function("maxValidators", "uint256")]
    public class MaxValidatorsFunctionBase : FunctionMessage
    {
        [Parameter("uint256", "index", 1)]
        public virtual BigInteger Index { get; set; }
    }

    public partial class VerifiersFunction : VerifiersFunctionBase { }

    [Function("verifiers", "address")]
    public class VerifiersFunctionBase : FunctionMessage
    {
        [Parameter("uint256", "index", 1)]
        public virtual BigInteger Index { get; set; }
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

    public partial class Sigverifierblsbn254zkInvalidlengthError : Sigverifierblsbn254zkInvalidlengthErrorBase { }
    [Error("SigVerifierBlsBn254ZK_InvalidLength")]
    public class Sigverifierblsbn254zkInvalidlengthErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254zkInvalidmaxvalidatorsError : Sigverifierblsbn254zkInvalidmaxvalidatorsErrorBase { }
    [Error("SigVerifierBlsBn254ZK_InvalidMaxValidators")]
    public class Sigverifierblsbn254zkInvalidmaxvalidatorsErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254zkInvalidmaxvalidatorsorderError : Sigverifierblsbn254zkInvalidmaxvalidatorsorderErrorBase { }
    [Error("SigVerifierBlsBn254ZK_InvalidMaxValidatorsOrder")]
    public class Sigverifierblsbn254zkInvalidmaxvalidatorsorderErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254zkInvalidmessagelengthError : Sigverifierblsbn254zkInvalidmessagelengthErrorBase { }
    [Error("SigVerifierBlsBn254ZK_InvalidMessageLength")]
    public class Sigverifierblsbn254zkInvalidmessagelengthErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254zkInvalidprooflengthError : Sigverifierblsbn254zkInvalidprooflengthErrorBase { }
    [Error("SigVerifierBlsBn254ZK_InvalidProofLength")]
    public class Sigverifierblsbn254zkInvalidprooflengthErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254zkInvalidproofoffsetError : Sigverifierblsbn254zkInvalidproofoffsetErrorBase { }
    [Error("SigVerifierBlsBn254ZK_InvalidProofOffset")]
    public class Sigverifierblsbn254zkInvalidproofoffsetErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254zkInvalidtotalactivevalidatorsError : Sigverifierblsbn254zkInvalidtotalactivevalidatorsErrorBase { }
    [Error("SigVerifierBlsBn254ZK_InvalidTotalActiveValidators")]
    public class Sigverifierblsbn254zkInvalidtotalactivevalidatorsErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254zkInvalidverifierError : Sigverifierblsbn254zkInvalidverifierErrorBase { }
    [Error("SigVerifierBlsBn254ZK_InvalidVerifier")]
    public class Sigverifierblsbn254zkInvalidverifierErrorBase : IErrorDTO
    {
    }

    public partial class Sigverifierblsbn254zkUnsupportedkeytagError : Sigverifierblsbn254zkUnsupportedkeytagErrorBase { }
    [Error("SigVerifierBlsBn254ZK_UnsupportedKeyTag")]
    public class Sigverifierblsbn254zkUnsupportedkeytagErrorBase : IErrorDTO
    {
    }

    public partial class TotalActiveValidatorsHashOutputDTO : TotalActiveValidatorsHashOutputDTOBase { }

    [FunctionOutput]
    public class TotalActiveValidatorsHashOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class ValidatorSetHashMimcHashOutputDTO : ValidatorSetHashMimcHashOutputDTOBase { }

    [FunctionOutput]
    public class ValidatorSetHashMimcHashOutputDTOBase : IFunctionOutputDTO 
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

    public partial class MaxValidatorsOutputDTO : MaxValidatorsOutputDTOBase { }

    [FunctionOutput]
    public class MaxValidatorsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class VerifiersOutputDTO : VerifiersOutputDTOBase { }

    [FunctionOutput]
    public class VerifiersOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class VerifyQuorumSigOutputDTO : VerifyQuorumSigOutputDTOBase { }

    [FunctionOutput]
    public class VerifyQuorumSigOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }
}
