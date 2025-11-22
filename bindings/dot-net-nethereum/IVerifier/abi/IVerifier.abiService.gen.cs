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
using Symbiotic.Relay.IVerifier.abi.ContractDefinition;

namespace Symbiotic.Relay.IVerifier.abi
{
    public partial class IVerifier.abiService: IVerifier.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IVerifier.abiDeployment iVerifier.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IVerifier.abiDeployment>().SendRequestAndWaitForReceiptAsync(iVerifier.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IVerifier.abiDeployment iVerifier.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IVerifier.abiDeployment>().SendRequestAsync(iVerifier.abiDeployment);
        }

        public static async Task<IVerifier.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IVerifier.abiDeployment iVerifier.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iVerifier.abiDeployment, cancellationTokenSource);
            return new IVerifier.abiService(web3, receipt.ContractAddress);
        }

        public IVerifier.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IVerifier.abiServiceBase: ContractWeb3ServiceBase
    {

        public IVerifier.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }



        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(VerifyProofFunction)
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
