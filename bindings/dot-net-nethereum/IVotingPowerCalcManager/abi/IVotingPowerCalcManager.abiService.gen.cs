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
using Symbiotic.Relay.IVotingPowerCalcManager.abi.ContractDefinition;

namespace Symbiotic.Relay.IVotingPowerCalcManager.abi
{
    public partial class IVotingPowerCalcManager.abiService: IVotingPowerCalcManager.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IVotingPowerCalcManager.abiDeployment iVotingPowerCalcManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IVotingPowerCalcManager.abiDeployment>().SendRequestAndWaitForReceiptAsync(iVotingPowerCalcManager.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IVotingPowerCalcManager.abiDeployment iVotingPowerCalcManager.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IVotingPowerCalcManager.abiDeployment>().SendRequestAsync(iVotingPowerCalcManager.abiDeployment);
        }

        public static async Task<IVotingPowerCalcManager.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IVotingPowerCalcManager.abiDeployment iVotingPowerCalcManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iVotingPowerCalcManager.abiDeployment, cancellationTokenSource);
            return new IVotingPowerCalcManager.abiService(web3, receipt.ContractAddress);
        }

        public IVotingPowerCalcManager.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IVotingPowerCalcManager.abiServiceBase: ContractWeb3ServiceBase
    {

        public IVotingPowerCalcManager.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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
