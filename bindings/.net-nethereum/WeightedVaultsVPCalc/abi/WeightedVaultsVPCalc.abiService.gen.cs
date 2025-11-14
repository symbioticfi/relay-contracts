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
using Symbiotic.Relay.WeightedVaultsVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.WeightedVaultsVPCalc.abi
{
    public partial class WeightedVaultsVPCalc.abiService: WeightedVaultsVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, WeightedVaultsVPCalc.abiDeployment weightedVaultsVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<WeightedVaultsVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(weightedVaultsVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, WeightedVaultsVPCalc.abiDeployment weightedVaultsVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<WeightedVaultsVPCalc.abiDeployment>().SendRequestAsync(weightedVaultsVPCalc.abiDeployment);
        }

        public static async Task<WeightedVaultsVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, WeightedVaultsVPCalc.abiDeployment weightedVaultsVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, weightedVaultsVPCalc.abiDeployment, cancellationTokenSource);
            return new WeightedVaultsVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public WeightedVaultsVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class WeightedVaultsVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public WeightedVaultsVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<BigInteger> GetVaultWeightQueryAsync(GetVaultWeightFunction getVaultWeightFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetVaultWeightFunction, BigInteger>(getVaultWeightFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetVaultWeightQueryAsync(string vault, BlockParameter blockParameter = null)
        {
            var getVaultWeightFunction = new GetVaultWeightFunction();
                getVaultWeightFunction.Vault = vault;
            
            return ContractHandler.QueryAsync<GetVaultWeightFunction, BigInteger>(getVaultWeightFunction, blockParameter);
        }

        public Task<BigInteger> GetVaultWeightAtQueryAsync(GetVaultWeightAtFunction getVaultWeightAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetVaultWeightAtFunction, BigInteger>(getVaultWeightAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetVaultWeightAtQueryAsync(string vault, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getVaultWeightAtFunction = new GetVaultWeightAtFunction();
                getVaultWeightAtFunction.Vault = vault;
                getVaultWeightAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetVaultWeightAtFunction, BigInteger>(getVaultWeightAtFunction, blockParameter);
        }

        public virtual Task<string> SetVaultWeightRequestAsync(SetVaultWeightFunction setVaultWeightFunction)
        {
             return ContractHandler.SendRequestAsync(setVaultWeightFunction);
        }

        public virtual Task<TransactionReceipt> SetVaultWeightRequestAndWaitForReceiptAsync(SetVaultWeightFunction setVaultWeightFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setVaultWeightFunction, cancellationToken);
        }

        public virtual Task<string> SetVaultWeightRequestAsync(string vault, BigInteger weight)
        {
            var setVaultWeightFunction = new SetVaultWeightFunction();
                setVaultWeightFunction.Vault = vault;
                setVaultWeightFunction.Weight = weight;
            
             return ContractHandler.SendRequestAsync(setVaultWeightFunction);
        }

        public virtual Task<TransactionReceipt> SetVaultWeightRequestAndWaitForReceiptAsync(string vault, BigInteger weight, CancellationTokenSource cancellationToken = null)
        {
            var setVaultWeightFunction = new SetVaultWeightFunction();
                setVaultWeightFunction.Vault = vault;
                setVaultWeightFunction.Weight = weight;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setVaultWeightFunction, cancellationToken);
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
                typeof(GetVaultWeightFunction),
                typeof(GetVaultWeightAtFunction),
                typeof(SetVaultWeightFunction),
                typeof(StakeToVotingPowerFunction),
                typeof(StakeToVotingPowerAtFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(InitializedEventDTO),
                typeof(SetVaultWeightEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(CheckpointUnorderedInsertionError),
                typeof(InvalidInitializationError),
                typeof(NotInitializingError),
                typeof(WeightedvaultsvpcalcToolargeweightError)
            };
        }
    }
}
