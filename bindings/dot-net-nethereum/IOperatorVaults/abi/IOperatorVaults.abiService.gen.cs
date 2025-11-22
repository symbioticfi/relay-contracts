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
using Symbiotic.Relay.IOperatorVaults.abi.ContractDefinition;

namespace Symbiotic.Relay.IOperatorVaults.abi
{
    public partial class IOperatorVaults.abiService: IOperatorVaults.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IOperatorVaults.abiDeployment iOperatorVaults.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IOperatorVaults.abiDeployment>().SendRequestAndWaitForReceiptAsync(iOperatorVaults.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IOperatorVaults.abiDeployment iOperatorVaults.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IOperatorVaults.abiDeployment>().SendRequestAsync(iOperatorVaults.abiDeployment);
        }

        public static async Task<IOperatorVaults.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IOperatorVaults.abiDeployment iOperatorVaults.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iOperatorVaults.abiDeployment, cancellationTokenSource);
            return new IOperatorVaults.abiService(web3, receipt.ContractAddress);
        }

        public IOperatorVaults.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IOperatorVaults.abiServiceBase: ContractWeb3ServiceBase
    {

        public IOperatorVaults.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public virtual Task<string> RegisterOperatorVaultRequestAsync(RegisterOperatorVaultFunction registerOperatorVaultFunction)
        {
             return ContractHandler.SendRequestAsync(registerOperatorVaultFunction);
        }

        public virtual Task<TransactionReceipt> RegisterOperatorVaultRequestAndWaitForReceiptAsync(RegisterOperatorVaultFunction registerOperatorVaultFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerOperatorVaultFunction, cancellationToken);
        }

        public virtual Task<string> RegisterOperatorVaultRequestAsync(string @operator, string vault)
        {
            var registerOperatorVaultFunction = new RegisterOperatorVaultFunction();
                registerOperatorVaultFunction.Operator = @operator;
                registerOperatorVaultFunction.Vault = vault;
            
             return ContractHandler.SendRequestAsync(registerOperatorVaultFunction);
        }

        public virtual Task<TransactionReceipt> RegisterOperatorVaultRequestAndWaitForReceiptAsync(string @operator, string vault, CancellationTokenSource cancellationToken = null)
        {
            var registerOperatorVaultFunction = new RegisterOperatorVaultFunction();
                registerOperatorVaultFunction.Operator = @operator;
                registerOperatorVaultFunction.Vault = vault;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerOperatorVaultFunction, cancellationToken);
        }

        public virtual Task<string> UnregisterOperatorVaultRequestAsync(UnregisterOperatorVaultFunction unregisterOperatorVaultFunction)
        {
             return ContractHandler.SendRequestAsync(unregisterOperatorVaultFunction);
        }

        public virtual Task<TransactionReceipt> UnregisterOperatorVaultRequestAndWaitForReceiptAsync(UnregisterOperatorVaultFunction unregisterOperatorVaultFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterOperatorVaultFunction, cancellationToken);
        }

        public virtual Task<string> UnregisterOperatorVaultRequestAsync(string vault)
        {
            var unregisterOperatorVaultFunction = new UnregisterOperatorVaultFunction();
                unregisterOperatorVaultFunction.Vault = vault;
            
             return ContractHandler.SendRequestAsync(unregisterOperatorVaultFunction);
        }

        public virtual Task<TransactionReceipt> UnregisterOperatorVaultRequestAndWaitForReceiptAsync(string vault, CancellationTokenSource cancellationToken = null)
        {
            var unregisterOperatorVaultFunction = new UnregisterOperatorVaultFunction();
                unregisterOperatorVaultFunction.Vault = vault;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterOperatorVaultFunction, cancellationToken);
        }

        public virtual Task<string> UnregisterOperatorVaultRequestAsync(UnregisterOperatorVault1Function unregisterOperatorVault1Function)
        {
             return ContractHandler.SendRequestAsync(unregisterOperatorVault1Function);
        }

        public virtual Task<TransactionReceipt> UnregisterOperatorVaultRequestAndWaitForReceiptAsync(UnregisterOperatorVault1Function unregisterOperatorVault1Function, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterOperatorVault1Function, cancellationToken);
        }

        public virtual Task<string> UnregisterOperatorVaultRequestAsync(string @operator, string vault)
        {
            var unregisterOperatorVault1Function = new UnregisterOperatorVault1Function();
                unregisterOperatorVault1Function.Operator = @operator;
                unregisterOperatorVault1Function.Vault = vault;
            
             return ContractHandler.SendRequestAsync(unregisterOperatorVault1Function);
        }

        public virtual Task<TransactionReceipt> UnregisterOperatorVaultRequestAndWaitForReceiptAsync(string @operator, string vault, CancellationTokenSource cancellationToken = null)
        {
            var unregisterOperatorVault1Function = new UnregisterOperatorVault1Function();
                unregisterOperatorVault1Function.Operator = @operator;
                unregisterOperatorVault1Function.Vault = vault;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterOperatorVault1Function, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(RegisterOperatorVaultFunction),
                typeof(UnregisterOperatorVaultFunction),
                typeof(UnregisterOperatorVault1Function)
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
