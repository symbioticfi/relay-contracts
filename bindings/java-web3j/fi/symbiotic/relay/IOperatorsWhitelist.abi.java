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
public class IOperatorsWhitelist.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_ISOPERATORWHITELISTED = "isOperatorWhitelisted";

    public static final String FUNC_ISWHITELISTENABLED = "isWhitelistEnabled";

    public static final String FUNC_SETWHITELISTSTATUS = "setWhitelistStatus";

    public static final String FUNC_UNWHITELISTOPERATOR = "unwhitelistOperator";

    public static final String FUNC_WHITELISTOPERATOR = "whitelistOperator";

    public static final Event SETWHITELISTSTATUS_EVENT = new Event("SetWhitelistStatus", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
    ;

    public static final Event UNWHITELISTOPERATOR_EVENT = new Event("UnwhitelistOperator", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event WHITELISTOPERATOR_EVENT = new Event("WhitelistOperator", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final CustomError OPERATORSWHITELIST_OPERATORNOTWHITELISTED_ERROR = new CustomError("OperatorsWhitelist_OperatorNotWhitelisted", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPERATORSWHITELIST_OPERATORWHITELISTED_ERROR = new CustomError("OperatorsWhitelist_OperatorWhitelisted", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPERATORSWHITELIST_STATUSALREADYSET_ERROR = new CustomError("OperatorsWhitelist_StatusAlreadySet", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IOperatorsWhitelist.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IOperatorsWhitelist.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IOperatorsWhitelist.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IOperatorsWhitelist.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<Boolean> isOperatorWhitelisted(String operator) {
        final Function function = new Function(FUNC_ISOPERATORWHITELISTED, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isWhitelistEnabled() {
        final Function function = new Function(FUNC_ISWHITELISTENABLED, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setWhitelistStatus(Boolean status) {
        final Function function = new Function(
                FUNC_SETWHITELISTSTATUS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Bool(status)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> unwhitelistOperator(String operator) {
        final Function function = new Function(
                FUNC_UNWHITELISTOPERATOR, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> whitelistOperator(String operator) {
        final Function function = new Function(
                FUNC_WHITELISTOPERATOR, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<SetWhitelistStatusEventResponse> getSetWhitelistStatusEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETWHITELISTSTATUS_EVENT, transactionReceipt);
        ArrayList<SetWhitelistStatusEventResponse> responses = new ArrayList<SetWhitelistStatusEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetWhitelistStatusEventResponse typedResponse = new SetWhitelistStatusEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.status = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetWhitelistStatusEventResponse getSetWhitelistStatusEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETWHITELISTSTATUS_EVENT, log);
        SetWhitelistStatusEventResponse typedResponse = new SetWhitelistStatusEventResponse();
        typedResponse.log = log;
        typedResponse.status = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetWhitelistStatusEventResponse> setWhitelistStatusEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetWhitelistStatusEventFromLog(log));
    }

    public Flowable<SetWhitelistStatusEventResponse> setWhitelistStatusEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETWHITELISTSTATUS_EVENT));
        return setWhitelistStatusEventFlowable(filter);
    }

    public static List<UnwhitelistOperatorEventResponse> getUnwhitelistOperatorEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(UNWHITELISTOPERATOR_EVENT, transactionReceipt);
        ArrayList<UnwhitelistOperatorEventResponse> responses = new ArrayList<UnwhitelistOperatorEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            UnwhitelistOperatorEventResponse typedResponse = new UnwhitelistOperatorEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static UnwhitelistOperatorEventResponse getUnwhitelistOperatorEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(UNWHITELISTOPERATOR_EVENT, log);
        UnwhitelistOperatorEventResponse typedResponse = new UnwhitelistOperatorEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<UnwhitelistOperatorEventResponse> unwhitelistOperatorEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getUnwhitelistOperatorEventFromLog(log));
    }

    public Flowable<UnwhitelistOperatorEventResponse> unwhitelistOperatorEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(UNWHITELISTOPERATOR_EVENT));
        return unwhitelistOperatorEventFlowable(filter);
    }

    public static List<WhitelistOperatorEventResponse> getWhitelistOperatorEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(WHITELISTOPERATOR_EVENT, transactionReceipt);
        ArrayList<WhitelistOperatorEventResponse> responses = new ArrayList<WhitelistOperatorEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            WhitelistOperatorEventResponse typedResponse = new WhitelistOperatorEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static WhitelistOperatorEventResponse getWhitelistOperatorEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(WHITELISTOPERATOR_EVENT, log);
        WhitelistOperatorEventResponse typedResponse = new WhitelistOperatorEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<WhitelistOperatorEventResponse> whitelistOperatorEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getWhitelistOperatorEventFromLog(log));
    }

    public Flowable<WhitelistOperatorEventResponse> whitelistOperatorEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(WHITELISTOPERATOR_EVENT));
        return whitelistOperatorEventFlowable(filter);
    }

    @Deprecated
    public static IOperatorsWhitelist.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOperatorsWhitelist.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IOperatorsWhitelist.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOperatorsWhitelist.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IOperatorsWhitelist.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IOperatorsWhitelist.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IOperatorsWhitelist.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IOperatorsWhitelist.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class SetWhitelistStatusEventResponse extends BaseEventResponse {
        public Boolean status;
    }

    public static class UnwhitelistOperatorEventResponse extends BaseEventResponse {
        public String operator;
    }

    public static class WhitelistOperatorEventResponse extends BaseEventResponse {
        public String operator;
    }
}
