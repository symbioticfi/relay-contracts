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
using Symbiotic.Relay.AggregatorV3Interface.abi.ContractDefinition;

namespace Symbiotic.Relay.AggregatorV3Interface.abi
{
    public partial class AggregatorV3Interface.abiService: AggregatorV3Interface.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, AggregatorV3Interface.abiDeployment aggregatorV3Interface.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<AggregatorV3Interface.abiDeployment>().SendRequestAndWaitForReceiptAsync(aggregatorV3Interface.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, AggregatorV3Interface.abiDeployment aggregatorV3Interface.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<AggregatorV3Interface.abiDeployment>().SendRequestAsync(aggregatorV3Interface.abiDeployment);
        }

        public static async Task<AggregatorV3Interface.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, AggregatorV3Interface.abiDeployment aggregatorV3Interface.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, aggregatorV3Interface.abiDeployment, cancellationTokenSource);
            return new AggregatorV3Interface.abiService(web3, receipt.ContractAddress);
        }

        public AggregatorV3Interface.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class AggregatorV3Interface.abiServiceBase: ContractWeb3ServiceBase
    {

        public AggregatorV3Interface.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<byte> DecimalsQueryAsync(DecimalsFunction decimalsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<DecimalsFunction, byte>(decimalsFunction, blockParameter);
        }

        
        public virtual Task<byte> DecimalsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<DecimalsFunction, byte>(null, blockParameter);
        }

        public Task<string> DescriptionQueryAsync(DescriptionFunction descriptionFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<DescriptionFunction, string>(descriptionFunction, blockParameter);
        }

        
        public virtual Task<string> DescriptionQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<DescriptionFunction, string>(null, blockParameter);
        }

        public virtual Task<GetRoundDataOutputDTO> GetRoundDataQueryAsync(GetRoundDataFunction getRoundDataFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetRoundDataFunction, GetRoundDataOutputDTO>(getRoundDataFunction, blockParameter);
        }

        public virtual Task<GetRoundDataOutputDTO> GetRoundDataQueryAsync(BigInteger roundId, BlockParameter blockParameter = null)
        {
            var getRoundDataFunction = new GetRoundDataFunction();
                getRoundDataFunction.RoundId = roundId;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetRoundDataFunction, GetRoundDataOutputDTO>(getRoundDataFunction, blockParameter);
        }

        public virtual Task<LatestRoundDataOutputDTO> LatestRoundDataQueryAsync(LatestRoundDataFunction latestRoundDataFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<LatestRoundDataFunction, LatestRoundDataOutputDTO>(latestRoundDataFunction, blockParameter);
        }

        public virtual Task<LatestRoundDataOutputDTO> LatestRoundDataQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<LatestRoundDataFunction, LatestRoundDataOutputDTO>(null, blockParameter);
        }

        public Task<BigInteger> VersionQueryAsync(VersionFunction versionFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VersionFunction, BigInteger>(versionFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> VersionQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VersionFunction, BigInteger>(null, blockParameter);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(DecimalsFunction),
                typeof(DescriptionFunction),
                typeof(GetRoundDataFunction),
                typeof(LatestRoundDataFunction),
                typeof(VersionFunction)
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
