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

namespace Symbiotic.Relay.IEqualStakeVPCalc.abi.ContractDefinition
{


    public partial class IEqualStakeVPCalc.abiDeployment : IEqualStakeVPCalc.abiDeploymentBase
    {
        public IEqualStakeVPCalc.abiDeployment() : base(BYTECODE) { }
        public IEqualStakeVPCalc.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IEqualStakeVPCalc.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IEqualStakeVPCalc.abiDeploymentBase() : base(BYTECODE) { }
        public IEqualStakeVPCalc.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }
}
