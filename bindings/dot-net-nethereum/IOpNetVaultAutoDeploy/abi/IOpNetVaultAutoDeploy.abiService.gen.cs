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
using Symbiotic.Relay.IOpNetVaultAutoDeploy.abi.ContractDefinition;

namespace Symbiotic.Relay.IOpNetVaultAutoDeploy.abi
{
    public partial class IOpNetVaultAutoDeploy.abiService: IOpNetVaultAutoDeploy.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IOpNetVaultAutoDeploy.abiDeployment iOpNetVaultAutoDeploy.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IOpNetVaultAutoDeploy.abiDeployment>().SendRequestAndWaitForReceiptAsync(iOpNetVaultAutoDeploy.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IOpNetVaultAutoDeploy.abiDeployment iOpNetVaultAutoDeploy.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IOpNetVaultAutoDeploy.abiDeployment>().SendRequestAsync(iOpNetVaultAutoDeploy.abiDeployment);
        }

        public static async Task<IOpNetVaultAutoDeploy.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IOpNetVaultAutoDeploy.abiDeployment iOpNetVaultAutoDeploy.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iOpNetVaultAutoDeploy.abiDeployment, cancellationTokenSource);
            return new IOpNetVaultAutoDeploy.abiService(web3, receipt.ContractAddress);
        }

        public IOpNetVaultAutoDeploy.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IOpNetVaultAutoDeploy.abiServiceBase: ContractWeb3ServiceBase
    {

        public IOpNetVaultAutoDeploy.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public Task<string> VaultConfiguratorQueryAsync(VaultConfiguratorFunction vaultConfiguratorFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VaultConfiguratorFunction, string>(vaultConfiguratorFunction, blockParameter);
        }

        
        public virtual Task<string> VaultConfiguratorQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<VaultConfiguratorFunction, string>(null, blockParameter);
        }

        public virtual Task<GetAutoDeployConfigOutputDTO> GetAutoDeployConfigQueryAsync(GetAutoDeployConfigFunction getAutoDeployConfigFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetAutoDeployConfigFunction, GetAutoDeployConfigOutputDTO>(getAutoDeployConfigFunction, blockParameter);
        }

        public virtual Task<GetAutoDeployConfigOutputDTO> GetAutoDeployConfigQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryDeserializingToObjectAsync<GetAutoDeployConfigFunction, GetAutoDeployConfigOutputDTO>(null, blockParameter);
        }

        public Task<string> GetAutoDeployedVaultQueryAsync(GetAutoDeployedVaultFunction getAutoDeployedVaultFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetAutoDeployedVaultFunction, string>(getAutoDeployedVaultFunction, blockParameter);
        }

        
        public virtual Task<string> GetAutoDeployedVaultQueryAsync(string @operator, BlockParameter blockParameter = null)
        {
            var getAutoDeployedVaultFunction = new GetAutoDeployedVaultFunction();
                getAutoDeployedVaultFunction.Operator = @operator;
            
            return ContractHandler.QueryAsync<GetAutoDeployedVaultFunction, string>(getAutoDeployedVaultFunction, blockParameter);
        }

        public Task<bool> IsAutoDeployEnabledQueryAsync(IsAutoDeployEnabledFunction isAutoDeployEnabledFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsAutoDeployEnabledFunction, bool>(isAutoDeployEnabledFunction, blockParameter);
        }

        
        public virtual Task<bool> IsAutoDeployEnabledQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsAutoDeployEnabledFunction, bool>(null, blockParameter);
        }

        public Task<bool> IsSetMaxNetworkLimitHookEnabledQueryAsync(IsSetMaxNetworkLimitHookEnabledFunction isSetMaxNetworkLimitHookEnabledFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsSetMaxNetworkLimitHookEnabledFunction, bool>(isSetMaxNetworkLimitHookEnabledFunction, blockParameter);
        }

        
        public virtual Task<bool> IsSetMaxNetworkLimitHookEnabledQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<IsSetMaxNetworkLimitHookEnabledFunction, bool>(null, blockParameter);
        }

        public virtual Task<string> SetAutoDeployConfigRequestAsync(SetAutoDeployConfigFunction setAutoDeployConfigFunction)
        {
             return ContractHandler.SendRequestAsync(setAutoDeployConfigFunction);
        }

        public virtual Task<TransactionReceipt> SetAutoDeployConfigRequestAndWaitForReceiptAsync(SetAutoDeployConfigFunction setAutoDeployConfigFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setAutoDeployConfigFunction, cancellationToken);
        }

        public virtual Task<string> SetAutoDeployConfigRequestAsync(AutoDeployConfig config)
        {
            var setAutoDeployConfigFunction = new SetAutoDeployConfigFunction();
                setAutoDeployConfigFunction.Config = config;
            
             return ContractHandler.SendRequestAsync(setAutoDeployConfigFunction);
        }

        public virtual Task<TransactionReceipt> SetAutoDeployConfigRequestAndWaitForReceiptAsync(AutoDeployConfig config, CancellationTokenSource cancellationToken = null)
        {
            var setAutoDeployConfigFunction = new SetAutoDeployConfigFunction();
                setAutoDeployConfigFunction.Config = config;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setAutoDeployConfigFunction, cancellationToken);
        }

        public virtual Task<string> SetAutoDeployStatusRequestAsync(SetAutoDeployStatusFunction setAutoDeployStatusFunction)
        {
             return ContractHandler.SendRequestAsync(setAutoDeployStatusFunction);
        }

        public virtual Task<TransactionReceipt> SetAutoDeployStatusRequestAndWaitForReceiptAsync(SetAutoDeployStatusFunction setAutoDeployStatusFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setAutoDeployStatusFunction, cancellationToken);
        }

        public virtual Task<string> SetAutoDeployStatusRequestAsync(bool status)
        {
            var setAutoDeployStatusFunction = new SetAutoDeployStatusFunction();
                setAutoDeployStatusFunction.Status = status;
            
             return ContractHandler.SendRequestAsync(setAutoDeployStatusFunction);
        }

        public virtual Task<TransactionReceipt> SetAutoDeployStatusRequestAndWaitForReceiptAsync(bool status, CancellationTokenSource cancellationToken = null)
        {
            var setAutoDeployStatusFunction = new SetAutoDeployStatusFunction();
                setAutoDeployStatusFunction.Status = status;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setAutoDeployStatusFunction, cancellationToken);
        }

        public virtual Task<string> SetSetMaxNetworkLimitHookStatusRequestAsync(SetSetMaxNetworkLimitHookStatusFunction setSetMaxNetworkLimitHookStatusFunction)
        {
             return ContractHandler.SendRequestAsync(setSetMaxNetworkLimitHookStatusFunction);
        }

        public virtual Task<TransactionReceipt> SetSetMaxNetworkLimitHookStatusRequestAndWaitForReceiptAsync(SetSetMaxNetworkLimitHookStatusFunction setSetMaxNetworkLimitHookStatusFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setSetMaxNetworkLimitHookStatusFunction, cancellationToken);
        }

        public virtual Task<string> SetSetMaxNetworkLimitHookStatusRequestAsync(bool status)
        {
            var setSetMaxNetworkLimitHookStatusFunction = new SetSetMaxNetworkLimitHookStatusFunction();
                setSetMaxNetworkLimitHookStatusFunction.Status = status;
            
             return ContractHandler.SendRequestAsync(setSetMaxNetworkLimitHookStatusFunction);
        }

        public virtual Task<TransactionReceipt> SetSetMaxNetworkLimitHookStatusRequestAndWaitForReceiptAsync(bool status, CancellationTokenSource cancellationToken = null)
        {
            var setSetMaxNetworkLimitHookStatusFunction = new SetSetMaxNetworkLimitHookStatusFunction();
                setSetMaxNetworkLimitHookStatusFunction.Status = status;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setSetMaxNetworkLimitHookStatusFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(VaultConfiguratorFunction),
                typeof(GetAutoDeployConfigFunction),
                typeof(GetAutoDeployedVaultFunction),
                typeof(IsAutoDeployEnabledFunction),
                typeof(IsSetMaxNetworkLimitHookEnabledFunction),
                typeof(SetAutoDeployConfigFunction),
                typeof(SetAutoDeployStatusFunction),
                typeof(SetSetMaxNetworkLimitHookStatusFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(SetAutoDeployConfigEventDTO),
                typeof(SetAutoDeployStatusEventDTO),
                typeof(SetSetMaxNetworkLimitHookStatusEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(OpnetvaultautodeployInvalidburnerhookError),
                typeof(OpnetvaultautodeployInvalidcollateralError),
                typeof(OpnetvaultautodeployInvalidepochdurationError),
                typeof(OpnetvaultautodeployInvalidwithslasherError)
            };
        }
    }
}
