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
using Symbiotic.Relay.WeightedTokensVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.WeightedTokensVPCalc.abi
{
    public partial class WeightedTokensVPCalc.abiService: WeightedTokensVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, WeightedTokensVPCalc.abiDeployment weightedTokensVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<WeightedTokensVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(weightedTokensVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, WeightedTokensVPCalc.abiDeployment weightedTokensVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<WeightedTokensVPCalc.abiDeployment>().SendRequestAsync(weightedTokensVPCalc.abiDeployment);
        }

        public static async Task<WeightedTokensVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, WeightedTokensVPCalc.abiDeployment weightedTokensVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, weightedTokensVPCalc.abiDeployment, cancellationTokenSource);
            return new WeightedTokensVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public WeightedTokensVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class WeightedTokensVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public WeightedTokensVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<BigInteger> GetTokenWeightQueryAsync(GetTokenWeightFunction getTokenWeightFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTokenWeightFunction, BigInteger>(getTokenWeightFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetTokenWeightQueryAsync(string token, BlockParameter blockParameter = null)
        {
            var getTokenWeightFunction = new GetTokenWeightFunction();
                getTokenWeightFunction.Token = token;
            
            return ContractHandler.QueryAsync<GetTokenWeightFunction, BigInteger>(getTokenWeightFunction, blockParameter);
        }

        public Task<BigInteger> GetTokenWeightAtQueryAsync(GetTokenWeightAtFunction getTokenWeightAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTokenWeightAtFunction, BigInteger>(getTokenWeightAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetTokenWeightAtQueryAsync(string token, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getTokenWeightAtFunction = new GetTokenWeightAtFunction();
                getTokenWeightAtFunction.Token = token;
                getTokenWeightAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetTokenWeightAtFunction, BigInteger>(getTokenWeightAtFunction, blockParameter);
        }

        public virtual Task<string> SetTokenWeightRequestAsync(SetTokenWeightFunction setTokenWeightFunction)
        {
             return ContractHandler.SendRequestAsync(setTokenWeightFunction);
        }

        public virtual Task<TransactionReceipt> SetTokenWeightRequestAndWaitForReceiptAsync(SetTokenWeightFunction setTokenWeightFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setTokenWeightFunction, cancellationToken);
        }

        public virtual Task<string> SetTokenWeightRequestAsync(string token, BigInteger weight)
        {
            var setTokenWeightFunction = new SetTokenWeightFunction();
                setTokenWeightFunction.Token = token;
                setTokenWeightFunction.Weight = weight;
            
             return ContractHandler.SendRequestAsync(setTokenWeightFunction);
        }

        public virtual Task<TransactionReceipt> SetTokenWeightRequestAndWaitForReceiptAsync(string token, BigInteger weight, CancellationTokenSource cancellationToken = null)
        {
            var setTokenWeightFunction = new SetTokenWeightFunction();
                setTokenWeightFunction.Token = token;
                setTokenWeightFunction.Weight = weight;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setTokenWeightFunction, cancellationToken);
        }

        public Task<BigInteger> StakeToVotingPowerQueryAsync(StakeToVotingPowerFunction stakeToVotingPowerFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<StakeToVotingPowerFunction, BigInteger>(stakeToVotingPowerFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> StakeToVotingPowerQueryAsync(string vault, BigInteger stake, byte[] extraData, BlockParameter blockParameter = null)
        {
            var stakeToVotingPowerFunction = new StakeToVotingPowerFunction();
                stakeToVotingPowerFunction.Vault = vault;
                stakeToVotingPowerFunction.Stake = stake;
                stakeToVotingPowerFunction.ExtraData = extraData;
            
            return ContractHandler.QueryAsync<StakeToVotingPowerFunction, BigInteger>(stakeToVotingPowerFunction, blockParameter);
        }

        public Task<BigInteger> StakeToVotingPowerAtQueryAsync(StakeToVotingPowerAtFunction stakeToVotingPowerAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<StakeToVotingPowerAtFunction, BigInteger>(stakeToVotingPowerAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> StakeToVotingPowerAtQueryAsync(string vault, BigInteger stake, byte[] extraData, ulong timestamp, BlockParameter blockParameter = null)
        {
            var stakeToVotingPowerAtFunction = new StakeToVotingPowerAtFunction();
                stakeToVotingPowerAtFunction.Vault = vault;
                stakeToVotingPowerAtFunction.Stake = stake;
                stakeToVotingPowerAtFunction.ExtraData = extraData;
                stakeToVotingPowerAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<StakeToVotingPowerAtFunction, BigInteger>(stakeToVotingPowerAtFunction, blockParameter);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(GetTokenWeightFunction),
                typeof(GetTokenWeightAtFunction),
                typeof(SetTokenWeightFunction),
                typeof(StakeToVotingPowerFunction),
                typeof(StakeToVotingPowerAtFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(InitializedEventDTO),
                typeof(SetTokenWeightEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(CheckpointUnorderedInsertionError),
                typeof(InvalidInitializationError),
                typeof(NotInitializingError),
                typeof(WeightedtokensvpcalcToolargeweightError)
            };
        }
    }
}
