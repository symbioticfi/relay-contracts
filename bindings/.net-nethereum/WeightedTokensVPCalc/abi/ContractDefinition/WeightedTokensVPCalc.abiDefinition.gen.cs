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

namespace Symbiotic.Relay.WeightedTokensVPCalc.abi.ContractDefinition
{


    public partial class WeightedTokensVPCalc.abiDeployment : WeightedTokensVPCalc.abiDeploymentBase
    {
        public WeightedTokensVPCalc.abiDeployment() : base(BYTECODE) { }
        public WeightedTokensVPCalc.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class WeightedTokensVPCalc.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public WeightedTokensVPCalc.abiDeploymentBase() : base(BYTECODE) { }
        public WeightedTokensVPCalc.abiDeploymentBase(string byteCode) : base(byteCode) { }

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

    public partial class SetTokenWeightEventDTO : SetTokenWeightEventDTOBase { }

    [Event("SetTokenWeight")]
    public class SetTokenWeightEventDTOBase : IEventDTO
    {
        [Parameter("address", "token", 1, true )]
        public virtual string Token { get; set; }
        [Parameter("uint208", "weight", 2, false )]
        public virtual BigInteger Weight { get; set; }
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
