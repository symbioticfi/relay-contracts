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

namespace Symbiotic.Relay.IOperatorsBlacklist.abi.ContractDefinition
{


    public partial class IOperatorsBlacklist.abiDeployment : IOperatorsBlacklist.abiDeploymentBase
    {
        public IOperatorsBlacklist.abiDeployment() : base(BYTECODE) { }
        public IOperatorsBlacklist.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IOperatorsBlacklist.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IOperatorsBlacklist.abiDeploymentBase() : base(BYTECODE) { }
        public IOperatorsBlacklist.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class BlacklistOperatorFunction : BlacklistOperatorFunctionBase { }

    [Function("blacklistOperator")]
    public class BlacklistOperatorFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class IsOperatorBlacklistedFunction : IsOperatorBlacklistedFunctionBase { }

    [Function("isOperatorBlacklisted", "bool")]
    public class IsOperatorBlacklistedFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class UnblacklistOperatorFunction : UnblacklistOperatorFunctionBase { }

    [Function("unblacklistOperator")]
    public class UnblacklistOperatorFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class BlacklistOperatorEventDTO : BlacklistOperatorEventDTOBase { }

    [Event("BlacklistOperator")]
    public class BlacklistOperatorEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
    }

    public partial class UnblacklistOperatorEventDTO : UnblacklistOperatorEventDTOBase { }

    [Event("UnblacklistOperator")]
    public class UnblacklistOperatorEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
    }

    public partial class OperatorsblacklistOperatorblacklistedError : OperatorsblacklistOperatorblacklistedErrorBase { }
    [Error("OperatorsBlacklist_OperatorBlacklisted")]
    public class OperatorsblacklistOperatorblacklistedErrorBase : IErrorDTO
    {
    }

    public partial class OperatorsblacklistOperatornotblacklistedError : OperatorsblacklistOperatornotblacklistedErrorBase { }
    [Error("OperatorsBlacklist_OperatorNotBlacklisted")]
    public class OperatorsblacklistOperatornotblacklistedErrorBase : IErrorDTO
    {
    }



    public partial class IsOperatorBlacklistedOutputDTO : IsOperatorBlacklistedOutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorBlacklistedOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }


}
