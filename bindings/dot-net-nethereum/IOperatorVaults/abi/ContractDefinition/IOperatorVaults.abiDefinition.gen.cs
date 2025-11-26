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

namespace Symbiotic.Relay.IOperatorVaults.abi.ContractDefinition
{


    public partial class IOperatorVaults.abiDeployment : IOperatorVaults.abiDeploymentBase
    {
        public IOperatorVaults.abiDeployment() : base(BYTECODE) { }
        public IOperatorVaults.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IOperatorVaults.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IOperatorVaults.abiDeploymentBase() : base(BYTECODE) { }
        public IOperatorVaults.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class OperatorRegistryFunction : OperatorRegistryFunctionBase { }

    [Function("OPERATOR_REGISTRY", "address")]
    public class OperatorRegistryFunctionBase : FunctionMessage
    {

    }

    public partial class VaultFactoryFunction : VaultFactoryFunctionBase { }

    [Function("VAULT_FACTORY", "address")]
    public class VaultFactoryFunctionBase : FunctionMessage
    {

    }

    public partial class GetOperatorStakesFunction : GetOperatorStakesFunctionBase { }

    [Function("getOperatorStakes", typeof(GetOperatorStakesOutputDTO))]
    public class GetOperatorStakesFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class GetOperatorStakesAtFunction : GetOperatorStakesAtFunctionBase { }

    [Function("getOperatorStakesAt", typeof(GetOperatorStakesAtOutputDTO))]
    public class GetOperatorStakesAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetOperatorVaultsFunction : GetOperatorVaultsFunctionBase { }

    [Function("getOperatorVaults", "address[]")]
    public class GetOperatorVaultsFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class GetOperatorVaultsAtFunction : GetOperatorVaultsAtFunctionBase { }

    [Function("getOperatorVaultsAt", "address[]")]
    public class GetOperatorVaultsAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetOperatorVotingPowersFunction : GetOperatorVotingPowersFunctionBase { }

    [Function("getOperatorVotingPowers", typeof(GetOperatorVotingPowersOutputDTO))]
    public class GetOperatorVotingPowersFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("bytes", "extraData", 2)]
        public virtual byte[] ExtraData { get; set; }
    }

    public partial class GetOperatorVotingPowersAtFunction : GetOperatorVotingPowersAtFunctionBase { }

    [Function("getOperatorVotingPowersAt", typeof(GetOperatorVotingPowersAtOutputDTO))]
    public class GetOperatorVotingPowersAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("bytes", "extraData", 2)]
        public virtual byte[] ExtraData { get; set; }
        [Parameter("uint48", "timestamp", 3)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetOperatorsFunction : GetOperatorsFunctionBase { }

    [Function("getOperators", "address[]")]
    public class GetOperatorsFunctionBase : FunctionMessage
    {

    }

    public partial class GetOperatorsAtFunction : GetOperatorsAtFunctionBase { }

    [Function("getOperatorsAt", "address[]")]
    public class GetOperatorsAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetSharedVaultsFunction : GetSharedVaultsFunctionBase { }

    [Function("getSharedVaults", "address[]")]
    public class GetSharedVaultsFunctionBase : FunctionMessage
    {

    }

    public partial class GetSharedVaultsAtFunction : GetSharedVaultsAtFunctionBase { }

    [Function("getSharedVaultsAt", "address[]")]
    public class GetSharedVaultsAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetSlashingDataFunction : GetSlashingDataFunctionBase { }

    [Function("getSlashingData", typeof(GetSlashingDataOutputDTO))]
    public class GetSlashingDataFunctionBase : FunctionMessage
    {

    }

    public partial class GetSlashingDataAtFunction : GetSlashingDataAtFunctionBase { }

    [Function("getSlashingDataAt", typeof(GetSlashingDataAtOutputDTO))]
    public class GetSlashingDataAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
        [Parameter("bytes", "hint", 2)]
        public virtual byte[] Hint { get; set; }
    }

    public partial class GetTokensFunction : GetTokensFunctionBase { }

    [Function("getTokens", "address[]")]
    public class GetTokensFunctionBase : FunctionMessage
    {

    }

    public partial class GetTokensAtFunction : GetTokensAtFunctionBase { }

    [Function("getTokensAt", "address[]")]
    public class GetTokensAtFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class GetVotingPowersFunction : GetVotingPowersFunctionBase { }

    [Function("getVotingPowers", typeof(GetVotingPowersOutputDTO))]
    public class GetVotingPowersFunctionBase : FunctionMessage
    {
        [Parameter("bytes[]", "extraData", 1)]
        public virtual List<byte[]> ExtraData { get; set; }
    }

    public partial class GetVotingPowersAtFunction : GetVotingPowersAtFunctionBase { }

    [Function("getVotingPowersAt", typeof(GetVotingPowersAtOutputDTO))]
    public class GetVotingPowersAtFunctionBase : FunctionMessage
    {
        [Parameter("bytes[]", "extraData", 1)]
        public virtual List<byte[]> ExtraData { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class InvalidateOldSignaturesFunction : InvalidateOldSignaturesFunctionBase { }

    [Function("invalidateOldSignatures")]
    public class InvalidateOldSignaturesFunctionBase : FunctionMessage
    {

    }

    public partial class IsOperatorRegisteredFunction : IsOperatorRegisteredFunctionBase { }

    [Function("isOperatorRegistered", "bool")]
    public class IsOperatorRegisteredFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class IsOperatorRegisteredAtFunction : IsOperatorRegisteredAtFunctionBase { }

    [Function("isOperatorRegisteredAt", "bool")]
    public class IsOperatorRegisteredAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class IsOperatorVaultRegisteredFunction : IsOperatorVaultRegisteredFunctionBase { }

    [Function("isOperatorVaultRegistered", "bool")]
    public class IsOperatorVaultRegisteredFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
    }

    public partial class IsOperatorVaultRegistered1Function : IsOperatorVaultRegistered1FunctionBase { }

    [Function("isOperatorVaultRegistered", "bool")]
    public class IsOperatorVaultRegistered1FunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("address", "vault", 2)]
        public virtual string Vault { get; set; }
    }

    public partial class IsOperatorVaultRegisteredAt1Function : IsOperatorVaultRegisteredAt1FunctionBase { }

    [Function("isOperatorVaultRegisteredAt", "bool")]
    public class IsOperatorVaultRegisteredAt1FunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("address", "vault", 2)]
        public virtual string Vault { get; set; }
        [Parameter("uint48", "timestamp", 3)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class IsOperatorVaultRegisteredAtFunction : IsOperatorVaultRegisteredAtFunctionBase { }

    [Function("isOperatorVaultRegisteredAt", "bool")]
    public class IsOperatorVaultRegisteredAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class IsSharedVaultRegisteredFunction : IsSharedVaultRegisteredFunctionBase { }

    [Function("isSharedVaultRegistered", "bool")]
    public class IsSharedVaultRegisteredFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
    }

    public partial class IsSharedVaultRegisteredAtFunction : IsSharedVaultRegisteredAtFunctionBase { }

    [Function("isSharedVaultRegisteredAt", "bool")]
    public class IsSharedVaultRegisteredAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class IsTokenRegisteredFunction : IsTokenRegisteredFunctionBase { }

    [Function("isTokenRegistered", "bool")]
    public class IsTokenRegisteredFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
    }

    public partial class IsTokenRegisteredAtFunction : IsTokenRegisteredAtFunctionBase { }

    [Function("isTokenRegisteredAt", "bool")]
    public class IsTokenRegisteredAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "token", 1)]
        public virtual string Token { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class RegisterOperatorFunction : RegisterOperatorFunctionBase { }

    [Function("registerOperator")]
    public class RegisterOperatorFunctionBase : FunctionMessage
    {

    }

    public partial class RegisterOperatorVaultFunction : RegisterOperatorVaultFunctionBase { }

    [Function("registerOperatorVault")]
    public class RegisterOperatorVaultFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("address", "vault", 2)]
        public virtual string Vault { get; set; }
    }

    public partial class RegisterOperatorWithSignatureFunction : RegisterOperatorWithSignatureFunctionBase { }

    [Function("registerOperatorWithSignature")]
    public class RegisterOperatorWithSignatureFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("bytes", "signature", 2)]
        public virtual byte[] Signature { get; set; }
    }

    public partial class UnregisterOperatorFunction : UnregisterOperatorFunctionBase { }

    [Function("unregisterOperator")]
    public class UnregisterOperatorFunctionBase : FunctionMessage
    {

    }

    public partial class UnregisterOperatorVaultFunction : UnregisterOperatorVaultFunctionBase { }

    [Function("unregisterOperatorVault")]
    public class UnregisterOperatorVaultFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
    }

    public partial class UnregisterOperatorVault1Function : UnregisterOperatorVault1FunctionBase { }

    [Function("unregisterOperatorVault")]
    public class UnregisterOperatorVault1FunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("address", "vault", 2)]
        public virtual string Vault { get; set; }
    }

    public partial class UnregisterOperatorWithSignatureFunction : UnregisterOperatorWithSignatureFunctionBase { }

    [Function("unregisterOperatorWithSignature")]
    public class UnregisterOperatorWithSignatureFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("bytes", "signature", 2)]
        public virtual byte[] Signature { get; set; }
    }

    public partial class RegisterOperatorEventDTO : RegisterOperatorEventDTOBase { }

    [Event("RegisterOperator")]
    public class RegisterOperatorEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
    }

    public partial class RegisterOperatorVaultEventDTO : RegisterOperatorVaultEventDTOBase { }

    [Event("RegisterOperatorVault")]
    public class RegisterOperatorVaultEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
        [Parameter("address", "vault", 2, true )]
        public virtual string Vault { get; set; }
    }

    public partial class RegisterSharedVaultEventDTO : RegisterSharedVaultEventDTOBase { }

    [Event("RegisterSharedVault")]
    public class RegisterSharedVaultEventDTOBase : IEventDTO
    {
        [Parameter("address", "vault", 1, true )]
        public virtual string Vault { get; set; }
    }

    public partial class RegisterTokenEventDTO : RegisterTokenEventDTOBase { }

    [Event("RegisterToken")]
    public class RegisterTokenEventDTOBase : IEventDTO
    {
        [Parameter("address", "token", 1, true )]
        public virtual string Token { get; set; }
    }

    public partial class SetSlashingDataEventDTO : SetSlashingDataEventDTOBase { }

    [Event("SetSlashingData")]
    public class SetSlashingDataEventDTOBase : IEventDTO
    {
        [Parameter("bool", "requireSlasher", 1, false )]
        public virtual bool RequireSlasher { get; set; }
        [Parameter("uint48", "minVaultEpochDuration", 2, false )]
        public virtual ulong MinVaultEpochDuration { get; set; }
    }

    public partial class UnregisterOperatorEventDTO : UnregisterOperatorEventDTOBase { }

    [Event("UnregisterOperator")]
    public class UnregisterOperatorEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
    }

    public partial class UnregisterOperatorVaultEventDTO : UnregisterOperatorVaultEventDTOBase { }

    [Event("UnregisterOperatorVault")]
    public class UnregisterOperatorVaultEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
        [Parameter("address", "vault", 2, true )]
        public virtual string Vault { get; set; }
    }

    public partial class UnregisterSharedVaultEventDTO : UnregisterSharedVaultEventDTOBase { }

    [Event("UnregisterSharedVault")]
    public class UnregisterSharedVaultEventDTOBase : IEventDTO
    {
        [Parameter("address", "vault", 1, true )]
        public virtual string Vault { get; set; }
    }

    public partial class UnregisterTokenEventDTO : UnregisterTokenEventDTOBase { }

    [Event("UnregisterToken")]
    public class UnregisterTokenEventDTOBase : IEventDTO
    {
        [Parameter("address", "token", 1, true )]
        public virtual string Token { get; set; }
    }

    public partial class VotingpowerproviderInvalidoperatorError : VotingpowerproviderInvalidoperatorErrorBase { }
    [Error("VotingPowerProvider_InvalidOperator")]
    public class VotingpowerproviderInvalidoperatorErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderInvalidoperatorvaultError : VotingpowerproviderInvalidoperatorvaultErrorBase { }
    [Error("VotingPowerProvider_InvalidOperatorVault")]
    public class VotingpowerproviderInvalidoperatorvaultErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderInvalidsharedvaultError : VotingpowerproviderInvalidsharedvaultErrorBase { }
    [Error("VotingPowerProvider_InvalidSharedVault")]
    public class VotingpowerproviderInvalidsharedvaultErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderInvalidsignatureError : VotingpowerproviderInvalidsignatureErrorBase { }
    [Error("VotingPowerProvider_InvalidSignature")]
    public class VotingpowerproviderInvalidsignatureErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderInvalidtokenError : VotingpowerproviderInvalidtokenErrorBase { }
    [Error("VotingPowerProvider_InvalidToken")]
    public class VotingpowerproviderInvalidtokenErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderInvalidvaultError : VotingpowerproviderInvalidvaultErrorBase { }
    [Error("VotingPowerProvider_InvalidVault")]
    public class VotingpowerproviderInvalidvaultErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderOperatoralreadyregisteredError : VotingpowerproviderOperatoralreadyregisteredErrorBase { }
    [Error("VotingPowerProvider_OperatorAlreadyRegistered")]
    public class VotingpowerproviderOperatoralreadyregisteredErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderOperatornotregisteredError : VotingpowerproviderOperatornotregisteredErrorBase { }
    [Error("VotingPowerProvider_OperatorNotRegistered")]
    public class VotingpowerproviderOperatornotregisteredErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderOperatorvaultalreadyisregisteredError : VotingpowerproviderOperatorvaultalreadyisregisteredErrorBase { }
    [Error("VotingPowerProvider_OperatorVaultAlreadyIsRegistered")]
    public class VotingpowerproviderOperatorvaultalreadyisregisteredErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderOperatorvaultnotregisteredError : VotingpowerproviderOperatorvaultnotregisteredErrorBase { }
    [Error("VotingPowerProvider_OperatorVaultNotRegistered")]
    public class VotingpowerproviderOperatorvaultnotregisteredErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderSharedvaultalreadyisregisteredError : VotingpowerproviderSharedvaultalreadyisregisteredErrorBase { }
    [Error("VotingPowerProvider_SharedVaultAlreadyIsRegistered")]
    public class VotingpowerproviderSharedvaultalreadyisregisteredErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderSharedvaultnotregisteredError : VotingpowerproviderSharedvaultnotregisteredErrorBase { }
    [Error("VotingPowerProvider_SharedVaultNotRegistered")]
    public class VotingpowerproviderSharedvaultnotregisteredErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderTokenalreadyisregisteredError : VotingpowerproviderTokenalreadyisregisteredErrorBase { }
    [Error("VotingPowerProvider_TokenAlreadyIsRegistered")]
    public class VotingpowerproviderTokenalreadyisregisteredErrorBase : IErrorDTO
    {
    }

    public partial class VotingpowerproviderTokennotregisteredError : VotingpowerproviderTokennotregisteredErrorBase { }
    [Error("VotingPowerProvider_TokenNotRegistered")]
    public class VotingpowerproviderTokennotregisteredErrorBase : IErrorDTO
    {
    }

    public partial class OperatorRegistryOutputDTO : OperatorRegistryOutputDTOBase { }

    [FunctionOutput]
    public class OperatorRegistryOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class VaultFactoryOutputDTO : VaultFactoryOutputDTOBase { }

    [FunctionOutput]
    public class VaultFactoryOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class GetOperatorStakesOutputDTO : GetOperatorStakesOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorStakesOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<VaultValue> ReturnValue1 { get; set; }
    }

    public partial class GetOperatorStakesAtOutputDTO : GetOperatorStakesAtOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorStakesAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<VaultValue> ReturnValue1 { get; set; }
    }

    public partial class GetOperatorVaultsOutputDTO : GetOperatorVaultsOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorVaultsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetOperatorVaultsAtOutputDTO : GetOperatorVaultsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorVaultsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetOperatorVotingPowersOutputDTO : GetOperatorVotingPowersOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorVotingPowersOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<VaultValue> ReturnValue1 { get; set; }
    }

    public partial class GetOperatorVotingPowersAtOutputDTO : GetOperatorVotingPowersAtOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorVotingPowersAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<VaultValue> ReturnValue1 { get; set; }
    }

    public partial class GetOperatorsOutputDTO : GetOperatorsOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetOperatorsAtOutputDTO : GetOperatorsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetSharedVaultsOutputDTO : GetSharedVaultsOutputDTOBase { }

    [FunctionOutput]
    public class GetSharedVaultsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetSharedVaultsAtOutputDTO : GetSharedVaultsAtOutputDTOBase { }

    [FunctionOutput]
    public class GetSharedVaultsAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetSlashingDataOutputDTO : GetSlashingDataOutputDTOBase { }

    [FunctionOutput]
    public class GetSlashingDataOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "requireSlasher", 1)]
        public virtual bool RequireSlasher { get; set; }
        [Parameter("uint48", "minVaultEpochDuration", 2)]
        public virtual ulong MinVaultEpochDuration { get; set; }
    }

    public partial class GetSlashingDataAtOutputDTO : GetSlashingDataAtOutputDTOBase { }

    [FunctionOutput]
    public class GetSlashingDataAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "requireSlasher", 1)]
        public virtual bool RequireSlasher { get; set; }
        [Parameter("uint48", "minVaultEpochDuration", 2)]
        public virtual ulong MinVaultEpochDuration { get; set; }
    }

    public partial class GetTokensOutputDTO : GetTokensOutputDTOBase { }

    [FunctionOutput]
    public class GetTokensOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetTokensAtOutputDTO : GetTokensAtOutputDTOBase { }

    [FunctionOutput]
    public class GetTokensAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address[]", "", 1)]
        public virtual List<string> ReturnValue1 { get; set; }
    }

    public partial class GetVotingPowersOutputDTO : GetVotingPowersOutputDTOBase { }

    [FunctionOutput]
    public class GetVotingPowersOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<OperatorVotingPower> ReturnValue1 { get; set; }
    }

    public partial class GetVotingPowersAtOutputDTO : GetVotingPowersAtOutputDTOBase { }

    [FunctionOutput]
    public class GetVotingPowersAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple[]", "", 1)]
        public virtual List<OperatorVotingPower> ReturnValue1 { get; set; }
    }



    public partial class IsOperatorRegisteredOutputDTO : IsOperatorRegisteredOutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorRegisteredOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsOperatorRegisteredAtOutputDTO : IsOperatorRegisteredAtOutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorRegisteredAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsOperatorVaultRegisteredOutputDTO : IsOperatorVaultRegisteredOutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorVaultRegisteredOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsOperatorVaultRegistered1OutputDTO : IsOperatorVaultRegistered1OutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorVaultRegistered1OutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsOperatorVaultRegisteredAt1OutputDTO : IsOperatorVaultRegisteredAt1OutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorVaultRegisteredAt1OutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsOperatorVaultRegisteredAtOutputDTO : IsOperatorVaultRegisteredAtOutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorVaultRegisteredAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsSharedVaultRegisteredOutputDTO : IsSharedVaultRegisteredOutputDTOBase { }

    [FunctionOutput]
    public class IsSharedVaultRegisteredOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsSharedVaultRegisteredAtOutputDTO : IsSharedVaultRegisteredAtOutputDTOBase { }

    [FunctionOutput]
    public class IsSharedVaultRegisteredAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsTokenRegisteredOutputDTO : IsTokenRegisteredOutputDTOBase { }

    [FunctionOutput]
    public class IsTokenRegisteredOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsTokenRegisteredAtOutputDTO : IsTokenRegisteredAtOutputDTOBase { }

    [FunctionOutput]
    public class IsTokenRegisteredAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }














}
