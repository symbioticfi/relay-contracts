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

namespace Symbiotic.Relay.WeightedVaultsVPCalc.abi.ContractDefinition
{


    public partial class WeightedVaultsVPCalc.abiDeployment : WeightedVaultsVPCalc.abiDeploymentBase
    {
        public WeightedVaultsVPCalc.abiDeployment() : base(BYTECODE) { }
        public WeightedVaultsVPCalc.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class WeightedVaultsVPCalc.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public WeightedVaultsVPCalc.abiDeploymentBase() : base(BYTECODE) { }
        public WeightedVaultsVPCalc.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class GetVaultWeightFunction : GetVaultWeightFunctionBase { }

    [Function("getVaultWeight", "uint208")]
    public class GetVaultWeightFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
    }

    public partial class GetVaultWeightAtFunction : GetVaultWeightAtFunctionBase { }

    [Function("getVaultWeightAt", "uint208")]
    public class GetVaultWeightAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class SetVaultWeightFunction : SetVaultWeightFunctionBase { }

    [Function("setVaultWeight")]
    public class SetVaultWeightFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
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

    public partial class SetVaultWeightEventDTO : SetVaultWeightEventDTOBase { }

    [Event("SetVaultWeight")]
    public class SetVaultWeightEventDTOBase : IEventDTO
    {
        [Parameter("address", "vault", 1, true )]
        public virtual string Vault { get; set; }
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

    public partial class WeightedvaultsvpcalcToolargeweightError : WeightedvaultsvpcalcToolargeweightErrorBase { }
    [Error("WeightedVaultsVPCalc_TooLargeWeight")]
    public class WeightedvaultsvpcalcToolargeweightErrorBase : IErrorDTO
    {
    }

    public partial class GetVaultWeightOutputDTO : GetVaultWeightOutputDTOBase { }

    [FunctionOutput]
    public class GetVaultWeightOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetVaultWeightAtOutputDTO : GetVaultWeightAtOutputDTOBase { }

    [FunctionOutput]
    public class GetVaultWeightAtOutputDTOBase : IFunctionOutputDTO 
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
