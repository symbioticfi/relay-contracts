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
using Symbiotic.Relay.OzEIP712.abi.ContractDefinition;

namespace Symbiotic.Relay.OzEIP712.abi
{
    public partial class OzEIP712.abiService: OzEIP712.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, OzEIP712.abiDeployment ozEIP712.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<OzEIP712.abiDeployment>().SendRequestAndWaitForReceiptAsync(ozEIP712.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, OzEIP712.abiDeployment ozEIP712.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<OzEIP712.abiDeployment>().SendRequestAsync(ozEIP712.abiDeployment);
        }

        public static async Task<OzEIP712.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, OzEIP712.abiDeployment ozEIP712.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, ozEIP712.abiDeployment, cancellationTokenSource);
            return new OzEIP712.abiService(web3, receipt.ContractAddress);
        }

        public OzEIP712.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class OzEIP712.abiServiceBase: ContractWeb3ServiceBase
    {

        public OzEIP712.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public virtual Task<Eip712DomainOutputDTO> Eip712DomainQueryAsync(Eip712DomainFunction eip712DomainFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<Eip712DomainFunction, Eip712DomainOutputDTO>(eip712DomainFunction, blockParameter);
        }

        public virtual Task<Eip712DomainOutputDTO> Eip712DomainQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<Eip712DomainFunction, Eip712DomainOutputDTO>(null, blockParameter);
        }

        public Task<byte[]> HashTypedDataV4QueryAsync(HashTypedDataV4Function hashTypedDataV4Function, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<HashTypedDataV4Function, byte[]>(hashTypedDataV4Function, blockParameter);
        }

        
        public virtual Task<byte[]> HashTypedDataV4QueryAsync(byte[] structHash, BlockParameter blockParameter = null)
        {
            var hashTypedDataV4Function = new HashTypedDataV4Function();
                hashTypedDataV4Function.StructHash = structHash;
            
            return ContractHandler.QueryAsync<HashTypedDataV4Function, byte[]>(hashTypedDataV4Function, blockParameter);
        }

        public Task<byte[]> HashTypedDataV4CrossChainQueryAsync(HashTypedDataV4CrossChainFunction hashTypedDataV4CrossChainFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<HashTypedDataV4CrossChainFunction, byte[]>(hashTypedDataV4CrossChainFunction, blockParameter);
        }

        
        public virtual Task<byte[]> HashTypedDataV4CrossChainQueryAsync(byte[] structHash, BlockParameter blockParameter = null)
        {
            var hashTypedDataV4CrossChainFunction = new HashTypedDataV4CrossChainFunction();
                hashTypedDataV4CrossChainFunction.StructHash = structHash;
            
            return ContractHandler.QueryAsync<HashTypedDataV4CrossChainFunction, byte[]>(hashTypedDataV4CrossChainFunction, blockParameter);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(Eip712DomainFunction),
                typeof(HashTypedDataV4Function),
                typeof(HashTypedDataV4CrossChainFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(EIP712DomainChangedEventDTO),
                typeof(InitEIP712EventDTO),
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
