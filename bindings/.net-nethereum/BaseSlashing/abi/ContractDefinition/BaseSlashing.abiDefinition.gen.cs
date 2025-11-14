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

namespace Symbiotic.Relay.BaseSlashing.abi.ContractDefinition
{


    public partial class BaseSlashing.abiDeployment : BaseSlashing.abiDeploymentBase
    {
        public BaseSlashing.abiDeployment() : base(BYTECODE) { }
        public BaseSlashing.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class BaseSlashing.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public BaseSlashing.abiDeploymentBase() : base(BYTECODE) { }
        public BaseSlashing.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class NetworkFunction : NetworkFunctionBase { }

    [Function("NETWORK", "address")]
    public class NetworkFunctionBase : FunctionMessage
    {

    }

    public partial class OperatorRegistryFunction : OperatorRegistryFunctionBase { }

    [Function("OPERATOR_REGISTRY", "address")]
    public class OperatorRegistryFunctionBase : FunctionMessage
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

    public partial class VaultFactoryFunction : VaultFactoryFunctionBase { }

    [Function("VAULT_FACTORY", "address")]
    public class VaultFactoryFunctionBase : FunctionMessage
    {

    }

    public partial class Eip712DomainFunction : Eip712DomainFunctionBase { }

    [Function("eip712Domain", typeof(Eip712DomainOutputDTO))]
    public class Eip712DomainFunctionBase : FunctionMessage
    {

    }

    public partial class ExecuteSlashVaultFunction : ExecuteSlashVaultFunctionBase { }

    [Function("executeSlashVault", typeof(ExecuteSlashVaultOutputDTO))]
    public class ExecuteSlashVaultFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint256", "slashIndex", 2)]
        public virtual BigInteger SlashIndex { get; set; }
        [Parameter("bytes", "hints", 3)]
        public virtual byte[] Hints { get; set; }
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

    public partial class GetSlasherFunction : GetSlasherFunctionBase { }

    [Function("getSlasher", "address")]
    public class GetSlasherFunctionBase : FunctionMessage
    {

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

    public partial class MulticallFunction : MulticallFunctionBase { }

    [Function("multicall", "bytes[]")]
    public class MulticallFunctionBase : FunctionMessage
    {
        [Parameter("bytes[]", "data", 1)]
        public virtual List<byte[]> Data { get; set; }
    }

    public partial class NoncesFunction : NoncesFunctionBase { }

    [Function("nonces", "uint256")]
    public class NoncesFunctionBase : FunctionMessage
    {
        [Parameter("address", "owner", 1)]
        public virtual string Owner { get; set; }
    }

    public partial class RegisterOperatorFunction : RegisterOperatorFunctionBase { }

    [Function("registerOperator")]
    public class RegisterOperatorFunctionBase : FunctionMessage
    {

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

    public partial class SetSlasherFunction : SetSlasherFunctionBase { }

    [Function("setSlasher")]
    public class SetSlasherFunctionBase : FunctionMessage
    {
        [Parameter("address", "slasher", 1)]
        public virtual string Slasher { get; set; }
    }

    public partial class SlashVaultFunction : SlashVaultFunctionBase { }

    [Function("slashVault", typeof(SlashVaultOutputDTO))]
    public class SlashVaultFunctionBase : FunctionMessage
    {
        [Parameter("uint48", "timestamp", 1)]
        public virtual ulong Timestamp { get; set; }
        [Parameter("address", "vault", 2)]
        public virtual string Vault { get; set; }
        [Parameter("address", "operator", 3)]
        public virtual string Operator { get; set; }
        [Parameter("uint256", "amount", 4)]
        public virtual BigInteger Amount { get; set; }
        [Parameter("bytes", "hints", 5)]
        public virtual byte[] Hints { get; set; }
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

    public partial class StaticDelegateCallFunction : StaticDelegateCallFunctionBase { }

    [Function("staticDelegateCall")]
    public class StaticDelegateCallFunctionBase : FunctionMessage
    {
        [Parameter("address", "target", 1)]
        public virtual string Target { get; set; }
        [Parameter("bytes", "data", 2)]
        public virtual byte[] Data { get; set; }
    }

    public partial class UnregisterOperatorFunction : UnregisterOperatorFunctionBase { }

    [Function("unregisterOperator")]
    public class UnregisterOperatorFunctionBase : FunctionMessage
    {

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

    public partial class EIP712DomainChangedEventDTO : EIP712DomainChangedEventDTOBase { }

    [Event("EIP712DomainChanged")]
    public class EIP712DomainChangedEventDTOBase : IEventDTO
    {
    }

    public partial class ExecuteSlashEventDTO : ExecuteSlashEventDTOBase { }

    [Event("ExecuteSlash")]
    public class ExecuteSlashEventDTOBase : IEventDTO
    {
        [Parameter("address", "slasher", 1, true )]
        public virtual string Slasher { get; set; }
        [Parameter("uint256", "slashIndex", 2, true )]
        public virtual BigInteger SlashIndex { get; set; }
        [Parameter("bool", "success", 3, true )]
        public virtual bool Success { get; set; }
        [Parameter("uint256", "slashedAmount", 4, false )]
        public virtual BigInteger SlashedAmount { get; set; }
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

    public partial class InstantSlashEventDTO : InstantSlashEventDTOBase { }

    [Event("InstantSlash")]
    public class InstantSlashEventDTOBase : IEventDTO
    {
        [Parameter("address", "slasher", 1, true )]
        public virtual string Slasher { get; set; }
        [Parameter("address", "operator", 2, true )]
        public virtual string Operator { get; set; }
        [Parameter("bool", "success", 3, true )]
        public virtual bool Success { get; set; }
        [Parameter("uint256", "slashedAmount", 4, false )]
        public virtual BigInteger SlashedAmount { get; set; }
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

    public partial class SetSlasherEventDTO : SetSlasherEventDTOBase { }

    [Event("SetSlasher")]
    public class SetSlasherEventDTOBase : IEventDTO
    {
        [Parameter("address", "slasher", 1, false )]
        public virtual string Slasher { get; set; }
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

    public partial class VetoSlashEventDTO : VetoSlashEventDTOBase { }

    [Event("VetoSlash")]
    public class VetoSlashEventDTOBase : IEventDTO
    {
        [Parameter("address", "slasher", 1, true )]
        public virtual string Slasher { get; set; }
        [Parameter("address", "operator", 2, true )]
        public virtual string Operator { get; set; }
        [Parameter("bool", "success", 3, true )]
        public virtual bool Success { get; set; }
        [Parameter("uint256", "slashIndex", 4, false )]
        public virtual BigInteger SlashIndex { get; set; }
    }

    public partial class AddressEmptyCodeError : AddressEmptyCodeErrorBase { }

    [Error("AddressEmptyCode")]
    public class AddressEmptyCodeErrorBase : IErrorDTO
    {
        [Parameter("address", "target", 1)]
        public virtual string Target { get; set; }
    }

    public partial class BaseslashingNoslasherError : BaseslashingNoslasherErrorBase { }
    [Error("BaseSlashing_NoSlasher")]
    public class BaseslashingNoslasherErrorBase : IErrorDTO
    {
    }

    public partial class BaseslashingNoslashingError : BaseslashingNoslashingErrorBase { }
    [Error("BaseSlashing_NoSlashing")]
    public class BaseslashingNoslashingErrorBase : IErrorDTO
    {
    }

    public partial class BaseslashingNotslasherError : BaseslashingNotslasherErrorBase { }
    [Error("BaseSlashing_NotSlasher")]
    public class BaseslashingNotslasherErrorBase : IErrorDTO
    {
    }

    public partial class BaseslashingNotvetoslasherError : BaseslashingNotvetoslasherErrorBase { }
    [Error("BaseSlashing_NotVetoSlasher")]
    public class BaseslashingNotvetoslasherErrorBase : IErrorDTO
    {
    }

    public partial class BaseslashingUnknownslashertypeError : BaseslashingUnknownslashertypeErrorBase { }
    [Error("BaseSlashing_UnknownSlasherType")]
    public class BaseslashingUnknownslashertypeErrorBase : IErrorDTO
    {
    }

    public partial class FailedCallError : FailedCallErrorBase { }
    [Error("FailedCall")]
    public class FailedCallErrorBase : IErrorDTO
    {
    }

    public partial class InvalidAccountNonceError : InvalidAccountNonceErrorBase { }

    [Error("InvalidAccountNonce")]
    public class InvalidAccountNonceErrorBase : IErrorDTO
    {
        [Parameter("address", "account", 1)]
        public virtual string Account { get; set; }
        [Parameter("uint256", "currentNonce", 2)]
        public virtual BigInteger CurrentNonce { get; set; }
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

    public partial class NetworkOutputDTO : NetworkOutputDTOBase { }

    [FunctionOutput]
    public class NetworkOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class OperatorRegistryOutputDTO : OperatorRegistryOutputDTOBase { }

    [FunctionOutput]
    public class OperatorRegistryOutputDTOBase : IFunctionOutputDTO 
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

    public partial class VaultFactoryOutputDTO : VaultFactoryOutputDTOBase { }

    [FunctionOutput]
    public class VaultFactoryOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
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

    public partial class ExecuteSlashVaultOutputDTO : ExecuteSlashVaultOutputDTOBase { }

    [FunctionOutput]
    public class ExecuteSlashVaultOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "success", 1)]
        public virtual bool Success { get; set; }
        [Parameter("uint256", "slashedAmount", 2)]
        public virtual BigInteger SlashedAmount { get; set; }
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

    public partial class GetSlasherOutputDTO : GetSlasherOutputDTOBase { }

    [FunctionOutput]
    public class GetSlasherOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class GetSlashingDataOutputDTO : GetSlashingDataOutputDTOBase { }

    [FunctionOutput]
    public class GetSlashingDataOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
        [Parameter("uint48", "", 2)]
        public virtual ulong ReturnValue2 { get; set; }
    }

    public partial class GetSlashingDataAtOutputDTO : GetSlashingDataAtOutputDTOBase { }

    [FunctionOutput]
    public class GetSlashingDataAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
        [Parameter("uint48", "", 2)]
        public virtual ulong ReturnValue2 { get; set; }
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



    public partial class NoncesOutputDTO : NoncesOutputDTOBase { }

    [FunctionOutput]
    public class NoncesOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }







    public partial class SlashVaultOutputDTO : SlashVaultOutputDTOBase { }

    [FunctionOutput]
    public class SlashVaultOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "success", 1)]
        public virtual bool Success { get; set; }
        [Parameter("bytes", "response", 2)]
        public virtual byte[] Response { get; set; }
    }

    public partial class StakeToVotingPowerOutputDTO : StakeToVotingPowerOutputDTOBase { }

    [FunctionOutput]
    public class StakeToVotingPowerOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "power", 1)]
        public virtual BigInteger Power { get; set; }
    }

    public partial class StakeToVotingPowerAtOutputDTO : StakeToVotingPowerAtOutputDTOBase { }

    [FunctionOutput]
    public class StakeToVotingPowerAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "power", 1)]
        public virtual BigInteger Power { get; set; }
    }






}
