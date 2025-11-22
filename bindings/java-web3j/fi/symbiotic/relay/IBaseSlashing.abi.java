package fi.symbiotic.relay;

import io.reactivex.Flowable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Bool;
import org.web3j.abi.datatypes.CustomError;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.RemoteFunctionCall;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.BaseEventResponse;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tx.Contract;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.gas.ContractGasProvider;

/**
 * <p>Auto generated code.
 * <p><strong>Do not modify!</strong>
 * <p>Please use the <a href="https://docs.web3j.io/command_line.html">web3j command line tools</a>,
 * or the org.web3j.codegen.SolidityFunctionWrapperGenerator in the 
 * <a href="https://github.com/LFDT-web3j/web3j/tree/main/codegen">codegen module</a> to update.
 *
 * <p>Generated with web3j version 1.7.0.
 */
@SuppressWarnings("rawtypes")
public class IBaseSlashing.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_EXECUTESLASHVAULT = "executeSlashVault";

    public static final String FUNC_GETSLASHER = "getSlasher";

    public static final String FUNC_SETSLASHER = "setSlasher";

    public static final String FUNC_SLASHVAULT = "slashVault";

    public static final Event EXECUTESLASH_EVENT = new Event("ExecuteSlash", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Uint256>(true) {}, new TypeReference<Bool>(true) {}, new TypeReference<Uint256>() {}));
    ;

    public static final Event INSTANTSLASH_EVENT = new Event("InstantSlash", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Address>(true) {}, new TypeReference<Bool>(true) {}, new TypeReference<Uint256>() {}));
    ;

    public static final Event SETSLASHER_EVENT = new Event("SetSlasher", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
    ;

    public static final Event VETOSLASH_EVENT = new Event("VetoSlash", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Address>(true) {}, new TypeReference<Bool>(true) {}, new TypeReference<Uint256>() {}));
    ;

    public static final CustomError BASESLASHING_NOSLASHER_ERROR = new CustomError("BaseSlashing_NoSlasher", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError BASESLASHING_NOSLASHING_ERROR = new CustomError("BaseSlashing_NoSlashing", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError BASESLASHING_NOTSLASHER_ERROR = new CustomError("BaseSlashing_NotSlasher", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError BASESLASHING_NOTVETOSLASHER_ERROR = new CustomError("BaseSlashing_NotVetoSlasher", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError BASESLASHING_UNKNOWNSLASHERTYPE_ERROR = new CustomError("BaseSlashing_UnknownSlasherType", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IBaseSlashing.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IBaseSlashing.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IBaseSlashing.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IBaseSlashing.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<TransactionReceipt> executeSlashVault(String vault,
            BigInteger slashIndex, byte[] hints) {
        final Function function = new Function(
                FUNC_EXECUTESLASHVAULT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.generated.Uint256(slashIndex), 
                new org.web3j.abi.datatypes.DynamicBytes(hints)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<String> getSlasher() {
        final Function function = new Function(FUNC_GETSLASHER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setSlasher(String slasher) {
        final Function function = new Function(
                FUNC_SETSLASHER, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, slasher)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> slashVault(BigInteger timestamp, String vault,
            String operator, BigInteger amount, byte[] hints) {
        final Function function = new Function(
                FUNC_SLASHVAULT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp), 
                new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint256(amount), 
                new org.web3j.abi.datatypes.DynamicBytes(hints)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<ExecuteSlashEventResponse> getExecuteSlashEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(EXECUTESLASH_EVENT, transactionReceipt);
        ArrayList<ExecuteSlashEventResponse> responses = new ArrayList<ExecuteSlashEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            ExecuteSlashEventResponse typedResponse = new ExecuteSlashEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.slashIndex = (BigInteger) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
            typedResponse.slashedAmount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static ExecuteSlashEventResponse getExecuteSlashEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(EXECUTESLASH_EVENT, log);
        ExecuteSlashEventResponse typedResponse = new ExecuteSlashEventResponse();
        typedResponse.log = log;
        typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.slashIndex = (BigInteger) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
        typedResponse.slashedAmount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<ExecuteSlashEventResponse> executeSlashEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getExecuteSlashEventFromLog(log));
    }

    public Flowable<ExecuteSlashEventResponse> executeSlashEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(EXECUTESLASH_EVENT));
        return executeSlashEventFlowable(filter);
    }

    public static List<InstantSlashEventResponse> getInstantSlashEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(INSTANTSLASH_EVENT, transactionReceipt);
        ArrayList<InstantSlashEventResponse> responses = new ArrayList<InstantSlashEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InstantSlashEventResponse typedResponse = new InstantSlashEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
            typedResponse.slashedAmount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static InstantSlashEventResponse getInstantSlashEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(INSTANTSLASH_EVENT, log);
        InstantSlashEventResponse typedResponse = new InstantSlashEventResponse();
        typedResponse.log = log;
        typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.operator = (String) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
        typedResponse.slashedAmount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<InstantSlashEventResponse> instantSlashEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getInstantSlashEventFromLog(log));
    }

    public Flowable<InstantSlashEventResponse> instantSlashEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(INSTANTSLASH_EVENT));
        return instantSlashEventFlowable(filter);
    }

    public static List<SetSlasherEventResponse> getSetSlasherEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETSLASHER_EVENT, transactionReceipt);
        ArrayList<SetSlasherEventResponse> responses = new ArrayList<SetSlasherEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetSlasherEventResponse typedResponse = new SetSlasherEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.slasher = (String) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetSlasherEventResponse getSetSlasherEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETSLASHER_EVENT, log);
        SetSlasherEventResponse typedResponse = new SetSlasherEventResponse();
        typedResponse.log = log;
        typedResponse.slasher = (String) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetSlasherEventResponse> setSlasherEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetSlasherEventFromLog(log));
    }

    public Flowable<SetSlasherEventResponse> setSlasherEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETSLASHER_EVENT));
        return setSlasherEventFlowable(filter);
    }

    public static List<VetoSlashEventResponse> getVetoSlashEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(VETOSLASH_EVENT, transactionReceipt);
        ArrayList<VetoSlashEventResponse> responses = new ArrayList<VetoSlashEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            VetoSlashEventResponse typedResponse = new VetoSlashEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
            typedResponse.slashIndex = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static VetoSlashEventResponse getVetoSlashEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(VETOSLASH_EVENT, log);
        VetoSlashEventResponse typedResponse = new VetoSlashEventResponse();
        typedResponse.log = log;
        typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.operator = (String) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
        typedResponse.slashIndex = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<VetoSlashEventResponse> vetoSlashEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getVetoSlashEventFromLog(log));
    }

    public Flowable<VetoSlashEventResponse> vetoSlashEventFlowable(DefaultBlockParameter startBlock,
            DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(VETOSLASH_EVENT));
        return vetoSlashEventFlowable(filter);
    }

    @Deprecated
    public static IBaseSlashing.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IBaseSlashing.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IBaseSlashing.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IBaseSlashing.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IBaseSlashing.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IBaseSlashing.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IBaseSlashing.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IBaseSlashing.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class ExecuteSlashEventResponse extends BaseEventResponse {
        public String slasher;

        public BigInteger slashIndex;

        public Boolean success;

        public BigInteger slashedAmount;
    }

    public static class InstantSlashEventResponse extends BaseEventResponse {
        public String slasher;

        public String operator;

        public Boolean success;

        public BigInteger slashedAmount;
    }

    public static class SetSlasherEventResponse extends BaseEventResponse {
        public String slasher;
    }

    public static class VetoSlashEventResponse extends BaseEventResponse {
        public String slasher;

        public String operator;

        public Boolean success;

        public BigInteger slashIndex;
    }
}
