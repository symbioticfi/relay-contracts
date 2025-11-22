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
using Symbiotic.Relay.ISigVerifierBlsBn254ZK.abi.ContractDefinition;

namespace Symbiotic.Relay.ISigVerifierBlsBn254ZK.abi
{
    public partial class ISigVerifierBlsBn254ZK.abiService: ISigVerifierBlsBn254ZK.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, ISigVerifierBlsBn254ZK.abiDeployment iSigVerifierBlsBn254ZK.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<ISigVerifierBlsBn254ZK.abiDeployment>().SendRequestAndWaitForReceiptAsync(iSigVerifierBlsBn254ZK.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, ISigVerifierBlsBn254ZK.abiDeployment iSigVerifierBlsBn254ZK.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<ISigVerifierBlsBn254ZK.abiDeployment>().SendRequestAsync(iSigVerifierBlsBn254ZK.abiDeployment);
        }

        public static async Task<ISigVerifierBlsBn254ZK.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, ISigVerifierBlsBn254ZK.abiDeployment iSigVerifierBlsBn254ZK.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iSigVerifierBlsBn254ZK.abiDeployment, cancellationTokenSource);
            return new ISigVerifierBlsBn254ZK.abiService(web3, receipt.ContractAddress);
        }

        public ISigVerifierBlsBn254ZK.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class ISigVerifierBlsBn254ZK.abiServiceBase: ContractWeb3ServiceBase
    {

        public ISigVerifierBlsBn254ZK.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<byte[]> TotalActiveValidatorsHashQueryAsync(TotalActiveValidatorsHashFunction totalActiveValidatorsHashFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<TotalActiveValidatorsHashFunction, byte[]>(totalActiveValidatorsHashFunction, blockParameter);
        }

        
        public virtual Task<byte[]> TotalActiveValidatorsHashQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<TotalActiveValidatorsHashFunction, byte[]>(null, blockParameter);
        }

        public Task<byte[]> ValidatorSetHashMimcHashQueryAsync(ValidatorSetHashMimcHashFunction validatorSetHashMimcHashFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<ValidatorSetHashMimcHashFunction, byte[]>(validatorSetHashMimcHashFunction, blockParameter);
        }

        
        public virtual Task<byte[]> ValidatorSetHashMimcHashQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<ValidatorSetHashMimcHashFunction, byte[]>(null, blockParameter);
        }

        public Task<uint> VerificationTypeQueryAsync(VerificationTypeFunction verificationTypeFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerificationTypeFunction, uint>(verificationTypeFunction, blockParameter);
        }

        
        public virtual Task<uint> VerificationTypeQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerificationTypeFunction, uint>(null, blockParameter);
        }

        public Task<BigInteger> MaxValidatorsQueryAsync(MaxValidatorsFunction maxValidatorsFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<MaxValidatorsFunction, BigInteger>(maxValidatorsFunction, blockParameter);
        }

        
        public virtual Task<BigInteger> MaxValidatorsQueryAsync(BigInteger index, BlockParameter blockParameter = null)
        {
            var maxValidatorsFunction = new MaxValidatorsFunction();
                maxValidatorsFunction.Index = index;
            
            return ContractHandler.QueryAsync<MaxValidatorsFunction, BigInteger>(maxValidatorsFunction, blockParameter);
        }

        public Task<string> VerifiersQueryAsync(VerifiersFunction verifiersFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerifiersFunction, string>(verifiersFunction, blockParameter);
        }

        
        public virtual Task<string> VerifiersQueryAsync(BigInteger index, BlockParameter blockParameter = null)
        {
            var verifiersFunction = new VerifiersFunction();
                verifiersFunction.Index = index;
            
            return ContractHandler.QueryAsync<VerifiersFunction, string>(verifiersFunction, blockParameter);
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
                typeof(TotalActiveValidatorsHashFunction),
                typeof(ValidatorSetHashMimcHashFunction),
                typeof(VerificationTypeFunction),
                typeof(MaxValidatorsFunction),
                typeof(VerifiersFunction),
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
                typeof(Sigverifierblsbn254zkInvalidlengthError),
                typeof(Sigverifierblsbn254zkInvalidmaxvalidatorsError),
                typeof(Sigverifierblsbn254zkInvalidmaxvalidatorsorderError),
                typeof(Sigverifierblsbn254zkInvalidmessagelengthError),
                typeof(Sigverifierblsbn254zkInvalidprooflengthError),
                typeof(Sigverifierblsbn254zkInvalidproofoffsetError),
                typeof(Sigverifierblsbn254zkInvalidtotalactivevalidatorsError),
                typeof(Sigverifierblsbn254zkInvalidverifierError),
                typeof(Sigverifierblsbn254zkUnsupportedkeytagError)
            };
        }
    }
}
