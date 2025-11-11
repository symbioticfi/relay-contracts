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
using Symbiotic.Relay.SigVerifierBlsBn254Simple.abi.ContractDefinition;

namespace Symbiotic.Relay.SigVerifierBlsBn254Simple.abi
{
    public partial class SigVerifierBlsBn254Simple.abiService: SigVerifierBlsBn254Simple.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, SigVerifierBlsBn254Simple.abiDeployment sigVerifierBlsBn254Simple.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<SigVerifierBlsBn254Simple.abiDeployment>().SendRequestAndWaitForReceiptAsync(sigVerifierBlsBn254Simple.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, SigVerifierBlsBn254Simple.abiDeployment sigVerifierBlsBn254Simple.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<SigVerifierBlsBn254Simple.abiDeployment>().SendRequestAsync(sigVerifierBlsBn254Simple.abiDeployment);
        }

        public static async Task<SigVerifierBlsBn254Simple.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, SigVerifierBlsBn254Simple.abiDeployment sigVerifierBlsBn254Simple.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, sigVerifierBlsBn254Simple.abiDeployment, cancellationTokenSource);
            return new SigVerifierBlsBn254Simple.abiService(web3, receipt.ContractAddress);
        }

        public SigVerifierBlsBn254Simple.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class SigVerifierBlsBn254Simple.abiServiceBase: ContractWeb3ServiceBase
    {

        public SigVerifierBlsBn254Simple.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<byte[]> AggregatedPublicKeyG1HashQueryAsync(AggregatedPublicKeyG1HashFunction aggregatedPublicKeyG1HashFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<AggregatedPublicKeyG1HashFunction, byte[]>(aggregatedPublicKeyG1HashFunction, blockParameter);
        }

        
        public virtual Task<byte[]> AggregatedPublicKeyG1HashQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<AggregatedPublicKeyG1HashFunction, byte[]>(null, blockParameter);
        }

        public Task<BigInteger> MaxValidatorsQueryAsync(MaxValidatorsFunction maxValidatorsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<MaxValidatorsFunction, BigInteger>(maxValidatorsFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> MaxValidatorsQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<MaxValidatorsFunction, BigInteger>(null, blockParameter);
        }

        public Task<byte[]> ValidatorSetHashKeccak256HashQueryAsync(ValidatorSetHashKeccak256HashFunction validatorSetHashKeccak256HashFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<ValidatorSetHashKeccak256HashFunction, byte[]>(validatorSetHashKeccak256HashFunction, blockParameter);
        }

        
        public virtual Task<byte[]> ValidatorSetHashKeccak256HashQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<ValidatorSetHashKeccak256HashFunction, byte[]>(null, blockParameter);
        }

        public Task<uint> VerificationTypeQueryAsync(VerificationTypeFunction verificationTypeFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerificationTypeFunction, uint>(verificationTypeFunction, blockParameter);
        }

        
        public virtual Task<uint> VerificationTypeQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerificationTypeFunction, uint>(null, blockParameter);
        }

        public Task<bool> VerifyQuorumSigQueryAsync(VerifyQuorumSigFunction verifyQuorumSigFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerifyQuorumSigFunction, bool>(verifyQuorumSigFunction, blockParameter);
        }

        
        public virtual Task<bool> VerifyQuorumSigQueryAsync(string settlement, ulong epoch, byte[] message, byte keyTag, BigInteger quorumThreshold, byte[] proof, BlockParameter blockParameter = null)
        {
            var verifyQuorumSigFunction = new VerifyQuorumSigFunction();
                verifyQuorumSigFunction.Settlement = settlement;
                verifyQuorumSigFunction.Epoch = epoch;
                verifyQuorumSigFunction.Message = message;
                verifyQuorumSigFunction.KeyTag = keyTag;
                verifyQuorumSigFunction.QuorumThreshold = quorumThreshold;
                verifyQuorumSigFunction.Proof = proof;
            
            return ContractHandler.QueryAsync<VerifyQuorumSigFunction, bool>(verifyQuorumSigFunction, blockParameter);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(AggregatedPublicKeyG1HashFunction),
                typeof(MaxValidatorsFunction),
                typeof(ValidatorSetHashKeccak256HashFunction),
                typeof(VerificationTypeFunction),
                typeof(VerifyQuorumSigFunction)
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
                typeof(InvalidKeyTagError),
                typeof(Sigverifierblsbn254simpleInvalidmessagelengthError),
                typeof(Sigverifierblsbn254simpleInvalidnonsignerindexError),
                typeof(Sigverifierblsbn254simpleInvalidnonsignersorderError),
                typeof(Sigverifierblsbn254simpleInvalidprooflengthError),
                typeof(Sigverifierblsbn254simpleInvalidproofoffsetError),
                typeof(Sigverifierblsbn254simpleToomanyvalidatorsError),
                typeof(Sigverifierblsbn254simpleUnsupportedkeytagError)
            };
        }
    }
}
