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

namespace Symbiotic.Relay.IOzAccessControl.abi.ContractDefinition
{


    public partial class IOzAccessControl.abiDeployment : IOzAccessControl.abiDeploymentBase
    {
        public IOzAccessControl.abiDeployment() : base(BYTECODE) { }
        public IOzAccessControl.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IOzAccessControl.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IOzAccessControl.abiDeploymentBase() : base(BYTECODE) { }
        public IOzAccessControl.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class GetRoleFunction : GetRoleFunctionBase { }

    [Function("getRole", "bytes32")]
    public class GetRoleFunctionBase : FunctionMessage
    {
        [Parameter("bytes4", "selector", 1)]
        public virtual byte[] Selector { get; set; }
    }

    public partial class SetSelectorRoleEventDTO : SetSelectorRoleEventDTOBase { }

    [Event("SetSelectorRole")]
    public class SetSelectorRoleEventDTOBase : IEventDTO
    {
        [Parameter("bytes4", "selector", 1, true )]
        public virtual byte[] Selector { get; set; }
        [Parameter("bytes32", "role", 2, true )]
        public virtual byte[] Role { get; set; }
    }

    public partial class GetRoleOutputDTO : GetRoleOutputDTOBase { }

    [FunctionOutput]
    public class GetRoleOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("bytes32", "", 1)]
        public virtual byte[] ReturnValue1 { get; set; }
    }
}
