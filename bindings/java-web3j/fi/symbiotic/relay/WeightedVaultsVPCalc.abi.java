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
public class WeightedVaultsVPCalc.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_GETVAULTWEIGHT = "getVaultWeight";

    public static final String FUNC_GETVAULTWEIGHTAT = "getVaultWeightAt";

    public static final String FUNC_SETVAULTWEIGHT = "setVaultWeight";

    public static final String FUNC_STAKETOVOTINGPOWER = "stakeToVotingPower";

    public static final String FUNC_STAKETOVOTINGPOWERAT = "stakeToVotingPowerAt";

    public static final Event INITIALIZED_EVENT = new Event("Initialized", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint64>() {}));
    ;

    public static final Event SETVAULTWEIGHT_EVENT = new Event("SetVaultWeight", 
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

    public static final CustomError WEIGHTEDVAULTSVPCALC_TOOLARGEWEIGHT_ERROR = new CustomError("WeightedVaultsVPCalc_TooLargeWeight", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected WeightedVaultsVPCalc.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected WeightedVaultsVPCalc.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected WeightedVaultsVPCalc.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected WeightedVaultsVPCalc.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<BigInteger> getVaultWeight(String vault) {
        final Function function = new Function(FUNC_GETVAULTWEIGHT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getVaultWeightAt(String vault, BigInteger timestamp) {
        final Function function = new Function(FUNC_GETVAULTWEIGHTAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setVaultWeight(String vault, BigInteger weight) {
        final Function function = new Function(
                FUNC_SETVAULTWEIGHT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault), 
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

    public static List<SetVaultWeightEventResponse> getSetVaultWeightEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETVAULTWEIGHT_EVENT, transactionReceipt);
        ArrayList<SetVaultWeightEventResponse> responses = new ArrayList<SetVaultWeightEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetVaultWeightEventResponse typedResponse = new SetVaultWeightEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.vault = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.weight = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetVaultWeightEventResponse getSetVaultWeightEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETVAULTWEIGHT_EVENT, log);
        SetVaultWeightEventResponse typedResponse = new SetVaultWeightEventResponse();
        typedResponse.log = log;
        typedResponse.vault = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.weight = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetVaultWeightEventResponse> setVaultWeightEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetVaultWeightEventFromLog(log));
    }

    public Flowable<SetVaultWeightEventResponse> setVaultWeightEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETVAULTWEIGHT_EVENT));
        return setVaultWeightEventFlowable(filter);
    }

    @Deprecated
    public static WeightedVaultsVPCalc.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new WeightedVaultsVPCalc.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static WeightedVaultsVPCalc.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new WeightedVaultsVPCalc.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static WeightedVaultsVPCalc.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new WeightedVaultsVPCalc.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static WeightedVaultsVPCalc.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new WeightedVaultsVPCalc.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class InitializedEventResponse extends BaseEventResponse {
        public BigInteger version;
    }

    public static class SetVaultWeightEventResponse extends BaseEventResponse {
        public String vault;

        public BigInteger weight;
    }
}
