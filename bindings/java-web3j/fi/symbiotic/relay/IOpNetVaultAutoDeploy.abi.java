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
import org.web3j.abi.datatypes.StaticStruct;
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
public class IOpNetVaultAutoDeploy.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_VAULT_CONFIGURATOR = "VAULT_CONFIGURATOR";

    public static final String FUNC_GETAUTODEPLOYCONFIG = "getAutoDeployConfig";

    public static final String FUNC_GETAUTODEPLOYEDVAULT = "getAutoDeployedVault";

    public static final String FUNC_ISAUTODEPLOYENABLED = "isAutoDeployEnabled";

    public static final String FUNC_ISSETMAXNETWORKLIMITHOOKENABLED = "isSetMaxNetworkLimitHookEnabled";

    public static final String FUNC_SETAUTODEPLOYCONFIG = "setAutoDeployConfig";

    public static final String FUNC_SETAUTODEPLOYSTATUS = "setAutoDeployStatus";

    public static final String FUNC_SETSETMAXNETWORKLIMITHOOKSTATUS = "setSetMaxNetworkLimitHookStatus";

    public static final Event SETAUTODEPLOYCONFIG_EVENT = new Event("SetAutoDeployConfig", 
            Arrays.<TypeReference<?>>asList(new TypeReference<AutoDeployConfig>() {}));
    ;

    public static final Event SETAUTODEPLOYSTATUS_EVENT = new Event("SetAutoDeployStatus", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
    ;

    public static final Event SETSETMAXNETWORKLIMITHOOKSTATUS_EVENT = new Event("SetSetMaxNetworkLimitHookStatus", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
    ;

    public static final CustomError OPNETVAULTAUTODEPLOY_INVALIDBURNERHOOK_ERROR = new CustomError("OpNetVaultAutoDeploy_InvalidBurnerHook", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPNETVAULTAUTODEPLOY_INVALIDCOLLATERAL_ERROR = new CustomError("OpNetVaultAutoDeploy_InvalidCollateral", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPNETVAULTAUTODEPLOY_INVALIDEPOCHDURATION_ERROR = new CustomError("OpNetVaultAutoDeploy_InvalidEpochDuration", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError OPNETVAULTAUTODEPLOY_INVALIDWITHSLASHER_ERROR = new CustomError("OpNetVaultAutoDeploy_InvalidWithSlasher", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IOpNetVaultAutoDeploy.abi(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IOpNetVaultAutoDeploy.abi(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IOpNetVaultAutoDeploy.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IOpNetVaultAutoDeploy.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<String> VAULT_CONFIGURATOR() {
        final Function function = new Function(FUNC_VAULT_CONFIGURATOR, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<AutoDeployConfig> getAutoDeployConfig() {
        final Function function = new Function(FUNC_GETAUTODEPLOYCONFIG, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<AutoDeployConfig>() {}));
        return executeRemoteCallSingleValueReturn(function, AutoDeployConfig.class);
    }

    public RemoteFunctionCall<String> getAutoDeployedVault(String operator) {
        final Function function = new Function(FUNC_GETAUTODEPLOYEDVAULT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<Boolean> isAutoDeployEnabled() {
        final Function function = new Function(FUNC_ISAUTODEPLOYENABLED, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isSetMaxNetworkLimitHookEnabled() {
        final Function function = new Function(FUNC_ISSETMAXNETWORKLIMITHOOKENABLED, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setAutoDeployConfig(AutoDeployConfig config) {
        final Function function = new Function(
                FUNC_SETAUTODEPLOYCONFIG, 
                Arrays.<Type>asList(config), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setAutoDeployStatus(Boolean status) {
        final Function function = new Function(
                FUNC_SETAUTODEPLOYSTATUS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Bool(status)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setSetMaxNetworkLimitHookStatus(Boolean status) {
        final Function function = new Function(
                FUNC_SETSETMAXNETWORKLIMITHOOKSTATUS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Bool(status)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<SetAutoDeployConfigEventResponse> getSetAutoDeployConfigEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETAUTODEPLOYCONFIG_EVENT, transactionReceipt);
        ArrayList<SetAutoDeployConfigEventResponse> responses = new ArrayList<SetAutoDeployConfigEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetAutoDeployConfigEventResponse typedResponse = new SetAutoDeployConfigEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.config = (AutoDeployConfig) eventValues.getNonIndexedValues().get(0);
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetAutoDeployConfigEventResponse getSetAutoDeployConfigEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETAUTODEPLOYCONFIG_EVENT, log);
        SetAutoDeployConfigEventResponse typedResponse = new SetAutoDeployConfigEventResponse();
        typedResponse.log = log;
        typedResponse.config = (AutoDeployConfig) eventValues.getNonIndexedValues().get(0);
        return typedResponse;
    }

    public Flowable<SetAutoDeployConfigEventResponse> setAutoDeployConfigEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetAutoDeployConfigEventFromLog(log));
    }

    public Flowable<SetAutoDeployConfigEventResponse> setAutoDeployConfigEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETAUTODEPLOYCONFIG_EVENT));
        return setAutoDeployConfigEventFlowable(filter);
    }

    public static List<SetAutoDeployStatusEventResponse> getSetAutoDeployStatusEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETAUTODEPLOYSTATUS_EVENT, transactionReceipt);
        ArrayList<SetAutoDeployStatusEventResponse> responses = new ArrayList<SetAutoDeployStatusEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetAutoDeployStatusEventResponse typedResponse = new SetAutoDeployStatusEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.status = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetAutoDeployStatusEventResponse getSetAutoDeployStatusEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETAUTODEPLOYSTATUS_EVENT, log);
        SetAutoDeployStatusEventResponse typedResponse = new SetAutoDeployStatusEventResponse();
        typedResponse.log = log;
        typedResponse.status = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetAutoDeployStatusEventResponse> setAutoDeployStatusEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetAutoDeployStatusEventFromLog(log));
    }

    public Flowable<SetAutoDeployStatusEventResponse> setAutoDeployStatusEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETAUTODEPLOYSTATUS_EVENT));
        return setAutoDeployStatusEventFlowable(filter);
    }

    public static List<SetSetMaxNetworkLimitHookStatusEventResponse> getSetSetMaxNetworkLimitHookStatusEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETSETMAXNETWORKLIMITHOOKSTATUS_EVENT, transactionReceipt);
        ArrayList<SetSetMaxNetworkLimitHookStatusEventResponse> responses = new ArrayList<SetSetMaxNetworkLimitHookStatusEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetSetMaxNetworkLimitHookStatusEventResponse typedResponse = new SetSetMaxNetworkLimitHookStatusEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.status = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetSetMaxNetworkLimitHookStatusEventResponse getSetSetMaxNetworkLimitHookStatusEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETSETMAXNETWORKLIMITHOOKSTATUS_EVENT, log);
        SetSetMaxNetworkLimitHookStatusEventResponse typedResponse = new SetSetMaxNetworkLimitHookStatusEventResponse();
        typedResponse.log = log;
        typedResponse.status = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetSetMaxNetworkLimitHookStatusEventResponse> setSetMaxNetworkLimitHookStatusEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetSetMaxNetworkLimitHookStatusEventFromLog(log));
    }

    public Flowable<SetSetMaxNetworkLimitHookStatusEventResponse> setSetMaxNetworkLimitHookStatusEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETSETMAXNETWORKLIMITHOOKSTATUS_EVENT));
        return setSetMaxNetworkLimitHookStatusEventFlowable(filter);
    }

    @Deprecated
    public static IOpNetVaultAutoDeploy.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOpNetVaultAutoDeploy.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IOpNetVaultAutoDeploy.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IOpNetVaultAutoDeploy.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IOpNetVaultAutoDeploy.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IOpNetVaultAutoDeploy.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IOpNetVaultAutoDeploy.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IOpNetVaultAutoDeploy.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class AutoDeployConfig extends StaticStruct {
        public BigInteger epochDuration;

        public String collateral;

        public String burner;

        public Boolean withSlasher;

        public Boolean isBurnerHook;

        public AutoDeployConfig(BigInteger epochDuration, String collateral, String burner,
                Boolean withSlasher, Boolean isBurnerHook) {
            super(new org.web3j.abi.datatypes.generated.Uint48(epochDuration), 
                    new org.web3j.abi.datatypes.Address(160, collateral), 
                    new org.web3j.abi.datatypes.Address(160, burner), 
                    new org.web3j.abi.datatypes.Bool(withSlasher), 
                    new org.web3j.abi.datatypes.Bool(isBurnerHook));
            this.epochDuration = epochDuration;
            this.collateral = collateral;
            this.burner = burner;
            this.withSlasher = withSlasher;
            this.isBurnerHook = isBurnerHook;
        }

        public AutoDeployConfig(Uint48 epochDuration, Address collateral, Address burner,
                Bool withSlasher, Bool isBurnerHook) {
            super(epochDuration, collateral, burner, withSlasher, isBurnerHook);
            this.epochDuration = epochDuration.getValue();
            this.collateral = collateral.getValue();
            this.burner = burner.getValue();
            this.withSlasher = withSlasher.getValue();
            this.isBurnerHook = isBurnerHook.getValue();
        }
    }

    public static class SetAutoDeployConfigEventResponse extends BaseEventResponse {
        public AutoDeployConfig config;
    }

    public static class SetAutoDeployStatusEventResponse extends BaseEventResponse {
        public Boolean status;
    }

    public static class SetSetMaxNetworkLimitHookStatusEventResponse extends BaseEventResponse {
        public Boolean status;
    }
}
