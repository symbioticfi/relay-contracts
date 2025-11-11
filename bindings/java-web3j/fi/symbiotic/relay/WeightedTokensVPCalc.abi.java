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
import org.web3j.abi.datatypes.CustomError;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Uint208;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.abi.datatypes.generated.Uint64;
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
public class WeightedTokensVPCalc.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_GETTOKENWEIGHT = "getTokenWeight";

    public static final String FUNC_GETTOKENWEIGHTAT = "getTokenWeightAt";

    public static final String FUNC_SETTOKENWEIGHT = "setTokenWeight";

    public static final String FUNC_STAKETOVOTINGPOWER = "stakeToVotingPower";

    public static final String FUNC_STAKETOVOTINGPOWERAT = "stakeToVotingPowerAt";

    public static final Event INITIALIZED_EVENT = new Event("Initialized", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint64>() {}));
    ;

    public static final Event SETTOKENWEIGHT_EVENT = new Event("SetTokenWeight", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Uint208>() {}));
    ;

    public static final CustomError CHECKPOINTUNORDEREDINSERTION_ERROR = new CustomError("CheckpointUnorderedInsertion", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError INVALIDINITIALIZATION_ERROR = new CustomError("InvalidInitialization", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError NOTINITIALIZING_ERROR = new CustomError("NotInitializing", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError WEIGHTEDTOKENSVPCALC_TOOLARGEWEIGHT_ERROR = new CustomError("WeightedTokensVPCalc_TooLargeWeight", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected WeightedTokensVPCalc.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected WeightedTokensVPCalc.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected WeightedTokensVPCalc.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected WeightedTokensVPCalc.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<BigInteger> getTokenWeight(String token) {
        final Function function = new Function(FUNC_GETTOKENWEIGHT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getTokenWeightAt(String token, BigInteger timestamp) {
        final Function function = new Function(FUNC_GETTOKENWEIGHTAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setTokenWeight(String token, BigInteger weight) {
        final Function function = new Function(
                FUNC_SETTOKENWEIGHT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token), 
                new org.web3j.abi.datatypes.generated.Uint208(weight)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<BigInteger> stakeToVotingPower(String vault, BigInteger stake,
            byte[] extraData) {
        final Function function = new Function(FUNC_STAKETOVOTINGPOWER, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.generated.Uint256(stake), 
                new org.web3j.abi.datatypes.DynamicBytes(extraData)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> stakeToVotingPowerAt(String vault, BigInteger stake,
            byte[] extraData, BigInteger timestamp) {
        final Function function = new Function(FUNC_STAKETOVOTINGPOWERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.generated.Uint256(stake), 
                new org.web3j.abi.datatypes.DynamicBytes(extraData), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public static List<InitializedEventResponse> getInitializedEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(INITIALIZED_EVENT, transactionReceipt);
        ArrayList<InitializedEventResponse> responses = new ArrayList<InitializedEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InitializedEventResponse typedResponse = new InitializedEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.version = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static InitializedEventResponse getInitializedEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(INITIALIZED_EVENT, log);
        InitializedEventResponse typedResponse = new InitializedEventResponse();
        typedResponse.log = log;
        typedResponse.version = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<InitializedEventResponse> initializedEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getInitializedEventFromLog(log));
    }

    public Flowable<InitializedEventResponse> initializedEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(INITIALIZED_EVENT));
        return initializedEventFlowable(filter);
    }

    public static List<SetTokenWeightEventResponse> getSetTokenWeightEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETTOKENWEIGHT_EVENT, transactionReceipt);
        ArrayList<SetTokenWeightEventResponse> responses = new ArrayList<SetTokenWeightEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetTokenWeightEventResponse typedResponse = new SetTokenWeightEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.token = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.weight = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetTokenWeightEventResponse getSetTokenWeightEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETTOKENWEIGHT_EVENT, log);
        SetTokenWeightEventResponse typedResponse = new SetTokenWeightEventResponse();
        typedResponse.log = log;
        typedResponse.token = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.weight = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetTokenWeightEventResponse> setTokenWeightEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetTokenWeightEventFromLog(log));
    }

    public Flowable<SetTokenWeightEventResponse> setTokenWeightEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETTOKENWEIGHT_EVENT));
        return setTokenWeightEventFlowable(filter);
    }

    @Deprecated
    public static WeightedTokensVPCalc.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new WeightedTokensVPCalc.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static WeightedTokensVPCalc.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new WeightedTokensVPCalc.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static WeightedTokensVPCalc.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new WeightedTokensVPCalc.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static WeightedTokensVPCalc.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new WeightedTokensVPCalc.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class InitializedEventResponse extends BaseEventResponse {
        public BigInteger version;
    }

    public static class SetTokenWeightEventResponse extends BaseEventResponse {
        public String token;

        public BigInteger weight;
    }
}
