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
using Symbiotic.Relay.IWeightedTokensVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.IWeightedTokensVPCalc.abi
{
    public partial class IWeightedTokensVPCalc.abiService: IWeightedTokensVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IWeightedTokensVPCalc.abiDeployment iWeightedTokensVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IWeightedTokensVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(iWeightedTokensVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IWeightedTokensVPCalc.abiDeployment iWeightedTokensVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IWeightedTokensVPCalc.abiDeployment>().SendRequestAsync(iWeightedTokensVPCalc.abiDeployment);
        }

        public static async Task<IWeightedTokensVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IWeightedTokensVPCalc.abiDeployment iWeightedTokensVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iWeightedTokensVPCalc.abiDeployment, cancellationTokenSource);
            return new IWeightedTokensVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public IWeightedTokensVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IWeightedTokensVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public IWeightedTokensVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(GetTokenWeightFunction),
                typeof(GetTokenWeightAtFunction),
                typeof(SetTokenWeightFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(SetTokenWeightEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(WeightedtokensvpcalcToolargeweightError)
            };
        }
    }
}
