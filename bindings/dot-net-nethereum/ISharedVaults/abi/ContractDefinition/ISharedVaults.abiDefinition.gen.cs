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

namespace Symbiotic.Relay.ISharedVaults.abi.ContractDefinition
{


    public partial class ISharedVaults.abiDeployment : ISharedVaults.abiDeploymentBase
    {
        public ISharedVaults.abiDeployment() : base(BYTECODE) { }
        public ISharedVaults.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class ISharedVaults.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public ISharedVaults.abiDeploymentBase() : base(BYTECODE) { }
        public ISharedVaults.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class RegisterSharedVaultFunction : RegisterSharedVaultFunctionBase { }

    [Function("registerSharedVault")]
    public class RegisterSharedVaultFunctionBase : FunctionMessage
    {
        [Parameter("address", "sharedVault", 1)]
        public virtual string SharedVault { get; set; }
    }

    public partial class UnregisterSharedVaultFunction : UnregisterSharedVaultFunctionBase { }

    [Function("unregisterSharedVault")]
    public class UnregisterSharedVaultFunctionBase : FunctionMessage
    {
        [Parameter("address", "sharedVault", 1)]
        public virtual string SharedVault { get; set; }
    }




}
