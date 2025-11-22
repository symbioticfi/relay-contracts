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
using Symbiotic.Relay.IPermissionManager.abi.ContractDefinition;

namespace Symbiotic.Relay.IPermissionManager.abi
{
    public partial class IPermissionManager.abiService: IPermissionManager.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IPermissionManager.abiDeployment iPermissionManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IPermissionManager.abiDeployment>().SendRequestAndWaitForReceiptAsync(iPermissionManager.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IPermissionManager.abiDeployment iPermissionManager.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IPermissionManager.abiDeployment>().SendRequestAsync(iPermissionManager.abiDeployment);
        }

        public static async Task<IPermissionManager.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IPermissionManager.abiDeployment iPermissionManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iPermissionManager.abiDeployment, cancellationTokenSource);
            return new IPermissionManager.abiService(web3, receipt.ContractAddress);
        }

        public IPermissionManager.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IPermissionManager.abiServiceBase: ContractWeb3ServiceBase
    {

        public IPermissionManager.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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
