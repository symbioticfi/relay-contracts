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
using Symbiotic.Relay.INormalizedTokenDecimalsVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.INormalizedTokenDecimalsVPCalc.abi
{
    public partial class INormalizedTokenDecimalsVPCalc.abiService: INormalizedTokenDecimalsVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, INormalizedTokenDecimalsVPCalc.abiDeployment iNormalizedTokenDecimalsVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<INormalizedTokenDecimalsVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(iNormalizedTokenDecimalsVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, INormalizedTokenDecimalsVPCalc.abiDeployment iNormalizedTokenDecimalsVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<INormalizedTokenDecimalsVPCalc.abiDeployment>().SendRequestAsync(iNormalizedTokenDecimalsVPCalc.abiDeployment);
        }

        public static async Task<INormalizedTokenDecimalsVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, INormalizedTokenDecimalsVPCalc.abiDeployment iNormalizedTokenDecimalsVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iNormalizedTokenDecimalsVPCalc.abiDeployment, cancellationTokenSource);
            return new INormalizedTokenDecimalsVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public INormalizedTokenDecimalsVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class INormalizedTokenDecimalsVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public INormalizedTokenDecimalsVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {

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
