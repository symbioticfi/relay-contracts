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
using Symbiotic.Relay.IOperatorsBlacklist.abi.ContractDefinition;

namespace Symbiotic.Relay.IOperatorsBlacklist.abi
{
    public partial class IOperatorsBlacklist.abiService: IOperatorsBlacklist.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IOperatorsBlacklist.abiDeployment iOperatorsBlacklist.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IOperatorsBlacklist.abiDeployment>().SendRequestAndWaitForReceiptAsync(iOperatorsBlacklist.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IOperatorsBlacklist.abiDeployment iOperatorsBlacklist.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IOperatorsBlacklist.abiDeployment>().SendRequestAsync(iOperatorsBlacklist.abiDeployment);
        }

        public static async Task<IOperatorsBlacklist.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IOperatorsBlacklist.abiDeployment iOperatorsBlacklist.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iOperatorsBlacklist.abiDeployment, cancellationTokenSource);
            return new IOperatorsBlacklist.abiService(web3, receipt.ContractAddress);
        }

        public IOperatorsBlacklist.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IOperatorsBlacklist.abiServiceBase: ContractWeb3ServiceBase
    {

        public IOperatorsBlacklist.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public virtual Task<string> BlacklistOperatorRequestAsync(BlacklistOperatorFunction blacklistOperatorFunction)
        {
             return ContractHandler.SendRequestAsync(blacklistOperatorFunction);
        }

        public virtual Task<TransactionReceipt> BlacklistOperatorRequestAndWaitForReceiptAsync(BlacklistOperatorFunction blacklistOperatorFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(blacklistOperatorFunction, cancellationToken);
        }

        public virtual Task<string> BlacklistOperatorRequestAsync(string @operator)
        {
            var blacklistOperatorFunction = new BlacklistOperatorFunction();
                blacklistOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAsync(blacklistOperatorFunction);
        }

        public virtual Task<TransactionReceipt> BlacklistOperatorRequestAndWaitForReceiptAsync(string @operator, CancellationTokenSource cancellationToken = null)
        {
            var blacklistOperatorFunction = new BlacklistOperatorFunction();
                blacklistOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(blacklistOperatorFunction, cancellationToken);
        }

        public Task<bool> IsOperatorBlacklistedQueryAsync(IsOperatorBlacklistedFunction isOperatorBlacklistedFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorBlacklistedFunction, bool>(isOperatorBlacklistedFunction, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorBlacklistedQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var isOperatorBlacklistedFunction = new IsOperatorBlacklistedFunction();
                isOperatorBlacklistedFunction.Operator = @operator;
            
            return ContractHandler.QueryAsync<IsOperatorBlacklistedFunction, bool>(isOperatorBlacklistedFunction, blockParameter);
        }

        public virtual Task<string> UnblacklistOperatorRequestAsync(UnblacklistOperatorFunction unblacklistOperatorFunction)
        {
             return ContractHandler.SendRequestAsync(unblacklistOperatorFunction);
        }

        public virtual Task<TransactionReceipt> UnblacklistOperatorRequestAndWaitForReceiptAsync(UnblacklistOperatorFunction unblacklistOperatorFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unblacklistOperatorFunction, cancellationToken);
        }

        public virtual Task<string> UnblacklistOperatorRequestAsync(string @operator)
        {
            var unblacklistOperatorFunction = new UnblacklistOperatorFunction();
                unblacklistOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAsync(unblacklistOperatorFunction);
        }

        public virtual Task<TransactionReceipt> UnblacklistOperatorRequestAndWaitForReceiptAsync(string @operator, CancellationTokenSource cancellationToken = null)
        {
            var unblacklistOperatorFunction = new UnblacklistOperatorFunction();
                unblacklistOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unblacklistOperatorFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(BlacklistOperatorFunction),
                typeof(IsOperatorBlacklistedFunction),
                typeof(UnblacklistOperatorFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(BlacklistOperatorEventDTO),
                typeof(UnblacklistOperatorEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(OperatorsblacklistOperatorblacklistedError),
                typeof(OperatorsblacklistOperatornotblacklistedError)
            };
        }
    }
}
