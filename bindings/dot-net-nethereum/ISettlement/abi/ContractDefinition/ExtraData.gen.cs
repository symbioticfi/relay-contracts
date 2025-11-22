using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.ISettlement.abi.ContractDefinition
{
    public partial class ExtraData : ExtraDataBase { }

    public class ExtraDataBase 
    {
        [Parameter("bytes32", "key", 1)]
        public virtual byte[] Key { get; set; }
        [Parameter("bytes32", "value", 2)]
        public virtual byte[] Value { get; set; }
    }
}
