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
using Symbiotic.Relay.IOperatorsJail.abi.ContractDefinition;

namespace Symbiotic.Relay.IOperatorsJail.abi
{
    public partial class IOperatorsJail.abiService: IOperatorsJail.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IOperatorsJail.abiDeployment iOperatorsJail.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IOperatorsJail.abiDeployment>().SendRequestAndWaitForReceiptAsync(iOperatorsJail.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IOperatorsJail.abiDeployment iOperatorsJail.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IOperatorsJail.abiDeployment>().SendRequestAsync(iOperatorsJail.abiDeployment);
        }

        public static async Task<IOperatorsJail.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IOperatorsJail.abiDeployment iOperatorsJail.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iOperatorsJail.abiDeployment, cancellationTokenSource);
            return new IOperatorsJail.abiService(web3, receipt.ContractAddress);
        }

        public IOperatorsJail.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IOperatorsJail.abiServiceBase: ContractWeb3ServiceBase
    {

        public IOperatorsJail.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<ulong> GetOperatorJailedUntilQueryAsync(GetOperatorJailedUntilFunction getOperatorJailedUntilFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetOperatorJailedUntilFunction, ulong>(getOperatorJailedUntilFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetOperatorJailedUntilQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var getOperatorJailedUntilFunction = new GetOperatorJailedUntilFunction();
                getOperatorJailedUntilFunction.Operator = @operator;
            
            return ContractHandler.QueryAsync<GetOperatorJailedUntilFunction, ulong>(getOperatorJailedUntilFunction, blockParameter);
        }

        public Task<bool> IsOperatorJailedQueryAsync(IsOperatorJailedFunction isOperatorJailedFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorJailedFunction, bool>(isOperatorJailedFunction, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorJailedQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var isOperatorJailedFunction = new IsOperatorJailedFunction();
                isOperatorJailedFunction.Operator = @operator;
            
            return ContractHandler.QueryAsync<IsOperatorJailedFunction, bool>(isOperatorJailedFunction, blockParameter);
        }

        public virtual Task<string> JailOperatorRequestAsync(JailOperatorFunction jailOperatorFunction)
        {
             return ContractHandler.SendRequestAsync(jailOperatorFunction);
        }

        public virtual Task<TransactionReceipt> JailOperatorRequestAndWaitForReceiptAsync(JailOperatorFunction jailOperatorFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(jailOperatorFunction, cancellationToken);
        }

        public virtual Task<string> JailOperatorRequestAsync(string @operator, ulong duration)
        {
            var jailOperatorFunction = new JailOperatorFunction();
                jailOperatorFunction.Operator = @operator;
                jailOperatorFunction.Duration = duration;
            
             return ContractHandler.SendRequestAsync(jailOperatorFunction);
        }

        public virtual Task<TransactionReceipt> JailOperatorRequestAndWaitForReceiptAsync(string @operator, ulong duration, CancellationTokenSource cancellationToken = null)
        {
            var jailOperatorFunction = new JailOperatorFunction();
                jailOperatorFunction.Operator = @operator;
                jailOperatorFunction.Duration = duration;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(jailOperatorFunction, cancellationToken);
        }

        public virtual Task<string> UnjailOperatorRequestAsync(UnjailOperatorFunction unjailOperatorFunction)
        {
             return ContractHandler.SendRequestAsync(unjailOperatorFunction);
        }

        public virtual Task<TransactionReceipt> UnjailOperatorRequestAndWaitForReceiptAsync(UnjailOperatorFunction unjailOperatorFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unjailOperatorFunction, cancellationToken);
        }

        public virtual Task<string> UnjailOperatorRequestAsync(string @operator)
        {
            var unjailOperatorFunction = new UnjailOperatorFunction();
                unjailOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAsync(unjailOperatorFunction);
        }

        public virtual Task<TransactionReceipt> UnjailOperatorRequestAndWaitForReceiptAsync(string @operator, CancellationTokenSource cancellationToken = null)
        {
            var unjailOperatorFunction = new UnjailOperatorFunction();
                unjailOperatorFunction.Operator = @operator;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unjailOperatorFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(GetOperatorJailedUntilFunction),
                typeof(IsOperatorJailedFunction),
                typeof(JailOperatorFunction),
                typeof(UnjailOperatorFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(JailOperatorEventDTO),
                typeof(UnjailOperatorEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(OperatorsjailAlreadyjailedError),
                typeof(OperatorsjailInvaliddurationError),
                typeof(OperatorsjailOperatorjailedError),
                typeof(OperatorsjailOperatornotjailedError)
            };
        }
    }
}
