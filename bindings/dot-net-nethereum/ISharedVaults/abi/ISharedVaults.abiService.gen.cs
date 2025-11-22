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
using Symbiotic.Relay.ISharedVaults.abi.ContractDefinition;

namespace Symbiotic.Relay.ISharedVaults.abi
{
    public partial class ISharedVaults.abiService: ISharedVaults.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, ISharedVaults.abiDeployment iSharedVaults.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<ISharedVaults.abiDeployment>().SendRequestAndWaitForReceiptAsync(iSharedVaults.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, ISharedVaults.abiDeployment iSharedVaults.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<ISharedVaults.abiDeployment>().SendRequestAsync(iSharedVaults.abiDeployment);
        }

        public static async Task<ISharedVaults.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, ISharedVaults.abiDeployment iSharedVaults.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iSharedVaults.abiDeployment, cancellationTokenSource);
            return new ISharedVaults.abiService(web3, receipt.ContractAddress);
        }

        public ISharedVaults.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class ISharedVaults.abiServiceBase: ContractWeb3ServiceBase
    {

        public ISharedVaults.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public virtual Task<string> RegisterSharedVaultRequestAsync(RegisterSharedVaultFunction registerSharedVaultFunction)
        {
             return ContractHandler.SendRequestAsync(registerSharedVaultFunction);
        }

        public virtual Task<TransactionReceipt> RegisterSharedVaultRequestAndWaitForReceiptAsync(RegisterSharedVaultFunction registerSharedVaultFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerSharedVaultFunction, cancellationToken);
        }

        public virtual Task<string> RegisterSharedVaultRequestAsync(string sharedVault)
        {
            var registerSharedVaultFunction = new RegisterSharedVaultFunction();
                registerSharedVaultFunction.SharedVault = sharedVault;
            
             return ContractHandler.SendRequestAsync(registerSharedVaultFunction);
        }

        public virtual Task<TransactionReceipt> RegisterSharedVaultRequestAndWaitForReceiptAsync(string sharedVault, CancellationTokenSource cancellationToken = null)
        {
            var registerSharedVaultFunction = new RegisterSharedVaultFunction();
                registerSharedVaultFunction.SharedVault = sharedVault;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerSharedVaultFunction, cancellationToken);
        }

        public virtual Task<string> UnregisterSharedVaultRequestAsync(UnregisterSharedVaultFunction unregisterSharedVaultFunction)
        {
             return ContractHandler.SendRequestAsync(unregisterSharedVaultFunction);
        }

        public virtual Task<TransactionReceipt> UnregisterSharedVaultRequestAndWaitForReceiptAsync(UnregisterSharedVaultFunction unregisterSharedVaultFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterSharedVaultFunction, cancellationToken);
        }

        public virtual Task<string> UnregisterSharedVaultRequestAsync(string sharedVault)
        {
            var unregisterSharedVaultFunction = new UnregisterSharedVaultFunction();
                unregisterSharedVaultFunction.SharedVault = sharedVault;
            
             return ContractHandler.SendRequestAsync(unregisterSharedVaultFunction);
        }

        public virtual Task<TransactionReceipt> UnregisterSharedVaultRequestAndWaitForReceiptAsync(string sharedVault, CancellationTokenSource cancellationToken = null)
        {
            var unregisterSharedVaultFunction = new UnregisterSharedVaultFunction();
                unregisterSharedVaultFunction.SharedVault = sharedVault;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterSharedVaultFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(RegisterSharedVaultFunction),
                typeof(UnregisterSharedVaultFunction)
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
