using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.KeyRegistry.abi.ContractDefinition
{
    public partial class OperatorWithKeys : OperatorWithKeysBase { }

    public class OperatorWithKeysBase 
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("tuple[]", "keys", 2)]
        public virtual List<Key> Keys { get; set; }
    }
}
