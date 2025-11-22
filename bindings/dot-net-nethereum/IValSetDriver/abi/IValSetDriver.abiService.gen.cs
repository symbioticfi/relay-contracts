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
using Symbiotic.Relay.IValSetDriver.abi.ContractDefinition;

namespace Symbiotic.Relay.IValSetDriver.abi
{
    public partial class IValSetDriver.abiService: IValSetDriver.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IValSetDriver.abiDeployment iValSetDriver.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IValSetDriver.abiDeployment>().SendRequestAndWaitForReceiptAsync(iValSetDriver.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IValSetDriver.abiDeployment iValSetDriver.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IValSetDriver.abiDeployment>().SendRequestAsync(iValSetDriver.abiDeployment);
        }

        public static async Task<IValSetDriver.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IValSetDriver.abiDeployment iValSetDriver.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iValSetDriver.abiDeployment, cancellationTokenSource);
            return new IValSetDriver.abiService(web3, receipt.ContractAddress);
        }

        public IValSetDriver.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IValSetDriver.abiServiceBase: ContractWeb3ServiceBase
    {

        public IValSetDriver.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<BigInteger> MaxQuorumThresholdQueryAsync(MaxQuorumThresholdFunction maxQuorumThresholdFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<MaxQuorumThresholdFunction, BigInteger>(maxQuorumThresholdFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> MaxQuorumThresholdQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<MaxQuorumThresholdFunction, BigInteger>(null, blockParameter);
        }

        public virtual Task<string> AddQuorumThresholdRequestAsync(AddQuorumThresholdFunction addQuorumThresholdFunction)
        {
             return ContractHandler.SendRequestAsync(addQuorumThresholdFunction);
        }

        public virtual Task<TransactionReceipt> AddQuorumThresholdRequestAndWaitForReceiptAsync(AddQuorumThresholdFunction addQuorumThresholdFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(addQuorumThresholdFunction, cancellationToken);
        }

        public virtual Task<string> AddQuorumThresholdRequestAsync(QuorumThreshold quorumThreshold)
        {
            var addQuorumThresholdFunction = new AddQuorumThresholdFunction();
                addQuorumThresholdFunction.QuorumThreshold = quorumThreshold;
            
             return ContractHandler.SendRequestAsync(addQuorumThresholdFunction);
        }

        public virtual Task<TransactionReceipt> AddQuorumThresholdRequestAndWaitForReceiptAsync(QuorumThreshold quorumThreshold, CancellationTokenSource cancellationToken = null)
        {
            var addQuorumThresholdFunction = new AddQuorumThresholdFunction();
                addQuorumThresholdFunction.QuorumThreshold = quorumThreshold;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(addQuorumThresholdFunction, cancellationToken);
        }

        public virtual Task<string> AddSettlementRequestAsync(AddSettlementFunction addSettlementFunction)
        {
             return ContractHandler.SendRequestAsync(addSettlementFunction);
        }

        public virtual Task<TransactionReceipt> AddSettlementRequestAndWaitForReceiptAsync(AddSettlementFunction addSettlementFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(addSettlementFunction, cancellationToken);
        }

        public virtual Task<string> AddSettlementRequestAsync(CrossChainAddress settlement)
        {
            var addSettlementFunction = new AddSettlementFunction();
                addSettlementFunction.Settlement = settlement;
            
             return ContractHandler.SendRequestAsync(addSettlementFunction);
        }

        public virtual Task<TransactionReceipt> AddSettlementRequestAndWaitForReceiptAsync(CrossChainAddress settlement, CancellationTokenSource cancellationToken = null)
        {
            var addSettlementFunction = new AddSettlementFunction();
                addSettlementFunction.Settlement = settlement;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(addSettlementFunction, cancellationToken);
        }

        public virtual Task<string> AddVotingPowerProviderRequestAsync(AddVotingPowerProviderFunction addVotingPowerProviderFunction)
        {
             return ContractHandler.SendRequestAsync(addVotingPowerProviderFunction);
        }

        public virtual Task<TransactionReceipt> AddVotingPowerProviderRequestAndWaitForReceiptAsync(AddVotingPowerProviderFunction addVotingPowerProviderFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(addVotingPowerProviderFunction, cancellationToken);
        }

        public virtual Task<string> AddVotingPowerProviderRequestAsync(CrossChainAddress votingPowerProvider)
        {
            var addVotingPowerProviderFunction = new AddVotingPowerProviderFunction();
                addVotingPowerProviderFunction.VotingPowerProvider = votingPowerProvider;
            
             return ContractHandler.SendRequestAsync(addVotingPowerProviderFunction);
        }

        public virtual Task<TransactionReceipt> AddVotingPowerProviderRequestAndWaitForReceiptAsync(CrossChainAddress votingPowerProvider, CancellationTokenSource cancellationToken = null)
        {
            var addVotingPowerProviderFunction = new AddVotingPowerProviderFunction();
                addVotingPowerProviderFunction.VotingPowerProvider = votingPowerProvider;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(addVotingPowerProviderFunction, cancellationToken);
        }

        public Task<ulong> GetCommitterSlotDurationQueryAsync(GetCommitterSlotDurationFunction getCommitterSlotDurationFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCommitterSlotDurationFunction, ulong>(getCommitterSlotDurationFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetCommitterSlotDurationQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCommitterSlotDurationFunction, ulong>(null, blockParameter);
        }

        public Task<ulong> GetCommitterSlotDurationAtQueryAsync(GetCommitterSlotDurationAtFunction getCommitterSlotDurationAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCommitterSlotDurationAtFunction, ulong>(getCommitterSlotDurationAtFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetCommitterSlotDurationAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getCommitterSlotDurationAtFunction = new GetCommitterSlotDurationAtFunction();
                getCommitterSlotDurationAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetCommitterSlotDurationAtFunction, ulong>(getCommitterSlotDurationAtFunction, blockParameter);
        }

        public virtual Task<GetConfigOutputDTO> GetConfigQueryAsync(GetConfigFunction getConfigFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetConfigFunction, GetConfigOutputDTO>(getConfigFunction, blockParameter);
        }

        public virtual Task<GetConfigOutputDTO> GetConfigQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetConfigFunction, GetConfigOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetConfigAtOutputDTO> GetConfigAtQueryAsync(GetConfigAtFunction getConfigAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetConfigAtFunction, GetConfigAtOutputDTO>(getConfigAtFunction, blockParameter);
        }

        public virtual Task<GetConfigAtOutputDTO> GetConfigAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getConfigAtFunction = new GetConfigAtFunction();
                getConfigAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetConfigAtFunction, GetConfigAtOutputDTO>(getConfigAtFunction, blockParameter);
        }

        public virtual Task<GetKeysProviderOutputDTO> GetKeysProviderQueryAsync(GetKeysProviderFunction getKeysProviderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysProviderFunction, GetKeysProviderOutputDTO>(getKeysProviderFunction, blockParameter);
        }

        public virtual Task<GetKeysProviderOutputDTO> GetKeysProviderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysProviderFunction, GetKeysProviderOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetKeysProviderAtOutputDTO> GetKeysProviderAtQueryAsync(GetKeysProviderAtFunction getKeysProviderAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysProviderAtFunction, GetKeysProviderAtOutputDTO>(getKeysProviderAtFunction, blockParameter);
        }

        public virtual Task<GetKeysProviderAtOutputDTO> GetKeysProviderAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getKeysProviderAtFunction = new GetKeysProviderAtFunction();
                getKeysProviderAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetKeysProviderAtFunction, GetKeysProviderAtOutputDTO>(getKeysProviderAtFunction, blockParameter);
        }

        public Task<BigInteger> GetMaxValidatorsCountQueryAsync(GetMaxValidatorsCountFunction getMaxValidatorsCountFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMaxValidatorsCountFunction, BigInteger>(getMaxValidatorsCountFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetMaxValidatorsCountQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMaxValidatorsCountFunction, BigInteger>(null, blockParameter);
        }

        public Task<BigInteger> GetMaxValidatorsCountAtQueryAsync(GetMaxValidatorsCountAtFunction getMaxValidatorsCountAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMaxValidatorsCountAtFunction, BigInteger>(getMaxValidatorsCountAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetMaxValidatorsCountAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getMaxValidatorsCountAtFunction = new GetMaxValidatorsCountAtFunction();
                getMaxValidatorsCountAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetMaxValidatorsCountAtFunction, BigInteger>(getMaxValidatorsCountAtFunction, blockParameter);
        }

        public Task<BigInteger> GetMaxVotingPowerQueryAsync(GetMaxVotingPowerFunction getMaxVotingPowerFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMaxVotingPowerFunction, BigInteger>(getMaxVotingPowerFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetMaxVotingPowerQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMaxVotingPowerFunction, BigInteger>(null, blockParameter);
        }

        public Task<BigInteger> GetMaxVotingPowerAtQueryAsync(GetMaxVotingPowerAtFunction getMaxVotingPowerAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMaxVotingPowerAtFunction, BigInteger>(getMaxVotingPowerAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetMaxVotingPowerAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getMaxVotingPowerAtFunction = new GetMaxVotingPowerAtFunction();
                getMaxVotingPowerAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetMaxVotingPowerAtFunction, BigInteger>(getMaxVotingPowerAtFunction, blockParameter);
        }

        public Task<BigInteger> GetMinInclusionVotingPowerQueryAsync(GetMinInclusionVotingPowerFunction getMinInclusionVotingPowerFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMinInclusionVotingPowerFunction, BigInteger>(getMinInclusionVotingPowerFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetMinInclusionVotingPowerQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMinInclusionVotingPowerFunction, BigInteger>(null, blockParameter);
        }

        public Task<BigInteger> GetMinInclusionVotingPowerAtQueryAsync(GetMinInclusionVotingPowerAtFunction getMinInclusionVotingPowerAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetMinInclusionVotingPowerAtFunction, BigInteger>(getMinInclusionVotingPowerAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetMinInclusionVotingPowerAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getMinInclusionVotingPowerAtFunction = new GetMinInclusionVotingPowerAtFunction();
                getMinInclusionVotingPowerAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetMinInclusionVotingPowerAtFunction, BigInteger>(getMinInclusionVotingPowerAtFunction, blockParameter);
        }

        public Task<BigInteger> GetNumAggregatorsQueryAsync(GetNumAggregatorsFunction getNumAggregatorsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNumAggregatorsFunction, BigInteger>(getNumAggregatorsFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetNumAggregatorsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNumAggregatorsFunction, BigInteger>(null, blockParameter);
        }

        public Task<BigInteger> GetNumAggregatorsAtQueryAsync(GetNumAggregatorsAtFunction getNumAggregatorsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNumAggregatorsAtFunction, BigInteger>(getNumAggregatorsAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetNumAggregatorsAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getNumAggregatorsAtFunction = new GetNumAggregatorsAtFunction();
                getNumAggregatorsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetNumAggregatorsAtFunction, BigInteger>(getNumAggregatorsAtFunction, blockParameter);
        }

        public Task<BigInteger> GetNumCommittersQueryAsync(GetNumCommittersFunction getNumCommittersFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNumCommittersFunction, BigInteger>(getNumCommittersFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetNumCommittersQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNumCommittersFunction, BigInteger>(null, blockParameter);
        }

        public Task<BigInteger> GetNumCommittersAtQueryAsync(GetNumCommittersAtFunction getNumCommittersAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetNumCommittersAtFunction, BigInteger>(getNumCommittersAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetNumCommittersAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getNumCommittersAtFunction = new GetNumCommittersAtFunction();
                getNumCommittersAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetNumCommittersAtFunction, BigInteger>(getNumCommittersAtFunction, blockParameter);
        }

        public virtual Task<GetQuorumThresholdsOutputDTO> GetQuorumThresholdsQueryAsync(GetQuorumThresholdsFunction getQuorumThresholdsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetQuorumThresholdsFunction, GetQuorumThresholdsOutputDTO>(getQuorumThresholdsFunction, blockParameter);
        }

        public virtual Task<GetQuorumThresholdsOutputDTO> GetQuorumThresholdsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetQuorumThresholdsFunction, GetQuorumThresholdsOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetQuorumThresholdsAtOutputDTO> GetQuorumThresholdsAtQueryAsync(GetQuorumThresholdsAtFunction getQuorumThresholdsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetQuorumThresholdsAtFunction, GetQuorumThresholdsAtOutputDTO>(getQuorumThresholdsAtFunction, blockParameter);
        }

        public virtual Task<GetQuorumThresholdsAtOutputDTO> GetQuorumThresholdsAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getQuorumThresholdsAtFunction = new GetQuorumThresholdsAtFunction();
                getQuorumThresholdsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetQuorumThresholdsAtFunction, GetQuorumThresholdsAtOutputDTO>(getQuorumThresholdsAtFunction, blockParameter);
        }

        public Task<byte> GetRequiredHeaderKeyTagQueryAsync(GetRequiredHeaderKeyTagFunction getRequiredHeaderKeyTagFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredHeaderKeyTagFunction, byte>(getRequiredHeaderKeyTagFunction, blockParameter);
        }

        
        public virtual Task<byte> GetRequiredHeaderKeyTagQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredHeaderKeyTagFunction, byte>(null, blockParameter);
        }

        public Task<byte> GetRequiredHeaderKeyTagAtQueryAsync(GetRequiredHeaderKeyTagAtFunction getRequiredHeaderKeyTagAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredHeaderKeyTagAtFunction, byte>(getRequiredHeaderKeyTagAtFunction, blockParameter);
        }

        
        public virtual Task<byte> GetRequiredHeaderKeyTagAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getRequiredHeaderKeyTagAtFunction = new GetRequiredHeaderKeyTagAtFunction();
                getRequiredHeaderKeyTagAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetRequiredHeaderKeyTagAtFunction, byte>(getRequiredHeaderKeyTagAtFunction, blockParameter);
        }

        public Task<List<byte>> GetRequiredKeyTagsQueryAsync(GetRequiredKeyTagsFunction getRequiredKeyTagsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredKeyTagsFunction, List<byte>>(getRequiredKeyTagsFunction, blockParameter);
        }

        
        public virtual Task<List<byte>> GetRequiredKeyTagsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredKeyTagsFunction, List<byte>>(null, blockParameter);
        }

        public Task<List<byte>> GetRequiredKeyTagsAtQueryAsync(GetRequiredKeyTagsAtFunction getRequiredKeyTagsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredKeyTagsAtFunction, List<byte>>(getRequiredKeyTagsAtFunction, blockParameter);
        }

        
        public virtual Task<List<byte>> GetRequiredKeyTagsAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getRequiredKeyTagsAtFunction = new GetRequiredKeyTagsAtFunction();
                getRequiredKeyTagsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetRequiredKeyTagsAtFunction, List<byte>>(getRequiredKeyTagsAtFunction, blockParameter);
        }

        public virtual Task<GetSettlementsOutputDTO> GetSettlementsQueryAsync(GetSettlementsFunction getSettlementsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetSettlementsFunction, GetSettlementsOutputDTO>(getSettlementsFunction, blockParameter);
        }

        public virtual Task<GetSettlementsOutputDTO> GetSettlementsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetSettlementsFunction, GetSettlementsOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetSettlementsAtOutputDTO> GetSettlementsAtQueryAsync(GetSettlementsAtFunction getSettlementsAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetSettlementsAtFunction, GetSettlementsAtOutputDTO>(getSettlementsAtFunction, blockParameter);
        }

        public virtual Task<GetSettlementsAtOutputDTO> GetSettlementsAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getSettlementsAtFunction = new GetSettlementsAtFunction();
                getSettlementsAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetSettlementsAtFunction, GetSettlementsAtOutputDTO>(getSettlementsAtFunction, blockParameter);
        }

        public Task<uint> GetVerificationTypeQueryAsync(GetVerificationTypeFunction getVerificationTypeFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetVerificationTypeFunction, uint>(getVerificationTypeFunction, blockParameter);
        }

        
        public virtual Task<uint> GetVerificationTypeQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetVerificationTypeFunction, uint>(null, blockParameter);
        }

        public Task<uint> GetVerificationTypeAtQueryAsync(GetVerificationTypeAtFunction getVerificationTypeAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetVerificationTypeAtFunction, uint>(getVerificationTypeAtFunction, blockParameter);
        }

        
        public virtual Task<uint> GetVerificationTypeAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getVerificationTypeAtFunction = new GetVerificationTypeAtFunction();
                getVerificationTypeAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<GetVerificationTypeAtFunction, uint>(getVerificationTypeAtFunction, blockParameter);
        }

        public virtual Task<GetVotingPowerProvidersOutputDTO> GetVotingPowerProvidersQueryAsync(GetVotingPowerProvidersFunction getVotingPowerProvidersFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetVotingPowerProvidersFunction, GetVotingPowerProvidersOutputDTO>(getVotingPowerProvidersFunction, blockParameter);
        }

        public virtual Task<GetVotingPowerProvidersOutputDTO> GetVotingPowerProvidersQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetVotingPowerProvidersFunction, GetVotingPowerProvidersOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetVotingPowerProvidersAtOutputDTO> GetVotingPowerProvidersAtQueryAsync(GetVotingPowerProvidersAtFunction getVotingPowerProvidersAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetVotingPowerProvidersAtFunction, GetVotingPowerProvidersAtOutputDTO>(getVotingPowerProvidersAtFunction, blockParameter);
        }

        public virtual Task<GetVotingPowerProvidersAtOutputDTO> GetVotingPowerProvidersAtQueryAsync(ulong timestamp, BlockParameter blockParameter = null)
        {
            var getVotingPowerProvidersAtFunction = new GetVotingPowerProvidersAtFunction();
                getVotingPowerProvidersAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetVotingPowerProvidersAtFunction, GetVotingPowerProvidersAtOutputDTO>(getVotingPowerProvidersAtFunction, blockParameter);
        }

        public Task<bool> IsQuorumThresholdRegisteredQueryAsync(IsQuorumThresholdRegisteredFunction isQuorumThresholdRegisteredFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsQuorumThresholdRegisteredFunction, bool>(isQuorumThresholdRegisteredFunction, blockParameter);
        }

        
        public virtual Task<bool> IsQuorumThresholdRegisteredQueryAsync(QuorumThreshold quorumThreshold, BlockParameter blockParameter = null)
        {
            var isQuorumThresholdRegisteredFunction = new IsQuorumThresholdRegisteredFunction();
                isQuorumThresholdRegisteredFunction.QuorumThreshold = quorumThreshold;
            
            return ContractHandler.QueryAsync<IsQuorumThresholdRegisteredFunction, bool>(isQuorumThresholdRegisteredFunction, blockParameter);
        }

        public Task<bool> IsQuorumThresholdRegisteredAtQueryAsync(IsQuorumThresholdRegisteredAtFunction isQuorumThresholdRegisteredAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsQuorumThresholdRegisteredAtFunction, bool>(isQuorumThresholdRegisteredAtFunction, blockParameter);
        }

        
        public virtual Task<bool> IsQuorumThresholdRegisteredAtQueryAsync(QuorumThreshold quorumThreshold, ulong timestamp, BlockParameter blockParameter = null)
        {
            var isQuorumThresholdRegisteredAtFunction = new IsQuorumThresholdRegisteredAtFunction();
                isQuorumThresholdRegisteredAtFunction.QuorumThreshold = quorumThreshold;
                isQuorumThresholdRegisteredAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<IsQuorumThresholdRegisteredAtFunction, bool>(isQuorumThresholdRegisteredAtFunction, blockParameter);
        }

        public Task<bool> IsSettlementRegisteredQueryAsync(IsSettlementRegisteredFunction isSettlementRegisteredFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsSettlementRegisteredFunction, bool>(isSettlementRegisteredFunction, blockParameter);
        }

        
        public virtual Task<bool> IsSettlementRegisteredQueryAsync(CrossChainAddress settlement, BlockParameter blockParameter = null)
        {
            var isSettlementRegisteredFunction = new IsSettlementRegisteredFunction();
                isSettlementRegisteredFunction.Settlement = settlement;
            
            return ContractHandler.QueryAsync<IsSettlementRegisteredFunction, bool>(isSettlementRegisteredFunction, blockParameter);
        }

        public Task<bool> IsSettlementRegisteredAtQueryAsync(IsSettlementRegisteredAtFunction isSettlementRegisteredAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsSettlementRegisteredAtFunction, bool>(isSettlementRegisteredAtFunction, blockParameter);
        }

        
        public virtual Task<bool> IsSettlementRegisteredAtQueryAsync(CrossChainAddress settlement, ulong timestamp, BlockParameter blockParameter = null)
        {
            var isSettlementRegisteredAtFunction = new IsSettlementRegisteredAtFunction();
                isSettlementRegisteredAtFunction.Settlement = settlement;
                isSettlementRegisteredAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<IsSettlementRegisteredAtFunction, bool>(isSettlementRegisteredAtFunction, blockParameter);
        }

        public Task<bool> IsVotingPowerProviderRegisteredQueryAsync(IsVotingPowerProviderRegisteredFunction isVotingPowerProviderRegisteredFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsVotingPowerProviderRegisteredFunction, bool>(isVotingPowerProviderRegisteredFunction, blockParameter);
        }

        
        public virtual Task<bool> IsVotingPowerProviderRegisteredQueryAsync(CrossChainAddress votingPowerProvider, BlockParameter blockParameter = null)
        {
            var isVotingPowerProviderRegisteredFunction = new IsVotingPowerProviderRegisteredFunction();
                isVotingPowerProviderRegisteredFunction.VotingPowerProvider = votingPowerProvider;
            
            return ContractHandler.QueryAsync<IsVotingPowerProviderRegisteredFunction, bool>(isVotingPowerProviderRegisteredFunction, blockParameter);
        }

        public Task<bool> IsVotingPowerProviderRegisteredAtQueryAsync(IsVotingPowerProviderRegisteredAtFunction isVotingPowerProviderRegisteredAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsVotingPowerProviderRegisteredAtFunction, bool>(isVotingPowerProviderRegisteredAtFunction, blockParameter);
        }

        
        public virtual Task<bool> IsVotingPowerProviderRegisteredAtQueryAsync(CrossChainAddress votingPowerProvider, ulong timestamp, BlockParameter blockParameter = null)
        {
            var isVotingPowerProviderRegisteredAtFunction = new IsVotingPowerProviderRegisteredAtFunction();
                isVotingPowerProviderRegisteredAtFunction.VotingPowerProvider = votingPowerProvider;
                isVotingPowerProviderRegisteredAtFunction.Timestamp = timestamp;
            
            return ContractHandler.QueryAsync<IsVotingPowerProviderRegisteredAtFunction, bool>(isVotingPowerProviderRegisteredAtFunction, blockParameter);
        }

        public virtual Task<string> RemoveQuorumThresholdRequestAsync(RemoveQuorumThresholdFunction removeQuorumThresholdFunction)
        {
             return ContractHandler.SendRequestAsync(removeQuorumThresholdFunction);
        }

        public virtual Task<TransactionReceipt> RemoveQuorumThresholdRequestAndWaitForReceiptAsync(RemoveQuorumThresholdFunction removeQuorumThresholdFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(removeQuorumThresholdFunction, cancellationToken);
        }

        public virtual Task<string> RemoveQuorumThresholdRequestAsync(QuorumThreshold quorumThreshold)
        {
            var removeQuorumThresholdFunction = new RemoveQuorumThresholdFunction();
                removeQuorumThresholdFunction.QuorumThreshold = quorumThreshold;
            
             return ContractHandler.SendRequestAsync(removeQuorumThresholdFunction);
        }

        public virtual Task<TransactionReceipt> RemoveQuorumThresholdRequestAndWaitForReceiptAsync(QuorumThreshold quorumThreshold, CancellationTokenSource cancellationToken = null)
        {
            var removeQuorumThresholdFunction = new RemoveQuorumThresholdFunction();
                removeQuorumThresholdFunction.QuorumThreshold = quorumThreshold;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(removeQuorumThresholdFunction, cancellationToken);
        }

        public virtual Task<string> RemoveSettlementRequestAsync(RemoveSettlementFunction removeSettlementFunction)
        {
             return ContractHandler.SendRequestAsync(removeSettlementFunction);
        }

        public virtual Task<TransactionReceipt> RemoveSettlementRequestAndWaitForReceiptAsync(RemoveSettlementFunction removeSettlementFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(removeSettlementFunction, cancellationToken);
        }

        public virtual Task<string> RemoveSettlementRequestAsync(CrossChainAddress settlement)
        {
            var removeSettlementFunction = new RemoveSettlementFunction();
                removeSettlementFunction.Settlement = settlement;
            
             return ContractHandler.SendRequestAsync(removeSettlementFunction);
        }

        public virtual Task<TransactionReceipt> RemoveSettlementRequestAndWaitForReceiptAsync(CrossChainAddress settlement, CancellationTokenSource cancellationToken = null)
        {
            var removeSettlementFunction = new RemoveSettlementFunction();
                removeSettlementFunction.Settlement = settlement;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(removeSettlementFunction, cancellationToken);
        }

        public virtual Task<string> RemoveVotingPowerProviderRequestAsync(RemoveVotingPowerProviderFunction removeVotingPowerProviderFunction)
        {
             return ContractHandler.SendRequestAsync(removeVotingPowerProviderFunction);
        }

        public virtual Task<TransactionReceipt> RemoveVotingPowerProviderRequestAndWaitForReceiptAsync(RemoveVotingPowerProviderFunction removeVotingPowerProviderFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(removeVotingPowerProviderFunction, cancellationToken);
        }

        public virtual Task<string> RemoveVotingPowerProviderRequestAsync(CrossChainAddress votingPowerProvider)
        {
            var removeVotingPowerProviderFunction = new RemoveVotingPowerProviderFunction();
                removeVotingPowerProviderFunction.VotingPowerProvider = votingPowerProvider;
            
             return ContractHandler.SendRequestAsync(removeVotingPowerProviderFunction);
        }

        public virtual Task<TransactionReceipt> RemoveVotingPowerProviderRequestAndWaitForReceiptAsync(CrossChainAddress votingPowerProvider, CancellationTokenSource cancellationToken = null)
        {
            var removeVotingPowerProviderFunction = new RemoveVotingPowerProviderFunction();
                removeVotingPowerProviderFunction.VotingPowerProvider = votingPowerProvider;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(removeVotingPowerProviderFunction, cancellationToken);
        }

        public virtual Task<string> SetCommitterSlotDurationRequestAsync(SetCommitterSlotDurationFunction setCommitterSlotDurationFunction)
        {
             return ContractHandler.SendRequestAsync(setCommitterSlotDurationFunction);
        }

        public virtual Task<TransactionReceipt> SetCommitterSlotDurationRequestAndWaitForReceiptAsync(SetCommitterSlotDurationFunction setCommitterSlotDurationFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setCommitterSlotDurationFunction, cancellationToken);
        }

        public virtual Task<string> SetCommitterSlotDurationRequestAsync(ulong slotDuration)
        {
            var setCommitterSlotDurationFunction = new SetCommitterSlotDurationFunction();
                setCommitterSlotDurationFunction.SlotDuration = slotDuration;
            
             return ContractHandler.SendRequestAsync(setCommitterSlotDurationFunction);
        }

        public virtual Task<TransactionReceipt> SetCommitterSlotDurationRequestAndWaitForReceiptAsync(ulong slotDuration, CancellationTokenSource cancellationToken = null)
        {
            var setCommitterSlotDurationFunction = new SetCommitterSlotDurationFunction();
                setCommitterSlotDurationFunction.SlotDuration = slotDuration;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setCommitterSlotDurationFunction, cancellationToken);
        }

        public virtual Task<string> SetKeysProviderRequestAsync(SetKeysProviderFunction setKeysProviderFunction)
        {
             return ContractHandler.SendRequestAsync(setKeysProviderFunction);
        }

        public virtual Task<TransactionReceipt> SetKeysProviderRequestAndWaitForReceiptAsync(SetKeysProviderFunction setKeysProviderFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setKeysProviderFunction, cancellationToken);
        }

        public virtual Task<string> SetKeysProviderRequestAsync(CrossChainAddress keysProvider)
        {
            var setKeysProviderFunction = new SetKeysProviderFunction();
                setKeysProviderFunction.KeysProvider = keysProvider;
            
             return ContractHandler.SendRequestAsync(setKeysProviderFunction);
        }

        public virtual Task<TransactionReceipt> SetKeysProviderRequestAndWaitForReceiptAsync(CrossChainAddress keysProvider, CancellationTokenSource cancellationToken = null)
        {
            var setKeysProviderFunction = new SetKeysProviderFunction();
                setKeysProviderFunction.KeysProvider = keysProvider;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setKeysProviderFunction, cancellationToken);
        }

        public virtual Task<string> SetMaxValidatorsCountRequestAsync(SetMaxValidatorsCountFunction setMaxValidatorsCountFunction)
        {
             return ContractHandler.SendRequestAsync(setMaxValidatorsCountFunction);
        }

        public virtual Task<TransactionReceipt> SetMaxValidatorsCountRequestAndWaitForReceiptAsync(SetMaxValidatorsCountFunction setMaxValidatorsCountFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setMaxValidatorsCountFunction, cancellationToken);
        }

        public virtual Task<string> SetMaxValidatorsCountRequestAsync(BigInteger maxValidatorsCount)
        {
            var setMaxValidatorsCountFunction = new SetMaxValidatorsCountFunction();
                setMaxValidatorsCountFunction.MaxValidatorsCount = maxValidatorsCount;
            
             return ContractHandler.SendRequestAsync(setMaxValidatorsCountFunction);
        }

        public virtual Task<TransactionReceipt> SetMaxValidatorsCountRequestAndWaitForReceiptAsync(BigInteger maxValidatorsCount, CancellationTokenSource cancellationToken = null)
        {
            var setMaxValidatorsCountFunction = new SetMaxValidatorsCountFunction();
                setMaxValidatorsCountFunction.MaxValidatorsCount = maxValidatorsCount;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setMaxValidatorsCountFunction, cancellationToken);
        }

        public virtual Task<string> SetMaxVotingPowerRequestAsync(SetMaxVotingPowerFunction setMaxVotingPowerFunction)
        {
             return ContractHandler.SendRequestAsync(setMaxVotingPowerFunction);
        }

        public virtual Task<TransactionReceipt> SetMaxVotingPowerRequestAndWaitForReceiptAsync(SetMaxVotingPowerFunction setMaxVotingPowerFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setMaxVotingPowerFunction, cancellationToken);
        }

        public virtual Task<string> SetMaxVotingPowerRequestAsync(BigInteger maxVotingPower)
        {
            var setMaxVotingPowerFunction = new SetMaxVotingPowerFunction();
                setMaxVotingPowerFunction.MaxVotingPower = maxVotingPower;
            
             return ContractHandler.SendRequestAsync(setMaxVotingPowerFunction);
        }

        public virtual Task<TransactionReceipt> SetMaxVotingPowerRequestAndWaitForReceiptAsync(BigInteger maxVotingPower, CancellationTokenSource cancellationToken = null)
        {
            var setMaxVotingPowerFunction = new SetMaxVotingPowerFunction();
                setMaxVotingPowerFunction.MaxVotingPower = maxVotingPower;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setMaxVotingPowerFunction, cancellationToken);
        }

        public virtual Task<string> SetMinInclusionVotingPowerRequestAsync(SetMinInclusionVotingPowerFunction setMinInclusionVotingPowerFunction)
        {
             return ContractHandler.SendRequestAsync(setMinInclusionVotingPowerFunction);
        }

        public virtual Task<TransactionReceipt> SetMinInclusionVotingPowerRequestAndWaitForReceiptAsync(SetMinInclusionVotingPowerFunction setMinInclusionVotingPowerFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setMinInclusionVotingPowerFunction, cancellationToken);
        }

        public virtual Task<string> SetMinInclusionVotingPowerRequestAsync(BigInteger minInclusionVotingPower)
        {
            var setMinInclusionVotingPowerFunction = new SetMinInclusionVotingPowerFunction();
                setMinInclusionVotingPowerFunction.MinInclusionVotingPower = minInclusionVotingPower;
            
             return ContractHandler.SendRequestAsync(setMinInclusionVotingPowerFunction);
        }

        public virtual Task<TransactionReceipt> SetMinInclusionVotingPowerRequestAndWaitForReceiptAsync(BigInteger minInclusionVotingPower, CancellationTokenSource cancellationToken = null)
        {
            var setMinInclusionVotingPowerFunction = new SetMinInclusionVotingPowerFunction();
                setMinInclusionVotingPowerFunction.MinInclusionVotingPower = minInclusionVotingPower;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setMinInclusionVotingPowerFunction, cancellationToken);
        }

        public virtual Task<string> SetNumAggregatorsRequestAsync(SetNumAggregatorsFunction setNumAggregatorsFunction)
        {
             return ContractHandler.SendRequestAsync(setNumAggregatorsFunction);
        }

        public virtual Task<TransactionReceipt> SetNumAggregatorsRequestAndWaitForReceiptAsync(SetNumAggregatorsFunction setNumAggregatorsFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setNumAggregatorsFunction, cancellationToken);
        }

        public virtual Task<string> SetNumAggregatorsRequestAsync(BigInteger numAggregators)
        {
            var setNumAggregatorsFunction = new SetNumAggregatorsFunction();
                setNumAggregatorsFunction.NumAggregators = numAggregators;
            
             return ContractHandler.SendRequestAsync(setNumAggregatorsFunction);
        }

        public virtual Task<TransactionReceipt> SetNumAggregatorsRequestAndWaitForReceiptAsync(BigInteger numAggregators, CancellationTokenSource cancellationToken = null)
        {
            var setNumAggregatorsFunction = new SetNumAggregatorsFunction();
                setNumAggregatorsFunction.NumAggregators = numAggregators;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setNumAggregatorsFunction, cancellationToken);
        }

        public virtual Task<string> SetNumCommittersRequestAsync(SetNumCommittersFunction setNumCommittersFunction)
        {
             return ContractHandler.SendRequestAsync(setNumCommittersFunction);
        }

        public virtual Task<TransactionReceipt> SetNumCommittersRequestAndWaitForReceiptAsync(SetNumCommittersFunction setNumCommittersFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setNumCommittersFunction, cancellationToken);
        }

        public virtual Task<string> SetNumCommittersRequestAsync(BigInteger numCommitters)
        {
            var setNumCommittersFunction = new SetNumCommittersFunction();
                setNumCommittersFunction.NumCommitters = numCommitters;
            
             return ContractHandler.SendRequestAsync(setNumCommittersFunction);
        }

        public virtual Task<TransactionReceipt> SetNumCommittersRequestAndWaitForReceiptAsync(BigInteger numCommitters, CancellationTokenSource cancellationToken = null)
        {
            var setNumCommittersFunction = new SetNumCommittersFunction();
                setNumCommittersFunction.NumCommitters = numCommitters;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setNumCommittersFunction, cancellationToken);
        }

        public virtual Task<string> SetRequiredHeaderKeyTagRequestAsync(SetRequiredHeaderKeyTagFunction setRequiredHeaderKeyTagFunction)
        {
             return ContractHandler.SendRequestAsync(setRequiredHeaderKeyTagFunction);
        }

        public virtual Task<TransactionReceipt> SetRequiredHeaderKeyTagRequestAndWaitForReceiptAsync(SetRequiredHeaderKeyTagFunction setRequiredHeaderKeyTagFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setRequiredHeaderKeyTagFunction, cancellationToken);
        }

        public virtual Task<string> SetRequiredHeaderKeyTagRequestAsync(byte requiredHeaderKeyTag)
        {
            var setRequiredHeaderKeyTagFunction = new SetRequiredHeaderKeyTagFunction();
                setRequiredHeaderKeyTagFunction.RequiredHeaderKeyTag = requiredHeaderKeyTag;
            
             return ContractHandler.SendRequestAsync(setRequiredHeaderKeyTagFunction);
        }

        public virtual Task<TransactionReceipt> SetRequiredHeaderKeyTagRequestAndWaitForReceiptAsync(byte requiredHeaderKeyTag, CancellationTokenSource cancellationToken = null)
        {
            var setRequiredHeaderKeyTagFunction = new SetRequiredHeaderKeyTagFunction();
                setRequiredHeaderKeyTagFunction.RequiredHeaderKeyTag = requiredHeaderKeyTag;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setRequiredHeaderKeyTagFunction, cancellationToken);
        }

        public virtual Task<string> SetRequiredKeyTagsRequestAsync(SetRequiredKeyTagsFunction setRequiredKeyTagsFunction)
        {
             return ContractHandler.SendRequestAsync(setRequiredKeyTagsFunction);
        }

        public virtual Task<TransactionReceipt> SetRequiredKeyTagsRequestAndWaitForReceiptAsync(SetRequiredKeyTagsFunction setRequiredKeyTagsFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setRequiredKeyTagsFunction, cancellationToken);
        }

        public virtual Task<string> SetRequiredKeyTagsRequestAsync(List<byte> requiredKeyTags)
        {
            var setRequiredKeyTagsFunction = new SetRequiredKeyTagsFunction();
                setRequiredKeyTagsFunction.RequiredKeyTags = requiredKeyTags;
            
             return ContractHandler.SendRequestAsync(setRequiredKeyTagsFunction);
        }

        public virtual Task<TransactionReceipt> SetRequiredKeyTagsRequestAndWaitForReceiptAsync(List<byte> requiredKeyTags, CancellationTokenSource cancellationToken = null)
        {
            var setRequiredKeyTagsFunction = new SetRequiredKeyTagsFunction();
                setRequiredKeyTagsFunction.RequiredKeyTags = requiredKeyTags;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setRequiredKeyTagsFunction, cancellationToken);
        }

        public virtual Task<string> SetVerificationTypeRequestAsync(SetVerificationTypeFunction setVerificationTypeFunction)
        {
             return ContractHandler.SendRequestAsync(setVerificationTypeFunction);
        }

        public virtual Task<TransactionReceipt> SetVerificationTypeRequestAndWaitForReceiptAsync(SetVerificationTypeFunction setVerificationTypeFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setVerificationTypeFunction, cancellationToken);
        }

        public virtual Task<string> SetVerificationTypeRequestAsync(uint verificationType)
        {
            var setVerificationTypeFunction = new SetVerificationTypeFunction();
                setVerificationTypeFunction.VerificationType = verificationType;
            
             return ContractHandler.SendRequestAsync(setVerificationTypeFunction);
        }

        public virtual Task<TransactionReceipt> SetVerificationTypeRequestAndWaitForReceiptAsync(uint verificationType, CancellationTokenSource cancellationToken = null)
        {
            var setVerificationTypeFunction = new SetVerificationTypeFunction();
                setVerificationTypeFunction.VerificationType = verificationType;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setVerificationTypeFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(MaxQuorumThresholdFunction),
                typeof(AddQuorumThresholdFunction),
                typeof(AddSettlementFunction),
                typeof(AddVotingPowerProviderFunction),
                typeof(GetCommitterSlotDurationFunction),
                typeof(GetCommitterSlotDurationAtFunction),
                typeof(GetConfigFunction),
                typeof(GetConfigAtFunction),
                typeof(GetKeysProviderFunction),
                typeof(GetKeysProviderAtFunction),
                typeof(GetMaxValidatorsCountFunction),
                typeof(GetMaxValidatorsCountAtFunction),
                typeof(GetMaxVotingPowerFunction),
                typeof(GetMaxVotingPowerAtFunction),
                typeof(GetMinInclusionVotingPowerFunction),
                typeof(GetMinInclusionVotingPowerAtFunction),
                typeof(GetNumAggregatorsFunction),
                typeof(GetNumAggregatorsAtFunction),
                typeof(GetNumCommittersFunction),
                typeof(GetNumCommittersAtFunction),
                typeof(GetQuorumThresholdsFunction),
                typeof(GetQuorumThresholdsAtFunction),
                typeof(GetRequiredHeaderKeyTagFunction),
                typeof(GetRequiredHeaderKeyTagAtFunction),
                typeof(GetRequiredKeyTagsFunction),
                typeof(GetRequiredKeyTagsAtFunction),
                typeof(GetSettlementsFunction),
                typeof(GetSettlementsAtFunction),
                typeof(GetVerificationTypeFunction),
                typeof(GetVerificationTypeAtFunction),
                typeof(GetVotingPowerProvidersFunction),
                typeof(GetVotingPowerProvidersAtFunction),
                typeof(IsQuorumThresholdRegisteredFunction),
                typeof(IsQuorumThresholdRegisteredAtFunction),
                typeof(IsSettlementRegisteredFunction),
                typeof(IsSettlementRegisteredAtFunction),
                typeof(IsVotingPowerProviderRegisteredFunction),
                typeof(IsVotingPowerProviderRegisteredAtFunction),
                typeof(RemoveQuorumThresholdFunction),
                typeof(RemoveSettlementFunction),
                typeof(RemoveVotingPowerProviderFunction),
                typeof(SetCommitterSlotDurationFunction),
                typeof(SetKeysProviderFunction),
                typeof(SetMaxValidatorsCountFunction),
                typeof(SetMaxVotingPowerFunction),
                typeof(SetMinInclusionVotingPowerFunction),
                typeof(SetNumAggregatorsFunction),
                typeof(SetNumCommittersFunction),
                typeof(SetRequiredHeaderKeyTagFunction),
                typeof(SetRequiredKeyTagsFunction),
                typeof(SetVerificationTypeFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(AddQuorumThresholdEventDTO),
                typeof(AddSettlementEventDTO),
                typeof(AddVotingPowerProviderEventDTO),
                typeof(RemoveQuorumThresholdEventDTO),
                typeof(RemoveSettlementEventDTO),
                typeof(RemoveVotingPowerProviderEventDTO),
                typeof(SetCommitterSlotDurationEventDTO),
                typeof(SetKeysProviderEventDTO),
                typeof(SetMaxValidatorsCountEventDTO),
                typeof(SetMaxVotingPowerEventDTO),
                typeof(SetMinInclusionVotingPowerEventDTO),
                typeof(SetNumAggregatorsEventDTO),
                typeof(SetNumCommittersEventDTO),
                typeof(SetRequiredHeaderKeyTagEventDTO),
                typeof(SetRequiredKeyTagsEventDTO),
                typeof(SetVerificationTypeEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(ValsetdriverChainalreadyaddedError),
                typeof(ValsetdriverInvalidcrosschainaddressError),
                typeof(ValsetdriverInvalidmaxvalidatorscountError),
                typeof(ValsetdriverInvalidquorumthresholdError),
                typeof(ValsetdriverKeytagalreadyaddedError),
                typeof(ValsetdriverNotaddedError),
                typeof(ValsetdriverZerocommitterslotdurationError),
                typeof(ValsetdriverZeronumaggregatorsError),
                typeof(ValsetdriverZeronumcommittersError)
            };
        }
    }
}
