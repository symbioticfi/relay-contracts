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

namespace Symbiotic.Relay.PermissionManager.abi.ContractDefinition
{


    public partial class PermissionManager.abiDeployment : PermissionManager.abiDeploymentBase
    {
        public PermissionManager.abiDeployment() : base(BYTECODE) { }
        public PermissionManager.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class PermissionManager.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public PermissionManager.abiDeploymentBase() : base(BYTECODE) { }
        public PermissionManager.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class InitializedEventDTO : InitializedEventDTOBase { }

    [Event("Initialized")]
    public class InitializedEventDTOBase : IEventDTO
    {
        [Parameter("uint64", "version", 1, false )]
        public virtual ulong Version { get; set; }
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
}
