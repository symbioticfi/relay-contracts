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

namespace Symbiotic.Relay.IOperatorsJail.abi.ContractDefinition
{


    public partial class IOperatorsJail.abiDeployment : IOperatorsJail.abiDeploymentBase
    {
        public IOperatorsJail.abiDeployment() : base(BYTECODE) { }
        public IOperatorsJail.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IOperatorsJail.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IOperatorsJail.abiDeploymentBase() : base(BYTECODE) { }
        public IOperatorsJail.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class GetOperatorJailedUntilFunction : GetOperatorJailedUntilFunctionBase { }

    [Function("getOperatorJailedUntil", "uint48")]
    public class GetOperatorJailedUntilFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class IsOperatorJailedFunction : IsOperatorJailedFunctionBase { }

    [Function("isOperatorJailed", "bool")]
    public class IsOperatorJailedFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class JailOperatorFunction : JailOperatorFunctionBase { }

    [Function("jailOperator")]
    public class JailOperatorFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("uint48", "duration", 2)]
        public virtual ulong Duration { get; set; }
    }

    public partial class UnjailOperatorFunction : UnjailOperatorFunctionBase { }

    [Function("unjailOperator")]
    public class UnjailOperatorFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
    }

    public partial class JailOperatorEventDTO : JailOperatorEventDTOBase { }

    [Event("JailOperator")]
    public class JailOperatorEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
    }

    public partial class UnjailOperatorEventDTO : UnjailOperatorEventDTOBase { }

    [Event("UnjailOperator")]
    public class UnjailOperatorEventDTOBase : IEventDTO
    {
        [Parameter("address", "operator", 1, true )]
        public virtual string Operator { get; set; }
    }

    public partial class OperatorsjailAlreadyjailedError : OperatorsjailAlreadyjailedErrorBase { }
    [Error("OperatorsJail_AlreadyJailed")]
    public class OperatorsjailAlreadyjailedErrorBase : IErrorDTO
    {
    }

    public partial class OperatorsjailInvaliddurationError : OperatorsjailInvaliddurationErrorBase { }
    [Error("OperatorsJail_InvalidDuration")]
    public class OperatorsjailInvaliddurationErrorBase : IErrorDTO
    {
    }

    public partial class OperatorsjailOperatorjailedError : OperatorsjailOperatorjailedErrorBase { }
    [Error("OperatorsJail_OperatorJailed")]
    public class OperatorsjailOperatorjailedErrorBase : IErrorDTO
    {
    }

    public partial class OperatorsjailOperatornotjailedError : OperatorsjailOperatornotjailedErrorBase { }
    [Error("OperatorsJail_OperatorNotJailed")]
    public class OperatorsjailOperatornotjailedErrorBase : IErrorDTO
    {
    }

    public partial class GetOperatorJailedUntilOutputDTO : GetOperatorJailedUntilOutputDTOBase { }

    [FunctionOutput]
    public class GetOperatorJailedUntilOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint48", "", 1)]
        public virtual ulong ReturnValue1 { get; set; }
    }

    public partial class IsOperatorJailedOutputDTO : IsOperatorJailedOutputDTOBase { }

    [FunctionOutput]
    public class IsOperatorJailedOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bool", "", 1)]
        public virtual bool ReturnValue1 { get; set; }
    }




}
