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
using Symbiotic.Relay.EpochManager.abi.ContractDefinition;

namespace Symbiotic.Relay.EpochManager.abi
{
    public partial class EpochManager.abiService: EpochManager.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, EpochManager.abiDeployment epochManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<EpochManager.abiDeployment>().SendRequestAndWaitForReceiptAsync(epochManager.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, EpochManager.abiDeployment epochManager.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<EpochManager.abiDeployment>().SendRequestAsync(epochManager.abiDeployment);
        }

        public static async Task<EpochManager.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, EpochManager.abiDeployment epochManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, epochManager.abiDeployment, cancellationTokenSource);
            return new EpochManager.abiService(web3, receipt.ContractAddress);
        }

        public EpochManager.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class EpochManager.abiServiceBase: ContractWeb3ServiceBase
    {

        public EpochManager.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<ulong> GetCurrentEpochQueryAsync(GetCurrentEpochFunction getCurrentEpochFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCurrentEpochFunction, ulong>(getCurrentEpochFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetCurrentEpochQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCurrentEpochFunction, ulong>(null, blockParameter);
        }

        public Task<ulong> GetCurrentEpochDurationQueryAsync(GetCurrentEpochDurationFunction getCurrentEpochDurationFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCurrentEpochDurationFunction, ulong>(getCurrentEpochDurationFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetCurrentEpochDurationQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCurrentEpochDurationFunction, ulong>(null, blockParameter);
        }

        public Task<ulong> GetCurrentEpochStartQueryAsync(GetCurrentEpochStartFunction getCurrentEpochStartFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCurrentEpochStartFunction, ulong>(getCurrentEpochStartFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetCurrentEpochStartQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCurrentEpochStartFunction, ulong>(null, blockParameter);
        }

        public Task<ulong> GetEpochDurationQueryAsync(GetEpochDurationFunction getEpochDurationFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetEpochDurationFunction, ulong>(getEpochDurationFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetEpochDurationQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getEpochDurationFunction = new GetEpochDurationFunction();
                getEpochDurationFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetEpochDurationFunction, ulong>(getEpochDurationFunction, blockParameter);
        }

        public Task<ulong> GetEpochIndexQueryAsync(GetEpochIndexFunction getEpochIndexFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetEpochIndexFunction, ulong>(getEpochIndexFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetEpochIndexQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getEpochIndexFunction = new GetEpochIndexFunction();
                getEpochIndexFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetEpochIndexFunction, ulong>(getEpochIndexFunction, blockParameter);
        }

        public Task<ulong> GetEpochStartQueryAsync(GetEpochStartFunction getEpochStartFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetEpochStartFunction, ulong>(getEpochStartFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetEpochStartQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getEpochStartFunction = new GetEpochStartFunction();
                getEpochStartFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetEpochStartFunction, ulong>(getEpochStartFunction, blockParameter);
        }

        public Task<ulong> GetNextEpochQueryAsync(GetNextEpochFunction getNextEpochFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNextEpochFunction, ulong>(getNextEpochFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetNextEpochQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNextEpochFunction, ulong>(null, blockParameter);
        }

        public Task<ulong> GetNextEpochDurationQueryAsync(GetNextEpochDurationFunction getNextEpochDurationFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNextEpochDurationFunction, ulong>(getNextEpochDurationFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetNextEpochDurationQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNextEpochDurationFunction, ulong>(null, blockParameter);
        }

        public Task<ulong> GetNextEpochStartQueryAsync(GetNextEpochStartFunction getNextEpochStartFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNextEpochStartFunction, ulong>(getNextEpochStartFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetNextEpochStartQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNextEpochStartFunction, ulong>(null, blockParameter);
        }

        public virtual Task<string> SetEpochDurationRequestAsync(SetEpochDurationFunction setEpochDurationFunction)
        {
             return ContractHandler.SendRequestAsync(setEpochDurationFunction);
        }

        public virtual Task<TransactionReceipt> SetEpochDurationRequestAndWaitForReceiptAsync(SetEpochDurationFunction setEpochDurationFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setEpochDurationFunction, cancellationToken);
        }

        public virtual Task<string> SetEpochDurationRequestAsync(ulong epochDuration)
        {
            var setEpochDurationFunction = new SetEpochDurationFunction();
                setEpochDurationFunction.EpochDuration = epochDuration;
            
             return ContractHandler.SendRequestAsync(setEpochDurationFunction);
        }

        public virtual Task<TransactionReceipt> SetEpochDurationRequestAndWaitForReceiptAsync(ulong epochDuration, CancellationTokenSource cancellationToken = null)
        {
            var setEpochDurationFunction = new SetEpochDurationFunction();
                setEpochDurationFunction.EpochDuration = epochDuration;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setEpochDurationFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(GetCurrentEpochFunction),
                typeof(GetCurrentEpochDurationFunction),
                typeof(GetCurrentEpochStartFunction),
                typeof(GetEpochDurationFunction),
                typeof(GetEpochIndexFunction),
                typeof(GetEpochStartFunction),
                typeof(GetNextEpochFunction),
                typeof(GetNextEpochDurationFunction),
                typeof(GetNextEpochStartFunction),
                typeof(SetEpochDurationFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(InitEpochDurationEventDTO),
                typeof(InitializedEventDTO),
                typeof(SetEpochDurationEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(CheckpointUnorderedInsertionError),
                typeof(EpochmanagerInvalidepochdurationError),
                typeof(EpochmanagerInvalidepochdurationtimestampError),
                typeof(EpochmanagerToooldtimestampError),
                typeof(InvalidInitializationError),
                typeof(NotInitializingError)
            };
        }
    }
}
