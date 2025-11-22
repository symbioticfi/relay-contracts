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

namespace Symbiotic.Relay.INormalizedTokenDecimalsVPCalc.abi.ContractDefinition
{


    public partial class INormalizedTokenDecimalsVPCalc.abiDeployment : INormalizedTokenDecimalsVPCalc.abiDeploymentBase
    {
        public INormalizedTokenDecimalsVPCalc.abiDeployment() : base(BYTECODE) { }
        public INormalizedTokenDecimalsVPCalc.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class INormalizedTokenDecimalsVPCalc.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public INormalizedTokenDecimalsVPCalc.abiDeploymentBase() : base(BYTECODE) { }
        public INormalizedTokenDecimalsVPCalc.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }
}
