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

namespace Symbiotic.Relay.IMultiToken.abi.ContractDefinition
{


    public partial class IMultiToken.abiDeployment : IMultiToken.abiDeploymentBase
    {
        public IMultiToken.abiDeployment() : base(BYTECODE) { }
        public IMultiToken.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IMultiToken.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IMultiToken.abiDeploymentBase() : base(BYTECODE) { }
        public IMultiToken.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class RegisterTokenFunction : RegisterTokenFunctionBase { }

    [Function("registerToken")]
    public class RegisterTokenFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
    }

    public partial class UnregisterTokenFunction : UnregisterTokenFunctionBase { }

    [Function("unregisterToken")]
    public class UnregisterTokenFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
    }




}
