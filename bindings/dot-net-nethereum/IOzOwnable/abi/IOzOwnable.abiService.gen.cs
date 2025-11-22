using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;
using Nethereum.Web3;
using Nethereum.RPC.Eth.DTOs;
using Nethereum.Contracts.CQS;
using Nethereum.Contracts.ContractHandlers;
using Nethereum.Contracts;
using System.Threading;
using Symbiotic.Relay.IOzOwnable.abi.ContractDefinition;

namespace Symbiotic.Relay.IOzOwnable.abi
{
    public partial class IOzOwnable.abiService: IOzOwnable.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IOzOwnable.abiDeployment iOzOwnable.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IOzOwnable.abiDeployment>().SendRequestAndWaitForReceiptAsync(iOzOwnable.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IOzOwnable.abiDeployment iOzOwnable.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IOzOwnable.abiDeployment>().SendRequestAsync(iOzOwnable.abiDeployment);
        }

        public static async Task<IOzOwnable.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IOzOwnable.abiDeployment iOzOwnable.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iOzOwnable.abiDeployment, cancellationTokenSource);
            return new IOzOwnable.abiService(web3, receipt.ContractAddress);
        }

        public IOzOwnable.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IOzOwnable.abiServiceBase: ContractWeb3ServiceBase
    {

        public IOzOwnable.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {

            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {

            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {

            };
        }
    }
}
