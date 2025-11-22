package fi.symbiotic.relay;

import io.reactivex.Flowable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.CustomError;
import org.web3j.abi.datatypes.DynamicArray;
import org.web3j.abi.datatypes.DynamicBytes;
import org.web3j.abi.datatypes.DynamicStruct;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.abi.datatypes.generated.Uint8;
import org.web3j.abi.datatypes.reflection.Parameterized;
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
public class IKeyRegistry.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_GETKEY = "getKey";

    public static final String FUNC_GETKEYAT = "getKeyAt";

    public static final String FUNC_getKeys = "getKeys";

    public static final String FUNC_getKeysAt = "getKeysAt";

    public static final String FUNC_GETKEYSOPERATORS = "getKeysOperators";

    public static final String FUNC_GETKEYSOPERATORSAT = "getKeysOperatorsAt";

    public static final String FUNC_GETKEYSOPERATORSLENGTH = "getKeysOperatorsLength";

    public static final String FUNC_GETOPERATOR = "getOperator";

    public static final String FUNC_SETKEY = "setKey";

    public static final Event SETKEY_EVENT = new Event("SetKey", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Uint8>(true) {}, new TypeReference<DynamicBytes>(true) {}, new TypeReference<DynamicBytes>() {}));
    ;

    public static final CustomError KEYREGISTRY_ALREADYUSED_ERROR = new CustomError("KeyRegistry_AlreadyUsed", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError KEYREGISTRY_INVALIDKEYSIGNATURE_ERROR = new CustomError("KeyRegistry_InvalidKeySignature", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError KEYREGISTRY_INVALIDKEYTYPE_ERROR = new CustomError("KeyRegistry_InvalidKeyType", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IKeyRegistry.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IKeyRegistry.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IKeyRegistry.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IKeyRegistry.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<byte[]> getKey(String operator, BigInteger tag) {
        final Function function = new Function(FUNC_GETKEY, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint8(tag)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicBytes>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<byte[]> getKeyAt(String operator, BigInteger tag,
            BigInteger timestamp) {
        final Function function = new Function(FUNC_GETKEYAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint8(tag), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicBytes>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<List> getKeys() {
        final Function function = new Function(FUNC_getKeys, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<OperatorWithKeys>>() {}));
        return new RemoteFunctionCall<List>(function,
                new Callable<List>() {
                    @Override
                    @SuppressWarnings("unchecked")
                    public List call() throws Exception {
                        List<Type> result = (List<Type>) executeCallSingleValueReturn(function, List.class);
                        return convertToNative(result);
                    }
                });
    }

    public RemoteFunctionCall<List> getKeys(String operator) {
        final Function function = new Function(FUNC_getKeys, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<Key>>() {}));
        return new RemoteFunctionCall<List>(function,
                new Callable<List>() {
                    @Override
                    @SuppressWarnings("unchecked")
                    public List call() throws Exception {
                        List<Type> result = (List<Type>) executeCallSingleValueReturn(function, List.class);
                        return convertToNative(result);
                    }
                });
    }

    public RemoteFunctionCall<List> getKeysAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_getKeysAt, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<OperatorWithKeys>>() {}));
        return new RemoteFunctionCall<List>(function,
                new Callable<List>() {
                    @Override
                    @SuppressWarnings("unchecked")
                    public List call() throws Exception {
                        List<Type> result = (List<Type>) executeCallSingleValueReturn(function, List.class);
                        return convertToNative(result);
                    }
                });
    }

    public RemoteFunctionCall<List> getKeysAt(String operator, BigInteger timestamp) {
        final Function function = new Function(FUNC_getKeysAt, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<Key>>() {}));
        return new RemoteFunctionCall<List>(function,
                new Callable<List>() {
                    @Override
                    @SuppressWarnings("unchecked")
                    public List call() throws Exception {
                        List<Type> result = (List<Type>) executeCallSingleValueReturn(function, List.class);
                        return convertToNative(result);
                    }
                });
    }

    public RemoteFunctionCall<List> getKeysOperators() {
        final Function function = new Function(FUNC_GETKEYSOPERATORS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<Address>>() {}));
        return new RemoteFunctionCall<List>(function,
                new Callable<List>() {
                    @Override
                    @SuppressWarnings("unchecked")
                    public List call() throws Exception {
                        List<Type> result = (List<Type>) executeCallSingleValueReturn(function, List.class);
                        return convertToNative(result);
                    }
                });
    }

    public RemoteFunctionCall<List> getKeysOperatorsAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETKEYSOPERATORSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<Address>>() {}));
        return new RemoteFunctionCall<List>(function,
                new Callable<List>() {
                    @Override
                    @SuppressWarnings("unchecked")
                    public List call() throws Exception {
                        List<Type> result = (List<Type>) executeCallSingleValueReturn(function, List.class);
                        return convertToNative(result);
                    }
                });
    }

    public RemoteFunctionCall<BigInteger> getKeysOperatorsLength() {
        final Function function = new Function(FUNC_GETKEYSOPERATORSLENGTH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<String> getOperator(byte[] key) {
        final Function function = new Function(FUNC_GETOPERATOR, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.DynamicBytes(key)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setKey(BigInteger tag, byte[] key,
            byte[] signature, byte[] extraData) {
        final Function function = new Function(
                FUNC_SETKEY, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint8(tag), 
                new org.web3j.abi.datatypes.DynamicBytes(key), 
                new org.web3j.abi.datatypes.DynamicBytes(signature), 
                new org.web3j.abi.datatypes.DynamicBytes(extraData)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<SetKeyEventResponse> getSetKeyEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETKEY_EVENT, transactionReceipt);
        ArrayList<SetKeyEventResponse> responses = new ArrayList<SetKeyEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetKeyEventResponse typedResponse = new SetKeyEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.tag = (BigInteger) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.key = (byte[]) eventValues.getIndexedValues().get(2).getValue();
            typedResponse.extraData = (byte[]) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetKeyEventResponse getSetKeyEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETKEY_EVENT, log);
        SetKeyEventResponse typedResponse = new SetKeyEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.tag = (BigInteger) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.key = (byte[]) eventValues.getIndexedValues().get(2).getValue();
        typedResponse.extraData = (byte[]) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetKeyEventResponse> setKeyEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetKeyEventFromLog(log));
    }

    public Flowable<SetKeyEventResponse> setKeyEventFlowable(DefaultBlockParameter startBlock,
            DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETKEY_EVENT));
        return setKeyEventFlowable(filter);
    }

    @Deprecated
    public static IKeyRegistry.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IKeyRegistry.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IKeyRegistry.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IKeyRegistry.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IKeyRegistry.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IKeyRegistry.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IKeyRegistry.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IKeyRegistry.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class Key extends DynamicStruct {
        public BigInteger tag;

        public byte[] payload;

        public Key(BigInteger tag, byte[] payload) {
            super(new org.web3j.abi.datatypes.generated.Uint8(tag), 
                    new org.web3j.abi.datatypes.DynamicBytes(payload));
            this.tag = tag;
            this.payload = payload;
        }

        public Key(Uint8 tag, DynamicBytes payload) {
            super(tag, payload);
            this.tag = tag.getValue();
            this.payload = payload.getValue();
        }
    }

    public static class OperatorWithKeys extends DynamicStruct {
        public String operator;

        public List<Key> keys;

        public OperatorWithKeys(String operator, List<Key> keys) {
            super(new org.web3j.abi.datatypes.Address(160, operator), 
                    new org.web3j.abi.datatypes.DynamicArray<Key>(Key.class, keys));
            this.operator = operator;
            this.keys = keys;
        }

        public OperatorWithKeys(Address operator,
                @Parameterized(type = Key.class) DynamicArray<Key> keys) {
            super(operator, keys);
            this.operator = operator.getValue();
            this.keys = keys.getValue();
        }
    }

    public static class SetKeyEventResponse extends BaseEventResponse {
        public String operator;

        public BigInteger tag;

        public byte[] key;

        public byte[] extraData;
    }
}
