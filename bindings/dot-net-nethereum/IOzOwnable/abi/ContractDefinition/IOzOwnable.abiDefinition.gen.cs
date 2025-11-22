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

namespace Symbiotic.Relay.IOzOwnable.abi.ContractDefinition
{


    public partial class IOzOwnable.abiDeployment : IOzOwnable.abiDeploymentBase
    {
        public IOzOwnable.abiDeployment() : base(BYTECODE) { }
        public IOzOwnable.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IOzOwnable.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IOzOwnable.abiDeploymentBase() : base(BYTECODE) { }
        public IOzOwnable.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }
}
