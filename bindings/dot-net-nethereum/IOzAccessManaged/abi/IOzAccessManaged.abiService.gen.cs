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
using Symbiotic.Relay.IOzAccessManaged.abi.ContractDefinition;

namespace Symbiotic.Relay.IOzAccessManaged.abi
{
    public partial class IOzAccessManaged.abiService: IOzAccessManaged.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IOzAccessManaged.abiDeployment iOzAccessManaged.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IOzAccessManaged.abiDeployment>().SendRequestAndWaitForReceiptAsync(iOzAccessManaged.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IOzAccessManaged.abiDeployment iOzAccessManaged.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IOzAccessManaged.abiDeployment>().SendRequestAsync(iOzAccessManaged.abiDeployment);
        }

        public static async Task<IOzAccessManaged.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IOzAccessManaged.abiDeployment iOzAccessManaged.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iOzAccessManaged.abiDeployment, cancellationTokenSource);
            return new IOzAccessManaged.abiService(web3, receipt.ContractAddress);
        }

        public IOzAccessManaged.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IOzAccessManaged.abiServiceBase: ContractWeb3ServiceBase
    {

        public IOzAccessManaged.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<string> AuthorityQueryAsync(AuthorityFunction authorityFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<AuthorityFunction, string>(authorityFunction, blockParameter);
        }

        
        public virtual Task<string> AuthorityQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<AuthorityFunction, string>(null, blockParameter);
        }

        public Task<byte[]> IsConsumingScheduledOpQueryAsync(IsConsumingScheduledOpFunction isConsumingScheduledOpFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsConsumingScheduledOpFunction, byte[]>(isConsumingScheduledOpFunction, blockParameter);
        }

        
        public virtual Task<byte[]> IsConsumingScheduledOpQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsConsumingScheduledOpFunction, byte[]>(null, blockParameter);
        }

        public virtual Task<string> SetAuthorityRequestAsync(SetAuthorityFunction setAuthorityFunction)
        {
             return ContractHandler.SendRequestAsync(setAuthorityFunction);
        }

        public virtual Task<TransactionReceipt> SetAuthorityRequestAndWaitForReceiptAsync(SetAuthorityFunction setAuthorityFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setAuthorityFunction, cancellationToken);
        }

        public virtual Task<string> SetAuthorityRequestAsync(string returnValue1)
        {
            var setAuthorityFunction = new SetAuthorityFunction();
                setAuthorityFunction.ReturnValue1 = returnValue1;
            
             return ContractHandler.SendRequestAsync(setAuthorityFunction);
        }

        public virtual Task<TransactionReceipt> SetAuthorityRequestAndWaitForReceiptAsync(string returnValue1, CancellationTokenSource cancellationToken = null)
        {
            var setAuthorityFunction = new SetAuthorityFunction();
                setAuthorityFunction.ReturnValue1 = returnValue1;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setAuthorityFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(AuthorityFunction),
                typeof(IsConsumingScheduledOpFunction),
                typeof(SetAuthorityFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(AuthorityUpdatedEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(AccessManagedInvalidAuthorityError),
                typeof(AccessManagedRequiredDelayError),
                typeof(AccessManagedUnauthorizedError)
            };
        }
    }
}
