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
import org.web3j.abi.datatypes.Array;
import org.web3j.abi.datatypes.Bool;
import org.web3j.abi.datatypes.CustomError;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.StaticArray2;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.abi.datatypes.generated.Uint48;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.RemoteFunctionCall;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.BaseEventResponse;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tuples.generated.Tuple3;
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
public class IPricedTokensChainlinkVPCalc.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_GETTOKENHOPS = "getTokenHops";

    public static final String FUNC_GETTOKENHOPSAT = "getTokenHopsAt";

    public static final String FUNC_GETTOKENPRICE = "getTokenPrice";

    public static final String FUNC_GETTOKENPRICEAT = "getTokenPriceAt";

    public static final String FUNC_SETTOKENHOPS = "setTokenHops";

    public static final Event SETTOKENHOPS_EVENT = new Event("SetTokenHops", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<StaticArray2<Address>>() {}, new TypeReference<StaticArray2<Bool>>() {}, new TypeReference<StaticArray2<Uint48>>() {}));
    ;

    public static final CustomError PRICEDTOKENSCHAINLINKVPCALC_INVALIDAGGREGATOR_ERROR = new CustomError("PricedTokensChainlinkVPCalc_InvalidAggregator", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IPricedTokensChainlinkVPCalc.abi(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IPricedTokensChainlinkVPCalc.abi(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IPricedTokensChainlinkVPCalc.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IPricedTokensChainlinkVPCalc.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<Tuple3<List<String>, List<Boolean>, List<BigInteger>>> getTokenHops(
            String token) {
        final Function function = new Function(FUNC_GETTOKENHOPS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<StaticArray2<Address>>() {}, new TypeReference<StaticArray2<Bool>>() {}, new TypeReference<StaticArray2<Uint48>>() {}));
        return new RemoteFunctionCall<Tuple3<List<String>, List<Boolean>, List<BigInteger>>>(function,
                new Callable<Tuple3<List<String>, List<Boolean>, List<BigInteger>>>() {
                    @Override
                    public Tuple3<List<String>, List<Boolean>, List<BigInteger>> call() throws
                            Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple3<List<String>, List<Boolean>, List<BigInteger>>(
                                convertToNative((List<Address>) results.get(0).getValue()), 
                                convertToNative((List<Bool>) results.get(1).getValue()), 
                                convertToNative((List<Uint48>) results.get(2).getValue()));
                    }
                });
    }

    public RemoteFunctionCall<Tuple3<List<String>, List<Boolean>, List<BigInteger>>> getTokenHopsAt(
            String token, BigInteger timestamp) {
        final Function function = new Function(FUNC_GETTOKENHOPSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<StaticArray2<Address>>() {}, new TypeReference<StaticArray2<Bool>>() {}, new TypeReference<StaticArray2<Uint48>>() {}));
        return new RemoteFunctionCall<Tuple3<List<String>, List<Boolean>, List<BigInteger>>>(function,
                new Callable<Tuple3<List<String>, List<Boolean>, List<BigInteger>>>() {
                    @Override
                    public Tuple3<List<String>, List<Boolean>, List<BigInteger>> call() throws
                            Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple3<List<String>, List<Boolean>, List<BigInteger>>(
                                convertToNative((List<Address>) results.get(0).getValue()), 
                                convertToNative((List<Bool>) results.get(1).getValue()), 
                                convertToNative((List<Uint48>) results.get(2).getValue()));
                    }
                });
    }

    public RemoteFunctionCall<BigInteger> getTokenPrice(String token) {
        final Function function = new Function(FUNC_GETTOKENPRICE, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getTokenPriceAt(String token, BigInteger timestamp) {
        final Function function = new Function(FUNC_GETTOKENPRICEAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setTokenHops(String token,
            List<String> aggregators, List<Boolean> inverts, List<BigInteger> stalenessDurations) {
        final Function function = new Function(
                FUNC_SETTOKENHOPS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token), 
                new org.web3j.abi.datatypes.generated.StaticArray2<org.web3j.abi.datatypes.Address>(
                        org.web3j.abi.datatypes.Address.class,
                        org.web3j.abi.Utils.typeMap(aggregators, org.web3j.abi.datatypes.Address.class)), 
                new org.web3j.abi.datatypes.generated.StaticArray2<org.web3j.abi.datatypes.Bool>(
                        org.web3j.abi.datatypes.Bool.class,
                        org.web3j.abi.Utils.typeMap(inverts, org.web3j.abi.datatypes.Bool.class)), 
                new org.web3j.abi.datatypes.generated.StaticArray2<org.web3j.abi.datatypes.generated.Uint48>(
                        org.web3j.abi.datatypes.generated.Uint48.class,
                        org.web3j.abi.Utils.typeMap(stalenessDurations, org.web3j.abi.datatypes.generated.Uint48.class))), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<SetTokenHopsEventResponse> getSetTokenHopsEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETTOKENHOPS_EVENT, transactionReceipt);
        ArrayList<SetTokenHopsEventResponse> responses = new ArrayList<SetTokenHopsEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetTokenHopsEventResponse typedResponse = new SetTokenHopsEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.token = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.aggregators = (List<String>) ((Array) eventValues.getNonIndexedValues().get(0)).getNativeValueCopy();
            typedResponse.inverts = (List<Boolean>) ((Array) eventValues.getNonIndexedValues().get(1)).getNativeValueCopy();
            typedResponse.stalenessDurations = (List<BigInteger>) ((Array) eventValues.getNonIndexedValues().get(2)).getNativeValueCopy();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetTokenHopsEventResponse getSetTokenHopsEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETTOKENHOPS_EVENT, log);
        SetTokenHopsEventResponse typedResponse = new SetTokenHopsEventResponse();
        typedResponse.log = log;
        typedResponse.token = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.aggregators = (List<String>) ((Array) eventValues.getNonIndexedValues().get(0)).getNativeValueCopy();
        typedResponse.inverts = (List<Boolean>) ((Array) eventValues.getNonIndexedValues().get(1)).getNativeValueCopy();
        typedResponse.stalenessDurations = (List<BigInteger>) ((Array) eventValues.getNonIndexedValues().get(2)).getNativeValueCopy();
        return typedResponse;
    }

    public Flowable<SetTokenHopsEventResponse> setTokenHopsEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetTokenHopsEventFromLog(log));
    }

    public Flowable<SetTokenHopsEventResponse> setTokenHopsEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETTOKENHOPS_EVENT));
        return setTokenHopsEventFlowable(filter);
    }

    @Deprecated
    public static IPricedTokensChainlinkVPCalc.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IPricedTokensChainlinkVPCalc.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IPricedTokensChainlinkVPCalc.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IPricedTokensChainlinkVPCalc.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IPricedTokensChainlinkVPCalc.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IPricedTokensChainlinkVPCalc.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IPricedTokensChainlinkVPCalc.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IPricedTokensChainlinkVPCalc.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class SetTokenHopsEventResponse extends BaseEventResponse {
        public String token;

        public List<String> aggregators;

        public List<Boolean> inverts;

        public List<BigInteger> stalenessDurations;
    }
}
