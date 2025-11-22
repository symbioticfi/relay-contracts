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

namespace Symbiotic.Relay.IPricedTokensChainlinkVPCalc.abi.ContractDefinition
{


    public partial class IPricedTokensChainlinkVPCalc.abiDeployment : IPricedTokensChainlinkVPCalc.abiDeploymentBase
    {
        public IPricedTokensChainlinkVPCalc.abiDeployment() : base(BYTECODE) { }
        public IPricedTokensChainlinkVPCalc.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IPricedTokensChainlinkVPCalc.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IPricedTokensChainlinkVPCalc.abiDeploymentBase() : base(BYTECODE) { }
        public IPricedTokensChainlinkVPCalc.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class GetTokenHopsFunction : GetTokenHopsFunctionBase { }

    [Function("getTokenHops", typeof(GetTokenHopsOutputDTO))]
    public class GetTokenHopsFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
    }

    public partial class GetTokenHopsAtFunction : GetTokenHopsAtFunctionBase { }

    [Function("getTokenHopsAt", typeof(GetTokenHopsAtOutputDTO))]
    public class GetTokenHopsAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetTokenPriceFunction : GetTokenPriceFunctionBase { }

    [Function("getTokenPrice", "uint256")]
    public class GetTokenPriceFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
    }

    public partial class GetTokenPriceAtFunction : GetTokenPriceAtFunctionBase { }

    [Function("getTokenPriceAt", "uint256")]
    public class GetTokenPriceAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class SetTokenHopsFunction : SetTokenHopsFunctionBase { }

    [Function("setTokenHops")]
    public class SetTokenHopsFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
        [Parameter("address[2]", "aggregators", 2)]
        public virtual List<string> Aggregators { get; set; }
        [Parameter("bool[2]", "inverts", 3)]
        public virtual List<bool> Inverts { get; set; }
        [Parameter("uint48[2]", "stalenessDurations", 4)]
        public virtual List<ulong> StalenessDurations { get; set; }
    }

    public partial class SetTokenHopsEventDTO : SetTokenHopsEventDTOBase { }

    [Event("SetTokenHops")]
    public class SetTokenHopsEventDTOBase : IEventDTO
    {
        [Parameter("address", "token", 1, true )]
        public virtual string Token { get; set; }
        [Parameter("address[2]", "aggregators", 2, false )]
        public virtual List<string> Aggregators { get; set; }
        [Parameter("bool[2]", "inverts", 3, false )]
        public virtual List<bool> Inverts { get; set; }
        [Parameter("uint48[2]", "stalenessDurations", 4, false )]
        public virtual List<ulong> StalenessDurations { get; set; }
    }

    public partial class PricedtokenschainlinkvpcalcInvalidaggregatorError : PricedtokenschainlinkvpcalcInvalidaggregatorErrorBase { }
    [Error("PricedTokensChainlinkVPCalc_InvalidAggregator")]
    public class PricedtokenschainlinkvpcalcInvalidaggregatorErrorBase : IErrorDTO
    {
    }

    public partial class GetTokenHopsOutputDTO : GetTokenHopsOutputDTOBase { }

    [FunctionOutput]
    public class GetTokenHopsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[2]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
        [Parameter("bool[2]", "", 2)]
        public virtual List<bool> ReturnValue2 { get; set; }
        [Parameter("uint48[2]", "", 3)]
        public virtual List<ulong> ReturnValue3 { get; set; }
    }

    public partial class GetTokenHopsAtOutputDTO : GetTokenHopsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetTokenHopsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[2]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
        [Parameter("bool[2]", "", 2)]
        public virtual List<bool> ReturnValue2 { get; set; }
        [Parameter("uint48[2]", "", 3)]
        public virtual List<ulong> ReturnValue3 { get; set; }
    }

    public partial class GetTokenPriceOutputDTO : GetTokenPriceOutputDTOBase { }

    [FunctionOutput]
    public class GetTokenPriceOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetTokenPriceAtOutputDTO : GetTokenPriceAtOutputDTOBase { }

    [FunctionOutput]
    public class GetTokenPriceAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }


}
