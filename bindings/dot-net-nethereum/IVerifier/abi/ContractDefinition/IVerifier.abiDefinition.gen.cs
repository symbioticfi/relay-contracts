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

namespace Symbiotic.Relay.IVerifier.abi.ContractDefinition
{


    public partial class IVerifier.abiDeployment : IVerifier.abiDeploymentBase
    {
        public IVerifier.abiDeployment() : base(BYTECODE) { }
        public IVerifier.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IVerifier.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IVerifier.abiDeploymentBase() : base(BYTECODE) { }
        public IVerifier.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class VerifyProofFunction : VerifyProofFunctionBase { }

    [Function("verifyProof")]
    public class VerifyProofFunctionBase : FunctionMessage
    {
        [Parameter("uint256[8]", "proof", 1)]
        public virtual List<BigInteger> Proof { get; set; }
        [Parameter("uint256[2]", "commitments", 2)]
        public virtual List<BigInteger> Commitments { get; set; }
        [Parameter("uint256[2]", "commitmentPok", 3)]
        public virtual List<BigInteger> CommitmentPok { get; set; }
        [Parameter("uint256[1]", "input", 4)]
        public virtual List<BigInteger> Input { get; set; }
    }


}
