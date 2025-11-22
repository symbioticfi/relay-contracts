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
using Symbiotic.Relay.OzAccessManaged.abi.ContractDefinition;

namespace Symbiotic.Relay.OzAccessManaged.abi
{
    public partial class OzAccessManaged.abiService: OzAccessManaged.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, OzAccessManaged.abiDeployment ozAccessManaged.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<OzAccessManaged.abiDeployment>().SendRequestAndWaitForReceiptAsync(ozAccessManaged.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, OzAccessManaged.abiDeployment ozAccessManaged.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<OzAccessManaged.abiDeployment>().SendRequestAsync(ozAccessManaged.abiDeployment);
        }

        public static async Task<OzAccessManaged.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, OzAccessManaged.abiDeployment ozAccessManaged.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, ozAccessManaged.abiDeployment, cancellationTokenSource);
            return new OzAccessManaged.abiService(web3, receipt.ContractAddress);
        }

        public OzAccessManaged.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class OzAccessManaged.abiServiceBase: ContractWeb3ServiceBase
    {

        public OzAccessManaged.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
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

        public virtual Task<string> SetAuthorityRequestAsync(string newAuthority)
        {
            var setAuthorityFunction = new SetAuthorityFunction();
                setAuthorityFunction.NewAuthority = newAuthority;
            
             return ContractHandler.SendRequestAsync(setAuthorityFunction);
        }

        public virtual Task<TransactionReceipt> SetAuthorityRequestAndWaitForReceiptAsync(string newAuthority, CancellationTokenSource cancellationToken = null)
        {
            var setAuthorityFunction = new SetAuthorityFunction();
                setAuthorityFunction.NewAuthority = newAuthority;
            
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
                typeof(AuthorityUpdatedEventDTO),
                typeof(InitializedEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(AccessManagedInvalidAuthorityError),
                typeof(AccessManagedRequiredDelayError),
                typeof(AccessManagedUnauthorizedError),
                typeof(InvalidInitializationError),
                typeof(NotInitializingError)
            };
        }
    }
}
