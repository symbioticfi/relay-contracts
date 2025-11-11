using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.KeyRegistry.abi.ContractDefinition
{
    public partial class Key : KeyBase { }

    public class KeyBase 
    {
        [Parameter("uint8", "tag", 1)]
        public virtual byte Tag { get; set; }
        [Parameter("bytes", "payload", 2)]
        public virtual byte[] Payload { get; set; }
    }
}
