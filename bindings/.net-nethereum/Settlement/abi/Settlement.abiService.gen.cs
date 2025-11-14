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
using Symbiotic.Relay.Settlement.abi.ContractDefinition;

namespace Symbiotic.Relay.Settlement.abi
{
    public partial class Settlement.abiService: Settlement.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, Settlement.abiDeployment settlement.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<Settlement.abiDeployment>().SendRequestAndWaitForReceiptAsync(settlement.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, Settlement.abiDeployment settlement.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<Settlement.abiDeployment>().SendRequestAsync(settlement.abiDeployment);
        }

        public static async Task<Settlement.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, Settlement.abiDeployment settlement.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, settlement.abiDeployment, cancellationTokenSource);
            return new Settlement.abiService(web3, receipt.ContractAddress);
        }

        public Settlement.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class Settlement.abiServiceBase: ContractWeb3ServiceBase
    {

        public Settlement.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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

        public Task<byte> ValidatorSetVersionQueryAsync(ValidatorSetVersionFunction validatorSetVersionFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<ValidatorSetVersionFunction, byte>(validatorSetVersionFunction, blockParameter);
        }

        
        public virtual Task<byte> ValidatorSetVersionQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<ValidatorSetVersionFunction, byte>(null, blockParameter);
        }

        public virtual Task<string> CommitValSetHeaderRequestAsync(CommitValSetHeaderFunction commitValSetHeaderFunction)
        {
             return ContractHandler.SendRequestAsync(commitValSetHeaderFunction);
        }

        public virtual Task<TransactionReceipt> CommitValSetHeaderRequestAndWaitForReceiptAsync(CommitValSetHeaderFunction commitValSetHeaderFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(commitValSetHeaderFunction, cancellationToken);
        }

        public virtual Task<string> CommitValSetHeaderRequestAsync(ValSetHeader header, List<ExtraData> extraData, byte[] proof)
        {
            var commitValSetHeaderFunction = new CommitValSetHeaderFunction();
                commitValSetHeaderFunction.Header = header;
                commitValSetHeaderFunction.ExtraData = extraData;
                commitValSetHeaderFunction.Proof = proof;
            
             return ContractHandler.SendRequestAsync(commitValSetHeaderFunction);
        }

        public virtual Task<TransactionReceipt> CommitValSetHeaderRequestAndWaitForReceiptAsync(ValSetHeader header, List<ExtraData> extraData, byte[] proof, CancellationTokenSource cancellationToken = null)
        {
            var commitValSetHeaderFunction = new CommitValSetHeaderFunction();
                commitValSetHeaderFunction.Header = header;
                commitValSetHeaderFunction.ExtraData = extraData;
                commitValSetHeaderFunction.Proof = proof;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(commitValSetHeaderFunction, cancellationToken);
        }

        public virtual Task<Eip712DomainOutputDTO> Eip712DomainQueryAsync(Eip712DomainFunction eip712DomainFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<Eip712DomainFunction, Eip712DomainOutputDTO>(eip712DomainFunction, blockParameter);
        }

        public virtual Task<Eip712DomainOutputDTO> Eip712DomainQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<Eip712DomainFunction, Eip712DomainOutputDTO>(null, blockParameter);
        }

        public Task<ulong> GetCaptureTimestampFromValSetHeaderQueryAsync(GetCaptureTimestampFromValSetHeaderFunction getCaptureTimestampFromValSetHeaderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCaptureTimestampFromValSetHeaderFunction, ulong>(getCaptureTimestampFromValSetHeaderFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetCaptureTimestampFromValSetHeaderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCaptureTimestampFromValSetHeaderFunction, ulong>(null, blockParameter);
        }

        public Task<ulong> GetCaptureTimestampFromValSetHeaderAtQueryAsync(GetCaptureTimestampFromValSetHeaderAtFunction getCaptureTimestampFromValSetHeaderAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetCaptureTimestampFromValSetHeaderAtFunction, ulong>(getCaptureTimestampFromValSetHeaderAtFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetCaptureTimestampFromValSetHeaderAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getCaptureTimestampFromValSetHeaderAtFunction = new GetCaptureTimestampFromValSetHeaderAtFunction();
                getCaptureTimestampFromValSetHeaderAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetCaptureTimestampFromValSetHeaderAtFunction, ulong>(getCaptureTimestampFromValSetHeaderAtFunction, blockParameter);
        }

        public Task<byte[]> GetExtraDataQueryAsync(GetExtraDataFunction getExtraDataFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetExtraDataFunction, byte[]>(getExtraDataFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetExtraDataQueryAsync(byte[] key, BlockParameter blockParameter = null)
        {
            var getExtraDataFunction = new GetExtraDataFunction();
                getExtraDataFunction.Key = key;
            
            return ContractHandler.QueryAsync<GetExtraDataFunction, byte[]>(getExtraDataFunction, blockParameter);
        }

        public Task<byte[]> GetExtraDataAtQueryAsync(GetExtraDataAtFunction getExtraDataAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetExtraDataAtFunction, byte[]>(getExtraDataAtFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetExtraDataAtQueryAsync(ulong epoch, byte[] key, BlockParameter blockParameter = null)
        {
            var getExtraDataAtFunction = new GetExtraDataAtFunction();
                getExtraDataAtFunction.Epoch = epoch;
                getExtraDataAtFunction.Key = key;
            
            return ContractHandler.QueryAsync<GetExtraDataAtFunction, byte[]>(getExtraDataAtFunction, blockParameter);
        }

        public Task<ulong> GetLastCommittedHeaderEpochQueryAsync(GetLastCommittedHeaderEpochFunction getLastCommittedHeaderEpochFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetLastCommittedHeaderEpochFunction, ulong>(getLastCommittedHeaderEpochFunction, blockParameter);
        }

        
        public virtual Task<ulong> GetLastCommittedHeaderEpochQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetLastCommittedHeaderEpochFunction, ulong>(null, blockParameter);
        }

        public Task<BigInteger> GetQuorumThresholdFromValSetHeaderQueryAsync(GetQuorumThresholdFromValSetHeaderFunction getQuorumThresholdFromValSetHeaderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetQuorumThresholdFromValSetHeaderFunction, BigInteger>(getQuorumThresholdFromValSetHeaderFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetQuorumThresholdFromValSetHeaderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetQuorumThresholdFromValSetHeaderFunction, BigInteger>(null, blockParameter);
        }

        public Task<BigInteger> GetQuorumThresholdFromValSetHeaderAtQueryAsync(GetQuorumThresholdFromValSetHeaderAtFunction getQuorumThresholdFromValSetHeaderAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetQuorumThresholdFromValSetHeaderAtFunction, BigInteger>(getQuorumThresholdFromValSetHeaderAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetQuorumThresholdFromValSetHeaderAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getQuorumThresholdFromValSetHeaderAtFunction = new GetQuorumThresholdFromValSetHeaderAtFunction();
                getQuorumThresholdFromValSetHeaderAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetQuorumThresholdFromValSetHeaderAtFunction, BigInteger>(getQuorumThresholdFromValSetHeaderAtFunction, blockParameter);
        }

        public Task<byte> GetRequiredKeyTagFromValSetHeaderQueryAsync(GetRequiredKeyTagFromValSetHeaderFunction getRequiredKeyTagFromValSetHeaderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredKeyTagFromValSetHeaderFunction, byte>(getRequiredKeyTagFromValSetHeaderFunction, blockParameter);
        }

        
        public virtual Task<byte> GetRequiredKeyTagFromValSetHeaderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredKeyTagFromValSetHeaderFunction, byte>(null, blockParameter);
        }

        public Task<byte> GetRequiredKeyTagFromValSetHeaderAtQueryAsync(GetRequiredKeyTagFromValSetHeaderAtFunction getRequiredKeyTagFromValSetHeaderAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRequiredKeyTagFromValSetHeaderAtFunction, byte>(getRequiredKeyTagFromValSetHeaderAtFunction, blockParameter);
        }

        
        public virtual Task<byte> GetRequiredKeyTagFromValSetHeaderAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getRequiredKeyTagFromValSetHeaderAtFunction = new GetRequiredKeyTagFromValSetHeaderAtFunction();
                getRequiredKeyTagFromValSetHeaderAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetRequiredKeyTagFromValSetHeaderAtFunction, byte>(getRequiredKeyTagFromValSetHeaderAtFunction, blockParameter);
        }

        public Task<string> GetSigVerifierQueryAsync(GetSigVerifierFunction getSigVerifierFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetSigVerifierFunction, string>(getSigVerifierFunction, blockParameter);
        }

        
        public virtual Task<string> GetSigVerifierQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetSigVerifierFunction, string>(null, blockParameter);
        }

        public Task<string> GetSigVerifierAtQueryAsync(GetSigVerifierAtFunction getSigVerifierAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetSigVerifierAtFunction, string>(getSigVerifierAtFunction, blockParameter);
        }

        
        public virtual Task<string> GetSigVerifierAtQueryAsync(ulong epoch, byte[] hint, BlockParameter blockParameter = null)
        {
            var getSigVerifierAtFunction = new GetSigVerifierAtFunction();
                getSigVerifierAtFunction.Epoch = epoch;
                getSigVerifierAtFunction.Hint = hint;
            
            return ContractHandler.QueryAsync<GetSigVerifierAtFunction, string>(getSigVerifierAtFunction, blockParameter);
        }

        public Task<BigInteger> GetTotalVotingPowerFromValSetHeaderQueryAsync(GetTotalVotingPowerFromValSetHeaderFunction getTotalVotingPowerFromValSetHeaderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTotalVotingPowerFromValSetHeaderFunction, BigInteger>(getTotalVotingPowerFromValSetHeaderFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetTotalVotingPowerFromValSetHeaderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTotalVotingPowerFromValSetHeaderFunction, BigInteger>(null, blockParameter);
        }

        public Task<BigInteger> GetTotalVotingPowerFromValSetHeaderAtQueryAsync(GetTotalVotingPowerFromValSetHeaderAtFunction getTotalVotingPowerFromValSetHeaderAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetTotalVotingPowerFromValSetHeaderAtFunction, BigInteger>(getTotalVotingPowerFromValSetHeaderAtFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> GetTotalVotingPowerFromValSetHeaderAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getTotalVotingPowerFromValSetHeaderAtFunction = new GetTotalVotingPowerFromValSetHeaderAtFunction();
                getTotalVotingPowerFromValSetHeaderAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetTotalVotingPowerFromValSetHeaderAtFunction, BigInteger>(getTotalVotingPowerFromValSetHeaderAtFunction, blockParameter);
        }

        public virtual Task<GetValSetHeaderOutputDTO> GetValSetHeaderQueryAsync(GetValSetHeaderFunction getValSetHeaderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetValSetHeaderFunction, GetValSetHeaderOutputDTO>(getValSetHeaderFunction, blockParameter);
        }

        public virtual Task<GetValSetHeaderOutputDTO> GetValSetHeaderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetValSetHeaderFunction, GetValSetHeaderOutputDTO>(null, blockParameter);
        }

        public virtual Task<GetValSetHeaderAtOutputDTO> GetValSetHeaderAtQueryAsync(GetValSetHeaderAtFunction getValSetHeaderAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetValSetHeaderAtFunction, GetValSetHeaderAtOutputDTO>(getValSetHeaderAtFunction, blockParameter);
        }

        public virtual Task<GetValSetHeaderAtOutputDTO> GetValSetHeaderAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getValSetHeaderAtFunction = new GetValSetHeaderAtFunction();
                getValSetHeaderAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryDeserializingToObjectAsync<GetValSetHeaderAtFunction, GetValSetHeaderAtOutputDTO>(getValSetHeaderAtFunction, blockParameter);
        }

        public Task<byte[]> GetValSetHeaderHashQueryAsync(GetValSetHeaderHashFunction getValSetHeaderHashFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetValSetHeaderHashFunction, byte[]>(getValSetHeaderHashFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetValSetHeaderHashQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetValSetHeaderHashFunction, byte[]>(null, blockParameter);
        }

        public Task<byte[]> GetValSetHeaderHashAtQueryAsync(GetValSetHeaderHashAtFunction getValSetHeaderHashAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetValSetHeaderHashAtFunction, byte[]>(getValSetHeaderHashAtFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetValSetHeaderHashAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getValSetHeaderHashAtFunction = new GetValSetHeaderHashAtFunction();
                getValSetHeaderHashAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetValSetHeaderHashAtFunction, byte[]>(getValSetHeaderHashAtFunction, blockParameter);
        }

        public Task<byte[]> GetValidatorsSszMRootFromValSetHeaderQueryAsync(GetValidatorsSszMRootFromValSetHeaderFunction getValidatorsSszMRootFromValSetHeaderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetValidatorsSszMRootFromValSetHeaderFunction, byte[]>(getValidatorsSszMRootFromValSetHeaderFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetValidatorsSszMRootFromValSetHeaderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetValidatorsSszMRootFromValSetHeaderFunction, byte[]>(null, blockParameter);
        }

        public Task<byte[]> GetValidatorsSszMRootFromValSetHeaderAtQueryAsync(GetValidatorsSszMRootFromValSetHeaderAtFunction getValidatorsSszMRootFromValSetHeaderAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetValidatorsSszMRootFromValSetHeaderAtFunction, byte[]>(getValidatorsSszMRootFromValSetHeaderAtFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetValidatorsSszMRootFromValSetHeaderAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getValidatorsSszMRootFromValSetHeaderAtFunction = new GetValidatorsSszMRootFromValSetHeaderAtFunction();
                getValidatorsSszMRootFromValSetHeaderAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetValidatorsSszMRootFromValSetHeaderAtFunction, byte[]>(getValidatorsSszMRootFromValSetHeaderAtFunction, blockParameter);
        }

        public Task<byte> GetVersionFromValSetHeaderQueryAsync(GetVersionFromValSetHeaderFunction getVersionFromValSetHeaderFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetVersionFromValSetHeaderFunction, byte>(getVersionFromValSetHeaderFunction, blockParameter);
        }

        
        public virtual Task<byte> GetVersionFromValSetHeaderQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetVersionFromValSetHeaderFunction, byte>(null, blockParameter);
        }

        public Task<byte> GetVersionFromValSetHeaderAtQueryAsync(GetVersionFromValSetHeaderAtFunction getVersionFromValSetHeaderAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetVersionFromValSetHeaderAtFunction, byte>(getVersionFromValSetHeaderAtFunction, blockParameter);
        }

        
        public virtual Task<byte> GetVersionFromValSetHeaderAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var getVersionFromValSetHeaderAtFunction = new GetVersionFromValSetHeaderAtFunction();
                getVersionFromValSetHeaderAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<GetVersionFromValSetHeaderAtFunction, byte>(getVersionFromValSetHeaderAtFunction, blockParameter);
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

        public Task<bool> IsValSetHeaderCommittedAtQueryAsync(IsValSetHeaderCommittedAtFunction isValSetHeaderCommittedAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsValSetHeaderCommittedAtFunction, bool>(isValSetHeaderCommittedAtFunction, blockParameter);
        }

        
        public virtual Task<bool> IsValSetHeaderCommittedAtQueryAsync(ulong epoch, BlockParameter blockParameter = null)
        {
            var isValSetHeaderCommittedAtFunction = new IsValSetHeaderCommittedAtFunction();
                isValSetHeaderCommittedAtFunction.Epoch = epoch;
            
            return ContractHandler.QueryAsync<IsValSetHeaderCommittedAtFunction, bool>(isValSetHeaderCommittedAtFunction, blockParameter);
        }

        public virtual Task<string> SetGenesisRequestAsync(SetGenesisFunction setGenesisFunction)
        {
             return ContractHandler.SendRequestAsync(setGenesisFunction);
        }

        public virtual Task<TransactionReceipt> SetGenesisRequestAndWaitForReceiptAsync(SetGenesisFunction setGenesisFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setGenesisFunction, cancellationToken);
        }

        public virtual Task<string> SetGenesisRequestAsync(ValSetHeader valSetHeader, List<ExtraData> extraData)
        {
            var setGenesisFunction = new SetGenesisFunction();
                setGenesisFunction.ValSetHeader = valSetHeader;
                setGenesisFunction.ExtraData = extraData;
            
             return ContractHandler.SendRequestAsync(setGenesisFunction);
        }

        public virtual Task<TransactionReceipt> SetGenesisRequestAndWaitForReceiptAsync(ValSetHeader valSetHeader, List<ExtraData> extraData, CancellationTokenSource cancellationToken = null)
        {
            var setGenesisFunction = new SetGenesisFunction();
                setGenesisFunction.ValSetHeader = valSetHeader;
                setGenesisFunction.ExtraData = extraData;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setGenesisFunction, cancellationToken);
        }

        public virtual Task<string> SetSigVerifierRequestAsync(SetSigVerifierFunction setSigVerifierFunction)
        {
             return ContractHandler.SendRequestAsync(setSigVerifierFunction);
        }

        public virtual Task<TransactionReceipt> SetSigVerifierRequestAndWaitForReceiptAsync(SetSigVerifierFunction setSigVerifierFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setSigVerifierFunction, cancellationToken);
        }

        public virtual Task<string> SetSigVerifierRequestAsync(string sigVerifier)
        {
            var setSigVerifierFunction = new SetSigVerifierFunction();
                setSigVerifierFunction.SigVerifier = sigVerifier;
            
             return ContractHandler.SendRequestAsync(setSigVerifierFunction);
        }

        public virtual Task<TransactionReceipt> SetSigVerifierRequestAndWaitForReceiptAsync(string sigVerifier, CancellationTokenSource cancellationToken = null)
        {
            var setSigVerifierFunction = new SetSigVerifierFunction();
                setSigVerifierFunction.SigVerifier = sigVerifier;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setSigVerifierFunction, cancellationToken);
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

        public Task<bool> VerifyQuorumSigQueryAsync(VerifyQuorumSigFunction verifyQuorumSigFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerifyQuorumSigFunction, bool>(verifyQuorumSigFunction, blockParameter);
        }

        
        public virtual Task<bool> VerifyQuorumSigQueryAsync(byte[] message, byte keyTag, BigInteger quorumThreshold, byte[] proof, BlockParameter blockParameter = null)
        {
            var verifyQuorumSigFunction = new VerifyQuorumSigFunction();
                verifyQuorumSigFunction.Message = message;
                verifyQuorumSigFunction.KeyTag = keyTag;
                verifyQuorumSigFunction.QuorumThreshold = quorumThreshold;
                verifyQuorumSigFunction.Proof = proof;
            
            return ContractHandler.QueryAsync<VerifyQuorumSigFunction, bool>(verifyQuorumSigFunction, blockParameter);
        }

        public Task<bool> VerifyQuorumSigAtQueryAsync(VerifyQuorumSigAtFunction verifyQuorumSigAtFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerifyQuorumSigAtFunction, bool>(verifyQuorumSigAtFunction, blockParameter);
        }

        
        public virtual Task<bool> VerifyQuorumSigAtQueryAsync(byte[] message, byte keyTag, BigInteger quorumThreshold, byte[] proof, ulong epoch, byte[] hint, BlockParameter blockParameter = null)
        {
            var verifyQuorumSigAtFunction = new VerifyQuorumSigAtFunction();
                verifyQuorumSigAtFunction.Message = message;
                verifyQuorumSigAtFunction.KeyTag = keyTag;
                verifyQuorumSigAtFunction.QuorumThreshold = quorumThreshold;
                verifyQuorumSigAtFunction.Proof = proof;
                verifyQuorumSigAtFunction.Epoch = epoch;
                verifyQuorumSigAtFunction.Hint = hint;
            
            return ContractHandler.QueryAsync<VerifyQuorumSigAtFunction, bool>(verifyQuorumSigAtFunction, blockParameter);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(NetworkFunction),
                typeof(SubnetworkFunction),
                typeof(SubnetworkIdentifierFunction),
                typeof(ValidatorSetVersionFunction),
                typeof(CommitValSetHeaderFunction),
                typeof(Eip712DomainFunction),
                typeof(GetCaptureTimestampFromValSetHeaderFunction),
                typeof(GetCaptureTimestampFromValSetHeaderAtFunction),
                typeof(GetExtraDataFunction),
                typeof(GetExtraDataAtFunction),
                typeof(GetLastCommittedHeaderEpochFunction),
                typeof(GetQuorumThresholdFromValSetHeaderFunction),
                typeof(GetQuorumThresholdFromValSetHeaderAtFunction),
                typeof(GetRequiredKeyTagFromValSetHeaderFunction),
                typeof(GetRequiredKeyTagFromValSetHeaderAtFunction),
                typeof(GetSigVerifierFunction),
                typeof(GetSigVerifierAtFunction),
                typeof(GetTotalVotingPowerFromValSetHeaderFunction),
                typeof(GetTotalVotingPowerFromValSetHeaderAtFunction),
                typeof(GetValSetHeaderFunction),
                typeof(GetValSetHeaderAtFunction),
                typeof(GetValSetHeaderHashFunction),
                typeof(GetValSetHeaderHashAtFunction),
                typeof(GetValidatorsSszMRootFromValSetHeaderFunction),
                typeof(GetValidatorsSszMRootFromValSetHeaderAtFunction),
                typeof(GetVersionFromValSetHeaderFunction),
                typeof(GetVersionFromValSetHeaderAtFunction),
                typeof(HashTypedDataV4Function),
                typeof(HashTypedDataV4CrossChainFunction),
                typeof(IsValSetHeaderCommittedAtFunction),
                typeof(SetGenesisFunction),
                typeof(SetSigVerifierFunction),
                typeof(StaticDelegateCallFunction),
                typeof(VerifyQuorumSigFunction),
                typeof(VerifyQuorumSigAtFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(CommitValSetHeaderEventDTO),
                typeof(EIP712DomainChangedEventDTO),
                typeof(InitEIP712EventDTO),
                typeof(InitSigVerifierEventDTO),
                typeof(InitSubnetworkEventDTO),
                typeof(InitializedEventDTO),
                typeof(SetGenesisEventDTO),
                typeof(SetSigVerifierEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(CheckpointUnorderedInsertionError),
                typeof(InvalidInitializationError),
                typeof(InvalidKeyTagError),
                typeof(NetworkmanagerInvalidnetworkError),
                typeof(NotInitializingError),
                typeof(SettlementDuplicateextradatakeyError),
                typeof(SettlementInvalidcapturetimestampError),
                typeof(SettlementInvalidepochError),
                typeof(SettlementInvalidsigverifierError),
                typeof(SettlementInvalidvalidatorssszmrootError),
                typeof(SettlementInvalidversionError),
                typeof(SettlementQuorumthresholdgttotalvotingpowerError),
                typeof(SettlementValsetheaderalreadycommittedError),
                typeof(SettlementVerificationfailedError)
            };
        }
    }
}
