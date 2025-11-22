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
using Symbiotic.Relay.IMultiToken.abi.ContractDefinition;

namespace Symbiotic.Relay.IMultiToken.abi
{
    public partial class IMultiToken.abiService: IMultiToken.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IMultiToken.abiDeployment iMultiToken.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IMultiToken.abiDeployment>().SendRequestAndWaitForReceiptAsync(iMultiToken.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IMultiToken.abiDeployment iMultiToken.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IMultiToken.abiDeployment>().SendRequestAsync(iMultiToken.abiDeployment);
        }

        public static async Task<IMultiToken.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IMultiToken.abiDeployment iMultiToken.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iMultiToken.abiDeployment, cancellationTokenSource);
            return new IMultiToken.abiService(web3, receipt.ContractAddress);
        }

        public IMultiToken.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IMultiToken.abiServiceBase: ContractWeb3ServiceBase
    {

        public IMultiToken.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public virtual Task<string> RegisterTokenRequestAsync(RegisterTokenFunction registerTokenFunction)
        {
             return ContractHandler.SendRequestAsync(registerTokenFunction);
        }

        public virtual Task<TransactionReceipt> RegisterTokenRequestAndWaitForReceiptAsync(RegisterTokenFunction registerTokenFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerTokenFunction, cancellationToken);
        }

        public virtual Task<string> RegisterTokenRequestAsync(string token)
        {
            var registerTokenFunction = new RegisterTokenFunction();
                registerTokenFunction.Token = token;
            
             return ContractHandler.SendRequestAsync(registerTokenFunction);
        }

        public virtual Task<TransactionReceipt> RegisterTokenRequestAndWaitForReceiptAsync(string token, CancellationTokenSource cancellationToken = null)
        {
            var registerTokenFunction = new RegisterTokenFunction();
                registerTokenFunction.Token = token;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerTokenFunction, cancellationToken);
        }

        public virtual Task<string> UnregisterTokenRequestAsync(UnregisterTokenFunction unregisterTokenFunction)
        {
             return ContractHandler.SendRequestAsync(unregisterTokenFunction);
        }

        public virtual Task<TransactionReceipt> UnregisterTokenRequestAndWaitForReceiptAsync(UnregisterTokenFunction unregisterTokenFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterTokenFunction, cancellationToken);
        }

        public virtual Task<string> UnregisterTokenRequestAsync(string token)
        {
            var unregisterTokenFunction = new UnregisterTokenFunction();
                unregisterTokenFunction.Token = token;
            
             return ContractHandler.SendRequestAsync(unregisterTokenFunction);
        }

        public virtual Task<TransactionReceipt> UnregisterTokenRequestAndWaitForReceiptAsync(string token, CancellationTokenSource cancellationToken = null)
        {
            var unregisterTokenFunction = new UnregisterTokenFunction();
                unregisterTokenFunction.Token = token;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterTokenFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(RegisterTokenFunction),
                typeof(UnregisterTokenFunction)
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
