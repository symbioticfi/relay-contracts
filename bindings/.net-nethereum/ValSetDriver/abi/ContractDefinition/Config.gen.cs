using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.ValSetDriver.abi.ContractDefinition
{
    public partial class Config : ConfigBase { }

    public class ConfigBase 
    {
        [Parameter("uint208", "numAggregators", 1)]
        public virtual BigInteger NumAggregators { get; set; }
        [Parameter("uint208", "numCommitters", 2)]
        public virtual BigInteger NumCommitters { get; set; }
        [Parameter("uint48", "committerSlotDuration", 3)]
        public virtual ulong CommitterSlotDuration { get; set; }
        [Parameter("tuple[]", "votingPowerProviders", 4)]
        public virtual List<CrossChainAddress> VotingPowerProviders { get; set; }
        [Parameter("tuple", "keysProvider", 5)]
        public virtual CrossChainAddress KeysProvider { get; set; }
        [Parameter("tuple[]", "settlements", 6)]
        public virtual List<CrossChainAddress> Settlements { get; set; }
        [Parameter("uint256", "maxVotingPower", 7)]
        public virtual BigInteger MaxVotingPower { get; set; }
        [Parameter("uint256", "minInclusionVotingPower", 8)]
        public virtual BigInteger MinInclusionVotingPower { get; set; }
        [Parameter("uint208", "maxValidatorsCount", 9)]
        public virtual BigInteger MaxValidatorsCount { get; set; }
        [Parameter("uint8[]", "requiredKeyTags", 10)]
        public virtual List<byte> RequiredKeyTags { get; set; }
        [Parameter("tuple[]", "quorumThresholds", 11)]
        public virtual List<QuorumThreshold> QuorumThresholds { get; set; }
        [Parameter("uint8", "requiredHeaderKeyTag", 12)]
        public virtual byte RequiredHeaderKeyTag { get; set; }
        [Parameter("uint32", "verificationType", 13)]
        public virtual uint VerificationType { get; set; }
    }
}
