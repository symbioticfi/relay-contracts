package fi.symbiotic.relay;

import io.reactivex.Flowable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.CustomError;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Uint48;
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
public class IEpochManager.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_GETCURRENTEPOCH = "getCurrentEpoch";

    public static final String FUNC_GETCURRENTEPOCHDURATION = "getCurrentEpochDuration";

    public static final String FUNC_GETCURRENTEPOCHSTART = "getCurrentEpochStart";

    public static final String FUNC_GETEPOCHDURATION = "getEpochDuration";

    public static final String FUNC_GETEPOCHINDEX = "getEpochIndex";

    public static final String FUNC_GETEPOCHSTART = "getEpochStart";

    public static final String FUNC_GETNEXTEPOCH = "getNextEpoch";

    public static final String FUNC_GETNEXTEPOCHDURATION = "getNextEpochDuration";

    public static final String FUNC_GETNEXTEPOCHSTART = "getNextEpochStart";

    public static final String FUNC_SETEPOCHDURATION = "setEpochDuration";

    public static final Event INITEPOCHDURATION_EVENT = new Event("InitEpochDuration", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}, new TypeReference<Uint48>() {}));
    ;

    public static final Event SETEPOCHDURATION_EVENT = new Event("SetEpochDuration", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
    ;

    public static final CustomError EPOCHMANAGER_INVALIDEPOCHDURATION_ERROR = new CustomError("EpochManager_InvalidEpochDuration", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError EPOCHMANAGER_INVALIDEPOCHDURATIONTIMESTAMP_ERROR = new CustomError("EpochManager_InvalidEpochDurationTimestamp", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError EPOCHMANAGER_TOOOLDTIMESTAMP_ERROR = new CustomError("EpochManager_TooOldTimestamp", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IEpochManager.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IEpochManager.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IEpochManager.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IEpochManager.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<BigInteger> getCurrentEpoch() {
        final Function function = new Function(FUNC_GETCURRENTEPOCH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getCurrentEpochDuration() {
        final Function function = new Function(FUNC_GETCURRENTEPOCHDURATION, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getCurrentEpochStart() {
        final Function function = new Function(FUNC_GETCURRENTEPOCHSTART, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getEpochDuration(BigInteger epoch) {
        final Function function = new Function(FUNC_GETEPOCHDURATION, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getEpochIndex(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETEPOCHINDEX, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getEpochStart(BigInteger epoch) {
        final Function function = new Function(FUNC_GETEPOCHSTART, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getNextEpoch() {
        final Function function = new Function(FUNC_GETNEXTEPOCH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getNextEpochDuration() {
        final Function function = new Function(FUNC_GETNEXTEPOCHDURATION, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getNextEpochStart() {
        final Function function = new Function(FUNC_GETNEXTEPOCHSTART, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setEpochDuration(BigInteger epochDuration) {
        final Function function = new Function(
                FUNC_SETEPOCHDURATION, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epochDuration)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<InitEpochDurationEventResponse> getInitEpochDurationEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(INITEPOCHDURATION_EVENT, transactionReceipt);
        ArrayList<InitEpochDurationEventResponse> responses = new ArrayList<InitEpochDurationEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InitEpochDurationEventResponse typedResponse = new InitEpochDurationEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.epochDuration = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.epochDurationTimestamp = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static InitEpochDurationEventResponse getInitEpochDurationEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(INITEPOCHDURATION_EVENT, log);
        InitEpochDurationEventResponse typedResponse = new InitEpochDurationEventResponse();
        typedResponse.log = log;
        typedResponse.epochDuration = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        typedResponse.epochDurationTimestamp = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<InitEpochDurationEventResponse> initEpochDurationEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getInitEpochDurationEventFromLog(log));
    }

    public Flowable<InitEpochDurationEventResponse> initEpochDurationEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(INITEPOCHDURATION_EVENT));
        return initEpochDurationEventFlowable(filter);
    }

    public static List<SetEpochDurationEventResponse> getSetEpochDurationEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETEPOCHDURATION_EVENT, transactionReceipt);
        ArrayList<SetEpochDurationEventResponse> responses = new ArrayList<SetEpochDurationEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetEpochDurationEventResponse typedResponse = new SetEpochDurationEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.epochDuration = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetEpochDurationEventResponse getSetEpochDurationEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETEPOCHDURATION_EVENT, log);
        SetEpochDurationEventResponse typedResponse = new SetEpochDurationEventResponse();
        typedResponse.log = log;
        typedResponse.epochDuration = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetEpochDurationEventResponse> setEpochDurationEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetEpochDurationEventFromLog(log));
    }

    public Flowable<SetEpochDurationEventResponse> setEpochDurationEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETEPOCHDURATION_EVENT));
        return setEpochDurationEventFlowable(filter);
    }

    @Deprecated
    public static IEpochManager.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IEpochManager.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IEpochManager.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IEpochManager.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IEpochManager.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IEpochManager.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IEpochManager.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IEpochManager.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class InitEpochDurationEventResponse extends BaseEventResponse {
        public BigInteger epochDuration;

        public BigInteger epochDurationTimestamp;
    }

    public static class SetEpochDurationEventResponse extends BaseEventResponse {
        public BigInteger epochDuration;
    }
}
