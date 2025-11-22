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

    public partial class RegisterOperatorVaultFunction : RegisterOperatorVaultFunctionBase { }

    [Function("registerOperatorVault")]
    public class RegisterOperatorVaultFunctionBase : FunctionMessage
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("address", "vault", 2)]
        public virtual string Vault { get; set; }
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






}
