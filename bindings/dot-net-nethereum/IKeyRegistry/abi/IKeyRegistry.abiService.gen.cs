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
using Symbiotic.Relay.IKeyRegistry.abi.ContractDefinition;

namespace Symbiotic.Relay.IKeyRegistry.abi
{
    public partial class IKeyRegistry.abiService: IKeyRegistry.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IKeyRegistry.abiDeployment iKeyRegistry.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IKeyRegistry.abiDeployment>().SendRequestAndWaitForReceiptAsync(iKeyRegistry.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IKeyRegistry.abiDeployment iKeyRegistry.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IKeyRegistry.abiDeployment>().SendRequestAsync(iKeyRegistry.abiDeployment);
        }

        public static async Task<IKeyRegistry.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IKeyRegistry.abiDeployment iKeyRegistry.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iKeyRegistry.abiDeployment, cancellationTokenSource);
            return new IKeyRegistry.abiService(web3, receipt.ContractAddress);
        }

        public IKeyRegistry.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IKeyRegistry.abiServiceBase: ContractWeb3ServiceBase
    {

        public IKeyRegistry.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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

        public Task<byte[]> GetKeyQueryAsync(GetKeyFunction getKeyFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetKeyFunction, byte[]>(getKeyFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetKeyQueryAsync(string @operator, byte tag, BlockParameter blockParameter = null)
        {
            var getKeyFunction = new GetKeyFunction();
                getKeyFunction.Operator = @operator;
                getKeyFunction.Tag = tag;
            
            return ContractHandler.QueryAsync<GetKeyFunction, byte[]>(getKeyFunction, blockParameter);
        }

        public Task<byte[]> GetKeyAtQueryAsync(GetKeyAtFunction getKeyAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetKeyAtFunction, byte[]>(getKeyAtFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetKeyAtQueryAsync(string @operator, byte tag, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getKeyAtFunction = new GetKeyAtFunction();
                getKeyAtFunction.Operator = @operator;
                getKeyAtFunction.Tag = tag;
                getKeyAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetKeyAtFunction, byte[]>(getKeyAtFunction, blockParameter);
        }

        public virtual Task<GetKeysOutputDTO> GetKeysQueryAsync(GetKeysFunction getKeysFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysFunction, GetKeysOutputDTO>(getKeysFunction, blockParameter);
        }

        public virtual Task<GetKeysOutputDTO> GetKeysQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysFunction, GetKeysOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetKeys1OutputDTO> GetKeysQueryAsync(GetKeys1Function getKeys1Function, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeys1Function, GetKeys1OutputDTO>(getKeys1Function, blockParameter);
        }

        public virtual Task<GetKeys1OutputDTO> GetKeysQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var getKeys1Function = new GetKeys1Function();
                getKeys1Function.Operator = @operator;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeys1Function, GetKeys1OutputDTO>(getKeys1Function, blockParameter);
        }

        public virtual Task<GetKeysAtOutputDTO> GetKeysAtQueryAsync(GetKeysAtFunction getKeysAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysAtFunction, GetKeysAtOutputDTO>(getKeysAtFunction, blockParameter);
        }

        public virtual Task<GetKeysAtOutputDTO> GetKeysAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getKeysAtFunction = new GetKeysAtFunction();
                getKeysAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysAtFunction, GetKeysAtOutputDTO>(getKeysAtFunction, blockParameter);
        }

        public virtual Task<GetKeysAt1OutputDTO> GetKeysAtQueryAsync(GetKeysAt1Function getKeysAt1Function, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysAt1Function, GetKeysAt1OutputDTO>(getKeysAt1Function, blockParameter);
        }

        public virtual Task<GetKeysAt1OutputDTO> GetKeysAtQueryAsync(string @operator, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getKeysAt1Function = new GetKeysAt1Function();
                getKeysAt1Function.Operator = @operator;
                getKeysAt1Function.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysAt1Function, GetKeysAt1OutputDTO>(getKeysAt1Function, blockParameter);
        }

        public Task<List<string>> GetKeysOperatorsQueryAsync(GetKeysOperatorsFunction getKeysOperatorsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetKeysOperatorsFunction, List<string>>(getKeysOperatorsFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetKeysOperatorsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetKeysOperatorsFunction, List<string>>(null, blockParameter);
        }

        public Task<List<string>> GetKeysOperatorsAtQueryAsync(GetKeysOperatorsAtFunction getKeysOperatorsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetKeysOperatorsAtFunction, List<string>>(getKeysOperatorsAtFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetKeysOperatorsAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getKeysOperatorsAtFunction = new GetKeysOperatorsAtFunction();
                getKeysOperatorsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetKeysOperatorsAtFunction, List<string>>(getKeysOperatorsAtFunction, blockParameter);
        }

        public Task<BigInteger> GetKeysOperatorsLengthQueryAsync(GetKeysOperatorsLengthFunction getKeysOperatorsLengthFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetKeysOperatorsLengthFunction, BigInteger>(getKeysOperatorsLengthFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetKeysOperatorsLengthQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetKeysOperatorsLengthFunction, BigInteger>(null, blockParameter);
        }

        public Task<string> GetOperatorQueryAsync(GetOperatorFunction getOperatorFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetOperatorFunction, string>(getOperatorFunction, blockParameter);
        }

        
        public virtual Task<string> GetOperatorQueryAsync(byte[] key, BlockParameter blockParameter = null)
        {
            var getOperatorFunction = new GetOperatorFunction();
                getOperatorFunction.Key = key;
            
            return ContractHandler.QueryAsync<GetOperatorFunction, string>(getOperatorFunction, blockParameter);
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

        public virtual Task<string> SetKeyRequestAsync(SetKeyFunction setKeyFunction)
        {
             return ContractHandler.SendRequestAsync(setKeyFunction);
        }

        public virtual Task<TransactionReceipt> SetKeyRequestAndWaitForReceiptAsync(SetKeyFunction setKeyFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setKeyFunction, cancellationToken);
        }

        public virtual Task<string> SetKeyRequestAsync(byte tag, byte[] key, byte[] signature, byte[] extraData)
        {
            var setKeyFunction = new SetKeyFunction();
                setKeyFunction.Tag = tag;
                setKeyFunction.Key = key;
                setKeyFunction.Signature = signature;
                setKeyFunction.ExtraData = extraData;
            
             return ContractHandler.SendRequestAsync(setKeyFunction);
        }

        public virtual Task<TransactionReceipt> SetKeyRequestAndWaitForReceiptAsync(byte tag, byte[] key, byte[] signature, byte[] extraData, CancellationTokenSource cancellationToken = null)
        {
            var setKeyFunction = new SetKeyFunction();
                setKeyFunction.Tag = tag;
                setKeyFunction.Key = key;
                setKeyFunction.Signature = signature;
                setKeyFunction.ExtraData = extraData;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setKeyFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(Eip712DomainFunction),
                typeof(GetKeyFunction),
                typeof(GetKeyAtFunction),
                typeof(GetKeysFunction),
                typeof(GetKeys1Function),
                typeof(GetKeysAtFunction),
                typeof(GetKeysAt1Function),
                typeof(GetKeysOperatorsFunction),
                typeof(GetKeysOperatorsAtFunction),
                typeof(GetKeysOperatorsLengthFunction),
                typeof(GetOperatorFunction),
                typeof(HashTypedDataV4Function),
                typeof(HashTypedDataV4CrossChainFunction),
                typeof(SetKeyFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(EIP712DomainChangedEventDTO),
                typeof(InitEIP712EventDTO),
                typeof(SetKeyEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(KeyregistryAlreadyusedError),
                typeof(KeyregistryInvalidkeysignatureError),
                typeof(KeyregistryInvalidkeytypeError)
            };
        }
    }
}
