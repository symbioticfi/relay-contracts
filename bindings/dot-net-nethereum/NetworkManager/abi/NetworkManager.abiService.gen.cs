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
using Symbiotic.Relay.NetworkManager.abi.ContractDefinition;

namespace Symbiotic.Relay.NetworkManager.abi
{
    public partial class NetworkManager.abiService: NetworkManager.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, NetworkManager.abiDeployment networkManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<NetworkManager.abiDeployment>().SendRequestAndWaitForReceiptAsync(networkManager.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, NetworkManager.abiDeployment networkManager.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<NetworkManager.abiDeployment>().SendRequestAsync(networkManager.abiDeployment);
        }

        public static async Task<NetworkManager.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, NetworkManager.abiDeployment networkManager.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, networkManager.abiDeployment, cancellationTokenSource);
            return new NetworkManager.abiService(web3, receipt.ContractAddress);
        }

        public NetworkManager.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class NetworkManager.abiServiceBase: ContractWeb3ServiceBase
    {

        public NetworkManager.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<string> NetworkQueryAsync(NetworkFunction networkFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<NetworkFunction, string>(networkFunction, blockParameter);
        }

        
        public virtual Task<string> NetworkQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<NetworkFunction, string>(null, blockParameter);
        }

        public Task<byte[]> SubnetworkQueryAsync(SubnetworkFunction subnetworkFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<SubnetworkFunction, byte[]>(subnetworkFunction, blockParameter);
        }

        
        public virtual Task<byte[]> SubnetworkQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<SubnetworkFunction, byte[]>(null, blockParameter);
        }

        public Task<BigInteger> SubnetworkIdentifierQueryAsync(SubnetworkIdentifierFunction subnetworkIdentifierFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<SubnetworkIdentifierFunction, BigInteger>(subnetworkIdentifierFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> SubnetworkIdentifierQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<SubnetworkIdentifierFunction, BigInteger>(null, blockParameter);
        }

        public virtual Task<string> StaticDelegateCallRequestAsync(StaticDelegateCallFunction staticDelegateCallFunction)
        {
             return ContractHandler.SendRequestAsync(staticDelegateCallFunction);
        }

        public virtual Task<TransactionReceipt> StaticDelegateCallRequestAndWaitForReceiptAsync(StaticDelegateCallFunction staticDelegateCallFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(staticDelegateCallFunction, cancellationToken);
        }

        public virtual Task<string> StaticDelegateCallRequestAsync(string target, byte[] data)
        {
            var staticDelegateCallFunction = new StaticDelegateCallFunction();
                staticDelegateCallFunction.Target = target;
                staticDelegateCallFunction.Data = data;
            
             return ContractHandler.SendRequestAsync(staticDelegateCallFunction);
        }

        public virtual Task<TransactionReceipt> StaticDelegateCallRequestAndWaitForReceiptAsync(string target, byte[] data, CancellationTokenSource cancellationToken = null)
        {
            var staticDelegateCallFunction = new StaticDelegateCallFunction();
                staticDelegateCallFunction.Target = target;
                staticDelegateCallFunction.Data = data;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(staticDelegateCallFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(NetworkFunction),
                typeof(SubnetworkFunction),
                typeof(SubnetworkIdentifierFunction),
                typeof(StaticDelegateCallFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(InitSubnetworkEventDTO),
                typeof(InitializedEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(InvalidInitializationError),
                typeof(NetworkmanagerInvalidnetworkError),
                typeof(NotInitializingError)
            };
        }
    }
}
