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
using Symbiotic.Relay.IOzAccessControl.abi.ContractDefinition;

namespace Symbiotic.Relay.IOzAccessControl.abi
{
    public partial class IOzAccessControl.abiService: IOzAccessControl.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IOzAccessControl.abiDeployment iOzAccessControl.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IOzAccessControl.abiDeployment>().SendRequestAndWaitForReceiptAsync(iOzAccessControl.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IOzAccessControl.abiDeployment iOzAccessControl.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IOzAccessControl.abiDeployment>().SendRequestAsync(iOzAccessControl.abiDeployment);
        }

        public static async Task<IOzAccessControl.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IOzAccessControl.abiDeployment iOzAccessControl.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iOzAccessControl.abiDeployment, cancellationTokenSource);
            return new IOzAccessControl.abiService(web3, receipt.ContractAddress);
        }

        public IOzAccessControl.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IOzAccessControl.abiServiceBase: ContractWeb3ServiceBase
    {

        public IOzAccessControl.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<byte[]> GetRoleQueryAsync(GetRoleFunction getRoleFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetRoleFunction, byte[]>(getRoleFunction, blockParameter);
        }

        
        public virtual Task<byte[]> GetRoleQueryAsync(byte[] selector, BlockParameter blockParameter = null)
        {
            var getRoleFunction = new GetRoleFunction();
                getRoleFunction.Selector = selector;
            
            return ContractHandler.QueryAsync<GetRoleFunction, byte[]>(getRoleFunction, blockParameter);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(GetRoleFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(SetSelectorRoleEventDTO)
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
