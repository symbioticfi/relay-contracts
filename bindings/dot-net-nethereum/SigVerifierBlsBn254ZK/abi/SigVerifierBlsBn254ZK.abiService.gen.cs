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
using Symbiotic.Relay.SigVerifierBlsBn254ZK.abi.ContractDefinition;

namespace Symbiotic.Relay.SigVerifierBlsBn254ZK.abi
{
    public partial class SigVerifierBlsBn254ZK.abiService: SigVerifierBlsBn254ZK.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, SigVerifierBlsBn254ZK.abiDeployment sigVerifierBlsBn254ZK.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<SigVerifierBlsBn254ZK.abiDeployment>().SendRequestAndWaitForReceiptAsync(sigVerifierBlsBn254ZK.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, SigVerifierBlsBn254ZK.abiDeployment sigVerifierBlsBn254ZK.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<SigVerifierBlsBn254ZK.abiDeployment>().SendRequestAsync(sigVerifierBlsBn254ZK.abiDeployment);
        }

        public static async Task<SigVerifierBlsBn254ZK.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, SigVerifierBlsBn254ZK.abiDeployment sigVerifierBlsBn254ZK.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, sigVerifierBlsBn254ZK.abiDeployment, cancellationTokenSource);
            return new SigVerifierBlsBn254ZK.abiService(web3, receipt.ContractAddress);
        }

        public SigVerifierBlsBn254ZK.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class SigVerifierBlsBn254ZK.abiServiceBase: ContractWeb3ServiceBase
    {

        public SigVerifierBlsBn254ZK.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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

        
        public virtual Task<BigInteger> MaxValidatorsQueryAsync(BigInteger returnValue1, BlockParameter blockParameter = null)
        {
            var maxValidatorsFunction = new MaxValidatorsFunction();
                maxValidatorsFunction.ReturnValue1 = returnValue1;
            
            return ContractHandler.QueryAsync<MaxValidatorsFunction, BigInteger>(maxValidatorsFunction, blockParameter);
        }

        public Task<string> VerifiersQueryAsync(VerifiersFunction verifiersFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VerifiersFunction, string>(verifiersFunction, blockParameter);
        }

        
        public virtual Task<string> VerifiersQueryAsync(BigInteger returnValue1, BlockParameter blockParameter = null)
        {
            var verifiersFunction = new VerifiersFunction();
                verifiersFunction.ReturnValue1 = returnValue1;
            
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
                typeof(InvalidKeyTagError),
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
