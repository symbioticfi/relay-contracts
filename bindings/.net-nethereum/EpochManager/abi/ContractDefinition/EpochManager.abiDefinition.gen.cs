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

namespace Symbiotic.Relay.EpochManager.abi.ContractDefinition
{


    public partial class EpochManager.abiDeployment : EpochManager.abiDeploymentBase
    {
        public EpochManager.abiDeployment() : base(BYTECODE) { }
        public EpochManager.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class EpochManager.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public EpochManager.abiDeploymentBase() : base(BYTECODE) { }
        public EpochManager.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class GetCurrentEpochFunction : GetCurrentEpochFunctionBase { }

    [Function("getCurrentEpoch", "uint48")]
    public class GetCurrentEpochFunctionBase : FunctionMessage
    {

    }

    public partial class GetCurrentEpochDurationFunction : GetCurrentEpochDurationFunctionBase { }

    [Function("getCurrentEpochDuration", "uint48")]
    public class GetCurrentEpochDurationFunctionBase : FunctionMessage
    {

    }

    public partial class GetCurrentEpochStartFunction : GetCurrentEpochStartFunctionBase { }

    [Function("getCurrentEpochStart", "uint48")]
    public class GetCurrentEpochStartFunctionBase : FunctionMessage
    {

    }

    public partial class GetEpochDurationFunction : GetEpochDurationFunctionBase { }

    [Function("getEpochDuration", "uint48")]
    public class GetEpochDurationFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetEpochIndexFunction : GetEpochIndexFunctionBase { }

    [Function("getEpochIndex", "uint48")]
    public class GetEpochIndexFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetEpochStartFunction : GetEpochStartFunctionBase { }

    [Function("getEpochStart", "uint48")]
    public class GetEpochStartFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epoch", 1)]
        public virtual ulong Epoch { get; set; }
    }

    public partial class GetNextEpochFunction : GetNextEpochFunctionBase { }

    [Function("getNextEpoch", "uint48")]
    public class GetNextEpochFunctionBase : FunctionMessage
    {

    }

    public partial class GetNextEpochDurationFunction : GetNextEpochDurationFunctionBase { }

    [Function("getNextEpochDuration", "uint48")]
    public class GetNextEpochDurationFunctionBase : FunctionMessage
    {

    }

    public partial class GetNextEpochStartFunction : GetNextEpochStartFunctionBase { }

    [Function("getNextEpochStart", "uint48")]
    public class GetNextEpochStartFunctionBase : FunctionMessage
    {

    }

    public partial class SetEpochDurationFunction : SetEpochDurationFunctionBase { }

    [Function("setEpochDuration")]
    public class SetEpochDurationFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "epochDuration", 1)]
        public virtual ulong EpochDuration { get; set; }
    }

    public partial class InitEpochDurationEventDTO : InitEpochDurationEventDTOBase { }

    [Event("InitEpochDuration")]
    public class InitEpochDurationEventDTOBase : IEventDTO
    {
        [Parameter("uint48", "epochDuration", 1, false )]
        public virtual ulong EpochDuration { get; set; }
        [Parameter("uint48", "epochDurationTimestamp", 2, false )]
        public virtual ulong EpochDurationTimestamp { get; set; }
    }

    public partial class InitializedEventDTO : InitializedEventDTOBase { }

    [Event("Initialized")]
    public class InitializedEventDTOBase : IEventDTO
    {
        [Parameter("uint64", "version", 1, false )]
        public virtual ulong Version { get; set; }
    }

    public partial class SetEpochDurationEventDTO : SetEpochDurationEventDTOBase { }

    [Event("SetEpochDuration")]
    public class SetEpochDurationEventDTOBase : IEventDTO
    {
        [Parameter("uint48", "epochDuration", 1, false )]
        public virtual ulong EpochDuration { get; set; }
    }

    public partial class CheckpointUnorderedInsertionError : CheckpointUnorderedInsertionErrorBase { }
    [Error("CheckpointUnorderedInsertion")]
    public class CheckpointUnorderedInsertionErrorBase : IErrorDTO
    {
    }

    public partial class EpochmanagerInvalidepochdurationError : EpochmanagerInvalidepochdurationErrorBase { }
    [Error("EpochManager_InvalidEpochDuration")]
    public class EpochmanagerInvalidepochdurationErrorBase : IErrorDTO
    {
    }

    public partial class EpochmanagerInvalidepochdurationtimestampError : EpochmanagerInvalidepochdurationtimestampErrorBase { }
    [Error("EpochManager_InvalidEpochDurationTimestamp")]
    public class EpochmanagerInvalidepochdurationtimestampErrorBase : IErrorDTO
    {
    }

    public partial class EpochmanagerToooldtimestampError : EpochmanagerToooldtimestampErrorBase { }
    [Error("EpochManager_TooOldTimestamp")]
    public class EpochmanagerToooldtimestampErrorBase : IErrorDTO
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

    public partial class GetCurrentEpochOutputDTO : GetCurrentEpochOutputDTOBase { }

    [FunctionOutput]
    public class GetCurrentEpochOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetCurrentEpochDurationOutputDTO : GetCurrentEpochDurationOutputDTOBase { }

    [FunctionOutput]
    public class GetCurrentEpochDurationOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "epochDuration", 1)]
        public virtual ulong EpochDuration { get; set; }
    }

    public partial class GetCurrentEpochStartOutputDTO : GetCurrentEpochStartOutputDTOBase { }

    [FunctionOutput]
    public class GetCurrentEpochStartOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetEpochDurationOutputDTO : GetEpochDurationOutputDTOBase { }

    [FunctionOutput]
    public class GetEpochDurationOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "epochDuration", 1)]
        public virtual ulong EpochDuration { get; set; }
    }

    public partial class GetEpochIndexOutputDTO : GetEpochIndexOutputDTOBase { }

    [FunctionOutput]
    public class GetEpochIndexOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetEpochStartOutputDTO : GetEpochStartOutputDTOBase { }

    [FunctionOutput]
    public class GetEpochStartOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetNextEpochOutputDTO : GetNextEpochOutputDTOBase { }

    [FunctionOutput]
    public class GetNextEpochOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetNextEpochDurationOutputDTO : GetNextEpochDurationOutputDTOBase { }

    [FunctionOutput]
    public class GetNextEpochDurationOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class GetNextEpochStartOutputDTO : GetNextEpochStartOutputDTOBase { }

    [FunctionOutput]
    public class GetNextEpochStartOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }


}
