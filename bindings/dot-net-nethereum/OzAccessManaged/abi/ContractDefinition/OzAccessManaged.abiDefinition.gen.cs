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

namespace Symbiotic.Relay.OzAccessManaged.abi.ContractDefinition
{


    public partial class OzAccessManaged.abiDeployment : OzAccessManaged.abiDeploymentBase
    {
        public OzAccessManaged.abiDeployment() : base(BYTECODE) { }
        public OzAccessManaged.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class OzAccessManaged.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public OzAccessManaged.abiDeploymentBase() : base(BYTECODE) { }
        public OzAccessManaged.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class AuthorityFunction : AuthorityFunctionBase { }

    [Function("authority", "address")]
    public class AuthorityFunctionBase : FunctionMessage
    {

    }

    public partial class IsConsumingScheduledOpFunction : IsConsumingScheduledOpFunctionBase { }

    [Function("isConsumingScheduledOp", "bytes4")]
    public class IsConsumingScheduledOpFunctionBase : FunctionMessage
    {

    }

    public partial class SetAuthorityFunction : SetAuthorityFunctionBase { }

    [Function("setAuthority")]
    public class SetAuthorityFunctionBase : FunctionMessage
    {
        [Parameter("address", "newAuthority", 1)]
        public virtual string NewAuthority { get; set; }
    }

    public partial class AuthorityUpdatedEventDTO : AuthorityUpdatedEventDTOBase { }

    [Event("AuthorityUpdated")]
    public class AuthorityUpdatedEventDTOBase : IEventDTO
    {
        [Parameter("address", "authority", 1, false )]
        public virtual string Authority { get; set; }
    }

    public partial class InitializedEventDTO : InitializedEventDTOBase { }

    [Event("Initialized")]
    public class InitializedEventDTOBase : IEventDTO
    {
        [Parameter("uint64", "version", 1, false )]
        public virtual ulong Version { get; set; }
    }

    public partial class AccessManagedInvalidAuthorityError : AccessManagedInvalidAuthorityErrorBase { }

    [Error("AccessManagedInvalidAuthority")]
    public class AccessManagedInvalidAuthorityErrorBase : IErrorDTO
    {
        [Parameter("address", "authority", 1)]
        public virtual string Authority { get; set; }
    }

    public partial class AccessManagedRequiredDelayError : AccessManagedRequiredDelayErrorBase { }

    [Error("AccessManagedRequiredDelay")]
    public class AccessManagedRequiredDelayErrorBase : IErrorDTO
    {
        [Parameter("address", "caller", 1)]
        public virtual string Caller { get; set; }
        [Parameter("uint32", "delay", 2)]
        public virtual uint Delay { get; set; }
    }

    public partial class AccessManagedUnauthorizedError : AccessManagedUnauthorizedErrorBase { }

    [Error("AccessManagedUnauthorized")]
    public class AccessManagedUnauthorizedErrorBase : IErrorDTO
    {
        [Parameter("address", "caller", 1)]
        public virtual string Caller { get; set; }
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

    public partial class AuthorityOutputDTO : AuthorityOutputDTOBase { }

    [FunctionOutput]
    public class AuthorityOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class IsConsumingScheduledOpOutputDTO : IsConsumingScheduledOpOutputDTOBase { }

    [FunctionOutput]
    public class IsConsumingScheduledOpOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes4", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }


}
