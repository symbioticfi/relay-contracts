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
using Symbiotic.Relay.IBaseSlashing.abi.ContractDefinition;

namespace Symbiotic.Relay.IBaseSlashing.abi
{
    public partial class IBaseSlashing.abiService: IBaseSlashing.abiServiceBase
    {
        public static Task<TransactionReceipt> DeployContractAndWaitForReceiptAsync(Nethereum.Web3.IWeb3 web3, IBaseSlashing.abiDeployment iBaseSlashing.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            return web3.Eth.GetContractDeploymentHandler<IBaseSlashing.abiDeployment>().SendRequestAndWaitForReceiptAsync(iBaseSlashing.abiDeployment, cancellationTokenSource);
        }

        public static Task<string> DeployContractAsync(Nethereum.Web3.IWeb3 web3, IBaseSlashing.abiDeployment iBaseSlashing.abiDeployment)
        {
            return web3.Eth.GetContractDeploymentHandler<IBaseSlashing.abiDeployment>().SendRequestAsync(iBaseSlashing.abiDeployment);
        }

        public static async Task<IBaseSlashing.abiService> DeployContractAndGetServiceAsync(Nethereum.Web3.IWeb3 web3, IBaseSlashing.abiDeployment iBaseSlashing.abiDeployment, CancellationTokenSource cancellationTokenSource = null)
        {
            var receipt = await DeployContractAndWaitForReceiptAsync(web3, iBaseSlashing.abiDeployment, cancellationTokenSource);
            return new IBaseSlashing.abiService(web3, receipt.ContractAddress);
        }

        public IBaseSlashing.abiService(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

    }


    public partial class IBaseSlashing.abiServiceBase: ContractWeb3ServiceBase
    {

        public IBaseSlashing.abiServiceBase(Nethereum.Web3.IWeb3 web3, string contractAddress) : base(web3, contractAddress)
        {
        }

        public virtual Task<string> ExecuteSlashVaultRequestAsync(ExecuteSlashVaultFunction executeSlashVaultFunction)
        {
             return ContractHandler.SendRequestAsync(executeSlashVaultFunction);
        }

        public virtual Task<TransactionReceipt> ExecuteSlashVaultRequestAndWaitForReceiptAsync(ExecuteSlashVaultFunction executeSlashVaultFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(executeSlashVaultFunction, cancellationToken);
        }

        public virtual Task<string> ExecuteSlashVaultRequestAsync(string vault, BigInteger slashIndex, byte[] hints)
        {
            var executeSlashVaultFunction = new ExecuteSlashVaultFunction();
                executeSlashVaultFunction.Vault = vault;
                executeSlashVaultFunction.SlashIndex = slashIndex;
                executeSlashVaultFunction.Hints = hints;
            
             return ContractHandler.SendRequestAsync(executeSlashVaultFunction);
        }

        public virtual Task<TransactionReceipt> ExecuteSlashVaultRequestAndWaitForReceiptAsync(string vault, BigInteger slashIndex, byte[] hints, CancellationTokenSource cancellationToken = null)
        {
            var executeSlashVaultFunction = new ExecuteSlashVaultFunction();
                executeSlashVaultFunction.Vault = vault;
                executeSlashVaultFunction.SlashIndex = slashIndex;
                executeSlashVaultFunction.Hints = hints;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(executeSlashVaultFunction, cancellationToken);
        }

        public Task<string> GetSlasherQueryAsync(GetSlasherFunction getSlasherFunction, BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetSlasherFunction, string>(getSlasherFunction, blockParameter);
        }

        
        public virtual Task<string> GetSlasherQueryAsync(BlockParameter blockParameter = null)
        {
            return ContractHandler.QueryAsync<GetSlasherFunction, string>(null, blockParameter);
        }

        public virtual Task<string> SetSlasherRequestAsync(SetSlasherFunction setSlasherFunction)
        {
             return ContractHandler.SendRequestAsync(setSlasherFunction);
        }

        public virtual Task<TransactionReceipt> SetSlasherRequestAndWaitForReceiptAsync(SetSlasherFunction setSlasherFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setSlasherFunction, cancellationToken);
        }

        public virtual Task<string> SetSlasherRequestAsync(string slasher)
        {
            var setSlasherFunction = new SetSlasherFunction();
                setSlasherFunction.Slasher = slasher;
            
             return ContractHandler.SendRequestAsync(setSlasherFunction);
        }

        public virtual Task<TransactionReceipt> SetSlasherRequestAndWaitForReceiptAsync(string slasher, CancellationTokenSource cancellationToken = null)
        {
            var setSlasherFunction = new SetSlasherFunction();
                setSlasherFunction.Slasher = slasher;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(setSlasherFunction, cancellationToken);
        }

        public virtual Task<string> SlashVaultRequestAsync(SlashVaultFunction slashVaultFunction)
        {
             return ContractHandler.SendRequestAsync(slashVaultFunction);
        }

        public virtual Task<TransactionReceipt> SlashVaultRequestAndWaitForReceiptAsync(SlashVaultFunction slashVaultFunction, CancellationTokenSource cancellationToken = null)
        {
             return ContractHandler.SendRequestAndWaitForReceiptAsync(slashVaultFunction, cancellationToken);
        }

        public virtual Task<string> SlashVaultRequestAsync(ulong timestamp, string vault, string @operator, BigInteger amount, byte[] hints)
        {
            var slashVaultFunction = new SlashVaultFunction();
                slashVaultFunction.Timestamp = timestamp;
                slashVaultFunction.Vault = vault;
                slashVaultFunction.Operator = @operator;
                slashVaultFunction.Amount = amount;
                slashVaultFunction.Hints = hints;
            
             return ContractHandler.SendRequestAsync(slashVaultFunction);
        }

        public virtual Task<TransactionReceipt> SlashVaultRequestAndWaitForReceiptAsync(ulong timestamp, string vault, string @operator, BigInteger amount, byte[] hints, CancellationTokenSource cancellationToken = null)
        {
            var slashVaultFunction = new SlashVaultFunction();
                slashVaultFunction.Timestamp = timestamp;
                slashVaultFunction.Vault = vault;
                slashVaultFunction.Operator = @operator;
                slashVaultFunction.Amount = amount;
                slashVaultFunction.Hints = hints;
            
             return ContractHandler.SendRequestAndWaitForReceiptAsync(slashVaultFunction, cancellationToken);
        }

        public override List<Type> GetAllFunctionTypes()
        {
            return new List<Type>
            {
                typeof(ExecuteSlashVaultFunction),
                typeof(GetSlasherFunction),
                typeof(SetSlasherFunction),
                typeof(SlashVaultFunction)
            };
        }

        public override List<Type> GetAllEventTypes()
        {
            return new List<Type>
            {
                typeof(ExecuteSlashEventDTO),
                typeof(InstantSlashEventDTO),
                typeof(SetSlasherEventDTO),
                typeof(VetoSlashEventDTO)
            };
        }

        public override List<Type> GetAllErrorTypes()
        {
            return new List<Type>
            {
                typeof(BaseslashingNoslasherError),
                typeof(BaseslashingNoslashingError),
                typeof(BaseslashingNotslasherError),
                typeof(BaseslashingNotvetoslasherError),
                typeof(BaseslashingUnknownslashertypeError)
            };
        }
    }
}
