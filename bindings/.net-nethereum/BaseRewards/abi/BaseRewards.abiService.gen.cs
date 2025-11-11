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
using Symbiotic.Relay.BaseRewards.abi.ContractDefinition;

namespace Symbiotic.Relay.BaseRewards.abi
{
    public partial class BaseRewards.abiService: BaseRewards.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, BaseRewards.abiDeployment baseRewards.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<BaseRewards.abiDeployment>().SendRequestAndWaitForReceiptAsync(baseRewards.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, BaseRewards.abiDeployment baseRewards.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<BaseRewards.abiDeployment>().SendRequestAsync(baseRewards.abiDeployment);
        }

        public static async Task<BaseRewards.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, BaseRewards.abiDeployment baseRewards.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, baseRewards.abiDeployment, cancellationTokenSource);
            return new BaseRewards.abiService(web3, receipt.ContractAddress);
        }

        public BaseRewards.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class BaseRewards.abiServiceBase: ContractWeb3ServiceBase
    {

        public BaseRewards.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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

        public Task<string> OperatorRegistryQueryAsync(OperatorRegistryFunction operatorRegistryFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<OperatorRegistryFunction, string>(operatorRegistryFunction, blockParameter);
        }

        
        public virtual Task<string> OperatorRegistryQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<OperatorRegistryFunction, string>(null, blockParameter);
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

        public Task<string> VaultFactoryQueryAsync(VaultFactoryFunction vaultFactoryFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VaultFactoryFunction, string>(vaultFactoryFunction, blockParameter);
        }

        
        public virtual Task<string> VaultFactoryQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VaultFactoryFunction, string>(null, blockParameter);
        }

        public virtual Task<string> DistributeOperatorRewardsRequestAsync(DistributeOperatorRewardsFunction distributeOperatorRewardsFunction)
        {
             return ContractHandler.SendRequestAsync(distributeOperatorRewardsFunction);
        }

        public virtual Task<TransactionReceipt> DistributeOperatorRewardsRequestAndWaitForReceiptAsync(DistributeOperatorRewardsFunction distributeOperatorRewardsFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(distributeOperatorRewardsFunction, cancellationToken);
        }

        public virtual Task<string> DistributeOperatorRewardsRequestAsync(string operatorRewards, string token, BigInteger amount, byte[] root)
        {
            var distributeOperatorRewardsFunction = new DistributeOperatorRewardsFunction();
                distributeOperatorRewardsFunction.OperatorRewards = operatorRewards;
                distributeOperatorRewardsFunction.Token = token;
                distributeOperatorRewardsFunction.Amount = amount;
                distributeOperatorRewardsFunction.Root = root;
            
             return ContractHandler.SendRequestAsync(distributeOperatorRewardsFunction);
        }

        public virtual Task<TransactionReceipt> DistributeOperatorRewardsRequestAndWaitForReceiptAsync(string operatorRewards, string token, BigInteger amount, byte[] root, CancellationTokenSource cancellationToken = null)
        {
            var distributeOperatorRewardsFunction = new DistributeOperatorRewardsFunction();
                distributeOperatorRewardsFunction.OperatorRewards = operatorRewards;
                distributeOperatorRewardsFunction.Token = token;
                distributeOperatorRewardsFunction.Amount = amount;
                distributeOperatorRewardsFunction.Root = root;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(distributeOperatorRewardsFunction, cancellationToken);
        }

        public virtual Task<string> DistributeStakerRewardsRequestAsync(DistributeStakerRewardsFunction distributeStakerRewardsFunction)
        {
             return ContractHandler.SendRequestAsync(distributeStakerRewardsFunction);
        }

        public virtual Task<TransactionReceipt> DistributeStakerRewardsRequestAndWaitForReceiptAsync(DistributeStakerRewardsFunction distributeStakerRewardsFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(distributeStakerRewardsFunction, cancellationToken);
        }

        public virtual Task<string> DistributeStakerRewardsRequestAsync(string stakerRewards, string token, BigInteger amount, byte[] data)
        {
            var distributeStakerRewardsFunction = new DistributeStakerRewardsFunction();
                distributeStakerRewardsFunction.StakerRewards = stakerRewards;
                distributeStakerRewardsFunction.Token = token;
                distributeStakerRewardsFunction.Amount = amount;
                distributeStakerRewardsFunction.Data = data;
            
             return ContractHandler.SendRequestAsync(distributeStakerRewardsFunction);
        }

        public virtual Task<TransactionReceipt> DistributeStakerRewardsRequestAndWaitForReceiptAsync(string stakerRewards, string token, BigInteger amount, byte[] data, CancellationTokenSource cancellationToken = null)
        {
            var distributeStakerRewardsFunction = new DistributeStakerRewardsFunction();
                distributeStakerRewardsFunction.StakerRewards = stakerRewards;
                distributeStakerRewardsFunction.Token = token;
                distributeStakerRewardsFunction.Amount = amount;
                distributeStakerRewardsFunction.Data = data;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(distributeStakerRewardsFunction, cancellationToken);
        }

        public virtual Task<Eip712DomainOutputDTO> Eip712DomainQueryAsync(Eip712DomainFunction eip712DomainFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<Eip712DomainFunction, Eip712DomainOutputDTO>(eip712DomainFunction, blockParameter);
        }

        public virtual Task<Eip712DomainOutputDTO> Eip712DomainQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<Eip712DomainFunction, Eip712DomainOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetOperatorStakesOutputDTO> GetOperatorStakesQueryAsync(GetOperatorStakesFunction getOperatorStakesFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetOperatorStakesFunction, GetOperatorStakesOutputDTO>(getOperatorStakesFunction, blockParameter);
        }

        public virtual Task<GetOperatorStakesOutputDTO> GetOperatorStakesQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var getOperatorStakesFunction = new GetOperatorStakesFunction();
                getOperatorStakesFunction.Operator = @operator;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetOperatorStakesFunction, GetOperatorStakesOutputDTO>(getOperatorStakesFunction, blockParameter);
        }

        public virtual Task<GetOperatorStakesAtOutputDTO> GetOperatorStakesAtQueryAsync(GetOperatorStakesAtFunction getOperatorStakesAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetOperatorStakesAtFunction, GetOperatorStakesAtOutputDTO>(getOperatorStakesAtFunction, blockParameter);
        }

        public virtual Task<GetOperatorStakesAtOutputDTO> GetOperatorStakesAtQueryAsync(string @operator, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getOperatorStakesAtFunction = new GetOperatorStakesAtFunction();
                getOperatorStakesAtFunction.Operator = @operator;
                getOperatorStakesAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetOperatorStakesAtFunction, GetOperatorStakesAtOutputDTO>(getOperatorStakesAtFunction, blockParameter);
        }

        public Task<List<string>> GetOperatorVaultsQueryAsync(GetOperatorVaultsFunction getOperatorVaultsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetOperatorVaultsFunction, List<string>>(getOperatorVaultsFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetOperatorVaultsQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var getOperatorVaultsFunction = new GetOperatorVaultsFunction();
                getOperatorVaultsFunction.Operator = @operator;
            
            return ContractHandler.QueryAsync<GetOperatorVaultsFunction, List<string>>(getOperatorVaultsFunction, blockParameter);
        }

        public Task<List<string>> GetOperatorVaultsAtQueryAsync(GetOperatorVaultsAtFunction getOperatorVaultsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetOperatorVaultsAtFunction, List<string>>(getOperatorVaultsAtFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetOperatorVaultsAtQueryAsync(string @operator, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getOperatorVaultsAtFunction = new GetOperatorVaultsAtFunction();
                getOperatorVaultsAtFunction.Operator = @operator;
                getOperatorVaultsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetOperatorVaultsAtFunction, List<string>>(getOperatorVaultsAtFunction, blockParameter);
        }

        public virtual Task<GetOperatorVotingPowersOutputDTO> GetOperatorVotingPowersQueryAsync(GetOperatorVotingPowersFunction getOperatorVotingPowersFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetOperatorVotingPowersFunction, GetOperatorVotingPowersOutputDTO>(getOperatorVotingPowersFunction, blockParameter);
        }

        public virtual Task<GetOperatorVotingPowersOutputDTO> GetOperatorVotingPowersQueryAsync(string @operator, byte[] extraData, BlockParameter blockParameter = null)
        {
            var getOperatorVotingPowersFunction = new GetOperatorVotingPowersFunction();
                getOperatorVotingPowersFunction.Operator = @operator;
                getOperatorVotingPowersFunction.ExtraData = extraData;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetOperatorVotingPowersFunction, GetOperatorVotingPowersOutputDTO>(getOperatorVotingPowersFunction, blockParameter);
        }

        public virtual Task<GetOperatorVotingPowersAtOutputDTO> GetOperatorVotingPowersAtQueryAsync(GetOperatorVotingPowersAtFunction getOperatorVotingPowersAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetOperatorVotingPowersAtFunction, GetOperatorVotingPowersAtOutputDTO>(getOperatorVotingPowersAtFunction, blockParameter);
        }

        public virtual Task<GetOperatorVotingPowersAtOutputDTO> GetOperatorVotingPowersAtQueryAsync(string @operator, byte[] extraData, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getOperatorVotingPowersAtFunction = new GetOperatorVotingPowersAtFunction();
                getOperatorVotingPowersAtFunction.Operator = @operator;
                getOperatorVotingPowersAtFunction.ExtraData = extraData;
                getOperatorVotingPowersAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetOperatorVotingPowersAtFunction, GetOperatorVotingPowersAtOutputDTO>(getOperatorVotingPowersAtFunction, blockParameter);
        }

        public Task<List<string>> GetOperatorsQueryAsync(GetOperatorsFunction getOperatorsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetOperatorsFunction, List<string>>(getOperatorsFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetOperatorsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetOperatorsFunction, List<string>>(null, blockParameter);
        }

        public Task<List<string>> GetOperatorsAtQueryAsync(GetOperatorsAtFunction getOperatorsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetOperatorsAtFunction, List<string>>(getOperatorsAtFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetOperatorsAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getOperatorsAtFunction = new GetOperatorsAtFunction();
                getOperatorsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetOperatorsAtFunction, List<string>>(getOperatorsAtFunction, blockParameter);
        }

        public Task<string> GetRewarderQueryAsync(GetRewarderFunction getRewarderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRewarderFunction, string>(getRewarderFunction, blockParameter);
        }

        
        public virtual Task<string> GetRewarderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRewarderFunction, string>(null, blockParameter);
        }

        public Task<List<string>> GetSharedVaultsQueryAsync(GetSharedVaultsFunction getSharedVaultsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetSharedVaultsFunction, List<string>>(getSharedVaultsFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetSharedVaultsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetSharedVaultsFunction, List<string>>(null, blockParameter);
        }

        public Task<List<string>> GetSharedVaultsAtQueryAsync(GetSharedVaultsAtFunction getSharedVaultsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetSharedVaultsAtFunction, List<string>>(getSharedVaultsAtFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetSharedVaultsAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getSharedVaultsAtFunction = new GetSharedVaultsAtFunction();
                getSharedVaultsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetSharedVaultsAtFunction, List<string>>(getSharedVaultsAtFunction, blockParameter);
        }

        public virtual Task<GetSlashingDataOutputDTO> GetSlashingDataQueryAsync(GetSlashingDataFunction getSlashingDataFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetSlashingDataFunction, GetSlashingDataOutputDTO>(getSlashingDataFunction, blockParameter);
        }

        public virtual Task<GetSlashingDataOutputDTO> GetSlashingDataQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetSlashingDataFunction, GetSlashingDataOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetSlashingDataAtOutputDTO> GetSlashingDataAtQueryAsync(GetSlashingDataAtFunction getSlashingDataAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetSlashingDataAtFunction, GetSlashingDataAtOutputDTO>(getSlashingDataAtFunction, blockParameter);
        }

        public virtual Task<GetSlashingDataAtOutputDTO> GetSlashingDataAtQueryAsync(ulong timestamp, byte[] hint, BlockParameter blockParameter = null)
        {
            var getSlashingDataAtFunction = new GetSlashingDataAtFunction();
                getSlashingDataAtFunction.Timestamp = timestamp;
                getSlashingDataAtFunction.Hint = hint;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetSlashingDataAtFunction, GetSlashingDataAtOutputDTO>(getSlashingDataAtFunction, blockParameter);
        }

        public Task<List<string>> GetTokensQueryAsync(GetTokensFunction getTokensFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTokensFunction, List<string>>(getTokensFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetTokensQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTokensFunction, List<string>>(null, blockParameter);
        }

        public Task<List<string>> GetTokensAtQueryAsync(GetTokensAtFunction getTokensAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTokensAtFunction, List<string>>(getTokensAtFunction, blockParameter);
        }

        
        public virtual Task<List<string>> GetTokensAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getTokensAtFunction = new GetTokensAtFunction();
                getTokensAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetTokensAtFunction, List<string>>(getTokensAtFunction, blockParameter);
        }

        public virtual Task<GetVotingPowersOutputDTO> GetVotingPowersQueryAsync(GetVotingPowersFunction getVotingPowersFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetVotingPowersFunction, GetVotingPowersOutputDTO>(getVotingPowersFunction, blockParameter);
        }

        public virtual Task<GetVotingPowersOutputDTO> GetVotingPowersQueryAsync(List<byte[]> extraData, BlockParameter blockParameter = null)
        {
            var getVotingPowersFunction = new GetVotingPowersFunction();
                getVotingPowersFunction.ExtraData = extraData;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetVotingPowersFunction, GetVotingPowersOutputDTO>(getVotingPowersFunction, blockParameter);
        }

        public virtual Task<GetVotingPowersAtOutputDTO> GetVotingPowersAtQueryAsync(GetVotingPowersAtFunction getVotingPowersAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetVotingPowersAtFunction, GetVotingPowersAtOutputDTO>(getVotingPowersAtFunction, blockParameter);
        }

        public virtual Task<GetVotingPowersAtOutputDTO> GetVotingPowersAtQueryAsync(List<byte[]> extraData, ulong timestamp, BlockParameter blockParameter = null)
        {
            var getVotingPowersAtFunction = new GetVotingPowersAtFunction();
                getVotingPowersAtFunction.ExtraData = extraData;
                getVotingPowersAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetVotingPowersAtFunction, GetVotingPowersAtOutputDTO>(getVotingPowersAtFunction, blockParameter);
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

        public virtual Task<string> InvalidateOldSignaturesRequestAsync(InvalidateOldSignaturesFunction invalidateOldSignaturesFunction)
        {
             return ContractHandler.SendRequestAsync(invalidateOldSignaturesFunction);
        }

        public virtual Task<string> InvalidateOldSignaturesRequestAsync()
        {
             return ContractHandler.SendRequestAsync<InvalidateOldSignaturesFunction>();
        }

        public virtual Task<TransactionReceipt> InvalidateOldSignaturesRequestAndWaitForReceiptAsync(InvalidateOldSignaturesFunction invalidateOldSignaturesFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(invalidateOldSignaturesFunction, cancellationToken);
        }

        public virtual Task<TransactionReceipt> InvalidateOldSignaturesRequestAndWaitForReceiptAsync(CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync<InvalidateOldSignaturesFunction>(null, cancellationToken);
        }

        public Task<bool> IsOperatorRegisteredQueryAsync(IsOperatorRegisteredFunction isOperatorRegisteredFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorRegisteredFunction, bool>(isOperatorRegisteredFunction, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorRegisteredQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var isOperatorRegisteredFunction = new IsOperatorRegisteredFunction();
                isOperatorRegisteredFunction.Operator = @operator;
            
            return ContractHandler.QueryAsync<IsOperatorRegisteredFunction, bool>(isOperatorRegisteredFunction, blockParameter);
        }

        public Task<bool> IsOperatorRegisteredAtQueryAsync(IsOperatorRegisteredAtFunction isOperatorRegisteredAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorRegisteredAtFunction, bool>(isOperatorRegisteredAtFunction, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorRegisteredAtQueryAsync(string @operator, ulong timestamp, BlockParameter blockParameter = null)
        {
            var isOperatorRegisteredAtFunction = new IsOperatorRegisteredAtFunction();
                isOperatorRegisteredAtFunction.Operator = @operator;
                isOperatorRegisteredAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<IsOperatorRegisteredAtFunction, bool>(isOperatorRegisteredAtFunction, blockParameter);
        }

        public Task<bool> IsOperatorVaultRegisteredQueryAsync(IsOperatorVaultRegisteredFunction isOperatorVaultRegisteredFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorVaultRegisteredFunction, bool>(isOperatorVaultRegisteredFunction, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorVaultRegisteredQueryAsync(string vault, BlockParameter blockParameter = null)
        {
            var isOperatorVaultRegisteredFunction = new IsOperatorVaultRegisteredFunction();
                isOperatorVaultRegisteredFunction.Vault = vault;
            
            return ContractHandler.QueryAsync<IsOperatorVaultRegisteredFunction, bool>(isOperatorVaultRegisteredFunction, blockParameter);
        }

        public Task<bool> IsOperatorVaultRegisteredQueryAsync(IsOperatorVaultRegistered1Function isOperatorVaultRegistered1Function, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorVaultRegistered1Function, bool>(isOperatorVaultRegistered1Function, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorVaultRegisteredQueryAsync(string @operator, string vault, BlockParameter blockParameter = null)
        {
            var isOperatorVaultRegistered1Function = new IsOperatorVaultRegistered1Function();
                isOperatorVaultRegistered1Function.Operator = @operator;
                isOperatorVaultRegistered1Function.Vault = vault;
            
            return ContractHandler.QueryAsync<IsOperatorVaultRegistered1Function, bool>(isOperatorVaultRegistered1Function, blockParameter);
        }

        public Task<bool> IsOperatorVaultRegisteredAtQueryAsync(IsOperatorVaultRegisteredAt1Function isOperatorVaultRegisteredAt1Function, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorVaultRegisteredAt1Function, bool>(isOperatorVaultRegisteredAt1Function, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorVaultRegisteredAtQueryAsync(string @operator, string vault, ulong timestamp, BlockParameter blockParameter = null)
        {
            var isOperatorVaultRegisteredAt1Function = new IsOperatorVaultRegisteredAt1Function();
                isOperatorVaultRegisteredAt1Function.Operator = @operator;
                isOperatorVaultRegisteredAt1Function.Vault = vault;
                isOperatorVaultRegisteredAt1Function.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<IsOperatorVaultRegisteredAt1Function, bool>(isOperatorVaultRegisteredAt1Function, blockParameter);
        }

        public Task<bool> IsOperatorVaultRegisteredAtQueryAsync(IsOperatorVaultRegisteredAtFunction isOperatorVaultRegisteredAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsOperatorVaultRegisteredAtFunction, bool>(isOperatorVaultRegisteredAtFunction, blockParameter);
        }

        
        public virtual Task<bool> IsOperatorVaultRegisteredAtQueryAsync(string vault, ulong timestamp, BlockParameter blockParameter = null)
        {
            var isOperatorVaultRegisteredAtFunction = new IsOperatorVaultRegisteredAtFunction();
                isOperatorVaultRegisteredAtFunction.Vault = vault;
                isOperatorVaultRegisteredAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<IsOperatorVaultRegisteredAtFunction, bool>(isOperatorVaultRegisteredAtFunction, blockParameter);
        }

        public Task<bool> IsSharedVaultRegisteredQueryAsync(IsSharedVaultRegisteredFunction isSharedVaultRegisteredFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsSharedVaultRegisteredFunction, bool>(isSharedVaultRegisteredFunction, blockParameter);
        }

        
        public virtual Task<bool> IsSharedVaultRegisteredQueryAsync(string vault, BlockParameter blockParameter = null)
        {
            var isSharedVaultRegisteredFunction = new IsSharedVaultRegisteredFunction();
                isSharedVaultRegisteredFunction.Vault = vault;
            
            return ContractHandler.QueryAsync<IsSharedVaultRegisteredFunction, bool>(isSharedVaultRegisteredFunction, blockParameter);
        }

        public Task<bool> IsSharedVaultRegisteredAtQueryAsync(IsSharedVaultRegisteredAtFunction isSharedVaultRegisteredAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsSharedVaultRegisteredAtFunction, bool>(isSharedVaultRegisteredAtFunction, blockParameter);
        }

        
        public virtual Task<bool> IsSharedVaultRegisteredAtQueryAsync(string vault, ulong timestamp, BlockParameter blockParameter = null)
        {
            var isSharedVaultRegisteredAtFunction = new IsSharedVaultRegisteredAtFunction();
                isSharedVaultRegisteredAtFunction.Vault = vault;
                isSharedVaultRegisteredAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<IsSharedVaultRegisteredAtFunction, bool>(isSharedVaultRegisteredAtFunction, blockParameter);
        }

        public Task<bool> IsTokenRegisteredQueryAsync(IsTokenRegisteredFunction isTokenRegisteredFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsTokenRegisteredFunction, bool>(isTokenRegisteredFunction, blockParameter);
        }

        
        public virtual Task<bool> IsTokenRegisteredQueryAsync(string token, BlockParameter blockParameter = null)
        {
            var isTokenRegisteredFunction = new IsTokenRegisteredFunction();
                isTokenRegisteredFunction.Token = token;
            
            return ContractHandler.QueryAsync<IsTokenRegisteredFunction, bool>(isTokenRegisteredFunction, blockParameter);
        }

        public Task<bool> IsTokenRegisteredAtQueryAsync(IsTokenRegisteredAtFunction isTokenRegisteredAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsTokenRegisteredAtFunction, bool>(isTokenRegisteredAtFunction, blockParameter);
        }

        
        public virtual Task<bool> IsTokenRegisteredAtQueryAsync(string token, ulong timestamp, BlockParameter blockParameter = null)
        {
            var isTokenRegisteredAtFunction = new IsTokenRegisteredAtFunction();
                isTokenRegisteredAtFunction.Token = token;
                isTokenRegisteredAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<IsTokenRegisteredAtFunction, bool>(isTokenRegisteredAtFunction, blockParameter);
        }

        public virtual Task<string> MulticallRequestAsync(MulticallFunction multicallFunction)
        {
             return ContractHandler.SendRequestAsync(multicallFunction);
        }

        public virtual Task<TransactionReceipt> MulticallRequestAndWaitForReceiptAsync(MulticallFunction multicallFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(multicallFunction, cancellationToken);
        }

        public virtual Task<string> MulticallRequestAsync(List<byte[]> data)
        {
            var multicallFunction = new MulticallFunction();
                multicallFunction.Data = data;
            
             return ContractHandler.SendRequestAsync(multicallFunction);
        }

        public virtual Task<TransactionReceipt> MulticallRequestAndWaitForReceiptAsync(List<byte[]> data, CancellationTokenSource cancellationToken = null)
        {
            var multicallFunction = new MulticallFunction();
                multicallFunction.Data = data;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(multicallFunction, cancellationToken);
        }

        public Task<BigInteger> NoncesQueryAsync(NoncesFunction noncesFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<NoncesFunction, BigInteger>(noncesFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> NoncesQueryAsync(string owner, BlockParameter blockParameter = null)
        {
            var noncesFunction = new NoncesFunction();
                noncesFunction.Owner = owner;
            
            return ContractHandler.QueryAsync<NoncesFunction, BigInteger>(noncesFunction, blockParameter);
        }

        public virtual Task<string> RegisterOperatorRequestAsync(RegisterOperatorFunction registerOperatorFunction)
        {
             return ContractHandler.SendRequestAsync(registerOperatorFunction);
        }

        public virtual Task<string> RegisterOperatorRequestAsync()
        {
             return ContractHandler.SendRequestAsync<RegisterOperatorFunction>();
        }

        public virtual Task<TransactionReceipt> RegisterOperatorRequestAndWaitForReceiptAsync(RegisterOperatorFunction registerOperatorFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerOperatorFunction, cancellationToken);
        }

        public virtual Task<TransactionReceipt> RegisterOperatorRequestAndWaitForReceiptAsync(CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync<RegisterOperatorFunction>(null, cancellationToken);
        }

        public virtual Task<string> RegisterOperatorWithSignatureRequestAsync(RegisterOperatorWithSignatureFunction registerOperatorWithSignatureFunction)
        {
             return ContractHandler.SendRequestAsync(registerOperatorWithSignatureFunction);
        }

        public virtual Task<TransactionReceipt> RegisterOperatorWithSignatureRequestAndWaitForReceiptAsync(RegisterOperatorWithSignatureFunction registerOperatorWithSignatureFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerOperatorWithSignatureFunction, cancellationToken);
        }

        public virtual Task<string> RegisterOperatorWithSignatureRequestAsync(string @operator, byte[] signature)
        {
            var registerOperatorWithSignatureFunction = new RegisterOperatorWithSignatureFunction();
                registerOperatorWithSignatureFunction.Operator = @operator;
                registerOperatorWithSignatureFunction.Signature = signature;
            
             return ContractHandler.SendRequestAsync(registerOperatorWithSignatureFunction);
        }

        public virtual Task<TransactionReceipt> RegisterOperatorWithSignatureRequestAndWaitForReceiptAsync(string @operator, byte[] signature, CancellationTokenSource cancellationToken = null)
        {
            var registerOperatorWithSignatureFunction = new RegisterOperatorWithSignatureFunction();
                registerOperatorWithSignatureFunction.Operator = @operator;
                registerOperatorWithSignatureFunction.Signature = signature;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(registerOperatorWithSignatureFunction, cancellationToken);
        }

        public virtual Task<string> SetRewarderRequestAsync(SetRewarderFunction setRewarderFunction)
        {
             return ContractHandler.SendRequestAsync(setRewarderFunction);
        }

        public virtual Task<TransactionReceipt> SetRewarderRequestAndWaitForReceiptAsync(SetRewarderFunction setRewarderFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setRewarderFunction, cancellationToken);
        }

        public virtual Task<string> SetRewarderRequestAsync(string rewarder)
        {
            var setRewarderFunction = new SetRewarderFunction();
                setRewarderFunction.Rewarder = rewarder;
            
             return ContractHandler.SendRequestAsync(setRewarderFunction);
        }

        public virtual Task<TransactionReceipt> SetRewarderRequestAndWaitForReceiptAsync(string rewarder, CancellationTokenSource cancellationToken = null)
        {
            var setRewarderFunction = new SetRewarderFunction();
                setRewarderFunction.Rewarder = rewarder;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setRewarderFunction, cancellationToken);
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

        public virtual Task<string> UnregisterOperatorRequestAsync(UnregisterOperatorFunction unregisterOperatorFunction)
        {
             return ContractHandler.SendRequestAsync(unregisterOperatorFunction);
        }

        public virtual Task<string> UnregisterOperatorRequestAsync()
        {
             return ContractHandler.SendRequestAsync<UnregisterOperatorFunction>();
        }

        public virtual Task<TransactionReceipt> UnregisterOperatorRequestAndWaitForReceiptAsync(UnregisterOperatorFunction unregisterOperatorFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterOperatorFunction, cancellationToken);
        }

        public virtual Task<TransactionReceipt> UnregisterOperatorRequestAndWaitForReceiptAsync(CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync<UnregisterOperatorFunction>(null, cancellationToken);
        }

        public virtual Task<string> UnregisterOperatorWithSignatureRequestAsync(UnregisterOperatorWithSignatureFunction unregisterOperatorWithSignatureFunction)
        {
             return ContractHandler.SendRequestAsync(unregisterOperatorWithSignatureFunction);
        }

        public virtual Task<TransactionReceipt> UnregisterOperatorWithSignatureRequestAndWaitForReceiptAsync(UnregisterOperatorWithSignatureFunction unregisterOperatorWithSignatureFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterOperatorWithSignatureFunction, cancellationToken);
        }

        public virtual Task<string> UnregisterOperatorWithSignatureRequestAsync(string @operator, byte[] signature)
        {
            var unregisterOperatorWithSignatureFunction = new UnregisterOperatorWithSignatureFunction();
                unregisterOperatorWithSignatureFunction.Operator = @operator;
                unregisterOperatorWithSignatureFunction.Signature = signature;
            
             return ContractHandler.SendRequestAsync(unregisterOperatorWithSignatureFunction);
        }

        public virtual Task<TransactionReceipt> UnregisterOperatorWithSignatureRequestAndWaitForReceiptAsync(string @operator, byte[] signature, CancellationTokenSource cancellationToken = null)
        {
            var unregisterOperatorWithSignatureFunction = new UnregisterOperatorWithSignatureFunction();
                unregisterOperatorWithSignatureFunction.Operator = @operator;
                unregisterOperatorWithSignatureFunction.Signature = signature;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(unregisterOperatorWithSignatureFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(NetworkFunction),
                typeof(OperatorRegistryFunction),
                typeof(SubnetworkFunction),
                typeof(SubnetworkIdentifierFunction),
                typeof(VaultFactoryFunction),
                typeof(DistributeOperatorRewardsFunction),
                typeof(DistributeStakerRewardsFunction),
                typeof(Eip712DomainFunction),
                typeof(GetOperatorStakesFunction),
                typeof(GetOperatorStakesAtFunction),
                typeof(GetOperatorVaultsFunction),
                typeof(GetOperatorVaultsAtFunction),
                typeof(GetOperatorVotingPowersFunction),
                typeof(GetOperatorVotingPowersAtFunction),
                typeof(GetOperatorsFunction),
                typeof(GetOperatorsAtFunction),
                typeof(GetRewarderFunction),
                typeof(GetSharedVaultsFunction),
                typeof(GetSharedVaultsAtFunction),
                typeof(GetSlashingDataFunction),
                typeof(GetSlashingDataAtFunction),
                typeof(GetTokensFunction),
                typeof(GetTokensAtFunction),
                typeof(GetVotingPowersFunction),
                typeof(GetVotingPowersAtFunction),
                typeof(HashTypedDataV4Function),
                typeof(HashTypedDataV4CrossChainFunction),
                typeof(InvalidateOldSignaturesFunction),
                typeof(IsOperatorRegisteredFunction),
                typeof(IsOperatorRegisteredAtFunction),
                typeof(IsOperatorVaultRegisteredFunction),
                typeof(IsOperatorVaultRegistered1Function),
                typeof(IsOperatorVaultRegisteredAt1Function),
                typeof(IsOperatorVaultRegisteredAtFunction),
                typeof(IsSharedVaultRegisteredFunction),
                typeof(IsSharedVaultRegisteredAtFunction),
                typeof(IsTokenRegisteredFunction),
                typeof(IsTokenRegisteredAtFunction),
                typeof(MulticallFunction),
                typeof(NoncesFunction),
                typeof(RegisterOperatorFunction),
                typeof(RegisterOperatorWithSignatureFunction),
                typeof(SetRewarderFunction),
                typeof(StakeToVotingPowerFunction),
                typeof(StakeToVotingPowerAtFunction),
                typeof(StaticDelegateCallFunction),
                typeof(UnregisterOperatorFunction),
                typeof(UnregisterOperatorWithSignatureFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(DistributeOperatorRewardsEventDTO),
                typeof(DistributeStakerRewardsEventDTO),
                typeof(EIP712DomainChangedEventDTO),
                typeof(InitEIP712EventDTO),
                typeof(InitSubnetworkEventDTO),
                typeof(InitializedEventDTO),
                typeof(RegisterOperatorEventDTO),
                typeof(RegisterOperatorVaultEventDTO),
                typeof(RegisterSharedVaultEventDTO),
                typeof(RegisterTokenEventDTO),
                typeof(SetRewarderEventDTO),
                typeof(SetSlashingDataEventDTO),
                typeof(UnregisterOperatorEventDTO),
                typeof(UnregisterOperatorVaultEventDTO),
                typeof(UnregisterSharedVaultEventDTO),
                typeof(UnregisterTokenEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(AddressEmptyCodeError),
                typeof(BaserewardsNotrewarderError),
                typeof(FailedCallError),
                typeof(InvalidAccountNonceError),
                typeof(InvalidInitializationError),
                typeof(NetworkmanagerInvalidnetworkError),
                typeof(NotInitializingError),
                typeof(VotingpowerproviderInvalidoperatorError),
                typeof(VotingpowerproviderInvalidoperatorvaultError),
                typeof(VotingpowerproviderInvalidsharedvaultError),
                typeof(VotingpowerproviderInvalidsignatureError),
                typeof(VotingpowerproviderInvalidtokenError),
                typeof(VotingpowerproviderInvalidvaultError),
                typeof(VotingpowerproviderOperatoralreadyregisteredError),
                typeof(VotingpowerproviderOperatornotregisteredError),
                typeof(VotingpowerproviderOperatorvaultalreadyisregisteredError),
                typeof(VotingpowerproviderOperatorvaultnotregisteredError),
                typeof(VotingpowerproviderSharedvaultalreadyisregisteredError),
                typeof(VotingpowerproviderSharedvaultnotregisteredError),
                typeof(VotingpowerproviderTokenalreadyisregisteredError),
                typeof(VotingpowerproviderTokennotregisteredError)
            };
        }
    }
}
