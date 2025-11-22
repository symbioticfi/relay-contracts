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
public class IOperatorsJail.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_GETOPERATORJAILEDUNTIL = "getOperatorJailedUntil";

    public static final String FUNC_ISOPERATORJAILED = "isOperatorJailed";

    public static final String FUNC_JAILOPERATOR = "jailOperator";

    public static final String FUNC_UNJAILOPERATOR = "unjailOperator";

    public static final Event JAILOPERATOR_EVENT = new Event("JailOperator", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event UNJAILOPERATOR_EVENT = new Event("UnjailOperator", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final CustomError OPERATORSJAIL_ALREADYJAILED_ERROR = new CustomError("OperatorsJail_AlreadyJailed", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPERATORSJAIL_INVALIDDURATION_ERROR = new CustomError("OperatorsJail_InvalidDuration", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPERATORSJAIL_OPERATORJAILED_ERROR = new CustomError("OperatorsJail_OperatorJailed", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPERATORSJAIL_OPERATORNOTJAILED_ERROR = new CustomError("OperatorsJail_OperatorNotJailed", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IOperatorsJail.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IOperatorsJail.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IOperatorsJail.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IOperatorsJail.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<BigInteger> getOperatorJailedUntil(String operator) {
        final Function function = new Function(FUNC_GETOPERATORJAILEDUNTIL, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<Boolean> isOperatorJailed(String operator) {
        final Function function = new Function(FUNC_ISOPERATORJAILED, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<TransactionReceipt> jailOperator(String operator,
            BigInteger duration) {
        final Function function = new Function(
                FUNC_JAILOPERATOR, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint48(duration)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> unjailOperator(String operator) {
        final Function function = new Function(
                FUNC_UNJAILOPERATOR, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<JailOperatorEventResponse> getJailOperatorEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(JAILOPERATOR_EVENT, transactionReceipt);
        ArrayList<JailOperatorEventResponse> responses = new ArrayList<JailOperatorEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            JailOperatorEventResponse typedResponse = new JailOperatorEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static JailOperatorEventResponse getJailOperatorEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(JAILOPERATOR_EVENT, log);
        JailOperatorEventResponse typedResponse = new JailOperatorEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<JailOperatorEventResponse> jailOperatorEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getJailOperatorEventFromLog(log));
    }

    public Flowable<JailOperatorEventResponse> jailOperatorEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(JAILOPERATOR_EVENT));
        return jailOperatorEventFlowable(filter);
    }

    public static List<UnjailOperatorEventResponse> getUnjailOperatorEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(UNJAILOPERATOR_EVENT, transactionReceipt);
        ArrayList<UnjailOperatorEventResponse> responses = new ArrayList<UnjailOperatorEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            UnjailOperatorEventResponse typedResponse = new UnjailOperatorEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static UnjailOperatorEventResponse getUnjailOperatorEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(UNJAILOPERATOR_EVENT, log);
        UnjailOperatorEventResponse typedResponse = new UnjailOperatorEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<UnjailOperatorEventResponse> unjailOperatorEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getUnjailOperatorEventFromLog(log));
    }

    public Flowable<UnjailOperatorEventResponse> unjailOperatorEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(UNJAILOPERATOR_EVENT));
        return unjailOperatorEventFlowable(filter);
    }

    @Deprecated
    public static IOperatorsJail.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOperatorsJail.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IOperatorsJail.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOperatorsJail.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IOperatorsJail.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IOperatorsJail.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IOperatorsJail.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IOperatorsJail.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class JailOperatorEventResponse extends BaseEventResponse {
        public String operator;
    }

    public static class UnjailOperatorEventResponse extends BaseEventResponse {
        public String operator;
    }
}
