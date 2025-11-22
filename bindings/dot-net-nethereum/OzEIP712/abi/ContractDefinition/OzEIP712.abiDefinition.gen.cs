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

namespace Symbiotic.Relay.OzEIP712.abi.ContractDefinition
{


    public partial class OzEIP712.abiDeployment : OzEIP712.abiDeploymentBase
    {
        public OzEIP712.abiDeployment() : base(BYTECODE) { }
        public OzEIP712.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class OzEIP712.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public OzEIP712.abiDeploymentBase() : base(BYTECODE) { }
        public OzEIP712.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class Eip712DomainFunction : Eip712DomainFunctionBase { }

    [Function("eip712Domain", typeof(Eip712DomainOutputDTO))]
    public class Eip712DomainFunctionBase : FunctionMessage
    {

    }

    public partial class HashTypedDataV4Function : HashTypedDataV4FunctionBase { }

    [Function("hashTypedDataV4", "bytes32")]
    public class HashTypedDataV4FunctionBase : FunctionMessage
    {
        [Parameter("bytes32", "structHash", 1)]
        public virtual byte[] StructHash { get; set; }
    }

    public partial class HashTypedDataV4CrossChainFunction : HashTypedDataV4CrossChainFunctionBase { }

    [Function("hashTypedDataV4CrossChain", "bytes32")]
    public class HashTypedDataV4CrossChainFunctionBase : FunctionMessage
    {
        [Parameter("bytes32", "structHash", 1)]
        public virtual byte[] StructHash { get; set; }
    }

    public partial class EIP712DomainChangedEventDTO : EIP712DomainChangedEventDTOBase { }

    [Event("EIP712DomainChanged")]
    public class EIP712DomainChangedEventDTOBase : IEventDTO
    {
    }

    public partial class InitEIP712EventDTO : InitEIP712EventDTOBase { }

    [Event("InitEIP712")]
    public class InitEIP712EventDTOBase : IEventDTO
    {
        [Parameter("string", "name", 1, false )]
        public virtual string Name { get; set; }
        [Parameter("string", "version", 2, false )]
        public virtual string Version { get; set; }
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

    public partial class Eip712DomainOutputDTO : Eip712DomainOutputDTOBase { }

    [FunctionOutput]
    public class Eip712DomainOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes1", "fields", 1)]
        public virtual byte[] Fields { get; set; }
        [Parameter("string", "name", 2)]
        public virtual string Name { get; set; }
        [Parameter("string", "version", 3)]
        public virtual string Version { get; set; }
        [Parameter("uint256", "chainId", 4)]
        public virtual BigInteger ChainId { get; set; }
        [Parameter("address", "verifyingContract", 5)]
        public virtual string VerifyingContract { get; set; }
        [Parameter("bytes32", "salt", 6)]
        public virtual byte[] Salt { get; set; }
        [Parameter("uint256[]", "extensions", 7)]
        public virtual List<BigInteger> Extensions { get; set; }
    }

    public partial class HashTypedDataV4OutputDTO : HashTypedDataV4OutputDTOBase { }

    [FunctionOutput]
    public class HashTypedDataV4OutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class HashTypedDataV4CrossChainOutputDTO : HashTypedDataV4CrossChainOutputDTOBase { }

    [FunctionOutput]
    public class HashTypedDataV4CrossChainOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }
}
