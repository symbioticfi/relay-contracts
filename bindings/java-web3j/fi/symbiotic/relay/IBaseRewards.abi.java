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
import org.web3j.abi.datatypes.DynamicBytes;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Bytes32;
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
public class IBaseRewards.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_DISTRIBUTEOPERATORREWARDS = "distributeOperatorRewards";

    public static final String FUNC_DISTRIBUTESTAKERREWARDS = "distributeStakerRewards";

    public static final String FUNC_GETREWARDER = "getRewarder";

    public static final String FUNC_SETREWARDER = "setRewarder";

    public static final Event DISTRIBUTEOPERATORREWARDS_EVENT = new Event("DistributeOperatorRewards", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Address>(true) {}, new TypeReference<Uint256>() {}, new TypeReference<Bytes32>() {}));
    ;

    public static final Event DISTRIBUTESTAKERREWARDS_EVENT = new Event("DistributeStakerRewards", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Address>(true) {}, new TypeReference<Uint256>() {}, new TypeReference<DynamicBytes>() {}));
    ;

    public static final Event SETREWARDER_EVENT = new Event("SetRewarder", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
    ;

    public static final CustomError BASEREWARDS_NOTREWARDER_ERROR = new CustomError("BaseRewards_NotRewarder", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IBaseRewards.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IBaseRewards.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IBaseRewards.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IBaseRewards.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<TransactionReceipt> distributeOperatorRewards(String operatorRewards,
            String token, BigInteger amount, byte[] root) {
        final Function function = new Function(
                FUNC_DISTRIBUTEOPERATORREWARDS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operatorRewards), 
                new org.web3j.abi.datatypes.Address(160, token), 
                new org.web3j.abi.datatypes.generated.Uint256(amount), 
                new org.web3j.abi.datatypes.generated.Bytes32(root)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> distributeStakerRewards(String stakerRewards,
            String token, BigInteger amount, byte[] data) {
        final Function function = new Function(
                FUNC_DISTRIBUTESTAKERREWARDS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, stakerRewards), 
                new org.web3j.abi.datatypes.Address(160, token), 
                new org.web3j.abi.datatypes.generated.Uint256(amount), 
                new org.web3j.abi.datatypes.DynamicBytes(data)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<String> getRewarder() {
        final Function function = new Function(FUNC_GETREWARDER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setRewarder(String rewarder) {
        final Function function = new Function(
                FUNC_SETREWARDER, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, rewarder)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<DistributeOperatorRewardsEventResponse> getDistributeOperatorRewardsEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(DISTRIBUTEOPERATORREWARDS_EVENT, transactionReceipt);
        ArrayList<DistributeOperatorRewardsEventResponse> responses = new ArrayList<DistributeOperatorRewardsEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            DistributeOperatorRewardsEventResponse typedResponse = new DistributeOperatorRewardsEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operatorRewards = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.token = (String) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.amount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.root = (byte[]) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static DistributeOperatorRewardsEventResponse getDistributeOperatorRewardsEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(DISTRIBUTEOPERATORREWARDS_EVENT, log);
        DistributeOperatorRewardsEventResponse typedResponse = new DistributeOperatorRewardsEventResponse();
        typedResponse.log = log;
        typedResponse.operatorRewards = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.token = (String) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.amount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        typedResponse.root = (byte[]) eventValues.getNonIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<DistributeOperatorRewardsEventResponse> distributeOperatorRewardsEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getDistributeOperatorRewardsEventFromLog(log));
    }

    public Flowable<DistributeOperatorRewardsEventResponse> distributeOperatorRewardsEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(DISTRIBUTEOPERATORREWARDS_EVENT));
        return distributeOperatorRewardsEventFlowable(filter);
    }

    public static List<DistributeStakerRewardsEventResponse> getDistributeStakerRewardsEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(DISTRIBUTESTAKERREWARDS_EVENT, transactionReceipt);
        ArrayList<DistributeStakerRewardsEventResponse> responses = new ArrayList<DistributeStakerRewardsEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            DistributeStakerRewardsEventResponse typedResponse = new DistributeStakerRewardsEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.stakerRewards = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.token = (String) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.amount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.data = (byte[]) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static DistributeStakerRewardsEventResponse getDistributeStakerRewardsEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(DISTRIBUTESTAKERREWARDS_EVENT, log);
        DistributeStakerRewardsEventResponse typedResponse = new DistributeStakerRewardsEventResponse();
        typedResponse.log = log;
        typedResponse.stakerRewards = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.token = (String) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.amount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        typedResponse.data = (byte[]) eventValues.getNonIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<DistributeStakerRewardsEventResponse> distributeStakerRewardsEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getDistributeStakerRewardsEventFromLog(log));
    }

    public Flowable<DistributeStakerRewardsEventResponse> distributeStakerRewardsEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(DISTRIBUTESTAKERREWARDS_EVENT));
        return distributeStakerRewardsEventFlowable(filter);
    }

    public static List<SetRewarderEventResponse> getSetRewarderEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETREWARDER_EVENT, transactionReceipt);
        ArrayList<SetRewarderEventResponse> responses = new ArrayList<SetRewarderEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetRewarderEventResponse typedResponse = new SetRewarderEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.rewarder = (String) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetRewarderEventResponse getSetRewarderEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETREWARDER_EVENT, log);
        SetRewarderEventResponse typedResponse = new SetRewarderEventResponse();
        typedResponse.log = log;
        typedResponse.rewarder = (String) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetRewarderEventResponse> setRewarderEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetRewarderEventFromLog(log));
    }

    public Flowable<SetRewarderEventResponse> setRewarderEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETREWARDER_EVENT));
        return setRewarderEventFlowable(filter);
    }

    @Deprecated
    public static IBaseRewards.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IBaseRewards.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IBaseRewards.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IBaseRewards.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IBaseRewards.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IBaseRewards.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IBaseRewards.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IBaseRewards.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class DistributeOperatorRewardsEventResponse extends BaseEventResponse {
        public String operatorRewards;

        public String token;

        public BigInteger amount;

        public byte[] root;
    }

    public static class DistributeStakerRewardsEventResponse extends BaseEventResponse {
        public String stakerRewards;

        public String token;

        public BigInteger amount;

        public byte[] data;
    }

    public static class SetRewarderEventResponse extends BaseEventResponse {
        public String rewarder;
    }
}
