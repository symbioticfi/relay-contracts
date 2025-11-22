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
using Symbiotic.Relay.IOperatorsWhitelist.abi.ContractDefinition;

namespace Symbiotic.Relay.IOperatorsWhitelist.abi
{
    public partial class IOperatorsWhitelist.abiService: IOperatorsWhitelist.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IOperatorsWhitelist.abiDeployment iOperatorsWhitelist.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IOperatorsWhitelist.abiDeployment>().SendRequestAndWaitForReceiptAsync(iOperatorsWhitelist.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IOperatorsWhitelist.abiDeployment iOperatorsWhitelist.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IOperatorsWhitelist.abiDeployment>().SendRequestAsync(iOperatorsWhitelist.abiDeployment);
        }

        public static async Task<IOperatorsWhitelist.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IOperatorsWhitelist.abiDeployment iOperatorsWhitelist.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iOperatorsWhitelist.abiDeployment, cancellationTokenSource);
            return new IOperatorsWhitelist.abiService(web3, receipt.ContractAddress);
        }

        public IOperatorsWhitelist.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IOperatorsWhitelist.abiServiceBase: ContractWeb3ServiceBase
    {

        public IOperatorsWhitelist.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<bool> IsOperatorWhitelistedQueryAsync(IsOperatorWhitelistedFunction isOperatorWhitelistedFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorWhitelistedFunction, bool>(isOperatorWhitelistedFunction, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorWhitelistedQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var isOperatorWhitelistedFunction = new IsOperatorWhitelistedFunction();
                isOperatorWhitelistedFunction.Operator = @operator;
            
            return ContractHandler.QueryAsync<IsOperatorWhitelistedFunction, bool>(isOperatorWhitelistedFunction, blockParameter);
        }

        public Task<bool> IsWhitelistEnabledQueryAsync(IsWhitelistEnabledFunction isWhitelistEnabledFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsWhitelistEnabledFunction, bool>(isWhitelistEnabledFunction, blockParameter);
        }

        
        public virtual Task<bool> IsWhitelistEnabledQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsWhitelistEnabledFunction, bool>(null, blockParameter);
        }

        public virtual Task<string> SetWhitelistStatusRequestAsync(SetWhitelistStatusFunction setWhitelistStatusFunction)
        {
             return ContractHandler.SendRequestAsync(setWhitelistStatusFunction);
        }

        public virtual Task<TransactionReceipt> SetWhitelistStatusRequestAndWaitForReceiptAsync(SetWhitelistStatusFunction setWhitelistStatusFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setWhitelistStatusFunction, cancellationToken);
        }

        public virtual Task<string> SetWhitelistStatusRequestAsync(bool status)
        {
            var setWhitelistStatusFunction = new SetWhitelistStatusFunction();
                setWhitelistStatusFunction.Status = status;
            
             return ContractHandler.SendRequestAsync(setWhitelistStatusFunction);
        }

        public virtual Task<TransactionReceipt> SetWhitelistStatusRequestAndWaitForReceiptAsync(bool status, CancellationTokenSource cancellationToken = null)
        {
            var setWhitelistStatusFunction = new SetWhitelistStatusFunction();
                setWhitelistStatusFunction.Status = status;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setWhitelistStatusFunction, cancellationToken);
        }

        public virtual Task<string> UnwhitelistOperatorRequestAsync(UnwhitelistOperatorFunction unwhitelistOperatorFunction)
        {
             return ContractHandler.SendRequestAsync(unwhitelistOperatorFunction);
        }

        public virtual Task<TransactionReceipt> UnwhitelistOperatorRequestAndWaitForReceiptAsync(UnwhitelistOperatorFunction unwhitelistOperatorFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unwhitelistOperatorFunction, cancellationToken);
        }

        public virtual Task<string> UnwhitelistOperatorRequestAsync(string @operator)
        {
            var unwhitelistOperatorFunction = new UnwhitelistOperatorFunction();
                unwhitelistOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAsync(unwhitelistOperatorFunction);
        }

        public virtual Task<TransactionReceipt> UnwhitelistOperatorRequestAndWaitForReceiptAsync(string @operator, CancellationTokenSource cancellationToken = null)
        {
            var unwhitelistOperatorFunction = new UnwhitelistOperatorFunction();
                unwhitelistOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unwhitelistOperatorFunction, cancellationToken);
        }

        public virtual Task<string> WhitelistOperatorRequestAsync(WhitelistOperatorFunction whitelistOperatorFunction)
        {
             return ContractHandler.SendRequestAsync(whitelistOperatorFunction);
        }

        public virtual Task<TransactionReceipt> WhitelistOperatorRequestAndWaitForReceiptAsync(WhitelistOperatorFunction whitelistOperatorFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(whitelistOperatorFunction, cancellationToken);
        }

        public virtual Task<string> WhitelistOperatorRequestAsync(string @operator)
        {
            var whitelistOperatorFunction = new WhitelistOperatorFunction();
                whitelistOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAsync(whitelistOperatorFunction);
        }

        public virtual Task<TransactionReceipt> WhitelistOperatorRequestAndWaitForReceiptAsync(string @operator, CancellationTokenSource cancellationToken = null)
        {
            var whitelistOperatorFunction = new WhitelistOperatorFunction();
                whitelistOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(whitelistOperatorFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(IsOperatorWhitelistedFunction),
                typeof(IsWhitelistEnabledFunction),
                typeof(SetWhitelistStatusFunction),
                typeof(UnwhitelistOperatorFunction),
                typeof(WhitelistOperatorFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(SetWhitelistStatusEventDTO),
                typeof(UnwhitelistOperatorEventDTO),
                typeof(WhitelistOperatorEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(OperatorswhitelistOperatornotwhitelistedError),
                typeof(OperatorswhitelistOperatorwhitelistedError),
                typeof(OperatorswhitelistStatusalreadysetError)
            };
        }
    }
}
