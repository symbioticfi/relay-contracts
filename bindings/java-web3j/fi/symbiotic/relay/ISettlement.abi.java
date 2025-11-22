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
import org.web3j.abi.datatypes.DynamicArray;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.StaticStruct;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.abi.datatypes.generated.Uint48;
import org.web3j.abi.datatypes.generated.Uint8;
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
public class ISettlement.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_VALIDATOR_SET_VERSION = "VALIDATOR_SET_VERSION";

    public static final String FUNC_COMMITVALSETHEADER = "commitValSetHeader";

    public static final String FUNC_GETCAPTURETIMESTAMPFROMVALSETHEADER = "getCaptureTimestampFromValSetHeader";

    public static final String FUNC_GETCAPTURETIMESTAMPFROMVALSETHEADERAT = "getCaptureTimestampFromValSetHeaderAt";

    public static final String FUNC_GETEXTRADATA = "getExtraData";

    public static final String FUNC_GETEXTRADATAAT = "getExtraDataAt";

    public static final String FUNC_GETLASTCOMMITTEDHEADEREPOCH = "getLastCommittedHeaderEpoch";

    public static final String FUNC_GETQUORUMTHRESHOLDFROMVALSETHEADER = "getQuorumThresholdFromValSetHeader";

    public static final String FUNC_GETQUORUMTHRESHOLDFROMVALSETHEADERAT = "getQuorumThresholdFromValSetHeaderAt";

    public static final String FUNC_GETREQUIREDKEYTAGFROMVALSETHEADER = "getRequiredKeyTagFromValSetHeader";

    public static final String FUNC_GETREQUIREDKEYTAGFROMVALSETHEADERAT = "getRequiredKeyTagFromValSetHeaderAt";

    public static final String FUNC_GETSIGVERIFIER = "getSigVerifier";

    public static final String FUNC_GETSIGVERIFIERAT = "getSigVerifierAt";

    public static final String FUNC_GETTOTALVOTINGPOWERFROMVALSETHEADER = "getTotalVotingPowerFromValSetHeader";

    public static final String FUNC_GETTOTALVOTINGPOWERFROMVALSETHEADERAT = "getTotalVotingPowerFromValSetHeaderAt";

    public static final String FUNC_GETVALSETHEADER = "getValSetHeader";

    public static final String FUNC_GETVALSETHEADERAT = "getValSetHeaderAt";

    public static final String FUNC_GETVALSETHEADERHASH = "getValSetHeaderHash";

    public static final String FUNC_GETVALSETHEADERHASHAT = "getValSetHeaderHashAt";

    public static final String FUNC_GETVALIDATORSSSZMROOTFROMVALSETHEADER = "getValidatorsSszMRootFromValSetHeader";

    public static final String FUNC_GETVALIDATORSSSZMROOTFROMVALSETHEADERAT = "getValidatorsSszMRootFromValSetHeaderAt";

    public static final String FUNC_GETVERSIONFROMVALSETHEADER = "getVersionFromValSetHeader";

    public static final String FUNC_GETVERSIONFROMVALSETHEADERAT = "getVersionFromValSetHeaderAt";

    public static final String FUNC_ISVALSETHEADERCOMMITTEDAT = "isValSetHeaderCommittedAt";

    public static final String FUNC_SETGENESIS = "setGenesis";

    public static final String FUNC_SETSIGVERIFIER = "setSigVerifier";

    public static final String FUNC_VERIFYQUORUMSIG = "verifyQuorumSig";

    public static final String FUNC_VERIFYQUORUMSIGAT = "verifyQuorumSigAt";

    public static final Event COMMITVALSETHEADER_EVENT = new Event("CommitValSetHeader", 
            Arrays.<TypeReference<?>>asList(new TypeReference<ValSetHeader>() {}, new TypeReference<DynamicArray<ExtraData>>() {}));
    ;

    public static final Event INITSIGVERIFIER_EVENT = new Event("InitSigVerifier", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
    ;

    public static final Event SETGENESIS_EVENT = new Event("SetGenesis", 
            Arrays.<TypeReference<?>>asList(new TypeReference<ValSetHeader>() {}, new TypeReference<DynamicArray<ExtraData>>() {}));
    ;

    public static final Event SETSIGVERIFIER_EVENT = new Event("SetSigVerifier", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
    ;

    public static final CustomError SETTLEMENT_DUPLICATEEXTRADATAKEY_ERROR = new CustomError("Settlement_DuplicateExtraDataKey", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SETTLEMENT_INVALIDCAPTURETIMESTAMP_ERROR = new CustomError("Settlement_InvalidCaptureTimestamp", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SETTLEMENT_INVALIDEPOCH_ERROR = new CustomError("Settlement_InvalidEpoch", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SETTLEMENT_INVALIDSIGVERIFIER_ERROR = new CustomError("Settlement_InvalidSigVerifier", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SETTLEMENT_INVALIDVALIDATORSSSZMROOT_ERROR = new CustomError("Settlement_InvalidValidatorsSszMRoot", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SETTLEMENT_INVALIDVERSION_ERROR = new CustomError("Settlement_InvalidVersion", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SETTLEMENT_QUORUMTHRESHOLDGTTOTALVOTINGPOWER_ERROR = new CustomError("Settlement_QuorumThresholdGtTotalVotingPower", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SETTLEMENT_VALSETHEADERALREADYCOMMITTED_ERROR = new CustomError("Settlement_ValSetHeaderAlreadyCommitted", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SETTLEMENT_VERIFICATIONFAILED_ERROR = new CustomError("Settlement_VerificationFailed", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected ISettlement.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected ISettlement.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected ISettlement.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected ISettlement.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<BigInteger> VALIDATOR_SET_VERSION() {
        final Function function = new Function(FUNC_VALIDATOR_SET_VERSION, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint8>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<TransactionReceipt> commitValSetHeader(ValSetHeader header,
            List<ExtraData> extraData, byte[] proof) {
        final Function function = new Function(
                FUNC_COMMITVALSETHEADER, 
                Arrays.<Type>asList(header, 
                new org.web3j.abi.datatypes.DynamicArray<ExtraData>(ExtraData.class, extraData), 
                new org.web3j.abi.datatypes.DynamicBytes(proof)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<BigInteger> getCaptureTimestampFromValSetHeader() {
        final Function function = new Function(FUNC_GETCAPTURETIMESTAMPFROMVALSETHEADER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getCaptureTimestampFromValSetHeaderAt(BigInteger epoch) {
        final Function function = new Function(FUNC_GETCAPTURETIMESTAMPFROMVALSETHEADERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<byte[]> getExtraData(byte[] key) {
        final Function function = new Function(FUNC_GETEXTRADATA, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Bytes32(key)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<byte[]> getExtraDataAt(BigInteger epoch, byte[] key) {
        final Function function = new Function(FUNC_GETEXTRADATAAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch), 
                new org.web3j.abi.datatypes.generated.Bytes32(key)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<BigInteger> getLastCommittedHeaderEpoch() {
        final Function function = new Function(FUNC_GETLASTCOMMITTEDHEADEREPOCH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getQuorumThresholdFromValSetHeader() {
        final Function function = new Function(FUNC_GETQUORUMTHRESHOLDFROMVALSETHEADER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getQuorumThresholdFromValSetHeaderAt(BigInteger epoch) {
        final Function function = new Function(FUNC_GETQUORUMTHRESHOLDFROMVALSETHEADERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getRequiredKeyTagFromValSetHeader() {
        final Function function = new Function(FUNC_GETREQUIREDKEYTAGFROMVALSETHEADER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint8>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getRequiredKeyTagFromValSetHeaderAt(BigInteger epoch) {
        final Function function = new Function(FUNC_GETREQUIREDKEYTAGFROMVALSETHEADERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint8>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<String> getSigVerifier() {
        final Function function = new Function(FUNC_GETSIGVERIFIER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<String> getSigVerifierAt(BigInteger epoch, byte[] hint) {
        final Function function = new Function(FUNC_GETSIGVERIFIERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch), 
                new org.web3j.abi.datatypes.DynamicBytes(hint)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<BigInteger> getTotalVotingPowerFromValSetHeader() {
        final Function function = new Function(FUNC_GETTOTALVOTINGPOWERFROMVALSETHEADER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getTotalVotingPowerFromValSetHeaderAt(BigInteger epoch) {
        final Function function = new Function(FUNC_GETTOTALVOTINGPOWERFROMVALSETHEADERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<ValSetHeader> getValSetHeader() {
        final Function function = new Function(FUNC_GETVALSETHEADER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<ValSetHeader>() {}));
        return executeRemoteCallSingleValueReturn(function, ValSetHeader.class);
    }

    public RemoteFunctionCall<ValSetHeader> getValSetHeaderAt(BigInteger epoch) {
        final Function function = new Function(FUNC_GETVALSETHEADERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<ValSetHeader>() {}));
        return executeRemoteCallSingleValueReturn(function, ValSetHeader.class);
    }

    public RemoteFunctionCall<byte[]> getValSetHeaderHash() {
        final Function function = new Function(FUNC_GETVALSETHEADERHASH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<byte[]> getValSetHeaderHashAt(BigInteger epoch) {
        final Function function = new Function(FUNC_GETVALSETHEADERHASHAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<byte[]> getValidatorsSszMRootFromValSetHeader() {
        final Function function = new Function(FUNC_GETVALIDATORSSSZMROOTFROMVALSETHEADER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<byte[]> getValidatorsSszMRootFromValSetHeaderAt(BigInteger epoch) {
        final Function function = new Function(FUNC_GETVALIDATORSSSZMROOTFROMVALSETHEADERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<BigInteger> getVersionFromValSetHeader() {
        final Function function = new Function(FUNC_GETVERSIONFROMVALSETHEADER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint8>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getVersionFromValSetHeaderAt(BigInteger epoch) {
        final Function function = new Function(FUNC_GETVERSIONFROMVALSETHEADERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint8>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<Boolean> isValSetHeaderCommittedAt(BigInteger epoch) {
        final Function function = new Function(FUNC_ISVALSETHEADERCOMMITTEDAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(epoch)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setGenesis(ValSetHeader valSetHeader,
            List<ExtraData> extraData) {
        final Function function = new Function(
                FUNC_SETGENESIS, 
                Arrays.<Type>asList(valSetHeader, 
                new org.web3j.abi.datatypes.DynamicArray<ExtraData>(ExtraData.class, extraData)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setSigVerifier(String sigVerifier) {
        final Function function = new Function(
                FUNC_SETSIGVERIFIER, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, sigVerifier)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<Boolean> verifyQuorumSig(byte[] message, BigInteger keyTag,
            BigInteger quorumThreshold, byte[] proof) {
        final Function function = new Function(FUNC_VERIFYQUORUMSIG, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.DynamicBytes(message), 
                new org.web3j.abi.datatypes.generated.Uint8(keyTag), 
                new org.web3j.abi.datatypes.generated.Uint256(quorumThreshold), 
                new org.web3j.abi.datatypes.DynamicBytes(proof)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> verifyQuorumSigAt(byte[] message, BigInteger keyTag,
            BigInteger quorumThreshold, byte[] proof, BigInteger epoch, byte[] hint) {
        final Function function = new Function(FUNC_VERIFYQUORUMSIGAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.DynamicBytes(message), 
                new org.web3j.abi.datatypes.generated.Uint8(keyTag), 
                new org.web3j.abi.datatypes.generated.Uint256(quorumThreshold), 
                new org.web3j.abi.datatypes.DynamicBytes(proof), 
                new org.web3j.abi.datatypes.generated.Uint48(epoch), 
                new org.web3j.abi.datatypes.DynamicBytes(hint)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public static List<CommitValSetHeaderEventResponse> getCommitValSetHeaderEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(COMMITVALSETHEADER_EVENT, transactionReceipt);
        ArrayList<CommitValSetHeaderEventResponse> responses = new ArrayList<CommitValSetHeaderEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            CommitValSetHeaderEventResponse typedResponse = new CommitValSetHeaderEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.valSetHeader = (ValSetHeader) eventValues.getNonIndexedValues().get(0);
            typedResponse.extraData = (List<ExtraData>) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static CommitValSetHeaderEventResponse getCommitValSetHeaderEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(COMMITVALSETHEADER_EVENT, log);
        CommitValSetHeaderEventResponse typedResponse = new CommitValSetHeaderEventResponse();
        typedResponse.log = log;
        typedResponse.valSetHeader = (ValSetHeader) eventValues.getNonIndexedValues().get(0);
        typedResponse.extraData = (List<ExtraData>) eventValues.getNonIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<CommitValSetHeaderEventResponse> commitValSetHeaderEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getCommitValSetHeaderEventFromLog(log));
    }

    public Flowable<CommitValSetHeaderEventResponse> commitValSetHeaderEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(COMMITVALSETHEADER_EVENT));
        return commitValSetHeaderEventFlowable(filter);
    }

    public static List<InitSigVerifierEventResponse> getInitSigVerifierEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(INITSIGVERIFIER_EVENT, transactionReceipt);
        ArrayList<InitSigVerifierEventResponse> responses = new ArrayList<InitSigVerifierEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InitSigVerifierEventResponse typedResponse = new InitSigVerifierEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.sigVerifier = (String) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static InitSigVerifierEventResponse getInitSigVerifierEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(INITSIGVERIFIER_EVENT, log);
        InitSigVerifierEventResponse typedResponse = new InitSigVerifierEventResponse();
        typedResponse.log = log;
        typedResponse.sigVerifier = (String) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<InitSigVerifierEventResponse> initSigVerifierEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getInitSigVerifierEventFromLog(log));
    }

    public Flowable<InitSigVerifierEventResponse> initSigVerifierEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(INITSIGVERIFIER_EVENT));
        return initSigVerifierEventFlowable(filter);
    }

    public static List<SetGenesisEventResponse> getSetGenesisEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETGENESIS_EVENT, transactionReceipt);
        ArrayList<SetGenesisEventResponse> responses = new ArrayList<SetGenesisEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetGenesisEventResponse typedResponse = new SetGenesisEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.valSetHeader = (ValSetHeader) eventValues.getNonIndexedValues().get(0);
            typedResponse.extraData = (List<ExtraData>) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetGenesisEventResponse getSetGenesisEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETGENESIS_EVENT, log);
        SetGenesisEventResponse typedResponse = new SetGenesisEventResponse();
        typedResponse.log = log;
        typedResponse.valSetHeader = (ValSetHeader) eventValues.getNonIndexedValues().get(0);
        typedResponse.extraData = (List<ExtraData>) eventValues.getNonIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<SetGenesisEventResponse> setGenesisEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetGenesisEventFromLog(log));
    }

    public Flowable<SetGenesisEventResponse> setGenesisEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETGENESIS_EVENT));
        return setGenesisEventFlowable(filter);
    }

    public static List<SetSigVerifierEventResponse> getSetSigVerifierEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETSIGVERIFIER_EVENT, transactionReceipt);
        ArrayList<SetSigVerifierEventResponse> responses = new ArrayList<SetSigVerifierEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetSigVerifierEventResponse typedResponse = new SetSigVerifierEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.sigVerifier = (String) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetSigVerifierEventResponse getSetSigVerifierEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETSIGVERIFIER_EVENT, log);
        SetSigVerifierEventResponse typedResponse = new SetSigVerifierEventResponse();
        typedResponse.log = log;
        typedResponse.sigVerifier = (String) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetSigVerifierEventResponse> setSigVerifierEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetSigVerifierEventFromLog(log));
    }

    public Flowable<SetSigVerifierEventResponse> setSigVerifierEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETSIGVERIFIER_EVENT));
        return setSigVerifierEventFlowable(filter);
    }

    @Deprecated
    public static ISettlement.abi load(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        return new ISettlement.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static ISettlement.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new ISettlement.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static ISettlement.abi load(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        return new ISettlement.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static ISettlement.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new ISettlement.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class ValSetHeader extends StaticStruct {
        public BigInteger version;

        public BigInteger requiredKeyTag;

        public BigInteger epoch;

        public BigInteger captureTimestamp;

        public BigInteger quorumThreshold;

        public BigInteger totalVotingPower;

        public byte[] validatorsSszMRoot;

        public ValSetHeader(BigInteger version, BigInteger requiredKeyTag, BigInteger epoch,
                BigInteger captureTimestamp, BigInteger quorumThreshold,
                BigInteger totalVotingPower, byte[] validatorsSszMRoot) {
            super(new org.web3j.abi.datatypes.generated.Uint8(version), 
                    new org.web3j.abi.datatypes.generated.Uint8(requiredKeyTag), 
                    new org.web3j.abi.datatypes.generated.Uint48(epoch), 
                    new org.web3j.abi.datatypes.generated.Uint48(captureTimestamp), 
                    new org.web3j.abi.datatypes.generated.Uint256(quorumThreshold), 
                    new org.web3j.abi.datatypes.generated.Uint256(totalVotingPower), 
                    new org.web3j.abi.datatypes.generated.Bytes32(validatorsSszMRoot));
            this.version = version;
            this.requiredKeyTag = requiredKeyTag;
            this.epoch = epoch;
            this.captureTimestamp = captureTimestamp;
            this.quorumThreshold = quorumThreshold;
            this.totalVotingPower = totalVotingPower;
            this.validatorsSszMRoot = validatorsSszMRoot;
        }

        public ValSetHeader(Uint8 version, Uint8 requiredKeyTag, Uint48 epoch,
                Uint48 captureTimestamp, Uint256 quorumThreshold, Uint256 totalVotingPower,
                Bytes32 validatorsSszMRoot) {
            super(version, requiredKeyTag, epoch, captureTimestamp, quorumThreshold, totalVotingPower, validatorsSszMRoot);
            this.version = version.getValue();
            this.requiredKeyTag = requiredKeyTag.getValue();
            this.epoch = epoch.getValue();
            this.captureTimestamp = captureTimestamp.getValue();
            this.quorumThreshold = quorumThreshold.getValue();
            this.totalVotingPower = totalVotingPower.getValue();
            this.validatorsSszMRoot = validatorsSszMRoot.getValue();
        }
    }

    public static class ExtraData extends StaticStruct {
        public byte[] key;

        public byte[] value;

        public ExtraData(byte[] key, byte[] value) {
            super(new org.web3j.abi.datatypes.generated.Bytes32(key), 
                    new org.web3j.abi.datatypes.generated.Bytes32(value));
            this.key = key;
            this.value = value;
        }

        public ExtraData(Bytes32 key, Bytes32 value) {
            super(key, value);
            this.key = key.getValue();
            this.value = value.getValue();
        }
    }

    public static class CommitValSetHeaderEventResponse extends BaseEventResponse {
        public ValSetHeader valSetHeader;

        public List<ExtraData> extraData;
    }

    public static class InitSigVerifierEventResponse extends BaseEventResponse {
        public String sigVerifier;
    }

    public static class SetGenesisEventResponse extends BaseEventResponse {
        public ValSetHeader valSetHeader;

        public List<ExtraData> extraData;
    }

    public static class SetSigVerifierEventResponse extends BaseEventResponse {
        public String sigVerifier;
    }
}
