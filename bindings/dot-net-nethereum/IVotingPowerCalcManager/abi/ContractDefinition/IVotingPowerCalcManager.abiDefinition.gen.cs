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

namespace Symbiotic.Relay.IVotingPowerCalcManager.abi.ContractDefinition
{


    public partial class IVotingPowerCalcManager.abiDeployment : IVotingPowerCalcManager.abiDeploymentBase
    {
        public IVotingPowerCalcManager.abiDeployment() : base(BYTECODE) { }
        public IVotingPowerCalcManager.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IVotingPowerCalcManager.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IVotingPowerCalcManager.abiDeploymentBase() : base(BYTECODE) { }
        public IVotingPowerCalcManager.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class StakeToVotingPowerFunction : StakeToVotingPowerFunctionBase { }

    [Function("stakeToVotingPower", "uint256")]
    public class StakeToVotingPowerFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint256", "stake", 2)]
        public virtual BigInteger Stake { get; set; }
        [Parameter("bytes", "extraData", 3)]
        public virtual byte[] ExtraData { get; set; }
    }

    public partial class StakeToVotingPowerAtFunction : StakeToVotingPowerAtFunctionBase { }

    [Function("stakeToVotingPowerAt", "uint256")]
    public class StakeToVotingPowerAtFunctionBase : FunctionMessage
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint256", "stake", 2)]
        public virtual BigInteger Stake { get; set; }
        [Parameter("bytes", "extraData", 3)]
        public virtual byte[] ExtraData { get; set; }
        [Parameter("uint48", "timestamp", 4)]
        public virtual ulong Timestamp { get; set; }
    }

    public partial class StakeToVotingPowerOutputDTO : StakeToVotingPowerOutputDTOBase { }

    [FunctionOutput]
    public class StakeToVotingPowerOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class StakeToVotingPowerAtOutputDTO : StakeToVotingPowerAtOutputDTOBase { }

    [FunctionOutput]
    public class StakeToVotingPowerAtOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }
}
