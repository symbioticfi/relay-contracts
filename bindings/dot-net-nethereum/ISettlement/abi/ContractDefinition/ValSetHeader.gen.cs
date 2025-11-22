using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.ISettlement.abi.ContractDefinition
{
    public partial class ValSetHeader : ValSetHeaderBase { }

    public class ValSetHeaderBase 
    {
        [Parameter("uint8", "version", 1)]
        public virtual byte Version { get; set; }
        [Parameter("uint8", "requiredKeyTag", 2)]
        public virtual byte RequiredKeyTag { get; set; }
        [Parameter("uint48", "epoch", 3)]
        public virtual ulong Epoch { get; set; }
        [Parameter("uint48", "captureTimestamp", 4)]
        public virtual ulong CaptureTimestamp { get; set; }
        [Parameter("uint256", "quorumThreshold", 5)]
        public virtual BigInteger QuorumThreshold { get; set; }
        [Parameter("uint256", "totalVotingPower", 6)]
        public virtual BigInteger TotalVotingPower { get; set; }
        [Parameter("bytes32", "validatorsSszMRoot", 7)]
        public virtual byte[] ValidatorsSszMRoot { get; set; }
    }
}
