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

namespace Symbiotic.Relay.KeyRegistry.abi.ContractDefinition
{


    public partial class KeyRegistry.abiDeployment : KeyRegistry.abiDeploymentBase
    {
        public KeyRegistry.abiDeployment() : base(BYTECODE) { }
        public KeyRegistry.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class KeyRegistry.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public KeyRegistry.abiDeploymentBase() : base(BYTECODE) { }
        public KeyRegistry.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class KeyregistryInitFunction : KeyregistryInitFunctionBase { }

    [Function("__KeyRegistry_init")]
    public class KeyregistryInitFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "keyRegistryInitParams", 1)]
        public virtual KeyRegistryInitParams KeyRegistryInitParams { get; set; }
    }

    public partial class Eip712DomainFunction : Eip712DomainFunctionBase { }

    [Function("eip712Domain", typeof(Eip712DomainOutputDTO))]
    public class Eip712DomainFunctionBase : FunctionMessage
    {

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

    public partial class MulticallFunction : MulticallFunctionBase { }

    [Function("multicall", "bytes[]")]
    public class MulticallFunctionBase : FunctionMessage
    {
        [Parameter("bytes[]", "data", 1)]
        public virtual List<byte[]> Data { get; set; }
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

    public partial class AddressEmptyCodeError : AddressEmptyCodeErrorBase { }

    [Error("AddressEmptyCode")]
    public class AddressEmptyCodeErrorBase : IErrorDTO
    {
        [Parameter("address", "target", 1)]
        public virtual string Target { get; set; }
    }

    public partial class CheckpointUnorderedInsertionError : CheckpointUnorderedInsertionErrorBase { }
    [Error("CheckpointUnorderedInsertion")]
    public class CheckpointUnorderedInsertionErrorBase : IErrorDTO
    {
    }

    public partial class FailedCallError : FailedCallErrorBase { }
    [Error("FailedCall")]
    public class FailedCallErrorBase : IErrorDTO
    {
    }

    public partial class InvalidDSTLengthError : InvalidDSTLengthErrorBase { }

    [Error("InvalidDSTLength")]
    public class InvalidDSTLengthErrorBase : IErrorDTO
    {
        [Parameter("bytes", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }

    public partial class InvalidInitializationError : InvalidInitializationErrorBase { }
    [Error("InvalidInitialization")]
    public class InvalidInitializationErrorBase : IErrorDTO
    {
    }

    public partial class InvalidKeyTagError : InvalidKeyTagErrorBase { }
    [Error("InvalidKeyTag")]
    public class InvalidKeyTagErrorBase : IErrorDTO
    {
    }

    public partial class Keyblsbls12381InvalidbytesError : Keyblsbls12381InvalidbytesErrorBase { }
    [Error("KeyBlsBls12381_InvalidBytes")]
    public class Keyblsbls12381InvalidbytesErrorBase : IErrorDTO
    {
    }

    public partial class Keyblsbls12381InvalidkeyError : Keyblsbls12381InvalidkeyErrorBase { }
    [Error("KeyBlsBls12381_InvalidKey")]
    public class Keyblsbls12381InvalidkeyErrorBase : IErrorDTO
    {
    }

    public partial class Keyblsbn254InvalidbytesError : Keyblsbn254InvalidbytesErrorBase { }
    [Error("KeyBlsBn254_InvalidBytes")]
    public class Keyblsbn254InvalidbytesErrorBase : IErrorDTO
    {
    }

    public partial class Keyblsbn254InvalidkeyError : Keyblsbn254InvalidkeyErrorBase { }
    [Error("KeyBlsBn254_InvalidKey")]
    public class Keyblsbn254InvalidkeyErrorBase : IErrorDTO
    {
    }

    public partial class Keyecdsasecp256k1InvalidbytesError : Keyecdsasecp256k1InvalidbytesErrorBase { }
    [Error("KeyEcdsaSecp256k1_InvalidBytes")]
    public class Keyecdsasecp256k1InvalidbytesErrorBase : IErrorDTO
    {
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

    public partial class NotInitializingError : NotInitializingErrorBase { }
    [Error("NotInitializing")]
    public class NotInitializingErrorBase : IErrorDTO
    {
    }

    public partial class Sigblsbls12381InvalidmessagelengthError : Sigblsbls12381InvalidmessagelengthErrorBase { }
    [Error("SigBlsBls12381_InvalidMessageLength")]
    public class Sigblsbls12381InvalidmessagelengthErrorBase : IErrorDTO
    {
    }

    public partial class Sigblsbn254InvalidmessagelengthError : Sigblsbn254InvalidmessagelengthErrorBase { }
    [Error("SigBlsBn254_InvalidMessageLength")]
    public class Sigblsbn254InvalidmessagelengthErrorBase : IErrorDTO
    {
    }

    public partial class Sigecdsasecp256k1InvalidmessagelengthError : Sigecdsasecp256k1InvalidmessagelengthErrorBase { }
    [Error("SigEcdsaSecp256k1_InvalidMessageLength")]
    public class Sigecdsasecp256k1InvalidmessagelengthErrorBase : IErrorDTO
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
        [Parameter("tuple[]", "operatorsKeys", 1)]
        public virtual List<OperatorWithKeys> OperatorsKeys { get; set; }
    }

    public partial class GetKeys1OutputDTO : GetKeys1OutputDTOBase { }

    [FunctionOutput]
    public class GetKeys1OutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "keys", 1)]
        public virtual List<Key> Keys { get; set; }
    }

    public partial class GetKeysAtOutputDTO : GetKeysAtOutputDTOBase { }

    [FunctionOutput]
    public class GetKeysAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "operatorsKeys", 1)]
        public virtual List<OperatorWithKeys> OperatorsKeys { get; set; }
    }

    public partial class GetKeysAt1OutputDTO : GetKeysAt1OutputDTOBase { }

    [FunctionOutput]
    public class GetKeysAt1OutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "keys", 1)]
        public virtual List<Key> Keys { get; set; }
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
