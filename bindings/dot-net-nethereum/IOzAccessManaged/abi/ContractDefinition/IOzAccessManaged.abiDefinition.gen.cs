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

namespace Symbiotic.Relay.IOzAccessManaged.abi.ContractDefinition
{


    public partial class IOzAccessManaged.abiDeployment : IOzAccessManaged.abiDeploymentBase
    {
        public IOzAccessManaged.abiDeployment() : base(BYTECODE) { }
        public IOzAccessManaged.abiDeployment(string byteCode) : base(byteCode) { }
    }

    public class IOzAccessManaged.abiDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "";
        public IOzAccessManaged.abiDeploymentBase() : base(BYTECODE) { }
        public IOzAccessManaged.abiDeploymentBase(string byteCode) : base(byteCode) { }

    }
}
