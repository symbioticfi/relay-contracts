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

namespace Symbiotic.Relay.NetworkManager.abi.ContractDefinition
{


    public partial class NetworkManager.abiDeployment : NetworkManager.abiDeploymentBase
    {
        public NetworkManager.abiDeployment() : base(BYTECODE) { }
        public NetworkManager.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class NetworkManager.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public NetworkManager.abiDeploymentBase() : base(BYTECODE) { }
        public NetworkManager.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class NetworkFunction : NetworkFunctionBase { }

    [Function("NETWORK", "address")]
    public class NetworkFunctionBase : FunctionMessage
    {

    }

    public partial class SubnetworkFunction : SubnetworkFunctionBase { }

    [Function("SUBNETWORK", "bytes32")]
    public class SubnetworkFunctionBase : FunctionMessage
    {

    }

    public partial class SubnetworkIdentifierFunction : SubnetworkIdentifierFunctionBase { }

    [Function("SUBNETWORK_IDENTIFIER", "uint96")]
    public class SubnetworkIdentifierFunctionBase : FunctionMessage
    {

    }

    public partial class StaticDelegateCallFunction : StaticDelegateCallFunctionBase { }

    [Function("staticDelegateCall")]
    public class StaticDelegateCallFunctionBase : FunctionMessage
    {
        [Parameter("address", "target", 1)]
        public virtual string Target { get; set; }
        [Parameter("bytes", "data", 2)]
        public virtual byte[] Data { get; set; }
    }

    public partial class InitSubnetworkEventDTO : InitSubnetworkEventDTOBase { }

    [Event("InitSubnetwork")]
    public class InitSubnetworkEventDTOBase : IEventDTO
    {
        [Parameter("address", "network", 1, false )]
        public virtual string Network { get; set; }
        [Parameter("uint96", "subnetworkId", 2, false )]
        public virtual BigInteger SubnetworkId { get; set; }
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

    public partial class NetworkmanagerInvalidnetworkError : NetworkmanagerInvalidnetworkErrorBase { }
    [Error("NetworkManager_InvalidNetwork")]
    public class NetworkmanagerInvalidnetworkErrorBase : IErrorDTO
    {
    }

    public partial class NotInitializingError : NotInitializingErrorBase { }
    [Error("NotInitializing")]
    public class NotInitializingErrorBase : IErrorDTO
    {
    }

    public partial class NetworkOutputDTO : NetworkOutputDTOBase { }

    [FunctionOutput]
    public class NetworkOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class SubnetworkOutputDTO : SubnetworkOutputDTOBase { }

    [FunctionOutput]
    public class SubnetworkOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class SubnetworkIdentifierOutputDTO : SubnetworkIdentifierOutputDTOBase { }

    [FunctionOutput]
    public class SubnetworkIdentifierOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint96", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }


}
