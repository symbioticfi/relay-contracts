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

namespace Symbiotic.Relay.IPermissionManager.abi.ContractDefinition
{


    public partial class IPermissionManager.abiDeployment : IPermissionManager.abiDeploymentBase
    {
        public IPermissionManager.abiDeployment() : base(BYTECODE) { }
        public IPermissionManager.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IPermissionManager.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IPermissionManager.abiDeploymentBase() : base(BYTECODE) { }
        public IPermissionManager.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }
}
