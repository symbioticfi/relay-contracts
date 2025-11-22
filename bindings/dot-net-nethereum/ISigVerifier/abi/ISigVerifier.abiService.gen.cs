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
using Symbiotic.Relay.ISigVerifier.abi.ContractDefinition;

namespace Symbiotic.Relay.ISigVerifier.abi
{
    public partial class ISigVerifier.abiService: ISigVerifier.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, ISigVerifier.abiDeployment iSigVerifier.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<ISigVerifier.abiDeployment>().SendRequestAndWaitForReceiptAsync(iSigVerifier.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, ISigVerifier.abiDeployment iSigVerifier.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<ISigVerifier.abiDeployment>().SendRequestAsync(iSigVerifier.abiDeployment);
        }

        public static async Task<ISigVerifier.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, ISigVerifier.abiDeployment iSigVerifier.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iSigVerifier.abiDeployment, cancellationTokenSource);
            return new ISigVerifier.abiService(web3, receipt.ContractAddress);
        }

        public ISigVerifier.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class ISigVerifier.abiServiceBase: ContractWeb3ServiceBase
    {

        public ISigVerifier.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
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

            };
        }
    }
}
