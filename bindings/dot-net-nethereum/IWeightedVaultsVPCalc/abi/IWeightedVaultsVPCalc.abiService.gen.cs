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
using Symbiotic.Relay.IWeightedVaultsVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.IWeightedVaultsVPCalc.abi
{
    public partial class IWeightedVaultsVPCalc.abiService: IWeightedVaultsVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IWeightedVaultsVPCalc.abiDeployment iWeightedVaultsVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IWeightedVaultsVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(iWeightedVaultsVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IWeightedVaultsVPCalc.abiDeployment iWeightedVaultsVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IWeightedVaultsVPCalc.abiDeployment>().SendRequestAsync(iWeightedVaultsVPCalc.abiDeployment);
        }

        public static async Task<IWeightedVaultsVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IWeightedVaultsVPCalc.abiDeployment iWeightedVaultsVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iWeightedVaultsVPCalc.abiDeployment, cancellationTokenSource);
            return new IWeightedVaultsVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public IWeightedVaultsVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IWeightedVaultsVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public IWeightedVaultsVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(GetVaultWeightFunction),
                typeof(GetVaultWeightAtFunction),
                typeof(SetVaultWeightFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(SetVaultWeightEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(WeightedvaultsvpcalcToolargeweightError)
            };
        }
    }
}
