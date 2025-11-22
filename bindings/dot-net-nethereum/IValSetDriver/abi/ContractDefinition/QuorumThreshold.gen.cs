using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.IValSetDriver.abi.ContractDefinition
{
    public partial class QuorumThreshold : QuorumThresholdBase { }

    public class QuorumThresholdBase 
    {
        [Parameter("uint8", "keyTag", 1)]
        public virtual byte KeyTag { get; set; }
        [Parameter("uint248", "quorumThreshold", 2)]
        public virtual BigInteger QuorumThreshold { get; set; }
    }
}
