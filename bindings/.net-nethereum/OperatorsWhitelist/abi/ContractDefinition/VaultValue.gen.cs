using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.OperatorsWhitelist.abi.ContractDefinition
{
    public partial class VaultValue : VaultValueBase { }

    public class VaultValueBase 
    {
        [Parameter("address", "vault", 1)]
        public virtual string Vault { get; set; }
        [Parameter("uint256", "value", 2)]
        public virtual BigInteger Value { get; set; }
    }
}
