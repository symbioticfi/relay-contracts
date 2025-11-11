using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.KeyRegistry.abi.ContractDefinition
{
    public partial class OzEIP712InitParams : OzEIP712InitParamsBase { }

    public class OzEIP712InitParamsBase 
    {
        [Parameter("string", "name", 1)]
        public virtual string Name { get; set; }
        [Parameter("string", "version", 2)]
        public virtual string Version { get; set; }
    }
}
