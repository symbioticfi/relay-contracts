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

namespace Symbiotic.Relay.AggregatorV3Interface.abi.ContractDefinition
{


    public partial class AggregatorV3Interface.abiDeployment : AggregatorV3Interface.abiDeploymentBase
    {
        public AggregatorV3Interface.abiDeployment() : base(BYTECODE) { }
        public AggregatorV3Interface.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class AggregatorV3Interface.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public AggregatorV3Interface.abiDeploymentBase() : base(BYTECODE) { }
        public AggregatorV3Interface.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class DecimalsFunction : DecimalsFunctionBase { }

    [Function("decimals", "uint8")]
    public class DecimalsFunctionBase : FunctionMessage
    {

    }

    public partial class DescriptionFunction : DescriptionFunctionBase { }

    [Function("description", "string")]
    public class DescriptionFunctionBase : FunctionMessage
    {

    }

    public partial class GetRoundDataFunction : GetRoundDataFunctionBase { }

    [Function("getRoundData", typeof(GetRoundDataOutputDTO))]
    public class GetRoundDataFunctionBase : FunctionMessage
    {
        [Parameter("uint80", "_roundId", 1)]
        public virtual BigInteger RoundId { get; set; }
    }

    public partial class LatestRoundDataFunction : LatestRoundDataFunctionBase { }

    [Function("latestRoundData", typeof(LatestRoundDataOutputDTO))]
    public class LatestRoundDataFunctionBase : FunctionMessage
    {

    }

    public partial class VersionFunction : VersionFunctionBase { }

    [Function("version", "uint256")]
    public class VersionFunctionBase : FunctionMessage
    {

    }

    public partial class DecimalsOutputDTO : DecimalsOutputDTOBase { }

    [FunctionOutput]
    public class DecimalsOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint8", "", 1)]
        public virtual byte ReturnValue1 { get; set; }
    }

    public partial class DescriptionOutputDTO : DescriptionOutputDTOBase { }

    [FunctionOutput]
    public class DescriptionOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("string", "", 1)]
        public virtual string ReturnValue1 { get; set; }
    }

    public partial class GetRoundDataOutputDTO : GetRoundDataOutputDTOBase { }

    [FunctionOutput]
    public class GetRoundDataOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint80", "roundId", 1)]
        public virtual BigInteger RoundId { get; set; }
        [Parameter("int256", "answer", 2)]
        public virtual BigInteger Answer { get; set; }
        [Parameter("uint256", "startedAt", 3)]
        public virtual BigInteger StartedAt { get; set; }
        [Parameter("uint256", "updatedAt", 4)]
        public virtual BigInteger UpdatedAt { get; set; }
        [Parameter("uint80", "answeredInRound", 5)]
        public virtual BigInteger AnsweredInRound { get; set; }
    }

    public partial class LatestRoundDataOutputDTO : LatestRoundDataOutputDTOBase { }

    [FunctionOutput]
    public class LatestRoundDataOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint80", "roundId", 1)]
        public virtual BigInteger RoundId { get; set; }
        [Parameter("int256", "answer", 2)]
        public virtual BigInteger Answer { get; set; }
        [Parameter("uint256", "startedAt", 3)]
        public virtual BigInteger StartedAt { get; set; }
        [Parameter("uint256", "updatedAt", 4)]
        public virtual BigInteger UpdatedAt { get; set; }
        [Parameter("uint80", "answeredInRound", 5)]
        public virtual BigInteger AnsweredInRound { get; set; }
    }

    public partial class VersionOutputDTO : VersionOutputDTOBase { }

    [FunctionOutput]
    public class VersionOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }
}
