package fi.symbiotic.relay;

import io.reactivex.Flowable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Array;
import org.web3j.abi.datatypes.Bool;
import org.web3j.abi.datatypes.CustomError;
import org.web3j.abi.datatypes.DynamicArray;
import org.web3j.abi.datatypes.DynamicStruct;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.StaticStruct;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Uint208;
import org.web3j.abi.datatypes.generated.Uint248;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.abi.datatypes.generated.Uint32;
import org.web3j.abi.datatypes.generated.Uint48;
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
public class IValSetDriver.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_MAX_QUORUM_THRESHOLD = "MAX_QUORUM_THRESHOLD";

    public static final String FUNC_ADDQUORUMTHRESHOLD = "addQuorumThreshold";

    public static final String FUNC_ADDSETTLEMENT = "addSettlement";

    public static final String FUNC_ADDVOTINGPOWERPROVIDER = "addVotingPowerProvider";

    public static final String FUNC_GETCOMMITTERSLOTDURATION = "getCommitterSlotDuration";

    public static final String FUNC_GETCOMMITTERSLOTDURATIONAT = "getCommitterSlotDurationAt";

    public static final String FUNC_GETCONFIG = "getConfig";

    public static final String FUNC_GETCONFIGAT = "getConfigAt";

    public static final String FUNC_GETKEYSPROVIDER = "getKeysProvider";

    public static final String FUNC_GETKEYSPROVIDERAT = "getKeysProviderAt";

    public static final String FUNC_GETMAXVALIDATORSCOUNT = "getMaxValidatorsCount";

    public static final String FUNC_GETMAXVALIDATORSCOUNTAT = "getMaxValidatorsCountAt";

    public static final String FUNC_GETMAXVOTINGPOWER = "getMaxVotingPower";

    public static final String FUNC_GETMAXVOTINGPOWERAT = "getMaxVotingPowerAt";

    public static final String FUNC_GETMININCLUSIONVOTINGPOWER = "getMinInclusionVotingPower";

    public static final String FUNC_GETMININCLUSIONVOTINGPOWERAT = "getMinInclusionVotingPowerAt";

    public static final String FUNC_GETNUMAGGREGATORS = "getNumAggregators";

    public static final String FUNC_GETNUMAGGREGATORSAT = "getNumAggregatorsAt";

    public static final String FUNC_GETNUMCOMMITTERS = "getNumCommitters";

    public static final String FUNC_GETNUMCOMMITTERSAT = "getNumCommittersAt";

    public static final String FUNC_GETQUORUMTHRESHOLDS = "getQuorumThresholds";

    public static final String FUNC_GETQUORUMTHRESHOLDSAT = "getQuorumThresholdsAt";

    public static final String FUNC_GETREQUIREDHEADERKEYTAG = "getRequiredHeaderKeyTag";

    public static final String FUNC_GETREQUIREDHEADERKEYTAGAT = "getRequiredHeaderKeyTagAt";

    public static final String FUNC_GETREQUIREDKEYTAGS = "getRequiredKeyTags";

    public static final String FUNC_GETREQUIREDKEYTAGSAT = "getRequiredKeyTagsAt";

    public static final String FUNC_GETSETTLEMENTS = "getSettlements";

    public static final String FUNC_GETSETTLEMENTSAT = "getSettlementsAt";

    public static final String FUNC_GETVERIFICATIONTYPE = "getVerificationType";

    public static final String FUNC_GETVERIFICATIONTYPEAT = "getVerificationTypeAt";

    public static final String FUNC_GETVOTINGPOWERPROVIDERS = "getVotingPowerProviders";

    public static final String FUNC_GETVOTINGPOWERPROVIDERSAT = "getVotingPowerProvidersAt";

    public static final String FUNC_ISQUORUMTHRESHOLDREGISTERED = "isQuorumThresholdRegistered";

    public static final String FUNC_ISQUORUMTHRESHOLDREGISTEREDAT = "isQuorumThresholdRegisteredAt";

    public static final String FUNC_ISSETTLEMENTREGISTERED = "isSettlementRegistered";

    public static final String FUNC_ISSETTLEMENTREGISTEREDAT = "isSettlementRegisteredAt";

    public static final String FUNC_ISVOTINGPOWERPROVIDERREGISTERED = "isVotingPowerProviderRegistered";

    public static final String FUNC_ISVOTINGPOWERPROVIDERREGISTEREDAT = "isVotingPowerProviderRegisteredAt";

    public static final String FUNC_REMOVEQUORUMTHRESHOLD = "removeQuorumThreshold";

    public static final String FUNC_REMOVESETTLEMENT = "removeSettlement";

    public static final String FUNC_REMOVEVOTINGPOWERPROVIDER = "removeVotingPowerProvider";

    public static final String FUNC_SETCOMMITTERSLOTDURATION = "setCommitterSlotDuration";

    public static final String FUNC_SETKEYSPROVIDER = "setKeysProvider";

    public static final String FUNC_SETMAXVALIDATORSCOUNT = "setMaxValidatorsCount";

    public static final String FUNC_SETMAXVOTINGPOWER = "setMaxVotingPower";

    public static final String FUNC_SETMININCLUSIONVOTINGPOWER = "setMinInclusionVotingPower";

    public static final String FUNC_SETNUMAGGREGATORS = "setNumAggregators";

    public static final String FUNC_SETNUMCOMMITTERS = "setNumCommitters";

    public static final String FUNC_SETREQUIREDHEADERKEYTAG = "setRequiredHeaderKeyTag";

    public static final String FUNC_SETREQUIREDKEYTAGS = "setRequiredKeyTags";

    public static final String FUNC_SETVERIFICATIONTYPE = "setVerificationType";

    public static final Event ADDQUORUMTHRESHOLD_EVENT = new Event("AddQuorumThreshold", 
            Arrays.<TypeReference<?>>asList(new TypeReference<QuorumThreshold>() {}));
    ;

    public static final Event ADDSETTLEMENT_EVENT = new Event("AddSettlement", 
            Arrays.<TypeReference<?>>asList(new TypeReference<CrossChainAddress>() {}));
    ;

    public static final Event ADDVOTINGPOWERPROVIDER_EVENT = new Event("AddVotingPowerProvider", 
            Arrays.<TypeReference<?>>asList(new TypeReference<CrossChainAddress>() {}));
    ;

    public static final Event REMOVEQUORUMTHRESHOLD_EVENT = new Event("RemoveQuorumThreshold", 
            Arrays.<TypeReference<?>>asList(new TypeReference<QuorumThreshold>() {}));
    ;

    public static final Event REMOVESETTLEMENT_EVENT = new Event("RemoveSettlement", 
            Arrays.<TypeReference<?>>asList(new TypeReference<CrossChainAddress>() {}));
    ;

    public static final Event REMOVEVOTINGPOWERPROVIDER_EVENT = new Event("RemoveVotingPowerProvider", 
            Arrays.<TypeReference<?>>asList(new TypeReference<CrossChainAddress>() {}));
    ;

    public static final Event SETCOMMITTERSLOTDURATION_EVENT = new Event("SetCommitterSlotDuration", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
    ;

    public static final Event SETKEYSPROVIDER_EVENT = new Event("SetKeysProvider", 
            Arrays.<TypeReference<?>>asList(new TypeReference<CrossChainAddress>() {}));
    ;

    public static final Event SETMAXVALIDATORSCOUNT_EVENT = new Event("SetMaxValidatorsCount", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
    ;

    public static final Event SETMAXVOTINGPOWER_EVENT = new Event("SetMaxVotingPower", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
    ;

    public static final Event SETMININCLUSIONVOTINGPOWER_EVENT = new Event("SetMinInclusionVotingPower", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
    ;

    public static final Event SETNUMAGGREGATORS_EVENT = new Event("SetNumAggregators", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
    ;

    public static final Event SETNUMCOMMITTERS_EVENT = new Event("SetNumCommitters", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
    ;

    public static final Event SETREQUIREDHEADERKEYTAG_EVENT = new Event("SetRequiredHeaderKeyTag", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint8>() {}));
    ;

    public static final Event SETREQUIREDKEYTAGS_EVENT = new Event("SetRequiredKeyTags", 
            Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<Uint8>>() {}));
    ;

    public static final Event SETVERIFICATIONTYPE_EVENT = new Event("SetVerificationType", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint32>() {}));
    ;

    public static final CustomError VALSETDRIVER_CHAINALREADYADDED_ERROR = new CustomError("ValSetDriver_ChainAlreadyAdded", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VALSETDRIVER_INVALIDCROSSCHAINADDRESS_ERROR = new CustomError("ValSetDriver_InvalidCrossChainAddress", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VALSETDRIVER_INVALIDMAXVALIDATORSCOUNT_ERROR = new CustomError("ValSetDriver_InvalidMaxValidatorsCount", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VALSETDRIVER_INVALIDQUORUMTHRESHOLD_ERROR = new CustomError("ValSetDriver_InvalidQuorumThreshold", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VALSETDRIVER_KEYTAGALREADYADDED_ERROR = new CustomError("ValSetDriver_KeyTagAlreadyAdded", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VALSETDRIVER_NOTADDED_ERROR = new CustomError("ValSetDriver_NotAdded", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VALSETDRIVER_ZEROCOMMITTERSLOTDURATION_ERROR = new CustomError("ValSetDriver_ZeroCommitterSlotDuration", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VALSETDRIVER_ZERONUMAGGREGATORS_ERROR = new CustomError("ValSetDriver_ZeroNumAggregators", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VALSETDRIVER_ZERONUMCOMMITTERS_ERROR = new CustomError("ValSetDriver_ZeroNumCommitters", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected IValSetDriver.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected IValSetDriver.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected IValSetDriver.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected IValSetDriver.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<BigInteger> MAX_QUORUM_THRESHOLD() {
        final Function function = new Function(FUNC_MAX_QUORUM_THRESHOLD, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint248>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<TransactionReceipt> addQuorumThreshold(
            QuorumThreshold quorumThreshold) {
        final Function function = new Function(
                FUNC_ADDQUORUMTHRESHOLD, 
                Arrays.<Type>asList(quorumThreshold), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> addSettlement(CrossChainAddress settlement) {
        final Function function = new Function(
                FUNC_ADDSETTLEMENT, 
                Arrays.<Type>asList(settlement), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> addVotingPowerProvider(
            CrossChainAddress votingPowerProvider) {
        final Function function = new Function(
                FUNC_ADDVOTINGPOWERPROVIDER, 
                Arrays.<Type>asList(votingPowerProvider), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<BigInteger> getCommitterSlotDuration() {
        final Function function = new Function(FUNC_GETCOMMITTERSLOTDURATION, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getCommitterSlotDurationAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETCOMMITTERSLOTDURATIONAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint48>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<Config> getConfig() {
        final Function function = new Function(FUNC_GETCONFIG, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Config>() {}));
        return executeRemoteCallSingleValueReturn(function, Config.class);
    }

    public RemoteFunctionCall<Config> getConfigAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETCONFIGAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Config>() {}));
        return executeRemoteCallSingleValueReturn(function, Config.class);
    }

    public RemoteFunctionCall<CrossChainAddress> getKeysProvider() {
        final Function function = new Function(FUNC_GETKEYSPROVIDER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<CrossChainAddress>() {}));
        return executeRemoteCallSingleValueReturn(function, CrossChainAddress.class);
    }

    public RemoteFunctionCall<CrossChainAddress> getKeysProviderAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETKEYSPROVIDERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<CrossChainAddress>() {}));
        return executeRemoteCallSingleValueReturn(function, CrossChainAddress.class);
    }

    public RemoteFunctionCall<BigInteger> getMaxValidatorsCount() {
        final Function function = new Function(FUNC_GETMAXVALIDATORSCOUNT, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getMaxValidatorsCountAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETMAXVALIDATORSCOUNTAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getMaxVotingPower() {
        final Function function = new Function(FUNC_GETMAXVOTINGPOWER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getMaxVotingPowerAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETMAXVOTINGPOWERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getMinInclusionVotingPower() {
        final Function function = new Function(FUNC_GETMININCLUSIONVOTINGPOWER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getMinInclusionVotingPowerAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETMININCLUSIONVOTINGPOWERAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getNumAggregators() {
        final Function function = new Function(FUNC_GETNUMAGGREGATORS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getNumAggregatorsAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETNUMAGGREGATORSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getNumCommitters() {
        final Function function = new Function(FUNC_GETNUMCOMMITTERS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getNumCommittersAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETNUMCOMMITTERSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint208>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<List> getQuorumThresholds() {
        final Function function = new Function(FUNC_GETQUORUMTHRESHOLDS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<QuorumThreshold>>() {}));
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

    public RemoteFunctionCall<List> getQuorumThresholdsAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETQUORUMTHRESHOLDSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<QuorumThreshold>>() {}));
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

    public RemoteFunctionCall<BigInteger> getRequiredHeaderKeyTag() {
        final Function function = new Function(FUNC_GETREQUIREDHEADERKEYTAG, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint8>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getRequiredHeaderKeyTagAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETREQUIREDHEADERKEYTAGAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint8>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<List> getRequiredKeyTags() {
        final Function function = new Function(FUNC_GETREQUIREDKEYTAGS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<Uint8>>() {}));
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

    public RemoteFunctionCall<List> getRequiredKeyTagsAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETREQUIREDKEYTAGSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<Uint8>>() {}));
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

    public RemoteFunctionCall<List> getSettlements() {
        final Function function = new Function(FUNC_GETSETTLEMENTS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<CrossChainAddress>>() {}));
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

    public RemoteFunctionCall<List> getSettlementsAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETSETTLEMENTSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<CrossChainAddress>>() {}));
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

    public RemoteFunctionCall<BigInteger> getVerificationType() {
        final Function function = new Function(FUNC_GETVERIFICATIONTYPE, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint32>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> getVerificationTypeAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETVERIFICATIONTYPEAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint32>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<List> getVotingPowerProviders() {
        final Function function = new Function(FUNC_GETVOTINGPOWERPROVIDERS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<CrossChainAddress>>() {}));
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

    public RemoteFunctionCall<List> getVotingPowerProvidersAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETVOTINGPOWERPROVIDERSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<CrossChainAddress>>() {}));
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

    public RemoteFunctionCall<Boolean> isQuorumThresholdRegistered(
            QuorumThreshold quorumThreshold) {
        final Function function = new Function(FUNC_ISQUORUMTHRESHOLDREGISTERED, 
                Arrays.<Type>asList(quorumThreshold), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isQuorumThresholdRegisteredAt(
            QuorumThreshold quorumThreshold, BigInteger timestamp) {
        final Function function = new Function(FUNC_ISQUORUMTHRESHOLDREGISTEREDAT, 
                Arrays.<Type>asList(quorumThreshold, 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isSettlementRegistered(CrossChainAddress settlement) {
        final Function function = new Function(FUNC_ISSETTLEMENTREGISTERED, 
                Arrays.<Type>asList(settlement), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isSettlementRegisteredAt(CrossChainAddress settlement,
            BigInteger timestamp) {
        final Function function = new Function(FUNC_ISSETTLEMENTREGISTEREDAT, 
                Arrays.<Type>asList(settlement, 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isVotingPowerProviderRegistered(
            CrossChainAddress votingPowerProvider) {
        final Function function = new Function(FUNC_ISVOTINGPOWERPROVIDERREGISTERED, 
                Arrays.<Type>asList(votingPowerProvider), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isVotingPowerProviderRegisteredAt(
            CrossChainAddress votingPowerProvider, BigInteger timestamp) {
        final Function function = new Function(FUNC_ISVOTINGPOWERPROVIDERREGISTEREDAT, 
                Arrays.<Type>asList(votingPowerProvider, 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<TransactionReceipt> removeQuorumThreshold(
            QuorumThreshold quorumThreshold) {
        final Function function = new Function(
                FUNC_REMOVEQUORUMTHRESHOLD, 
                Arrays.<Type>asList(quorumThreshold), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> removeSettlement(CrossChainAddress settlement) {
        final Function function = new Function(
                FUNC_REMOVESETTLEMENT, 
                Arrays.<Type>asList(settlement), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> removeVotingPowerProvider(
            CrossChainAddress votingPowerProvider) {
        final Function function = new Function(
                FUNC_REMOVEVOTINGPOWERPROVIDER, 
                Arrays.<Type>asList(votingPowerProvider), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setCommitterSlotDuration(
            BigInteger slotDuration) {
        final Function function = new Function(
                FUNC_SETCOMMITTERSLOTDURATION, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(slotDuration)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setKeysProvider(CrossChainAddress keysProvider) {
        final Function function = new Function(
                FUNC_SETKEYSPROVIDER, 
                Arrays.<Type>asList(keysProvider), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setMaxValidatorsCount(
            BigInteger maxValidatorsCount) {
        final Function function = new Function(
                FUNC_SETMAXVALIDATORSCOUNT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint208(maxValidatorsCount)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setMaxVotingPower(BigInteger maxVotingPower) {
        final Function function = new Function(
                FUNC_SETMAXVOTINGPOWER, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(maxVotingPower)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setMinInclusionVotingPower(
            BigInteger minInclusionVotingPower) {
        final Function function = new Function(
                FUNC_SETMININCLUSIONVOTINGPOWER, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(minInclusionVotingPower)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setNumAggregators(BigInteger numAggregators) {
        final Function function = new Function(
                FUNC_SETNUMAGGREGATORS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint208(numAggregators)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setNumCommitters(BigInteger numCommitters) {
        final Function function = new Function(
                FUNC_SETNUMCOMMITTERS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint208(numCommitters)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setRequiredHeaderKeyTag(
            BigInteger requiredHeaderKeyTag) {
        final Function function = new Function(
                FUNC_SETREQUIREDHEADERKEYTAG, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint8(requiredHeaderKeyTag)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setRequiredKeyTags(
            List<BigInteger> requiredKeyTags) {
        final Function function = new Function(
                FUNC_SETREQUIREDKEYTAGS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.DynamicArray<org.web3j.abi.datatypes.generated.Uint8>(
                        org.web3j.abi.datatypes.generated.Uint8.class,
                        org.web3j.abi.Utils.typeMap(requiredKeyTags, org.web3j.abi.datatypes.generated.Uint8.class))), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setVerificationType(BigInteger verificationType) {
        final Function function = new Function(
                FUNC_SETVERIFICATIONTYPE, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint32(verificationType)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public static List<AddQuorumThresholdEventResponse> getAddQuorumThresholdEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(ADDQUORUMTHRESHOLD_EVENT, transactionReceipt);
        ArrayList<AddQuorumThresholdEventResponse> responses = new ArrayList<AddQuorumThresholdEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            AddQuorumThresholdEventResponse typedResponse = new AddQuorumThresholdEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.quorumThreshold = (QuorumThreshold) eventValues.getNonIndexedValues().get(0);
            responses.add(typedResponse);
        }
        return responses;
    }

    public static AddQuorumThresholdEventResponse getAddQuorumThresholdEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(ADDQUORUMTHRESHOLD_EVENT, log);
        AddQuorumThresholdEventResponse typedResponse = new AddQuorumThresholdEventResponse();
        typedResponse.log = log;
        typedResponse.quorumThreshold = (QuorumThreshold) eventValues.getNonIndexedValues().get(0);
        return typedResponse;
    }

    public Flowable<AddQuorumThresholdEventResponse> addQuorumThresholdEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getAddQuorumThresholdEventFromLog(log));
    }

    public Flowable<AddQuorumThresholdEventResponse> addQuorumThresholdEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(ADDQUORUMTHRESHOLD_EVENT));
        return addQuorumThresholdEventFlowable(filter);
    }

    public static List<AddSettlementEventResponse> getAddSettlementEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(ADDSETTLEMENT_EVENT, transactionReceipt);
        ArrayList<AddSettlementEventResponse> responses = new ArrayList<AddSettlementEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            AddSettlementEventResponse typedResponse = new AddSettlementEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.settlement = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
            responses.add(typedResponse);
        }
        return responses;
    }

    public static AddSettlementEventResponse getAddSettlementEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(ADDSETTLEMENT_EVENT, log);
        AddSettlementEventResponse typedResponse = new AddSettlementEventResponse();
        typedResponse.log = log;
        typedResponse.settlement = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
        return typedResponse;
    }

    public Flowable<AddSettlementEventResponse> addSettlementEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getAddSettlementEventFromLog(log));
    }

    public Flowable<AddSettlementEventResponse> addSettlementEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(ADDSETTLEMENT_EVENT));
        return addSettlementEventFlowable(filter);
    }

    public static List<AddVotingPowerProviderEventResponse> getAddVotingPowerProviderEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(ADDVOTINGPOWERPROVIDER_EVENT, transactionReceipt);
        ArrayList<AddVotingPowerProviderEventResponse> responses = new ArrayList<AddVotingPowerProviderEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            AddVotingPowerProviderEventResponse typedResponse = new AddVotingPowerProviderEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.votingPowerProvider = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
            responses.add(typedResponse);
        }
        return responses;
    }

    public static AddVotingPowerProviderEventResponse getAddVotingPowerProviderEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(ADDVOTINGPOWERPROVIDER_EVENT, log);
        AddVotingPowerProviderEventResponse typedResponse = new AddVotingPowerProviderEventResponse();
        typedResponse.log = log;
        typedResponse.votingPowerProvider = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
        return typedResponse;
    }

    public Flowable<AddVotingPowerProviderEventResponse> addVotingPowerProviderEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getAddVotingPowerProviderEventFromLog(log));
    }

    public Flowable<AddVotingPowerProviderEventResponse> addVotingPowerProviderEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(ADDVOTINGPOWERPROVIDER_EVENT));
        return addVotingPowerProviderEventFlowable(filter);
    }

    public static List<RemoveQuorumThresholdEventResponse> getRemoveQuorumThresholdEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(REMOVEQUORUMTHRESHOLD_EVENT, transactionReceipt);
        ArrayList<RemoveQuorumThresholdEventResponse> responses = new ArrayList<RemoveQuorumThresholdEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            RemoveQuorumThresholdEventResponse typedResponse = new RemoveQuorumThresholdEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.quorumThreshold = (QuorumThreshold) eventValues.getNonIndexedValues().get(0);
            responses.add(typedResponse);
        }
        return responses;
    }

    public static RemoveQuorumThresholdEventResponse getRemoveQuorumThresholdEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(REMOVEQUORUMTHRESHOLD_EVENT, log);
        RemoveQuorumThresholdEventResponse typedResponse = new RemoveQuorumThresholdEventResponse();
        typedResponse.log = log;
        typedResponse.quorumThreshold = (QuorumThreshold) eventValues.getNonIndexedValues().get(0);
        return typedResponse;
    }

    public Flowable<RemoveQuorumThresholdEventResponse> removeQuorumThresholdEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getRemoveQuorumThresholdEventFromLog(log));
    }

    public Flowable<RemoveQuorumThresholdEventResponse> removeQuorumThresholdEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(REMOVEQUORUMTHRESHOLD_EVENT));
        return removeQuorumThresholdEventFlowable(filter);
    }

    public static List<RemoveSettlementEventResponse> getRemoveSettlementEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(REMOVESETTLEMENT_EVENT, transactionReceipt);
        ArrayList<RemoveSettlementEventResponse> responses = new ArrayList<RemoveSettlementEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            RemoveSettlementEventResponse typedResponse = new RemoveSettlementEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.settlement = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
            responses.add(typedResponse);
        }
        return responses;
    }

    public static RemoveSettlementEventResponse getRemoveSettlementEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(REMOVESETTLEMENT_EVENT, log);
        RemoveSettlementEventResponse typedResponse = new RemoveSettlementEventResponse();
        typedResponse.log = log;
        typedResponse.settlement = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
        return typedResponse;
    }

    public Flowable<RemoveSettlementEventResponse> removeSettlementEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getRemoveSettlementEventFromLog(log));
    }

    public Flowable<RemoveSettlementEventResponse> removeSettlementEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(REMOVESETTLEMENT_EVENT));
        return removeSettlementEventFlowable(filter);
    }

    public static List<RemoveVotingPowerProviderEventResponse> getRemoveVotingPowerProviderEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(REMOVEVOTINGPOWERPROVIDER_EVENT, transactionReceipt);
        ArrayList<RemoveVotingPowerProviderEventResponse> responses = new ArrayList<RemoveVotingPowerProviderEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            RemoveVotingPowerProviderEventResponse typedResponse = new RemoveVotingPowerProviderEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.votingPowerProvider = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
            responses.add(typedResponse);
        }
        return responses;
    }

    public static RemoveVotingPowerProviderEventResponse getRemoveVotingPowerProviderEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(REMOVEVOTINGPOWERPROVIDER_EVENT, log);
        RemoveVotingPowerProviderEventResponse typedResponse = new RemoveVotingPowerProviderEventResponse();
        typedResponse.log = log;
        typedResponse.votingPowerProvider = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
        return typedResponse;
    }

    public Flowable<RemoveVotingPowerProviderEventResponse> removeVotingPowerProviderEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getRemoveVotingPowerProviderEventFromLog(log));
    }

    public Flowable<RemoveVotingPowerProviderEventResponse> removeVotingPowerProviderEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(REMOVEVOTINGPOWERPROVIDER_EVENT));
        return removeVotingPowerProviderEventFlowable(filter);
    }

    public static List<SetCommitterSlotDurationEventResponse> getSetCommitterSlotDurationEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETCOMMITTERSLOTDURATION_EVENT, transactionReceipt);
        ArrayList<SetCommitterSlotDurationEventResponse> responses = new ArrayList<SetCommitterSlotDurationEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetCommitterSlotDurationEventResponse typedResponse = new SetCommitterSlotDurationEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.committerSlotDuration = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetCommitterSlotDurationEventResponse getSetCommitterSlotDurationEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETCOMMITTERSLOTDURATION_EVENT, log);
        SetCommitterSlotDurationEventResponse typedResponse = new SetCommitterSlotDurationEventResponse();
        typedResponse.log = log;
        typedResponse.committerSlotDuration = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetCommitterSlotDurationEventResponse> setCommitterSlotDurationEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetCommitterSlotDurationEventFromLog(log));
    }

    public Flowable<SetCommitterSlotDurationEventResponse> setCommitterSlotDurationEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETCOMMITTERSLOTDURATION_EVENT));
        return setCommitterSlotDurationEventFlowable(filter);
    }

    public static List<SetKeysProviderEventResponse> getSetKeysProviderEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETKEYSPROVIDER_EVENT, transactionReceipt);
        ArrayList<SetKeysProviderEventResponse> responses = new ArrayList<SetKeysProviderEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetKeysProviderEventResponse typedResponse = new SetKeysProviderEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.keysProvider = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetKeysProviderEventResponse getSetKeysProviderEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETKEYSPROVIDER_EVENT, log);
        SetKeysProviderEventResponse typedResponse = new SetKeysProviderEventResponse();
        typedResponse.log = log;
        typedResponse.keysProvider = (CrossChainAddress) eventValues.getNonIndexedValues().get(0);
        return typedResponse;
    }

    public Flowable<SetKeysProviderEventResponse> setKeysProviderEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetKeysProviderEventFromLog(log));
    }

    public Flowable<SetKeysProviderEventResponse> setKeysProviderEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETKEYSPROVIDER_EVENT));
        return setKeysProviderEventFlowable(filter);
    }

    public static List<SetMaxValidatorsCountEventResponse> getSetMaxValidatorsCountEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETMAXVALIDATORSCOUNT_EVENT, transactionReceipt);
        ArrayList<SetMaxValidatorsCountEventResponse> responses = new ArrayList<SetMaxValidatorsCountEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetMaxValidatorsCountEventResponse typedResponse = new SetMaxValidatorsCountEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.maxValidatorsCount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetMaxValidatorsCountEventResponse getSetMaxValidatorsCountEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETMAXVALIDATORSCOUNT_EVENT, log);
        SetMaxValidatorsCountEventResponse typedResponse = new SetMaxValidatorsCountEventResponse();
        typedResponse.log = log;
        typedResponse.maxValidatorsCount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetMaxValidatorsCountEventResponse> setMaxValidatorsCountEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetMaxValidatorsCountEventFromLog(log));
    }

    public Flowable<SetMaxValidatorsCountEventResponse> setMaxValidatorsCountEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETMAXVALIDATORSCOUNT_EVENT));
        return setMaxValidatorsCountEventFlowable(filter);
    }

    public static List<SetMaxVotingPowerEventResponse> getSetMaxVotingPowerEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETMAXVOTINGPOWER_EVENT, transactionReceipt);
        ArrayList<SetMaxVotingPowerEventResponse> responses = new ArrayList<SetMaxVotingPowerEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetMaxVotingPowerEventResponse typedResponse = new SetMaxVotingPowerEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.maxVotingPower = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetMaxVotingPowerEventResponse getSetMaxVotingPowerEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETMAXVOTINGPOWER_EVENT, log);
        SetMaxVotingPowerEventResponse typedResponse = new SetMaxVotingPowerEventResponse();
        typedResponse.log = log;
        typedResponse.maxVotingPower = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetMaxVotingPowerEventResponse> setMaxVotingPowerEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetMaxVotingPowerEventFromLog(log));
    }

    public Flowable<SetMaxVotingPowerEventResponse> setMaxVotingPowerEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETMAXVOTINGPOWER_EVENT));
        return setMaxVotingPowerEventFlowable(filter);
    }

    public static List<SetMinInclusionVotingPowerEventResponse> getSetMinInclusionVotingPowerEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETMININCLUSIONVOTINGPOWER_EVENT, transactionReceipt);
        ArrayList<SetMinInclusionVotingPowerEventResponse> responses = new ArrayList<SetMinInclusionVotingPowerEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetMinInclusionVotingPowerEventResponse typedResponse = new SetMinInclusionVotingPowerEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.minInclusionVotingPower = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetMinInclusionVotingPowerEventResponse getSetMinInclusionVotingPowerEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETMININCLUSIONVOTINGPOWER_EVENT, log);
        SetMinInclusionVotingPowerEventResponse typedResponse = new SetMinInclusionVotingPowerEventResponse();
        typedResponse.log = log;
        typedResponse.minInclusionVotingPower = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetMinInclusionVotingPowerEventResponse> setMinInclusionVotingPowerEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetMinInclusionVotingPowerEventFromLog(log));
    }

    public Flowable<SetMinInclusionVotingPowerEventResponse> setMinInclusionVotingPowerEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETMININCLUSIONVOTINGPOWER_EVENT));
        return setMinInclusionVotingPowerEventFlowable(filter);
    }

    public static List<SetNumAggregatorsEventResponse> getSetNumAggregatorsEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETNUMAGGREGATORS_EVENT, transactionReceipt);
        ArrayList<SetNumAggregatorsEventResponse> responses = new ArrayList<SetNumAggregatorsEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetNumAggregatorsEventResponse typedResponse = new SetNumAggregatorsEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.numAggregators = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetNumAggregatorsEventResponse getSetNumAggregatorsEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETNUMAGGREGATORS_EVENT, log);
        SetNumAggregatorsEventResponse typedResponse = new SetNumAggregatorsEventResponse();
        typedResponse.log = log;
        typedResponse.numAggregators = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetNumAggregatorsEventResponse> setNumAggregatorsEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetNumAggregatorsEventFromLog(log));
    }

    public Flowable<SetNumAggregatorsEventResponse> setNumAggregatorsEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETNUMAGGREGATORS_EVENT));
        return setNumAggregatorsEventFlowable(filter);
    }

    public static List<SetNumCommittersEventResponse> getSetNumCommittersEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETNUMCOMMITTERS_EVENT, transactionReceipt);
        ArrayList<SetNumCommittersEventResponse> responses = new ArrayList<SetNumCommittersEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetNumCommittersEventResponse typedResponse = new SetNumCommittersEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.numCommitters = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetNumCommittersEventResponse getSetNumCommittersEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETNUMCOMMITTERS_EVENT, log);
        SetNumCommittersEventResponse typedResponse = new SetNumCommittersEventResponse();
        typedResponse.log = log;
        typedResponse.numCommitters = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetNumCommittersEventResponse> setNumCommittersEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetNumCommittersEventFromLog(log));
    }

    public Flowable<SetNumCommittersEventResponse> setNumCommittersEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETNUMCOMMITTERS_EVENT));
        return setNumCommittersEventFlowable(filter);
    }

    public static List<SetRequiredHeaderKeyTagEventResponse> getSetRequiredHeaderKeyTagEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETREQUIREDHEADERKEYTAG_EVENT, transactionReceipt);
        ArrayList<SetRequiredHeaderKeyTagEventResponse> responses = new ArrayList<SetRequiredHeaderKeyTagEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetRequiredHeaderKeyTagEventResponse typedResponse = new SetRequiredHeaderKeyTagEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.requiredHeaderKeyTag = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetRequiredHeaderKeyTagEventResponse getSetRequiredHeaderKeyTagEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETREQUIREDHEADERKEYTAG_EVENT, log);
        SetRequiredHeaderKeyTagEventResponse typedResponse = new SetRequiredHeaderKeyTagEventResponse();
        typedResponse.log = log;
        typedResponse.requiredHeaderKeyTag = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetRequiredHeaderKeyTagEventResponse> setRequiredHeaderKeyTagEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetRequiredHeaderKeyTagEventFromLog(log));
    }

    public Flowable<SetRequiredHeaderKeyTagEventResponse> setRequiredHeaderKeyTagEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETREQUIREDHEADERKEYTAG_EVENT));
        return setRequiredHeaderKeyTagEventFlowable(filter);
    }

    public static List<SetRequiredKeyTagsEventResponse> getSetRequiredKeyTagsEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETREQUIREDKEYTAGS_EVENT, transactionReceipt);
        ArrayList<SetRequiredKeyTagsEventResponse> responses = new ArrayList<SetRequiredKeyTagsEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetRequiredKeyTagsEventResponse typedResponse = new SetRequiredKeyTagsEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.requiredKeyTags = (List<BigInteger>) ((Array) eventValues.getNonIndexedValues().get(0)).getNativeValueCopy();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetRequiredKeyTagsEventResponse getSetRequiredKeyTagsEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETREQUIREDKEYTAGS_EVENT, log);
        SetRequiredKeyTagsEventResponse typedResponse = new SetRequiredKeyTagsEventResponse();
        typedResponse.log = log;
        typedResponse.requiredKeyTags = (List<BigInteger>) ((Array) eventValues.getNonIndexedValues().get(0)).getNativeValueCopy();
        return typedResponse;
    }

    public Flowable<SetRequiredKeyTagsEventResponse> setRequiredKeyTagsEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetRequiredKeyTagsEventFromLog(log));
    }

    public Flowable<SetRequiredKeyTagsEventResponse> setRequiredKeyTagsEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETREQUIREDKEYTAGS_EVENT));
        return setRequiredKeyTagsEventFlowable(filter);
    }

    public static List<SetVerificationTypeEventResponse> getSetVerificationTypeEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETVERIFICATIONTYPE_EVENT, transactionReceipt);
        ArrayList<SetVerificationTypeEventResponse> responses = new ArrayList<SetVerificationTypeEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetVerificationTypeEventResponse typedResponse = new SetVerificationTypeEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.verificationType = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetVerificationTypeEventResponse getSetVerificationTypeEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETVERIFICATIONTYPE_EVENT, log);
        SetVerificationTypeEventResponse typedResponse = new SetVerificationTypeEventResponse();
        typedResponse.log = log;
        typedResponse.verificationType = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetVerificationTypeEventResponse> setVerificationTypeEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetVerificationTypeEventFromLog(log));
    }

    public Flowable<SetVerificationTypeEventResponse> setVerificationTypeEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETVERIFICATIONTYPE_EVENT));
        return setVerificationTypeEventFlowable(filter);
    }

    @Deprecated
    public static IValSetDriver.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new IValSetDriver.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static IValSetDriver.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new IValSetDriver.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static IValSetDriver.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new IValSetDriver.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static IValSetDriver.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new IValSetDriver.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class QuorumThreshold extends StaticStruct {
        public BigInteger keyTag;

        public BigInteger quorumThreshold;

        public QuorumThreshold(BigInteger keyTag, BigInteger quorumThreshold) {
            super(new org.web3j.abi.datatypes.generated.Uint8(keyTag), 
                    new org.web3j.abi.datatypes.generated.Uint248(quorumThreshold));
            this.keyTag = keyTag;
            this.quorumThreshold = quorumThreshold;
        }

        public QuorumThreshold(Uint8 keyTag, Uint248 quorumThreshold) {
            super(keyTag, quorumThreshold);
            this.keyTag = keyTag.getValue();
            this.quorumThreshold = quorumThreshold.getValue();
        }
    }

    public static class CrossChainAddress extends StaticStruct {
        public BigInteger chainId;

        public String addr;

        public CrossChainAddress(BigInteger chainId, String addr) {
            super(new org.web3j.abi.datatypes.generated.Uint64(chainId), 
                    new org.web3j.abi.datatypes.Address(160, addr));
            this.chainId = chainId;
            this.addr = addr;
        }

        public CrossChainAddress(Uint64 chainId, Address addr) {
            super(chainId, addr);
            this.chainId = chainId.getValue();
            this.addr = addr.getValue();
        }
    }

    public static class Config extends DynamicStruct {
        public BigInteger numAggregators;

        public BigInteger numCommitters;

        public BigInteger committerSlotDuration;

        public List<CrossChainAddress> votingPowerProviders;

        public CrossChainAddress keysProvider;

        public List<CrossChainAddress> settlements;

        public BigInteger maxVotingPower;

        public BigInteger minInclusionVotingPower;

        public BigInteger maxValidatorsCount;

        public List<BigInteger> requiredKeyTags;

        public List<QuorumThreshold> quorumThresholds;

        public BigInteger requiredHeaderKeyTag;

        public BigInteger verificationType;

        public Config(BigInteger numAggregators, BigInteger numCommitters,
                BigInteger committerSlotDuration, List<CrossChainAddress> votingPowerProviders,
                CrossChainAddress keysProvider, List<CrossChainAddress> settlements,
                BigInteger maxVotingPower, BigInteger minInclusionVotingPower,
                BigInteger maxValidatorsCount, List<BigInteger> requiredKeyTags,
                List<QuorumThreshold> quorumThresholds, BigInteger requiredHeaderKeyTag,
                BigInteger verificationType) {
            super(new org.web3j.abi.datatypes.generated.Uint208(numAggregators), 
                    new org.web3j.abi.datatypes.generated.Uint208(numCommitters), 
                    new org.web3j.abi.datatypes.generated.Uint48(committerSlotDuration), 
                    new org.web3j.abi.datatypes.DynamicArray<CrossChainAddress>(CrossChainAddress.class, votingPowerProviders), 
                    keysProvider, 
                    new org.web3j.abi.datatypes.DynamicArray<CrossChainAddress>(CrossChainAddress.class, settlements), 
                    new org.web3j.abi.datatypes.generated.Uint256(maxVotingPower), 
                    new org.web3j.abi.datatypes.generated.Uint256(minInclusionVotingPower), 
                    new org.web3j.abi.datatypes.generated.Uint208(maxValidatorsCount), 
                    new org.web3j.abi.datatypes.DynamicArray<org.web3j.abi.datatypes.generated.Uint8>(
                            org.web3j.abi.datatypes.generated.Uint8.class,
                            org.web3j.abi.Utils.typeMap(requiredKeyTags, org.web3j.abi.datatypes.generated.Uint8.class)), 
                    new org.web3j.abi.datatypes.DynamicArray<QuorumThreshold>(QuorumThreshold.class, quorumThresholds), 
                    new org.web3j.abi.datatypes.generated.Uint8(requiredHeaderKeyTag), 
                    new org.web3j.abi.datatypes.generated.Uint32(verificationType));
            this.numAggregators = numAggregators;
            this.numCommitters = numCommitters;
            this.committerSlotDuration = committerSlotDuration;
            this.votingPowerProviders = votingPowerProviders;
            this.keysProvider = keysProvider;
            this.settlements = settlements;
            this.maxVotingPower = maxVotingPower;
            this.minInclusionVotingPower = minInclusionVotingPower;
            this.maxValidatorsCount = maxValidatorsCount;
            this.requiredKeyTags = requiredKeyTags;
            this.quorumThresholds = quorumThresholds;
            this.requiredHeaderKeyTag = requiredHeaderKeyTag;
            this.verificationType = verificationType;
        }

        public Config(Uint208 numAggregators, Uint208 numCommitters, Uint48 committerSlotDuration,
                @Parameterized(type = CrossChainAddress.class) DynamicArray<CrossChainAddress> votingPowerProviders,
                CrossChainAddress keysProvider,
                @Parameterized(type = CrossChainAddress.class) DynamicArray<CrossChainAddress> settlements,
                Uint256 maxVotingPower, Uint256 minInclusionVotingPower, Uint208 maxValidatorsCount,
                @Parameterized(type = Uint8.class) DynamicArray<Uint8> requiredKeyTags,
                @Parameterized(type = QuorumThreshold.class) DynamicArray<QuorumThreshold> quorumThresholds,
                Uint8 requiredHeaderKeyTag, Uint32 verificationType) {
            super(numAggregators, numCommitters, committerSlotDuration, votingPowerProviders, keysProvider, settlements, maxVotingPower, minInclusionVotingPower, maxValidatorsCount, requiredKeyTags, quorumThresholds, requiredHeaderKeyTag, verificationType);
            this.numAggregators = numAggregators.getValue();
            this.numCommitters = numCommitters.getValue();
            this.committerSlotDuration = committerSlotDuration.getValue();
            this.votingPowerProviders = votingPowerProviders.getValue();
            this.keysProvider = keysProvider;
            this.settlements = settlements.getValue();
            this.maxVotingPower = maxVotingPower.getValue();
            this.minInclusionVotingPower = minInclusionVotingPower.getValue();
            this.maxValidatorsCount = maxValidatorsCount.getValue();
            this.requiredKeyTags = requiredKeyTags.getValue().stream().map(v -> v.getValue()).collect(Collectors.toList());
            this.quorumThresholds = quorumThresholds.getValue();
            this.requiredHeaderKeyTag = requiredHeaderKeyTag.getValue();
            this.verificationType = verificationType.getValue();
        }
    }

    public static class AddQuorumThresholdEventResponse extends BaseEventResponse {
        public QuorumThreshold quorumThreshold;
    }

    public static class AddSettlementEventResponse extends BaseEventResponse {
        public CrossChainAddress settlement;
    }

    public static class AddVotingPowerProviderEventResponse extends BaseEventResponse {
        public CrossChainAddress votingPowerProvider;
    }

    public static class RemoveQuorumThresholdEventResponse extends BaseEventResponse {
        public QuorumThreshold quorumThreshold;
    }

    public static class RemoveSettlementEventResponse extends BaseEventResponse {
        public CrossChainAddress settlement;
    }

    public static class RemoveVotingPowerProviderEventResponse extends BaseEventResponse {
        public CrossChainAddress votingPowerProvider;
    }

    public static class SetCommitterSlotDurationEventResponse extends BaseEventResponse {
        public BigInteger committerSlotDuration;
    }

    public static class SetKeysProviderEventResponse extends BaseEventResponse {
        public CrossChainAddress keysProvider;
    }

    public static class SetMaxValidatorsCountEventResponse extends BaseEventResponse {
        public BigInteger maxValidatorsCount;
    }

    public static class SetMaxVotingPowerEventResponse extends BaseEventResponse {
        public BigInteger maxVotingPower;
    }

    public static class SetMinInclusionVotingPowerEventResponse extends BaseEventResponse {
        public BigInteger minInclusionVotingPower;
    }

    public static class SetNumAggregatorsEventResponse extends BaseEventResponse {
        public BigInteger numAggregators;
    }

    public static class SetNumCommittersEventResponse extends BaseEventResponse {
        public BigInteger numCommitters;
    }

    public static class SetRequiredHeaderKeyTagEventResponse extends BaseEventResponse {
        public BigInteger requiredHeaderKeyTag;
    }

    public static class SetRequiredKeyTagsEventResponse extends BaseEventResponse {
        public List<BigInteger> requiredKeyTags;
    }

    public static class SetVerificationTypeEventResponse extends BaseEventResponse {
        public BigInteger verificationType;
    }
}
