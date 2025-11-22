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

namespace Symbiotic.Relay.ISigVerifier.abi.ContractDefinition
{


    public partial class ISigVerifier.abiDeployment : ISigVerifier.abiDeploymentBase
    {
        public ISigVerifier.abiDeployment() : base(BYTECODE) { }
        public ISigVerifier.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class ISigVerifier.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public ISigVerifier.abiDeploymentBase() : base(BYTECODE) { }
        public ISigVerifier.abiDeploymentBase(string byteCode) : base(byteCode) { }

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
