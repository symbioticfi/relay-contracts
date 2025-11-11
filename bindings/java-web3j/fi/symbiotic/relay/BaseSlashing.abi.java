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
import org.web3j.abi.datatypes.Bool;
import org.web3j.abi.datatypes.CustomError;
import org.web3j.abi.datatypes.DynamicArray;
import org.web3j.abi.datatypes.DynamicStruct;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.StaticStruct;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.Utf8String;
import org.web3j.abi.datatypes.generated.Bytes1;
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.abi.datatypes.generated.Uint48;
import org.web3j.abi.datatypes.generated.Uint64;
import org.web3j.abi.datatypes.generated.Uint96;
import org.web3j.abi.datatypes.reflection.Parameterized;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.RemoteFunctionCall;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.BaseEventResponse;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tuples.generated.Tuple2;
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
public class BaseSlashing.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_NETWORK = "NETWORK";

    public static final String FUNC_OPERATOR_REGISTRY = "OPERATOR_REGISTRY";

    public static final String FUNC_SUBNETWORK = "SUBNETWORK";

    public static final String FUNC_SUBNETWORK_IDENTIFIER = "SUBNETWORK_IDENTIFIER";

    public static final String FUNC_VAULT_FACTORY = "VAULT_FACTORY";

    public static final String FUNC_EIP712DOMAIN = "eip712Domain";

    public static final String FUNC_EXECUTESLASHVAULT = "executeSlashVault";

    public static final String FUNC_GETOPERATORSTAKES = "getOperatorStakes";

    public static final String FUNC_GETOPERATORSTAKESAT = "getOperatorStakesAt";

    public static final String FUNC_GETOPERATORVAULTS = "getOperatorVaults";

    public static final String FUNC_GETOPERATORVAULTSAT = "getOperatorVaultsAt";

    public static final String FUNC_GETOPERATORVOTINGPOWERS = "getOperatorVotingPowers";

    public static final String FUNC_GETOPERATORVOTINGPOWERSAT = "getOperatorVotingPowersAt";

    public static final String FUNC_GETOPERATORS = "getOperators";

    public static final String FUNC_GETOPERATORSAT = "getOperatorsAt";

    public static final String FUNC_GETSHAREDVAULTS = "getSharedVaults";

    public static final String FUNC_GETSHAREDVAULTSAT = "getSharedVaultsAt";

    public static final String FUNC_GETSLASHER = "getSlasher";

    public static final String FUNC_GETSLASHINGDATA = "getSlashingData";

    public static final String FUNC_GETSLASHINGDATAAT = "getSlashingDataAt";

    public static final String FUNC_GETTOKENS = "getTokens";

    public static final String FUNC_GETTOKENSAT = "getTokensAt";

    public static final String FUNC_GETVOTINGPOWERS = "getVotingPowers";

    public static final String FUNC_GETVOTINGPOWERSAT = "getVotingPowersAt";

    public static final String FUNC_HASHTYPEDDATAV4 = "hashTypedDataV4";

    public static final String FUNC_HASHTYPEDDATAV4CROSSCHAIN = "hashTypedDataV4CrossChain";

    public static final String FUNC_INVALIDATEOLDSIGNATURES = "invalidateOldSignatures";

    public static final String FUNC_ISOPERATORREGISTERED = "isOperatorRegistered";

    public static final String FUNC_ISOPERATORREGISTEREDAT = "isOperatorRegisteredAt";

    public static final String FUNC_isOperatorVaultRegistered = "isOperatorVaultRegistered";

    public static final String FUNC_isOperatorVaultRegisteredAt = "isOperatorVaultRegisteredAt";

    public static final String FUNC_ISSHAREDVAULTREGISTERED = "isSharedVaultRegistered";

    public static final String FUNC_ISSHAREDVAULTREGISTEREDAT = "isSharedVaultRegisteredAt";

    public static final String FUNC_ISTOKENREGISTERED = "isTokenRegistered";

    public static final String FUNC_ISTOKENREGISTEREDAT = "isTokenRegisteredAt";

    public static final String FUNC_MULTICALL = "multicall";

    public static final String FUNC_NONCES = "nonces";

    public static final String FUNC_REGISTEROPERATOR = "registerOperator";

    public static final String FUNC_REGISTEROPERATORWITHSIGNATURE = "registerOperatorWithSignature";

    public static final String FUNC_SETSLASHER = "setSlasher";

    public static final String FUNC_SLASHVAULT = "slashVault";

    public static final String FUNC_STAKETOVOTINGPOWER = "stakeToVotingPower";

    public static final String FUNC_STAKETOVOTINGPOWERAT = "stakeToVotingPowerAt";

    public static final String FUNC_STATICDELEGATECALL = "staticDelegateCall";

    public static final String FUNC_UNREGISTEROPERATOR = "unregisterOperator";

    public static final String FUNC_UNREGISTEROPERATORWITHSIGNATURE = "unregisterOperatorWithSignature";

    public static final Event EIP712DOMAINCHANGED_EVENT = new Event("EIP712DomainChanged", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final Event EXECUTESLASH_EVENT = new Event("ExecuteSlash", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Uint256>(true) {}, new TypeReference<Bool>(true) {}, new TypeReference<Uint256>() {}));
    ;

    public static final Event INITEIP712_EVENT = new Event("InitEIP712", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}));
    ;

    public static final Event INITSUBNETWORK_EVENT = new Event("InitSubnetwork", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Uint96>() {}));
    ;

    public static final Event INITIALIZED_EVENT = new Event("Initialized", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint64>() {}));
    ;

    public static final Event INSTANTSLASH_EVENT = new Event("InstantSlash", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Address>(true) {}, new TypeReference<Bool>(true) {}, new TypeReference<Uint256>() {}));
    ;

    public static final Event REGISTEROPERATOR_EVENT = new Event("RegisterOperator", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event REGISTEROPERATORVAULT_EVENT = new Event("RegisterOperatorVault", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Address>(true) {}));
    ;

    public static final Event REGISTERSHAREDVAULT_EVENT = new Event("RegisterSharedVault", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event REGISTERTOKEN_EVENT = new Event("RegisterToken", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event SETSLASHER_EVENT = new Event("SetSlasher", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
    ;

    public static final Event SETSLASHINGDATA_EVENT = new Event("SetSlashingData", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}, new TypeReference<Uint48>() {}));
    ;

    public static final Event UNREGISTEROPERATOR_EVENT = new Event("UnregisterOperator", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event UNREGISTEROPERATORVAULT_EVENT = new Event("UnregisterOperatorVault", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Address>(true) {}));
    ;

    public static final Event UNREGISTERSHAREDVAULT_EVENT = new Event("UnregisterSharedVault", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event UNREGISTERTOKEN_EVENT = new Event("UnregisterToken", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}));
    ;

    public static final Event VETOSLASH_EVENT = new Event("VetoSlash", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>(true) {}, new TypeReference<Address>(true) {}, new TypeReference<Bool>(true) {}, new TypeReference<Uint256>() {}));
    ;

    public static final CustomError ADDRESSEMPTYCODE_ERROR = new CustomError("AddressEmptyCode", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
    ;

    public static final CustomError BASESLASHING_NOSLASHER_ERROR = new CustomError("BaseSlashing_NoSlasher", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError BASESLASHING_NOSLASHING_ERROR = new CustomError("BaseSlashing_NoSlashing", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError BASESLASHING_NOTSLASHER_ERROR = new CustomError("BaseSlashing_NotSlasher", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError BASESLASHING_NOTVETOSLASHER_ERROR = new CustomError("BaseSlashing_NotVetoSlasher", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError BASESLASHING_UNKNOWNSLASHERTYPE_ERROR = new CustomError("BaseSlashing_UnknownSlasherType", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError FAILEDCALL_ERROR = new CustomError("FailedCall", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError INVALIDACCOUNTNONCE_ERROR = new CustomError("InvalidAccountNonce", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Uint256>() {}));
    ;

    public static final CustomError INVALIDINITIALIZATION_ERROR = new CustomError("InvalidInitialization", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError NETWORKMANAGER_INVALIDNETWORK_ERROR = new CustomError("NetworkManager_InvalidNetwork", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError NOTINITIALIZING_ERROR = new CustomError("NotInitializing", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_INVALIDOPERATOR_ERROR = new CustomError("VotingPowerProvider_InvalidOperator", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_INVALIDOPERATORVAULT_ERROR = new CustomError("VotingPowerProvider_InvalidOperatorVault", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_INVALIDSHAREDVAULT_ERROR = new CustomError("VotingPowerProvider_InvalidSharedVault", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_INVALIDSIGNATURE_ERROR = new CustomError("VotingPowerProvider_InvalidSignature", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_INVALIDTOKEN_ERROR = new CustomError("VotingPowerProvider_InvalidToken", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_INVALIDVAULT_ERROR = new CustomError("VotingPowerProvider_InvalidVault", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_OPERATORALREADYREGISTERED_ERROR = new CustomError("VotingPowerProvider_OperatorAlreadyRegistered", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_OPERATORNOTREGISTERED_ERROR = new CustomError("VotingPowerProvider_OperatorNotRegistered", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_OPERATORVAULTALREADYISREGISTERED_ERROR = new CustomError("VotingPowerProvider_OperatorVaultAlreadyIsRegistered", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_OPERATORVAULTNOTREGISTERED_ERROR = new CustomError("VotingPowerProvider_OperatorVaultNotRegistered", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_SHAREDVAULTALREADYISREGISTERED_ERROR = new CustomError("VotingPowerProvider_SharedVaultAlreadyIsRegistered", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_SHAREDVAULTNOTREGISTERED_ERROR = new CustomError("VotingPowerProvider_SharedVaultNotRegistered", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_TOKENALREADYISREGISTERED_ERROR = new CustomError("VotingPowerProvider_TokenAlreadyIsRegistered", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError VOTINGPOWERPROVIDER_TOKENNOTREGISTERED_ERROR = new CustomError("VotingPowerProvider_TokenNotRegistered", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected BaseSlashing.abi(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected BaseSlashing.abi(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected BaseSlashing.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected BaseSlashing.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<String> NETWORK() {
        final Function function = new Function(FUNC_NETWORK, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<String> OPERATOR_REGISTRY() {
        final Function function = new Function(FUNC_OPERATOR_REGISTRY, 
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

    public RemoteFunctionCall<String> VAULT_FACTORY() {
        final Function function = new Function(FUNC_VAULT_FACTORY, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
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

    public RemoteFunctionCall<TransactionReceipt> executeSlashVault(String vault,
            BigInteger slashIndex, byte[] hints) {
        final Function function = new Function(
                FUNC_EXECUTESLASHVAULT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.generated.Uint256(slashIndex), 
                new org.web3j.abi.datatypes.DynamicBytes(hints)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<List> getOperatorStakes(String operator) {
        final Function function = new Function(FUNC_GETOPERATORSTAKES, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<VaultValue>>() {}));
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

    public RemoteFunctionCall<List> getOperatorStakesAt(String operator, BigInteger timestamp) {
        final Function function = new Function(FUNC_GETOPERATORSTAKESAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<VaultValue>>() {}));
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

    public RemoteFunctionCall<List> getOperatorVaults(String operator) {
        final Function function = new Function(FUNC_GETOPERATORVAULTS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
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

    public RemoteFunctionCall<List> getOperatorVaultsAt(String operator, BigInteger timestamp) {
        final Function function = new Function(FUNC_GETOPERATORVAULTSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
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

    public RemoteFunctionCall<List> getOperatorVotingPowers(String operator, byte[] extraData) {
        final Function function = new Function(FUNC_GETOPERATORVOTINGPOWERS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.DynamicBytes(extraData)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<VaultValue>>() {}));
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

    public RemoteFunctionCall<List> getOperatorVotingPowersAt(String operator, byte[] extraData,
            BigInteger timestamp) {
        final Function function = new Function(FUNC_GETOPERATORVOTINGPOWERSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.DynamicBytes(extraData), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<VaultValue>>() {}));
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

    public RemoteFunctionCall<List> getOperators() {
        final Function function = new Function(FUNC_GETOPERATORS, 
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

    public RemoteFunctionCall<List> getOperatorsAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETOPERATORSAT, 
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

    public RemoteFunctionCall<List> getSharedVaults() {
        final Function function = new Function(FUNC_GETSHAREDVAULTS, 
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

    public RemoteFunctionCall<List> getSharedVaultsAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETSHAREDVAULTSAT, 
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

    public RemoteFunctionCall<String> getSlasher() {
        final Function function = new Function(FUNC_GETSLASHER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<Tuple2<Boolean, BigInteger>> getSlashingData() {
        final Function function = new Function(FUNC_GETSLASHINGDATA, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}, new TypeReference<Uint48>() {}));
        return new RemoteFunctionCall<Tuple2<Boolean, BigInteger>>(function,
                new Callable<Tuple2<Boolean, BigInteger>>() {
                    @Override
                    public Tuple2<Boolean, BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple2<Boolean, BigInteger>(
                                (Boolean) results.get(0).getValue(), 
                                (BigInteger) results.get(1).getValue());
                    }
                });
    }

    public RemoteFunctionCall<Tuple2<Boolean, BigInteger>> getSlashingDataAt(BigInteger timestamp,
            byte[] hint) {
        final Function function = new Function(FUNC_GETSLASHINGDATAAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp), 
                new org.web3j.abi.datatypes.DynamicBytes(hint)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}, new TypeReference<Uint48>() {}));
        return new RemoteFunctionCall<Tuple2<Boolean, BigInteger>>(function,
                new Callable<Tuple2<Boolean, BigInteger>>() {
                    @Override
                    public Tuple2<Boolean, BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple2<Boolean, BigInteger>(
                                (Boolean) results.get(0).getValue(), 
                                (BigInteger) results.get(1).getValue());
                    }
                });
    }

    public RemoteFunctionCall<List> getTokens() {
        final Function function = new Function(FUNC_GETTOKENS, 
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

    public RemoteFunctionCall<List> getTokensAt(BigInteger timestamp) {
        final Function function = new Function(FUNC_GETTOKENSAT, 
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

    public RemoteFunctionCall<List> getVotingPowers(List<byte[]> extraData) {
        final Function function = new Function(FUNC_GETVOTINGPOWERS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.DynamicArray<org.web3j.abi.datatypes.DynamicBytes>(
                        org.web3j.abi.datatypes.DynamicBytes.class,
                        org.web3j.abi.Utils.typeMap(extraData, org.web3j.abi.datatypes.DynamicBytes.class))), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<OperatorVotingPower>>() {}));
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

    public RemoteFunctionCall<List> getVotingPowersAt(List<byte[]> extraData,
            BigInteger timestamp) {
        final Function function = new Function(FUNC_GETVOTINGPOWERSAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.DynamicArray<org.web3j.abi.datatypes.DynamicBytes>(
                        org.web3j.abi.datatypes.DynamicBytes.class,
                        org.web3j.abi.Utils.typeMap(extraData, org.web3j.abi.datatypes.DynamicBytes.class)), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<OperatorVotingPower>>() {}));
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

    public RemoteFunctionCall<TransactionReceipt> invalidateOldSignatures() {
        final Function function = new Function(
                FUNC_INVALIDATEOLDSIGNATURES, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<Boolean> isOperatorRegistered(String operator) {
        final Function function = new Function(FUNC_ISOPERATORREGISTERED, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isOperatorRegisteredAt(String operator,
            BigInteger timestamp) {
        final Function function = new Function(FUNC_ISOPERATORREGISTEREDAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isOperatorVaultRegistered(String vault) {
        final Function function = new Function(FUNC_isOperatorVaultRegistered, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isOperatorVaultRegistered(String operator, String vault) {
        final Function function = new Function(FUNC_isOperatorVaultRegistered, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.Address(160, vault)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isOperatorVaultRegisteredAt(String operator, String vault,
            BigInteger timestamp) {
        final Function function = new Function(FUNC_isOperatorVaultRegisteredAt, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isOperatorVaultRegisteredAt(String vault,
            BigInteger timestamp) {
        final Function function = new Function(FUNC_isOperatorVaultRegisteredAt, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isSharedVaultRegistered(String vault) {
        final Function function = new Function(FUNC_ISSHAREDVAULTREGISTERED, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isSharedVaultRegisteredAt(String vault,
            BigInteger timestamp) {
        final Function function = new Function(FUNC_ISSHAREDVAULTREGISTEREDAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isTokenRegistered(String token) {
        final Function function = new Function(FUNC_ISTOKENREGISTERED, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<Boolean> isTokenRegisteredAt(String token, BigInteger timestamp) {
        final Function function = new Function(FUNC_ISTOKENREGISTEREDAT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, token), 
                new org.web3j.abi.datatypes.generated.Uint48(timestamp)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
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

    public RemoteFunctionCall<BigInteger> nonces(String owner) {
        final Function function = new Function(FUNC_NONCES, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, owner)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<TransactionReceipt> registerOperator() {
        final Function function = new Function(
                FUNC_REGISTEROPERATOR, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> registerOperatorWithSignature(String operator,
            byte[] signature) {
        final Function function = new Function(
                FUNC_REGISTEROPERATORWITHSIGNATURE, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.DynamicBytes(signature)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> setSlasher(String slasher) {
        final Function function = new Function(
                FUNC_SETSLASHER, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, slasher)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> slashVault(BigInteger timestamp, String vault,
            String operator, BigInteger amount, byte[] hints) {
        final Function function = new Function(
                FUNC_SLASHVAULT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint48(timestamp), 
                new org.web3j.abi.datatypes.Address(160, vault), 
                new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.generated.Uint256(amount), 
                new org.web3j.abi.datatypes.DynamicBytes(hints)), 
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

    public RemoteFunctionCall<TransactionReceipt> staticDelegateCall(String target, byte[] data) {
        final Function function = new Function(
                FUNC_STATICDELEGATECALL, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, target), 
                new org.web3j.abi.datatypes.DynamicBytes(data)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> unregisterOperator() {
        final Function function = new Function(
                FUNC_UNREGISTEROPERATOR, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> unregisterOperatorWithSignature(String operator,
            byte[] signature) {
        final Function function = new Function(
                FUNC_UNREGISTEROPERATORWITHSIGNATURE, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, operator), 
                new org.web3j.abi.datatypes.DynamicBytes(signature)), 
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

    public static List<ExecuteSlashEventResponse> getExecuteSlashEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(EXECUTESLASH_EVENT, transactionReceipt);
        ArrayList<ExecuteSlashEventResponse> responses = new ArrayList<ExecuteSlashEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            ExecuteSlashEventResponse typedResponse = new ExecuteSlashEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.slashIndex = (BigInteger) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
            typedResponse.slashedAmount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static ExecuteSlashEventResponse getExecuteSlashEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(EXECUTESLASH_EVENT, log);
        ExecuteSlashEventResponse typedResponse = new ExecuteSlashEventResponse();
        typedResponse.log = log;
        typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.slashIndex = (BigInteger) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
        typedResponse.slashedAmount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<ExecuteSlashEventResponse> executeSlashEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getExecuteSlashEventFromLog(log));
    }

    public Flowable<ExecuteSlashEventResponse> executeSlashEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(EXECUTESLASH_EVENT));
        return executeSlashEventFlowable(filter);
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

    public static List<InstantSlashEventResponse> getInstantSlashEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(INSTANTSLASH_EVENT, transactionReceipt);
        ArrayList<InstantSlashEventResponse> responses = new ArrayList<InstantSlashEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InstantSlashEventResponse typedResponse = new InstantSlashEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
            typedResponse.slashedAmount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static InstantSlashEventResponse getInstantSlashEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(INSTANTSLASH_EVENT, log);
        InstantSlashEventResponse typedResponse = new InstantSlashEventResponse();
        typedResponse.log = log;
        typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.operator = (String) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
        typedResponse.slashedAmount = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<InstantSlashEventResponse> instantSlashEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getInstantSlashEventFromLog(log));
    }

    public Flowable<InstantSlashEventResponse> instantSlashEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(INSTANTSLASH_EVENT));
        return instantSlashEventFlowable(filter);
    }

    public static List<RegisterOperatorEventResponse> getRegisterOperatorEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(REGISTEROPERATOR_EVENT, transactionReceipt);
        ArrayList<RegisterOperatorEventResponse> responses = new ArrayList<RegisterOperatorEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            RegisterOperatorEventResponse typedResponse = new RegisterOperatorEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static RegisterOperatorEventResponse getRegisterOperatorEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(REGISTEROPERATOR_EVENT, log);
        RegisterOperatorEventResponse typedResponse = new RegisterOperatorEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<RegisterOperatorEventResponse> registerOperatorEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getRegisterOperatorEventFromLog(log));
    }

    public Flowable<RegisterOperatorEventResponse> registerOperatorEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(REGISTEROPERATOR_EVENT));
        return registerOperatorEventFlowable(filter);
    }

    public static List<RegisterOperatorVaultEventResponse> getRegisterOperatorVaultEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(REGISTEROPERATORVAULT_EVENT, transactionReceipt);
        ArrayList<RegisterOperatorVaultEventResponse> responses = new ArrayList<RegisterOperatorVaultEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            RegisterOperatorVaultEventResponse typedResponse = new RegisterOperatorVaultEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.vault = (String) eventValues.getIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static RegisterOperatorVaultEventResponse getRegisterOperatorVaultEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(REGISTEROPERATORVAULT_EVENT, log);
        RegisterOperatorVaultEventResponse typedResponse = new RegisterOperatorVaultEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.vault = (String) eventValues.getIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<RegisterOperatorVaultEventResponse> registerOperatorVaultEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getRegisterOperatorVaultEventFromLog(log));
    }

    public Flowable<RegisterOperatorVaultEventResponse> registerOperatorVaultEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(REGISTEROPERATORVAULT_EVENT));
        return registerOperatorVaultEventFlowable(filter);
    }

    public static List<RegisterSharedVaultEventResponse> getRegisterSharedVaultEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(REGISTERSHAREDVAULT_EVENT, transactionReceipt);
        ArrayList<RegisterSharedVaultEventResponse> responses = new ArrayList<RegisterSharedVaultEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            RegisterSharedVaultEventResponse typedResponse = new RegisterSharedVaultEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.vault = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static RegisterSharedVaultEventResponse getRegisterSharedVaultEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(REGISTERSHAREDVAULT_EVENT, log);
        RegisterSharedVaultEventResponse typedResponse = new RegisterSharedVaultEventResponse();
        typedResponse.log = log;
        typedResponse.vault = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<RegisterSharedVaultEventResponse> registerSharedVaultEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getRegisterSharedVaultEventFromLog(log));
    }

    public Flowable<RegisterSharedVaultEventResponse> registerSharedVaultEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(REGISTERSHAREDVAULT_EVENT));
        return registerSharedVaultEventFlowable(filter);
    }

    public static List<RegisterTokenEventResponse> getRegisterTokenEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(REGISTERTOKEN_EVENT, transactionReceipt);
        ArrayList<RegisterTokenEventResponse> responses = new ArrayList<RegisterTokenEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            RegisterTokenEventResponse typedResponse = new RegisterTokenEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.token = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static RegisterTokenEventResponse getRegisterTokenEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(REGISTERTOKEN_EVENT, log);
        RegisterTokenEventResponse typedResponse = new RegisterTokenEventResponse();
        typedResponse.log = log;
        typedResponse.token = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<RegisterTokenEventResponse> registerTokenEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getRegisterTokenEventFromLog(log));
    }

    public Flowable<RegisterTokenEventResponse> registerTokenEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(REGISTERTOKEN_EVENT));
        return registerTokenEventFlowable(filter);
    }

    public static List<SetSlasherEventResponse> getSetSlasherEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETSLASHER_EVENT, transactionReceipt);
        ArrayList<SetSlasherEventResponse> responses = new ArrayList<SetSlasherEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetSlasherEventResponse typedResponse = new SetSlasherEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.slasher = (String) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetSlasherEventResponse getSetSlasherEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETSLASHER_EVENT, log);
        SetSlasherEventResponse typedResponse = new SetSlasherEventResponse();
        typedResponse.log = log;
        typedResponse.slasher = (String) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<SetSlasherEventResponse> setSlasherEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetSlasherEventFromLog(log));
    }

    public Flowable<SetSlasherEventResponse> setSlasherEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETSLASHER_EVENT));
        return setSlasherEventFlowable(filter);
    }

    public static List<SetSlashingDataEventResponse> getSetSlashingDataEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(SETSLASHINGDATA_EVENT, transactionReceipt);
        ArrayList<SetSlashingDataEventResponse> responses = new ArrayList<SetSlashingDataEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SetSlashingDataEventResponse typedResponse = new SetSlashingDataEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.requireSlasher = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.minVaultEpochDuration = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static SetSlashingDataEventResponse getSetSlashingDataEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(SETSLASHINGDATA_EVENT, log);
        SetSlashingDataEventResponse typedResponse = new SetSlashingDataEventResponse();
        typedResponse.log = log;
        typedResponse.requireSlasher = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
        typedResponse.minVaultEpochDuration = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<SetSlashingDataEventResponse> setSlashingDataEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getSetSlashingDataEventFromLog(log));
    }

    public Flowable<SetSlashingDataEventResponse> setSlashingDataEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SETSLASHINGDATA_EVENT));
        return setSlashingDataEventFlowable(filter);
    }

    public static List<UnregisterOperatorEventResponse> getUnregisterOperatorEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(UNREGISTEROPERATOR_EVENT, transactionReceipt);
        ArrayList<UnregisterOperatorEventResponse> responses = new ArrayList<UnregisterOperatorEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            UnregisterOperatorEventResponse typedResponse = new UnregisterOperatorEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static UnregisterOperatorEventResponse getUnregisterOperatorEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(UNREGISTEROPERATOR_EVENT, log);
        UnregisterOperatorEventResponse typedResponse = new UnregisterOperatorEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<UnregisterOperatorEventResponse> unregisterOperatorEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getUnregisterOperatorEventFromLog(log));
    }

    public Flowable<UnregisterOperatorEventResponse> unregisterOperatorEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(UNREGISTEROPERATOR_EVENT));
        return unregisterOperatorEventFlowable(filter);
    }

    public static List<UnregisterOperatorVaultEventResponse> getUnregisterOperatorVaultEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(UNREGISTEROPERATORVAULT_EVENT, transactionReceipt);
        ArrayList<UnregisterOperatorVaultEventResponse> responses = new ArrayList<UnregisterOperatorVaultEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            UnregisterOperatorVaultEventResponse typedResponse = new UnregisterOperatorVaultEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.vault = (String) eventValues.getIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static UnregisterOperatorVaultEventResponse getUnregisterOperatorVaultEventFromLog(
            Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(UNREGISTEROPERATORVAULT_EVENT, log);
        UnregisterOperatorVaultEventResponse typedResponse = new UnregisterOperatorVaultEventResponse();
        typedResponse.log = log;
        typedResponse.operator = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.vault = (String) eventValues.getIndexedValues().get(1).getValue();
        return typedResponse;
    }

    public Flowable<UnregisterOperatorVaultEventResponse> unregisterOperatorVaultEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getUnregisterOperatorVaultEventFromLog(log));
    }

    public Flowable<UnregisterOperatorVaultEventResponse> unregisterOperatorVaultEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(UNREGISTEROPERATORVAULT_EVENT));
        return unregisterOperatorVaultEventFlowable(filter);
    }

    public static List<UnregisterSharedVaultEventResponse> getUnregisterSharedVaultEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(UNREGISTERSHAREDVAULT_EVENT, transactionReceipt);
        ArrayList<UnregisterSharedVaultEventResponse> responses = new ArrayList<UnregisterSharedVaultEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            UnregisterSharedVaultEventResponse typedResponse = new UnregisterSharedVaultEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.vault = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static UnregisterSharedVaultEventResponse getUnregisterSharedVaultEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(UNREGISTERSHAREDVAULT_EVENT, log);
        UnregisterSharedVaultEventResponse typedResponse = new UnregisterSharedVaultEventResponse();
        typedResponse.log = log;
        typedResponse.vault = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<UnregisterSharedVaultEventResponse> unregisterSharedVaultEventFlowable(
            EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getUnregisterSharedVaultEventFromLog(log));
    }

    public Flowable<UnregisterSharedVaultEventResponse> unregisterSharedVaultEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(UNREGISTERSHAREDVAULT_EVENT));
        return unregisterSharedVaultEventFlowable(filter);
    }

    public static List<UnregisterTokenEventResponse> getUnregisterTokenEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(UNREGISTERTOKEN_EVENT, transactionReceipt);
        ArrayList<UnregisterTokenEventResponse> responses = new ArrayList<UnregisterTokenEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            UnregisterTokenEventResponse typedResponse = new UnregisterTokenEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.token = (String) eventValues.getIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static UnregisterTokenEventResponse getUnregisterTokenEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(UNREGISTERTOKEN_EVENT, log);
        UnregisterTokenEventResponse typedResponse = new UnregisterTokenEventResponse();
        typedResponse.log = log;
        typedResponse.token = (String) eventValues.getIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<UnregisterTokenEventResponse> unregisterTokenEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getUnregisterTokenEventFromLog(log));
    }

    public Flowable<UnregisterTokenEventResponse> unregisterTokenEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(UNREGISTERTOKEN_EVENT));
        return unregisterTokenEventFlowable(filter);
    }

    public static List<VetoSlashEventResponse> getVetoSlashEvents(
            TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = staticExtractEventParametersWithLog(VETOSLASH_EVENT, transactionReceipt);
        ArrayList<VetoSlashEventResponse> responses = new ArrayList<VetoSlashEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            VetoSlashEventResponse typedResponse = new VetoSlashEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
            typedResponse.operator = (String) eventValues.getIndexedValues().get(1).getValue();
            typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
            typedResponse.slashIndex = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static VetoSlashEventResponse getVetoSlashEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(VETOSLASH_EVENT, log);
        VetoSlashEventResponse typedResponse = new VetoSlashEventResponse();
        typedResponse.log = log;
        typedResponse.slasher = (String) eventValues.getIndexedValues().get(0).getValue();
        typedResponse.operator = (String) eventValues.getIndexedValues().get(1).getValue();
        typedResponse.success = (Boolean) eventValues.getIndexedValues().get(2).getValue();
        typedResponse.slashIndex = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        return typedResponse;
    }

    public Flowable<VetoSlashEventResponse> vetoSlashEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getVetoSlashEventFromLog(log));
    }

    public Flowable<VetoSlashEventResponse> vetoSlashEventFlowable(DefaultBlockParameter startBlock,
            DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(VETOSLASH_EVENT));
        return vetoSlashEventFlowable(filter);
    }

    @Deprecated
    public static BaseSlashing.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new BaseSlashing.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static BaseSlashing.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new BaseSlashing.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static BaseSlashing.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new BaseSlashing.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static BaseSlashing.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new BaseSlashing.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class VaultValue extends StaticStruct {
        public String vault;

        public BigInteger value;

        public VaultValue(String vault, BigInteger value) {
            super(new org.web3j.abi.datatypes.Address(160, vault), 
                    new org.web3j.abi.datatypes.generated.Uint256(value));
            this.vault = vault;
            this.value = value;
        }

        public VaultValue(Address vault, Uint256 value) {
            super(vault, value);
            this.vault = vault.getValue();
            this.value = value.getValue();
        }
    }

    public static class OperatorVotingPower extends DynamicStruct {
        public String operator;

        public List<VaultValue> vaults;

        public OperatorVotingPower(String operator, List<VaultValue> vaults) {
            super(new org.web3j.abi.datatypes.Address(160, operator), 
                    new org.web3j.abi.datatypes.DynamicArray<VaultValue>(VaultValue.class, vaults));
            this.operator = operator;
            this.vaults = vaults;
        }

        public OperatorVotingPower(Address operator,
                @Parameterized(type = VaultValue.class) DynamicArray<VaultValue> vaults) {
            super(operator, vaults);
            this.operator = operator.getValue();
            this.vaults = vaults.getValue();
        }
    }

    public static class EIP712DomainChangedEventResponse extends BaseEventResponse {
    }

    public static class ExecuteSlashEventResponse extends BaseEventResponse {
        public String slasher;

        public BigInteger slashIndex;

        public Boolean success;

        public BigInteger slashedAmount;
    }

    public static class InitEIP712EventResponse extends BaseEventResponse {
        public String name;

        public String version;
    }

    public static class InitSubnetworkEventResponse extends BaseEventResponse {
        public String network;

        public BigInteger subnetworkId;
    }

    public static class InitializedEventResponse extends BaseEventResponse {
        public BigInteger version;
    }

    public static class InstantSlashEventResponse extends BaseEventResponse {
        public String slasher;

        public String operator;

        public Boolean success;

        public BigInteger slashedAmount;
    }

    public static class RegisterOperatorEventResponse extends BaseEventResponse {
        public String operator;
    }

    public static class RegisterOperatorVaultEventResponse extends BaseEventResponse {
        public String operator;

        public String vault;
    }

    public static class RegisterSharedVaultEventResponse extends BaseEventResponse {
        public String vault;
    }

    public static class RegisterTokenEventResponse extends BaseEventResponse {
        public String token;
    }

    public static class SetSlasherEventResponse extends BaseEventResponse {
        public String slasher;
    }

    public static class SetSlashingDataEventResponse extends BaseEventResponse {
        public Boolean requireSlasher;

        public BigInteger minVaultEpochDuration;
    }

    public static class UnregisterOperatorEventResponse extends BaseEventResponse {
        public String operator;
    }

    public static class UnregisterOperatorVaultEventResponse extends BaseEventResponse {
        public String operator;

        public String vault;
    }

    public static class UnregisterSharedVaultEventResponse extends BaseEventResponse {
        public String vault;
    }

    public static class UnregisterTokenEventResponse extends BaseEventResponse {
        public String token;
    }

    public static class VetoSlashEventResponse extends BaseEventResponse {
        public String slasher;

        public String operator;

        public Boolean success;

        public BigInteger slashIndex;
    }
}
