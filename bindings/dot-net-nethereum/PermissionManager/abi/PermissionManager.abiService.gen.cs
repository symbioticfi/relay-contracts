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
using Symbiotic.Relay.PermissionManager.abi.ContractDefinition;

namespace Symbiotic.Relay.PermissionManager.abi
{
    public partial class PermissionManager.abiService: PermissionManager.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, PermissionManager.abiDeployment permissionManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<PermissionManager.abiDeployment>().SendRequestAndWaitForReceiptAsync(permissionManager.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, PermissionManager.abiDeployment permissionManager.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<PermissionManager.abiDeployment>().SendRequestAsync(permissionManager.abiDeployment);
        }

        public static async Task<PermissionManager.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, PermissionManager.abiDeployment permissionManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, permissionManager.abiDeployment, cancellationTokenSource);
            return new PermissionManager.abiService(web3, receipt.ContractAddress);
        }

        public PermissionManager.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class PermissionManager.abiServiceBase: ContractWeb3ServiceBase
    {

        public PermissionManager.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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
                typeof(InitializedEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(InvalidInitializationError),
                typeof(NotInitializingError)
            };
        }
    }
}
