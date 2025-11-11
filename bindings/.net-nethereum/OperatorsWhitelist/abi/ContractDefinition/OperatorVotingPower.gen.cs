using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.OperatorsWhitelist.abi.ContractDefinition
{
    public partial class OperatorVotingPower : OperatorVotingPowerBase { }

    public class OperatorVotingPowerBase 
    {
        [Parameter("address", "operator", 1)]
        public virtual string Operator { get; set; }
        [Parameter("tuple[]", "vaults", 2)]
        public virtual List<VaultValue> Vaults { get; set; }
    }
}
