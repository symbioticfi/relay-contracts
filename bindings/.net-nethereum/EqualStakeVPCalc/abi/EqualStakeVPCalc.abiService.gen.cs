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
using Symbiotic.Relay.EqualStakeVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.EqualStakeVPCalc.abi
{
    public partial class EqualStakeVPCalc.abiService: EqualStakeVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, EqualStakeVPCalc.abiDeployment equalStakeVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<EqualStakeVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(equalStakeVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, EqualStakeVPCalc.abiDeployment equalStakeVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<EqualStakeVPCalc.abiDeployment>().SendRequestAsync(equalStakeVPCalc.abiDeployment);
        }

        public static async Task<EqualStakeVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, EqualStakeVPCalc.abiDeployment equalStakeVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, equalStakeVPCalc.abiDeployment, cancellationTokenSource);
            return new EqualStakeVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public EqualStakeVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class EqualStakeVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public EqualStakeVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<BigInteger> StakeToVotingPowerQueryAsync(StakeToVotingPowerFunction stakeToVotingPowerFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<StakeToVotingPowerFunction, BigInteger>(stakeToVotingPowerFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> StakeToVotingPowerQueryAsync(string returnValue1, BigInteger stake, byte[] returnValue3, BlockParameter blockParameter = null)
        {
            var stakeToVotingPowerFunction = new StakeToVotingPowerFunction();
                stakeToVotingPowerFunction.ReturnValue1 = returnValue1;
                stakeToVotingPowerFunction.Stake = stake;
                stakeToVotingPowerFunction.ReturnValue3 = returnValue3;
            
            return ContractHandler.QueryAsync<StakeToVotingPowerFunction, BigInteger>(stakeToVotingPowerFunction, blockParameter);
        }

        public Task<BigInteger> StakeToVotingPowerAtQueryAsync(StakeToVotingPowerAtFunction stakeToVotingPowerAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<StakeToVotingPowerAtFunction, BigInteger>(stakeToVotingPowerAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> StakeToVotingPowerAtQueryAsync(string returnValue1, BigInteger stake, byte[] returnValue3, ulong returnValue4, BlockParameter blockParameter = null)
        {
            var stakeToVotingPowerAtFunction = new StakeToVotingPowerAtFunction();
                stakeToVotingPowerAtFunction.ReturnValue1 = returnValue1;
                stakeToVotingPowerAtFunction.Stake = stake;
                stakeToVotingPowerAtFunction.ReturnValue3 = returnValue3;
                stakeToVotingPowerAtFunction.ReturnValue4 = returnValue4;
            
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
