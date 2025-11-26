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
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.Uint96;
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
public class INetworkManager.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_NETWORK = "NETWORK";

    public static final String FUNC_SUBNETWORK = "SUBNETWORK";

    public static final String FUNC_SUBNETWORK_IDENTIFIER = "SUBNETWORK_IDENTIFIER";

    public static final String FUNC_STATICDELEGATECALL = "staticDelegateCall";

    public static final Event INITSUBNETWORK_EVENT = new Event("InitSubnetwork", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Uint96>() {}));
    ;

    public static final CustomError NETWORKMANAGER_INVALIDNETWORK_ERROR = new CustomError("NetworkManager_InvalidNetwork", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected INetworkManager.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected INetworkManager.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected INetworkManager.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected INetworkManager.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<String> NETWORK() {
        final Function function = new Function(FUNC_NETWORK, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<byte[]> SUBNETWORK() {
        final Function function = new Function(FUNC_SUBNETWORK, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<BigInteger> SUBNETWORK_IDENTIFIER() {
        final Function function = new Function(FUNC_SUBNETWORK_IDENTIFIER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint96>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<TransactionReceipt> staticDelegateCall(String target, byte[] data) {
        final Function function = new Function(
                FUNC_STATICDELEGATECALL, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, target), 
                new org.web3j.abi.datatypes.DynamicBytes(data)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<InitSubnetworkEventResponse> getInitSubnetworkEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(INITSUBNETWORK_EVENT, transactionReceipt);
        ArrayList<InitSubnetworkEventResponse> responses = new ArrayList<InitSubnetworkEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InitSubnetworkEventResponse typedResponse = new InitSubnetworkEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.network = (String) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.subnetworkId = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static InitSubnetworkEventResponse getInitSubnetworkEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(INITSUBNETWORK_EVENT, log);
        InitSubnetworkEventResponse typedResponse = new InitSubnetworkEventResponse();
        typedResponse.log = log;
        typedResponse.network = (String) eventValues.getNonIndexedValues().get(0).getValue();
        typedResponse.subnetworkId = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<InitSubnetworkEventResponse> initSubnetworkEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getInitSubnetworkEventFromLog(log));
    }

    public Flowable<InitSubnetworkEventResponse> initSubnetworkEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(INITSUBNETWORK_EVENT));
        return initSubnetworkEventFlowable(filter);
    }

    @Deprecated
    public static INetworkManager.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new INetworkManager.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static INetworkManager.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new INetworkManager.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static INetworkManager.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new INetworkManager.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static INetworkManager.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new INetworkManager.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class InitSubnetworkEventResponse extends BaseEventResponse {
        public String network;

        public BigInteger subnetworkId;
    }
}
