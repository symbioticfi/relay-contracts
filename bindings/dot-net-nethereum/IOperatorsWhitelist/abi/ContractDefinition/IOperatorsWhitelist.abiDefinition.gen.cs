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

namespace Symbiotic.Relay.IOperatorsWhitelist.abi.ContractDefinition
{


    public partial class IOperatorsWhitelist.abiDeployment : IOperatorsWhitelist.abiDeploymentBase
    {
        public IOperatorsWhitelist.abiDeployment() : base(BYTECODE) { }
        public IOperatorsWhitelist.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IOperatorsWhitelist.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IOperatorsWhitelist.abiDeploymentBase() : base(BYTECODE) { }
        public IOperatorsWhitelist.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class IsOperatorWhitelistedFunction : IsOperatorWhitelistedFunctionBase { }

    [Function("isOperatorWhitelisted", "bool")]
    public class IsOperatorWhitelistedFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class IsWhitelistEnabledFunction : IsWhitelistEnabledFunctionBase { }

    [Function("isWhitelistEnabled", "bool")]
    public class IsWhitelistEnabledFunctionBase : FunctionMessage
    {

    }

    public partial class SetWhitelistStatusFunction : SetWhitelistStatusFunctionBase { }

    [Function("setWhitelistStatus")]
    public class SetWhitelistStatusFunctionBase : FunctionMessage
    {
        [Parameter("bool", "status", 1)]
        public virtual bool Status { get; set; }
    }

    public partial class UnwhitelistOperatorFunction : UnwhitelistOperatorFunctionBase { }

    [Function("unwhitelistOperator")]
    public class UnwhitelistOperatorFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class WhitelistOperatorFunction : WhitelistOperatorFunctionBase { }

    [Function("whitelistOperator")]
    public class WhitelistOperatorFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class SetWhitelistStatusEventDTO : SetWhitelistStatusEventDTOBase { }

    [Event("SetWhitelistStatus")]
    public class SetWhitelistStatusEventDTOBase : IEventDTO
    {
        [Parameter("bool", "status", 1, false )]
        public virtual bool Status { get; set; }
    }

    public partial class UnwhitelistOperatorEventDTO : UnwhitelistOperatorEventDTOBase { }

    [Event("UnwhitelistOperator")]
    public class UnwhitelistOperatorEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
    }

    public partial class WhitelistOperatorEventDTO : WhitelistOperatorEventDTOBase { }

    [Event("WhitelistOperator")]
    public class WhitelistOperatorEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
    }

    public partial class OperatorswhitelistOperatornotwhitelistedError : OperatorswhitelistOperatornotwhitelistedErrorBase { }
    [Error("OperatorsWhitelist_OperatorNotWhitelisted")]
    public class OperatorswhitelistOperatornotwhitelistedErrorBase : IErrorDTO
    {
    }

    public partial class OperatorswhitelistOperatorwhitelistedError : OperatorswhitelistOperatorwhitelistedErrorBase { }
    [Error("OperatorsWhitelist_OperatorWhitelisted")]
    public class OperatorswhitelistOperatorwhitelistedErrorBase : IErrorDTO
    {
    }

    public partial class OperatorswhitelistStatusalreadysetError : OperatorswhitelistStatusalreadysetErrorBase { }
    [Error("OperatorsWhitelist_StatusAlreadySet")]
    public class OperatorswhitelistStatusalreadysetErrorBase : IErrorDTO
    {
    }

    public partial class IsOperatorWhitelistedOutputDTO : IsOperatorWhitelistedOutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorWhitelistedOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }

    public partial class IsWhitelistEnabledOutputDTO : IsWhitelistEnabledOutputDTOBase { }

    [FunctionOutput]
    public class IsWhitelistEnabledOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }






}
