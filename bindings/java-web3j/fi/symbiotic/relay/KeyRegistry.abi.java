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
import org.web3j.abi.datatypes.Utf8String;
import org.web3j.abi.datatypes.generated.Bytes1;
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.abi.datatypes.generated.Uint64;
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
import org.web3j.tuples.generated.Tuple7;
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
public class KeyRegistry.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC___KEYREGISTRY_INIT = "__KeyRegistry_init";

    public static final String FUNC_EIP712DOMAIN = "eip712Domain";

    public static final String FUNC_GETKEY = "getKey";

    public static final String FUNC_GETKEYAT = "getKeyAt";

    public static final String FUNC_getKeys = "getKeys";

    public static final String FUNC_getKeysAt = "getKeysAt";

    public static final String FUNC_GETKEYSOPERATORS = "getKeysOperators";

    public static final String FUNC_GETKEYSOPERATORSAT = "getKeysOperatorsAt";

    public static final String FUNC_GETKEYSOPERATORSLENGTH = "getKeysOperatorsLength";

    public static final String FUNC_GETOPERATOR = "getOperator";

    public static final String FUNC_HASHTYPEDDATAV4 = "hashTypedDataV4";

    public static final String FUNC_HASHTYPEDDATAV4CROSSCHAIN = "hashTypedDataV4CrossChain";

    public static final String FUNC_MULTICALL = "multicall";

    public static final String FUNC_SETKEY = "setKey";

    public static final Event EIP712DOMAINCHANGED_EVENT = new Event("EIP712DomainChanged", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final Event INITEIP712_EVENT = new Event("InitEIP712", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}));
    ;

    public static final Event INITIALIZED_EVENT = new Event("Initialized", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint64>() {}));
    ;

    public static final Event SETKEY_EVENT = new Event("SetKey", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Uint8>(true) {}, new TypeReference<DynamicBytes>(true) {}, new TypeReference<DynamicBytes>() {}));
    ;

    public static final CustomError ADDRESSEMPTYCODE_ERROR = new CustomError("AddressEmptyCode", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
    ;

    public static final CustomError CHECKPOINTUNORDEREDINSERTION_ERROR = new CustomError("CheckpointUnorderedInsertion", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError FAILEDCALL_ERROR = new CustomError("FailedCall", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError INVALIDINITIALIZATION_ERROR = new CustomError("InvalidInitialization", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError INVALIDKEYTAG_ERROR = new CustomError("InvalidKeyTag", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError KEYBLSBN12381_INVALIDBYTES_ERROR = new CustomError("KeyBlsBn12381_InvalidBytes", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError KEYBLSBN12381_INVALIDKEY_ERROR = new CustomError("KeyBlsBn12381_InvalidKey", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError KEYBLSBN254_INVALIDBYTES_ERROR = new CustomError("KeyBlsBn254_InvalidBytes", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError KEYBLSBN254_INVALIDKEY_ERROR = new CustomError("KeyBlsBn254_InvalidKey", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError KEYECDSASECP256K1_INVALIDBYTES_ERROR = new CustomError("KeyEcdsaSecp256k1_InvalidBytes", 
            Arrays.<TypeReference<?>>asList());
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

    public static final CustomError NOTINITIALIZING_ERROR = new CustomError("NotInitializing", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGBLSBN12381_INVALIDMESSAGELENGTH_ERROR = new CustomError("SigBlsBn12381_InvalidMessageLength", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGBLSBN254_INVALIDMESSAGELENGTH_ERROR = new CustomError("SigBlsBn254_InvalidMessageLength", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGECDSASECP256K1_INVALIDMESSAGELENGTH_ERROR = new CustomError("SigEcdsaSecp256k1_InvalidMessageLength", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected KeyRegistry.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected KeyRegistry.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected KeyRegistry.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected KeyRegistry.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<TransactionReceipt> __KeyRegistry_init(
            KeyRegistryInitParams keyRegistryInitParams) {
        final Function function = new Function(
                FUNC___KEYREGISTRY_INIT, 
                Arrays.<Type>asList(keyRegistryInitParams), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<Tuple7<byte[], String, String, BigInteger, String, byte[], List<BigInteger>>> eip712Domain(
            ) {
        final Function function = new Function(FUNC_EIP712DOMAIN, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes1>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Uint256>() {}, new TypeReference<Address>() {}, new TypeReference<Bytes32>() {}, new TypeReference<DynamicArray<Uint256>>() {}));
        return new RemoteFunctionCall<Tuple7<byte[], String, String, BigInteger, String, byte[], List<BigInteger>>>(function,
                new Callable<Tuple7<byte[], String, String, BigInteger, String, byte[], List<BigInteger>>>() {
                    @Override
                    public Tuple7<byte[], String, String, BigInteger, String, byte[], List<BigInteger>> call(
                            ) throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple7<byte[], String, String, BigInteger, String, byte[], List<BigInteger>>(
                                (byte[]) results.get(0).getValue(), 
                                (String) results.get(1).getValue(), 
                                (String) results.get(2).getValue(), 
                                (BigInteger) results.get(3).getValue(), 
                                (String) results.get(4).getValue(), 
                                (byte[]) results.get(5).getValue(), 
                                convertToNative((List<Uint256>) results.get(6).getValue()));
                    }
                });
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

    public RemoteFunctionCall<byte[]> hashTypedDataV4(byte[] structHash) {
        final Function function = new Function(FUNC_HASHTYPEDDATAV4, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Bytes32(structHash)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<byte[]> hashTypedDataV4CrossChain(byte[] structHash) {
        final Function function = new Function(FUNC_HASHTYPEDDATAV4CROSSCHAIN, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Bytes32(structHash)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<TransactionReceipt> multicall(List<byte[]> data) {
        final Function function = new Function(
                FUNC_MULTICALL, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.DynamicArray<org.web3j.abi.datatypes.DynamicBytes>(
                        org.web3j.abi.datatypes.DynamicBytes.class,
                        org.web3j.abi.Utils.typeMap(data, org.web3j.abi.datatypes.DynamicBytes.class))), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
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

    public static List<EIP712DomainChangedEventResponse> getEIP712DomainChangedEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(EIP712DOMAINCHANGED_EVENT, transactionReceipt);
        ArrayList<EIP712DomainChangedEventResponse> responses = new ArrayList<EIP712DomainChangedEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            EIP712DomainChangedEventResponse typedResponse = new EIP712DomainChangedEventResponse();
            typedResponse.log = eventValues.getLog();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static EIP712DomainChangedEventResponse getEIP712DomainChangedEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(EIP712DOMAINCHANGED_EVENT, log);
        EIP712DomainChangedEventResponse typedResponse = new EIP712DomainChangedEventResponse();
        typedResponse.log = log;
        return typedResponse;
    }

    public Flowable<EIP712DomainChangedEventResponse> eIP712DomainChangedEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getEIP712DomainChangedEventFromLog(log));
    }

    public Flowable<EIP712DomainChangedEventResponse> eIP712DomainChangedEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(EIP712DOMAINCHANGED_EVENT));
        return eIP712DomainChangedEventFlowable(filter);
    }

    public static List<InitEIP712EventResponse> getInitEIP712Events(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(INITEIP712_EVENT, transactionReceipt);
        ArrayList<InitEIP712EventResponse> responses = new ArrayList<InitEIP712EventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InitEIP712EventResponse typedResponse = new InitEIP712EventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.name = (String) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.version = (String) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static InitEIP712EventResponse getInitEIP712EventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(INITEIP712_EVENT, log);
        InitEIP712EventResponse typedResponse = new InitEIP712EventResponse();
        typedResponse.log = log;
        typedResponse.name = (String) eventValues.getNonIndexedValues().get(0).getValue();
        typedResponse.version = (String) eventValues.getNonIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<InitEIP712EventResponse> initEIP712EventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getInitEIP712EventFromLog(log));
    }

    public Flowable<InitEIP712EventResponse> initEIP712EventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(INITEIP712_EVENT));
        return initEIP712EventFlowable(filter);
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
    public static KeyRegistry.abi load(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        return new KeyRegistry.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static KeyRegistry.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new KeyRegistry.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static KeyRegistry.abi load(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        return new KeyRegistry.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static KeyRegistry.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new KeyRegistry.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class OzEIP712InitParams extends DynamicStruct {
        public String name;

        public String version;

        public OzEIP712InitParams(String name, String version) {
            super(new org.web3j.abi.datatypes.Utf8String(name), 
                    new org.web3j.abi.datatypes.Utf8String(version));
            this.name = name;
            this.version = version;
        }

        public OzEIP712InitParams(Utf8String name, Utf8String version) {
            super(name, version);
            this.name = name.getValue();
            this.version = version.getValue();
        }
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

    public static class KeyRegistryInitParams extends DynamicStruct {
        public OzEIP712InitParams ozEip712InitParams;

        public KeyRegistryInitParams(OzEIP712InitParams ozEip712InitParams) {
            super(ozEip712InitParams);
            this.ozEip712InitParams = ozEip712InitParams;
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

    public static class EIP712DomainChangedEventResponse extends BaseEventResponse {
    }

    public static class InitEIP712EventResponse extends BaseEventResponse {
        public String name;

        public String version;
    }

    public static class InitializedEventResponse extends BaseEventResponse {
        public BigInteger version;
    }

    public static class SetKeyEventResponse extends BaseEventResponse {
        public String operator;

        public BigInteger tag;

        public byte[] key;

        public byte[] extraData;
    }
}
