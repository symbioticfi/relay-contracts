using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Symbiotic.Relay.KeyRegistry.abi.ContractDefinition
{
    public partial class KeyRegistryInitParams : KeyRegistryInitParamsBase { }

    public class KeyRegistryInitParamsBase 
    {
        [Parameter("tuple", "ozEip712InitParams", 1)]
        public virtual OzEIP712InitParams OzEip712InitParams { get; set; }
    }
}
