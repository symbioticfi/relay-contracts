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

namespace Symbiotic.Relay.IOpNetVaultAutoDeploy.abi.ContractDefinition
{


    public partial class IOpNetVaultAutoDeploy.abiDeployment : IOpNetVaultAutoDeploy.abiDeploymentBase
    {
        public IOpNetVaultAutoDeploy.abiDeployment() : base(BYTECODE) { }
        public IOpNetVaultAutoDeploy.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IOpNetVaultAutoDeploy.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IOpNetVaultAutoDeploy.abiDeploymentBase() : base(BYTECODE) { }
        public IOpNetVaultAutoDeploy.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class VaultConfiguratorFunction : VaultConfiguratorFunctionBase { }

    [Function("VAULT_CONFIGURATOR", "address")]
    public class VaultConfiguratorFunctionBase : FunctionMessage
    {

    }

    public partial class GetAutoDeployConfigFunction : GetAutoDeployConfigFunctionBase { }

    [Function("getAutoDeployConfig", typeof(GetAutoDeployConfigOutputDTO))]
    public class GetAutoDeployConfigFunctionBase : FunctionMessage
    {

    }

    public partial class GetAutoDeployedVaultFunction : GetAutoDeployedVaultFunctionBase { }

    [Function("getAutoDeployedVault", "address")]
    public class GetAutoDeployedVaultFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class IsAutoDeployEnabledFunction : IsAutoDeployEnabledFunctionBase { }

    [Function("isAutoDeployEnabled", "bool")]
    public class IsAutoDeployEnabledFunctionBase : FunctionMessage
    {

    }

    public partial class IsSetMaxNetworkLimitHookEnabledFunction : IsSetMaxNetworkLimitHookEnabledFunctionBase { }

    [Function("isSetMaxNetworkLimitHookEnabled", "bool")]
    public class IsSetMaxNetworkLimitHookEnabledFunctionBase : FunctionMessage
    {

    }

    public partial class SetAutoDeployConfigFunction : SetAutoDeployConfigFunctionBase { }

    [Function("setAutoDeployConfig")]
    public class SetAutoDeployConfigFunctionBase : FunctionMessage
    {
        [Parameter("tuple", "config", 1)]
        public virtual AutoDeployConfig Config { get; set; }
    }

    public partial class SetAutoDeployStatusFunction : SetAutoDeployStatusFunctionBase { }

    [Function("setAutoDeployStatus")]
    public class SetAutoDeployStatusFunctionBase : FunctionMessage
    {
        [Parameter("bool", "status", 1)]
        public virtual bool Status { get; set; }
    }

    public partial class SetSetMaxNetworkLimitHookStatusFunction : SetSetMaxNetworkLimitHookStatusFunctionBase { }

    [Function("setSetMaxNetworkLimitHookStatus")]
    public class SetSetMaxNetworkLimitHookStatusFunctionBase : FunctionMessage
    {
        [Parameter("bool", "status", 1)]
        public virtual bool Status { get; set; }
    }

    public partial class SetAutoDeployConfigEventDTO : SetAutoDeployConfigEventDTOBase { }

    [Event("SetAutoDeployConfig")]
    public class SetAutoDeployConfigEventDTOBase : IEventDTO
    {
        [Parameter("tuple", "config", 1, false )]
        public virtual AutoDeployConfig Config { get; set; }
    }

    public partial class SetAutoDeployStatusEventDTO : SetAutoDeployStatusEventDTOBase { }

    [Event("SetAutoDeployStatus")]
    public class SetAutoDeployStatusEventDTOBase : IEventDTO
    {
        [Parameter("bool", "status", 1, false )]
        public virtual bool Status { get; set; }
    }

    public partial class SetSetMaxNetworkLimitHookStatusEventDTO : SetSetMaxNetworkLimitHookStatusEventDTOBase { }

    [Event("SetSetMaxNetworkLimitHookStatus")]
    public class SetSetMaxNetworkLimitHookStatusEventDTOBase : IEventDTO
    {
        [Parameter("bool", "status", 1, false )]
        public virtual bool Status { get; set; }
    }

    public partial class OpnetvaultautodeployInvalidburnerhookError : OpnetvaultautodeployInvalidburnerhookErrorBase { }
    [Error("OpNetVaultAutoDeploy_InvalidBurnerHook")]
    public class OpnetvaultautodeployInvalidburnerhookErrorBase : IErrorDTO
    {
    }

    public partial class OpnetvaultautodeployInvalidcollateralError : OpnetvaultautodeployInvalidcollateralErrorBase { }
    [Error("OpNetVaultAutoDeploy_InvalidCollateral")]
    public class OpnetvaultautodeployInvalidcollateralErrorBase : IErrorDTO
    {
    }

    public partial class OpnetvaultautodeployInvalidepochdurationError : OpnetvaultautodeployInvalidepochdurationErrorBase { }
    [Error("OpNetVaultAutoDeploy_InvalidEpochDuration")]
    public class OpnetvaultautodeployInvalidepochdurationErrorBase : IErrorDTO
    {
    }

    public partial class OpnetvaultautodeployInvalidwithslasherError : OpnetvaultautodeployInvalidwithslasherErrorBase { }
    [Error("OpNetVaultAutoDeploy_InvalidWithSlasher")]
    public class OpnetvaultautodeployInvalidwithslasherErrorBase : IErrorDTO
    {
    }

    public partial class VaultConfiguratorOutputDTO : VaultConfiguratorOutputDTOBase { }

    [FunctionOutput]
    public class VaultConfiguratorOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class GetAutoDeployConfigOutputDTO : GetAutoDeployConfigOutputDTOBase { }

    [FunctionOutput]
    public class GetAutoDeployConfigOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple", "", 1)]
        public virtual AutoDeployConfig ReturnValue1 { get; set; }
    }

    public partial class GetAutoDeployedVaultOutputDTO : GetAutoDeployedVaultOutputDTOBase { }

    [FunctionOutput]
    public class GetAutoDeployedVaultOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class IsAutoDeployEnabledOutputDTO : IsAutoDeployEnabledOutputDTOBase { }

    [FunctionOutput]
    public class IsAutoDeployEnabledOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsSetMaxNetworkLimitHookEnabledOutputDTO : IsSetMaxNetworkLimitHookEnabledOutputDTOBase { }

    [FunctionOutput]
    public class IsSetMaxNetworkLimitHookEnabledOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }






}
