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

namespace Symbiotic.Relay.IBaseRewards.abi.ContractDefinition
{


    public partial class IBaseRewards.abiDeployment : IBaseRewards.abiDeploymentBase
    {
        public IBaseRewards.abiDeployment() : base(BYTECODE) { }
        public IBaseRewards.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IBaseRewards.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IBaseRewards.abiDeploymentBase() : base(BYTECODE) { }
        public IBaseRewards.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class DistributeOperatorRewardsFunction : DistributeOperatorRewardsFunctionBase { }

    [Function("distributeOperatorRewards")]
    public class DistributeOperatorRewardsFunctionBase : FunctionMessage
    {
        [Parameter("address", "operatorRewards", 1)]
        public virtual string OperatorRewards { get; set; }
        [Parameter("address", "token", 2)]
        public virtual string Token { get; set; }
        [Parameter("uint256", "amount", 3)]
        public virtual BigInteger Amount { get; set; }
        [Parameter("bytes32", "root", 4)]
        public virtual byte[] Root { get; set; }
    }

    public partial class DistributeStakerRewardsFunction : DistributeStakerRewardsFunctionBase { }

    [Function("distributeStakerRewards")]
    public class DistributeStakerRewardsFunctionBase : FunctionMessage
    {
        [Parameter("address", "stakerRewards", 1)]
        public virtual string StakerRewards { get; set; }
        [Parameter("address", "token", 2)]
        public virtual string Token { get; set; }
        [Parameter("uint256", "amount", 3)]
        public virtual BigInteger Amount { get; set; }
        [Parameter("bytes", "data", 4)]
        public virtual byte[] Data { get; set; }
    }

    public partial class GetRewarderFunction : GetRewarderFunctionBase { }

    [Function("getRewarder", "address")]
    public class GetRewarderFunctionBase : FunctionMessage
    {

    }

    public partial class SetRewarderFunction : SetRewarderFunctionBase { }

    [Function("setRewarder")]
    public class SetRewarderFunctionBase : FunctionMessage
    {
        [Parameter("address", "rewarder", 1)]
        public virtual string Rewarder { get; set; }
    }

    public partial class DistributeOperatorRewardsEventDTO : DistributeOperatorRewardsEventDTOBase { }

    [Event("DistributeOperatorRewards")]
    public class DistributeOperatorRewardsEventDTOBase : IEventDTO
    {
        [Parameter("address", "operatorRewards", 1, true )]
        public virtual string OperatorRewards { get; set; }
        [Parameter("address", "token", 2, true )]
        public virtual string Token { get; set; }
        [Parameter("uint256", "amount", 3, false )]
        public virtual BigInteger Amount { get; set; }
        [Parameter("bytes32", "root", 4, false )]
        public virtual byte[] Root { get; set; }
    }

    public partial class DistributeStakerRewardsEventDTO : DistributeStakerRewardsEventDTOBase { }

    [Event("DistributeStakerRewards")]
    public class DistributeStakerRewardsEventDTOBase : IEventDTO
    {
        [Parameter("address", "stakerRewards", 1, true )]
        public virtual string StakerRewards { get; set; }
        [Parameter("address", "token", 2, true )]
        public virtual string Token { get; set; }
        [Parameter("uint256", "amount", 3, false )]
        public virtual BigInteger Amount { get; set; }
        [Parameter("bytes", "data", 4, false )]
        public virtual byte[] Data { get; set; }
    }

    public partial class SetRewarderEventDTO : SetRewarderEventDTOBase { }

    [Event("SetRewarder")]
    public class SetRewarderEventDTOBase : IEventDTO
    {
        [Parameter("address", "rewarder", 1, false )]
        public virtual string Rewarder { get; set; }
    }

    public partial class BaserewardsNotrewarderError : BaserewardsNotrewarderErrorBase { }
    [Error("BaseRewards_NotRewarder")]
    public class BaserewardsNotrewarderErrorBase : IErrorDTO
    {
    }





    public partial class GetRewarderOutputDTO : GetRewarderOutputDTOBase { }

    [FunctionOutput]
    public class GetRewarderOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("address", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }


}
