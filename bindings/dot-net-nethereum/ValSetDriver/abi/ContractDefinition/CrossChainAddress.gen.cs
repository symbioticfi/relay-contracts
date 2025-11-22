using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.ValSetDriver.abi.ContractDefinition
{
    public partial class CrossChainAddress : CrossChainAddressBase { }

    public class CrossChainAddressBase 
    {
        [Parameter("uint64", "chainId", 1)]
        public virtual ulong ChainId { get; set; }
        [Parameter("address", "addr", 2)]
        public virtual string Addr { get; set; }
    }
}
