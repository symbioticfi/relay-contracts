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
using Symbiotic.Relay.PricedTokensChainlinkVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.PricedTokensChainlinkVPCalc.abi
{
    public partial class PricedTokensChainlinkVPCalc.abiService: PricedTokensChainlinkVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, PricedTokensChainlinkVPCalc.abiDeployment pricedTokensChainlinkVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<PricedTokensChainlinkVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(pricedTokensChainlinkVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, PricedTokensChainlinkVPCalc.abiDeployment pricedTokensChainlinkVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<PricedTokensChainlinkVPCalc.abiDeployment>().SendRequestAsync(pricedTokensChainlinkVPCalc.abiDeployment);
        }

        public static async Task<PricedTokensChainlinkVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, PricedTokensChainlinkVPCalc.abiDeployment pricedTokensChainlinkVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, pricedTokensChainlinkVPCalc.abiDeployment, cancellationTokenSource);
            return new PricedTokensChainlinkVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public PricedTokensChainlinkVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class PricedTokensChainlinkVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public PricedTokensChainlinkVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public virtual Task<GetTokenHopsOutputDTO> GetTokenHopsQueryAsync(GetTokenHopsFunction getTokenHopsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetTokenHopsFunction, GetTokenHopsOutputDTO>(getTokenHopsFunction, blockParameter);
        }

        public virtual Task<GetTokenHopsOutputDTO> GetTokenHopsQueryAsync(string token, BlockParameter blockParameter = null)
        {
            var getTokenHopsFunction = new GetTokenHopsFunction();
                getTokenHopsFunction.Token = token;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetTokenHopsFunction, GetTokenHopsOutputDTO>(getTokenHopsFunction, blockParameter);
        }

        public virtual Task<GetTokenHopsAtOutputDTO> GetTokenHopsAtQueryAsync(GetTokenHopsAtFunction getTokenHopsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetTokenHopsAtFunction, GetTokenHopsAtOutputDTO>(getTokenHopsAtFunction, blockParameter);
        }

        public virtual Task<GetTokenHopsAtOutputDTO> GetTokenHopsAtQueryAsync(string token, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getTokenHopsAtFunction = new GetTokenHopsAtFunction();
                getTokenHopsAtFunction.Token = token;
                getTokenHopsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetTokenHopsAtFunction, GetTokenHopsAtOutputDTO>(getTokenHopsAtFunction, blockParameter);
        }

        public Task<BigInteger> GetTokenPriceQueryAsync(GetTokenPriceFunction getTokenPriceFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTokenPriceFunction, BigInteger>(getTokenPriceFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetTokenPriceQueryAsync(string token, BlockParameter blockParameter = null)
        {
            var getTokenPriceFunction = new GetTokenPriceFunction();
                getTokenPriceFunction.Token = token;
            
            return ContractHandler.QueryAsync<GetTokenPriceFunction, BigInteger>(getTokenPriceFunction, blockParameter);
        }

        public Task<BigInteger> GetTokenPriceAtQueryAsync(GetTokenPriceAtFunction getTokenPriceAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTokenPriceAtFunction, BigInteger>(getTokenPriceAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetTokenPriceAtQueryAsync(string token, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getTokenPriceAtFunction = new GetTokenPriceAtFunction();
                getTokenPriceAtFunction.Token = token;
                getTokenPriceAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetTokenPriceAtFunction, BigInteger>(getTokenPriceAtFunction, blockParameter);
        }

        public virtual Task<string> SetTokenHopsRequestAsync(SetTokenHopsFunction setTokenHopsFunction)
        {
             return ContractHandler.SendRequestAsync(setTokenHopsFunction);
        }

        public virtual Task<TransactionReceipt> SetTokenHopsRequestAndWaitForReceiptAsync(SetTokenHopsFunction setTokenHopsFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setTokenHopsFunction, cancellationToken);
        }

        public virtual Task<string> SetTokenHopsRequestAsync(string token, List<string> aggregators, List<bool> inverts, List<ulong> stalenessDurations)
        {
            var setTokenHopsFunction = new SetTokenHopsFunction();
                setTokenHopsFunction.Token = token;
                setTokenHopsFunction.Aggregators = aggregators;
                setTokenHopsFunction.Inverts = inverts;
                setTokenHopsFunction.StalenessDurations = stalenessDurations;
            
             return ContractHandler.SendRequestAsync(setTokenHopsFunction);
        }

        public virtual Task<TransactionReceipt> SetTokenHopsRequestAndWaitForReceiptAsync(string token, List<string> aggregators, List<bool> inverts, List<ulong> stalenessDurations, CancellationTokenSource cancellationToken = null)
        {
            var setTokenHopsFunction = new SetTokenHopsFunction();
                setTokenHopsFunction.Token = token;
                setTokenHopsFunction.Aggregators = aggregators;
                setTokenHopsFunction.Inverts = inverts;
                setTokenHopsFunction.StalenessDurations = stalenessDurations;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setTokenHopsFunction, cancellationToken);
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
                typeof(GetTokenHopsFunction),
                typeof(GetTokenHopsAtFunction),
                typeof(GetTokenPriceFunction),
                typeof(GetTokenPriceAtFunction),
                typeof(SetTokenHopsFunction),
                typeof(StakeToVotingPowerFunction),
                typeof(StakeToVotingPowerAtFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(InitializedEventDTO),
                typeof(SetTokenHopsEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(CheckpointUnorderedInsertionError),
                typeof(InvalidInitializationError),
                typeof(NotInitializingError),
                typeof(PricedtokenschainlinkvpcalcInvalidaggregatorError)
            };
        }
    }
}
