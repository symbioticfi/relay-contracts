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
using Symbiotic.Relay.IBaseRewards.abi.ContractDefinition;

namespace Symbiotic.Relay.IBaseRewards.abi
{
    public partial class IBaseRewards.abiService: IBaseRewards.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IBaseRewards.abiDeployment iBaseRewards.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IBaseRewards.abiDeployment>().SendRequestAndWaitForReceiptAsync(iBaseRewards.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IBaseRewards.abiDeployment iBaseRewards.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IBaseRewards.abiDeployment>().SendRequestAsync(iBaseRewards.abiDeployment);
        }

        public static async Task<IBaseRewards.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IBaseRewards.abiDeployment iBaseRewards.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iBaseRewards.abiDeployment, cancellationTokenSource);
            return new IBaseRewards.abiService(web3, receipt.ContractAddress);
        }

        public IBaseRewards.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IBaseRewards.abiServiceBase: ContractWeb3ServiceBase
    {

        public IBaseRewards.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public virtual Task<string> DistributeOperatorRewardsRequestAsync(DistributeOperatorRewardsFunction distributeOperatorRewardsFunction)
        {
             return ContractHandler.SendRequestAsync(distributeOperatorRewardsFunction);
        }

        public virtual Task<TransactionReceipt> DistributeOperatorRewardsRequestAndWaitForReceiptAsync(DistributeOperatorRewardsFunction distributeOperatorRewardsFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(distributeOperatorRewardsFunction, cancellationToken);
        }

        public virtual Task<string> DistributeOperatorRewardsRequestAsync(string operatorRewards, string token, BigInteger amount, byte[] root)
        {
            var distributeOperatorRewardsFunction = new DistributeOperatorRewardsFunction();
                distributeOperatorRewardsFunction.OperatorRewards = operatorRewards;
                distributeOperatorRewardsFunction.Token = token;
                distributeOperatorRewardsFunction.Amount = amount;
                distributeOperatorRewardsFunction.Root = root;
            
             return ContractHandler.SendRequestAsync(distributeOperatorRewardsFunction);
        }

        public virtual Task<TransactionReceipt> DistributeOperatorRewardsRequestAndWaitForReceiptAsync(string operatorRewards, string token, BigInteger amount, byte[] root, CancellationTokenSource cancellationToken = null)
        {
            var distributeOperatorRewardsFunction = new DistributeOperatorRewardsFunction();
                distributeOperatorRewardsFunction.OperatorRewards = operatorRewards;
                distributeOperatorRewardsFunction.Token = token;
                distributeOperatorRewardsFunction.Amount = amount;
                distributeOperatorRewardsFunction.Root = root;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(distributeOperatorRewardsFunction, cancellationToken);
        }

        public virtual Task<string> DistributeStakerRewardsRequestAsync(DistributeStakerRewardsFunction distributeStakerRewardsFunction)
        {
             return ContractHandler.SendRequestAsync(distributeStakerRewardsFunction);
        }

        public virtual Task<TransactionReceipt> DistributeStakerRewardsRequestAndWaitForReceiptAsync(DistributeStakerRewardsFunction distributeStakerRewardsFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(distributeStakerRewardsFunction, cancellationToken);
        }

        public virtual Task<string> DistributeStakerRewardsRequestAsync(string stakerRewards, string token, BigInteger amount, byte[] data)
        {
            var distributeStakerRewardsFunction = new DistributeStakerRewardsFunction();
                distributeStakerRewardsFunction.StakerRewards = stakerRewards;
                distributeStakerRewardsFunction.Token = token;
                distributeStakerRewardsFunction.Amount = amount;
                distributeStakerRewardsFunction.Data = data;
            
             return ContractHandler.SendRequestAsync(distributeStakerRewardsFunction);
        }

        public virtual Task<TransactionReceipt> DistributeStakerRewardsRequestAndWaitForReceiptAsync(string stakerRewards, string token, BigInteger amount, byte[] data, CancellationTokenSource cancellationToken = null)
        {
            var distributeStakerRewardsFunction = new DistributeStakerRewardsFunction();
                distributeStakerRewardsFunction.StakerRewards = stakerRewards;
                distributeStakerRewardsFunction.Token = token;
                distributeStakerRewardsFunction.Amount = amount;
                distributeStakerRewardsFunction.Data = data;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(distributeStakerRewardsFunction, cancellationToken);
        }

        public Task<string> GetRewarderQueryAsync(GetRewarderFunction getRewarderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRewarderFunction, string>(getRewarderFunction, blockParameter);
        }

        
        public virtual Task<string> GetRewarderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRewarderFunction, string>(null, blockParameter);
        }

        public virtual Task<string> SetRewarderRequestAsync(SetRewarderFunction setRewarderFunction)
        {
             return ContractHandler.SendRequestAsync(setRewarderFunction);
        }

        public virtual Task<TransactionReceipt> SetRewarderRequestAndWaitForReceiptAsync(SetRewarderFunction setRewarderFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setRewarderFunction, cancellationToken);
        }

        public virtual Task<string> SetRewarderRequestAsync(string rewarder)
        {
            var setRewarderFunction = new SetRewarderFunction();
                setRewarderFunction.Rewarder = rewarder;
            
             return ContractHandler.SendRequestAsync(setRewarderFunction);
        }

        public virtual Task<TransactionReceipt> SetRewarderRequestAndWaitForReceiptAsync(string rewarder, CancellationTokenSource cancellationToken = null)
        {
            var setRewarderFunction = new SetRewarderFunction();
                setRewarderFunction.Rewarder = rewarder;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setRewarderFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(DistributeOperatorRewardsFunction),
                typeof(DistributeStakerRewardsFunction),
                typeof(GetRewarderFunction),
                typeof(SetRewarderFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(DistributeOperatorRewardsEventDTO),
                typeof(DistributeStakerRewardsEventDTO),
                typeof(SetRewarderEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(BaserewardsNotrewarderError)
            };
        }
    }
}
