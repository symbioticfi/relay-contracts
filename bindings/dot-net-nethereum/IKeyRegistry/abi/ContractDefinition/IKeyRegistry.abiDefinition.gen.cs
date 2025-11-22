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

namespace Symbiotic.Relay.IKeyRegistry.abi.ContractDefinition
{


    public partial class IKeyRegistry.abiDeployment : IKeyRegistry.abiDeploymentBase
    {
        public IKeyRegistry.abiDeployment() : base(BYTECODE) { }
        public IKeyRegistry.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IKeyRegistry.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IKeyRegistry.abiDeploymentBase() : base(BYTECODE) { }
        public IKeyRegistry.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class GetKeyFunction : GetKeyFunctionBase { }

    [Function("getKey", "bytes")]
    public class GetKeyFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("uint8", "tag", 2)]
        public virtual byte Tag { get; set; }
    }

    public partial class GetKeyAtFunction : GetKeyAtFunctionBase { }

    [Function("getKeyAt", "bytes")]
    public class GetKeyAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("uint8", "tag", 2)]
        public virtual byte Tag { get; set; }
        [Parameter("uint48", "timestamp", 3)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetKeysFunction : GetKeysFunctionBase { }

    [Function("getKeys", typeof(GetKeysOutputDTO))]
    public class GetKeysFunctionBase : FunctionMessage
    {

    }

    public partial class GetKeys1Function : GetKeys1FunctionBase { }

    [Function("getKeys", typeof(GetKeys1OutputDTO))]
    public class GetKeys1FunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class GetKeysAtFunction : GetKeysAtFunctionBase { }

    [Function("getKeysAt", typeof(GetKeysAtOutputDTO))]
    public class GetKeysAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetKeysAt1Function : GetKeysAt1FunctionBase { }

    [Function("getKeysAt", typeof(GetKeysAt1OutputDTO))]
    public class GetKeysAt1FunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetKeysOperatorsFunction : GetKeysOperatorsFunctionBase { }

    [Function("getKeysOperators", "address[]")]
    public class GetKeysOperatorsFunctionBase : FunctionMessage
    {

    }

    public partial class GetKeysOperatorsAtFunction : GetKeysOperatorsAtFunctionBase { }

    [Function("getKeysOperatorsAt", "address[]")]
    public class GetKeysOperatorsAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetKeysOperatorsLengthFunction : GetKeysOperatorsLengthFunctionBase { }

    [Function("getKeysOperatorsLength", "uint256")]
    public class GetKeysOperatorsLengthFunctionBase : FunctionMessage
    {

    }

    public partial class GetOperatorFunction : GetOperatorFunctionBase { }

    [Function("getOperator", "address")]
    public class GetOperatorFunctionBase : FunctionMessage
    {
        [Parameter("bytes", "key", 1)]
        public virtual byte[] Key { get; set; }
    }

    public partial class SetKeyFunction : SetKeyFunctionBase { }

    [Function("setKey")]
    public class SetKeyFunctionBase : FunctionMessage
    {
        [Parameter("uint8", "tag", 1)]
        public virtual byte Tag { get; set; }
        [Parameter("bytes", "key", 2)]
        public virtual byte[] Key { get; set; }
        [Parameter("bytes", "signature", 3)]
        public virtual byte[] Signature { get; set; }
        [Parameter("bytes", "extraData", 4)]
        public virtual byte[] ExtraData { get; set; }
    }

    public partial class SetKeyEventDTO : SetKeyEventDTOBase { }

    [Event("SetKey")]
    public class SetKeyEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
        [Parameter("uint8", "tag", 2, true )]
        public virtual byte Tag { get; set; }
        [Parameter("bytes", "key", 3, true )]
        public virtual byte[] Key { get; set; }
        [Parameter("bytes", "extraData", 4, false )]
        public virtual byte[] ExtraData { get; set; }
    }

    public partial class KeyregistryAlreadyusedError : KeyregistryAlreadyusedErrorBase { }
    [Error("KeyRegistry_AlreadyUsed")]
    public class KeyregistryAlreadyusedErrorBase : IErrorDTO
    {
    }

    public partial class KeyregistryInvalidkeysignatureError : KeyregistryInvalidkeysignatureErrorBase { }
    [Error("KeyRegistry_InvalidKeySignature")]
    public class KeyregistryInvalidkeysignatureErrorBase : IErrorDTO
    {
    }

    public partial class KeyregistryInvalidkeytypeError : KeyregistryInvalidkeytypeErrorBase { }
    [Error("KeyRegistry_InvalidKeyType")]
    public class KeyregistryInvalidkeytypeErrorBase : IErrorDTO
    {
    }

    public partial class GetKeyOutputDTO : GetKeyOutputDTOBase { }

    [FunctionOutput]
    public class GetKeyOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class GetKeyAtOutputDTO : GetKeyAtOutputDTOBase { }

    [FunctionOutput]
    public class GetKeyAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class GetKeysOutputDTO : GetKeysOutputDTOBase { }

    [FunctionOutput]
    public class GetKeysOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<OperatorWithKeys> ReturnValue1 { get; set; }
    }

    public partial class GetKeys1OutputDTO : GetKeys1OutputDTOBase { }

    [FunctionOutput]
    public class GetKeys1OutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<Key> ReturnValue1 { get; set; }
    }

    public partial class GetKeysAtOutputDTO : GetKeysAtOutputDTOBase { }

    [FunctionOutput]
    public class GetKeysAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<OperatorWithKeys> ReturnValue1 { get; set; }
    }

    public partial class GetKeysAt1OutputDTO : GetKeysAt1OutputDTOBase { }

    [FunctionOutput]
    public class GetKeysAt1OutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<Key> ReturnValue1 { get; set; }
    }

    public partial class GetKeysOperatorsOutputDTO : GetKeysOperatorsOutputDTOBase { }

    [FunctionOutput]
    public class GetKeysOperatorsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetKeysOperatorsAtOutputDTO : GetKeysOperatorsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetKeysOperatorsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetKeysOperatorsLengthOutputDTO : GetKeysOperatorsLengthOutputDTOBase { }

    [FunctionOutput]
    public class GetKeysOperatorsLengthOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetOperatorOutputDTO : GetOperatorOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }


}
