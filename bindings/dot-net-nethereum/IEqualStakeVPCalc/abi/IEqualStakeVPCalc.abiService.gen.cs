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
using Symbiotic.Relay.IEqualStakeVPCalc.abi.ContractDefinition;

namespace Symbiotic.Relay.IEqualStakeVPCalc.abi
{
    public partial class IEqualStakeVPCalc.abiService: IEqualStakeVPCalc.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IEqualStakeVPCalc.abiDeployment iEqualStakeVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IEqualStakeVPCalc.abiDeployment>().SendRequestAndWaitForReceiptAsync(iEqualStakeVPCalc.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IEqualStakeVPCalc.abiDeployment iEqualStakeVPCalc.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IEqualStakeVPCalc.abiDeployment>().SendRequestAsync(iEqualStakeVPCalc.abiDeployment);
        }

        public static async Task<IEqualStakeVPCalc.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IEqualStakeVPCalc.abiDeployment iEqualStakeVPCalc.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iEqualStakeVPCalc.abiDeployment, cancellationTokenSource);
            return new IEqualStakeVPCalc.abiService(web3, receipt.ContractAddress);
        }

        public IEqualStakeVPCalc.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IEqualStakeVPCalc.abiServiceBase: ContractWeb3ServiceBase
    {

        public IEqualStakeVPCalc.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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
