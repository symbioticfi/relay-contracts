package fi.symbiotic.relay;

import io.reactivex.Flowable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.Bytes4;
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
public class IOzAccessControl.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_GETROLE = "getRole";

    public static final Event SETSELECTORROLE_EVENT = new Event("SetSelectorRole", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Bytes4>(true) {}, new TypeReference<Bytes32>(true) {}));
    ;

    @Deprecated
    protected IOzAccessControl.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IOzAccessControl.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IOzAccessControl.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IOzAccessControl.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<byte[]> getRole(byte[] selector) {
        final Function function = new Function(FUNC_GETROLE, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Bytes4(selector)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public static List<SetSelectorRoleEventResponse> getSetSelectorRoleEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETSELECTORROLE_EVENT, transactionReceipt);
        ArrayList<SetSelectorRoleEventResponse> responses = new ArrayList<SetSelectorRoleEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetSelectorRoleEventResponse typedResponse = new SetSelectorRoleEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.selector = (byte[]) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.role = (byte[]) eventValues.getIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetSelectorRoleEventResponse getSetSelectorRoleEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETSELECTORROLE_EVENT, log);
        SetSelectorRoleEventResponse typedResponse = new SetSelectorRoleEventResponse();
        typedResponse.log = log;
        typedResponse.selector = (byte[]) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.role = (byte[]) eventValues.getIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<SetSelectorRoleEventResponse> setSelectorRoleEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetSelectorRoleEventFromLog(log));
    }

    public Flowable<SetSelectorRoleEventResponse> setSelectorRoleEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETSELECTORROLE_EVENT));
        return setSelectorRoleEventFlowable(filter);
    }

    @Deprecated
    public static IOzAccessControl.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOzAccessControl.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IOzAccessControl.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOzAccessControl.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IOzAccessControl.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IOzAccessControl.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IOzAccessControl.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IOzAccessControl.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class SetSelectorRoleEventResponse extends BaseEventResponse {
        public byte[] selector;

        public byte[] role;
    }
}
