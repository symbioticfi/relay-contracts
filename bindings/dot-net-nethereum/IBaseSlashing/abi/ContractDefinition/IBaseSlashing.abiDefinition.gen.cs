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

namespace Symbiotic.Relay.IBaseSlashing.abi.ContractDefinition
{


    public partial class IBaseSlashing.abiDeployment : IBaseSlashing.abiDeploymentBase
    {
        public IBaseSlashing.abiDeployment() : base(BYTECODE) { }
        public IBaseSlashing.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IBaseSlashing.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IBaseSlashing.abiDeploymentBase() : base(BYTECODE) { }
        public IBaseSlashing.abiDeploymentBase(string byteCode) : base(byteCode) { }

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

    public partial class GetSlasherFunction : GetSlasherFunctionBase { }

    [Function("getSlasher", "address")]
    public class GetSlasherFunctionBase : FunctionMessage
    {

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

    public partial class SetSlasherEventDTO : SetSlasherEventDTOBase { }

    [Event("SetSlasher")]
    public class SetSlasherEventDTOBase : IEventDTO
    {
        [Parameter("address", "slasher", 1, false )]
        public virtual string Slasher { get; set; }
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

    public partial class ExecuteSlashVaultOutputDTO : ExecuteSlashVaultOutputDTOBase { }

    [FunctionOutput]
    public class ExecuteSlashVaultOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "success", 1)]
        public virtual bool Success { get; set; }
        [Parameter("uint256", "slashedAmount", 2)]
        public virtual BigInteger SlashedAmount { get; set; }
    }

    public partial class GetSlasherOutputDTO : GetSlasherOutputDTOBase { }

    [FunctionOutput]
    public class GetSlasherOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
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
}
