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

namespace Symbiotic.Relay.PricedTokensChainlinkVPCalc.abi.ContractDefinition
{


    public partial class PricedTokensChainlinkVPCalc.abiDeployment : PricedTokensChainlinkVPCalc.abiDeploymentBase
    {
        public PricedTokensChainlinkVPCalc.abiDeployment() : base(BYTECODE) { }
        public PricedTokensChainlinkVPCalc.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class PricedTokensChainlinkVPCalc.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public PricedTokensChainlinkVPCalc.abiDeploymentBase() : base(BYTECODE) { }
        public PricedTokensChainlinkVPCalc.abiDeploymentBase(string byteCode) : base(byteCode) { }

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

    public partial class StakeToVotingPowerFunction : StakeToVotingPowerFunctionBase { }

    [Function("stakeToVotingPower", "uint256")]
    public class StakeToVotingPowerFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint256", "stake", 2)]
        public virtual BigInteger Stake { get; set; }
        [Parameter("bytes", "extraData", 3)]
        public virtual byte[] ExtraData { get; set; }
    }

    public partial class StakeToVotingPowerAtFunction : StakeToVotingPowerAtFunctionBase { }

    [Function("stakeToVotingPowerAt", "uint256")]
    public class StakeToVotingPowerAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint256", "stake", 2)]
        public virtual BigInteger Stake { get; set; }
        [Parameter("bytes", "extraData", 3)]
        public virtual byte[] ExtraData { get; set; }
        [Parameter("uint48", "timestamp", 4)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class InitializedEventDTO : InitializedEventDTOBase { }

    [Event("Initialized")]
    public class InitializedEventDTOBase : IEventDTO
    {
        [Parameter("uint64", "version", 1, false )]
        public virtual ulong Version { get; set; }
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

    public partial class CheckpointUnorderedInsertionError : CheckpointUnorderedInsertionErrorBase { }
    [Error("CheckpointUnorderedInsertion")]
    public class CheckpointUnorderedInsertionErrorBase : IErrorDTO
    {
    }

    public partial class InvalidInitializationError : InvalidInitializationErrorBase { }
    [Error("InvalidInitialization")]
    public class InvalidInitializationErrorBase : IErrorDTO
    {
    }

    public partial class NotInitializingError : NotInitializingErrorBase { }
    [Error("NotInitializing")]
    public class NotInitializingErrorBase : IErrorDTO
    {
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



    public partial class StakeToVotingPowerOutputDTO : StakeToVotingPowerOutputDTOBase { }

    [FunctionOutput]
    public class StakeToVotingPowerOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class StakeToVotingPowerAtOutputDTO : StakeToVotingPowerAtOutputDTOBase { }

    [FunctionOutput]
    public class StakeToVotingPowerAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }
}
