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

namespace Symbiotic.Relay.IWeightedVaultsVPCalc.abi.ContractDefinition
{


    public partial class IWeightedVaultsVPCalc.abiDeployment : IWeightedVaultsVPCalc.abiDeploymentBase
    {
        public IWeightedVaultsVPCalc.abiDeployment() : base(BYTECODE) { }
        public IWeightedVaultsVPCalc.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IWeightedVaultsVPCalc.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IWeightedVaultsVPCalc.abiDeploymentBase() : base(BYTECODE) { }
        public IWeightedVaultsVPCalc.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class GetVaultWeightFunction : GetVaultWeightFunctionBase { }

    [Function("getVaultWeight", "uint208")]
    public class GetVaultWeightFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
    }

    public partial class GetVaultWeightAtFunction : GetVaultWeightAtFunctionBase { }

    [Function("getVaultWeightAt", "uint208")]
    public class GetVaultWeightAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint48", "timestamp", 2)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class SetVaultWeightFunction : SetVaultWeightFunctionBase { }

    [Function("setVaultWeight")]
    public class SetVaultWeightFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint208", "weight", 2)]
        public virtual BigInteger Weight { get; set; }
    }

    public partial class SetVaultWeightEventDTO : SetVaultWeightEventDTOBase { }

    [Event("SetVaultWeight")]
    public class SetVaultWeightEventDTOBase : IEventDTO
    {
        [Parameter("address", "vault", 1, true )]
        public virtual string Vault { get; set; }
        [Parameter("uint208", "weight", 2, false )]
        public virtual BigInteger Weight { get; set; }
    }

    public partial class WeightedvaultsvpcalcToolargeweightError : WeightedvaultsvpcalcToolargeweightErrorBase { }
    [Error("WeightedVaultsVPCalc_TooLargeWeight")]
    public class WeightedvaultsvpcalcToolargeweightErrorBase : IErrorDTO
    {
    }

    public partial class GetVaultWeightOutputDTO : GetVaultWeightOutputDTOBase { }

    [FunctionOutput]
    public class GetVaultWeightOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetVaultWeightAtOutputDTO : GetVaultWeightAtOutputDTOBase { }

    [FunctionOutput]
    public class GetVaultWeightAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint208", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }


}
