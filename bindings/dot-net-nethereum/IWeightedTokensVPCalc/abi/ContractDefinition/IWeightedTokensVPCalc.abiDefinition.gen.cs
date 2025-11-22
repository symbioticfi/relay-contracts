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

namespace Symbiotic.Relay.IWeightedTokensVPCalc.abi.ContractDefinition
{


    public partial class IWeightedTokensVPCalc.abiDeployment : IWeightedTokensVPCalc.abiDeploymentBase
    {
        public IWeightedTokensVPCalc.abiDeployment() : base(BYTECODE) { }
        public IWeightedTokensVPCalc.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IWeightedTokensVPCalc.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IWeightedTokensVPCalc.abiDeploymentBase() : base(BYTECODE) { }
        public IWeightedTokensVPCalc.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class GetTokenWeightFunction : GetTokenWeightFunctionBase { }

    [Function("getTokenWeight", "uint208")]
    public class GetTokenWeightFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
    }

    public partial class GetTokenWeightAtFunction : GetTokenWeightAtFunctionBase { }

    [Function("getTokenWeightAt", "uint208")]
    public class GetTokenWeightAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class SetTokenWeightFunction : SetTokenWeightFunctionBase { }

    [Function("setTokenWeight")]
    public class SetTokenWeightFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
        [Parameter("uint208", "weight", 2)]
        public virtual BigInteger Weight { get; set; }
    }

    public partial class SetTokenWeightEventDTO : SetTokenWeightEventDTOBase { }

    [Event("SetTokenWeight")]
    public class SetTokenWeightEventDTOBase : IEventDTO
    {
        [Parameter("address", "token", 1, true )]
        public virtual string Token { get; set; }
        [Parameter("uint208", "weight", 2, false )]
        public virtual BigInteger Weight { get; set; }
    }

    public partial class WeightedtokensvpcalcToolargeweightError : WeightedtokensvpcalcToolargeweightErrorBase { }
    [Error("WeightedTokensVPCalc_TooLargeWeight")]
    public class WeightedtokensvpcalcToolargeweightErrorBase : IErrorDTO
    {
    }

    public partial class GetTokenWeightOutputDTO : GetTokenWeightOutputDTOBase { }

    [FunctionOutput]
    public class GetTokenWeightOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetTokenWeightAtOutputDTO : GetTokenWeightAtOutputDTOBase { }

    [FunctionOutput]
    public class GetTokenWeightAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }


}
