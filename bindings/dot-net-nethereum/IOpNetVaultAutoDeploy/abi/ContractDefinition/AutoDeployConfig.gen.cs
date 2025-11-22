using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.IOpNetVaultAutoDeploy.abi.ContractDefinition
{
    public partial class AutoDeployConfig : AutoDeployConfigBase { }

    public class AutoDeployConfigBase 
    {
        [Parameter("uint48", "epochDuration", 1)]
        public virtual ulong EpochDuration { get; set; }
        [Parameter("address", "collateral", 2)]
        public virtual string Collateral { get; set; }
        [Parameter("address", "burner", 3)]
        public virtual string Burner { get; set; }
        [Parameter("bool", "withSlasher", 4)]
        public virtual bool WithSlasher { get; set; }
        [Parameter("bool", "isBurnerHook", 5)]
        public virtual bool IsBurnerHook { get; set; }
    }
}
