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
public class IOperatorsBlacklist.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_BLACKLISTOPERATOR = "blacklistOperator";

    public static final String FUNC_ISOPERATORBLACKLISTED = "isOperatorBlacklisted";

    public static final String FUNC_UNBLACKLISTOPERATOR = "unblacklistOperator";

    public static final Event BLACKLISTOPERATOR_EVENT = new Event("BlacklistOperator", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event UNBLACKLISTOPERATOR_EVENT = new Event("UnblacklistOperator", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final CustomError OPERATORSBLACKLIST_OPERATORBLACKLISTED_ERROR = new CustomError("OperatorsBlacklist_OperatorBlacklisted", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPERATORSBLACKLIST_OPERATORNOTBLACKLISTED_ERROR = new CustomError("OperatorsBlacklist_OperatorNotBlacklisted", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IOperatorsBlacklist.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IOperatorsBlacklist.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IOperatorsBlacklist.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IOperatorsBlacklist.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<TransactionReceipt> blacklistOperator(String operator) {
        final Function function = new Function(
                FUNC_BLACKLISTOPERATOR, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<Boolean> isOperatorBlacklisted(String operator) {
        final Function function = new Function(FUNC_ISOPERATORBLACKLISTED, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<TransactionReceipt> unblacklistOperator(String operator) {
        final Function function = new Function(
                FUNC_UNBLACKLISTOPERATOR, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<BlacklistOperatorEventResponse> getBlacklistOperatorEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(BLACKLISTOPERATOR_EVENT, transactionReceipt);
        ArrayList<BlacklistOperatorEventResponse> responses = new ArrayList<BlacklistOperatorEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            BlacklistOperatorEventResponse typedResponse = new BlacklistOperatorEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static BlacklistOperatorEventResponse getBlacklistOperatorEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(BLACKLISTOPERATOR_EVENT, log);
        BlacklistOperatorEventResponse typedResponse = new BlacklistOperatorEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<BlacklistOperatorEventResponse> blacklistOperatorEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getBlacklistOperatorEventFromLog(log));
    }

    public Flowable<BlacklistOperatorEventResponse> blacklistOperatorEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(BLACKLISTOPERATOR_EVENT));
        return blacklistOperatorEventFlowable(filter);
    }

    public static List<UnblacklistOperatorEventResponse> getUnblacklistOperatorEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(UNBLACKLISTOPERATOR_EVENT, transactionReceipt);
        ArrayList<UnblacklistOperatorEventResponse> responses = new ArrayList<UnblacklistOperatorEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            UnblacklistOperatorEventResponse typedResponse = new UnblacklistOperatorEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static UnblacklistOperatorEventResponse getUnblacklistOperatorEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(UNBLACKLISTOPERATOR_EVENT, log);
        UnblacklistOperatorEventResponse typedResponse = new UnblacklistOperatorEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<UnblacklistOperatorEventResponse> unblacklistOperatorEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getUnblacklistOperatorEventFromLog(log));
    }

    public Flowable<UnblacklistOperatorEventResponse> unblacklistOperatorEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(UNBLACKLISTOPERATOR_EVENT));
        return unblacklistOperatorEventFlowable(filter);
    }

    @Deprecated
    public static IOperatorsBlacklist.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOperatorsBlacklist.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IOperatorsBlacklist.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOperatorsBlacklist.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IOperatorsBlacklist.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IOperatorsBlacklist.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IOperatorsBlacklist.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IOperatorsBlacklist.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class BlacklistOperatorEventResponse extends BaseEventResponse {
        public String operator;
    }

    public static class UnblacklistOperatorEventResponse extends BaseEventResponse {
        public String operator;
    }
}
