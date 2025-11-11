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
using Symbiotic.Relay.NormalizedTokenDecimalsVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.NormalizedTokenDecimalsVPCalc.abi
{
    public partial class NormalizedTokenDecimalsVPCalc.abiService: NormalizedTokenDecimalsVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, NormalizedTokenDecimalsVPCalc.abiDeployment normalizedTokenDecimalsVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<NormalizedTokenDecimalsVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(normalizedTokenDecimalsVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, NormalizedTokenDecimalsVPCalc.abiDeployment normalizedTokenDecimalsVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<NormalizedTokenDecimalsVPCalc.abiDeployment>().SendRequestAsync(normalizedTokenDecimalsVPCalc.abiDeployment);
        }

        public static async Task<NormalizedTokenDecimalsVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, NormalizedTokenDecimalsVPCalc.abiDeployment normalizedTokenDecimalsVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, normalizedTokenDecimalsVPCalc.abiDeployment, cancellationTokenSource);
            return new NormalizedTokenDecimalsVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public NormalizedTokenDecimalsVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class NormalizedTokenDecimalsVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public NormalizedTokenDecimalsVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
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
                typeof(StakeToVotingPowerFunction),
                typeof(StakeToVotingPowerAtFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(InitializedEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(InvalidInitializationError),
                typeof(NotInitializingError)
            };
        }
    }
}
