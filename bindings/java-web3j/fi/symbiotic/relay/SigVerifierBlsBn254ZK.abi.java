package fi.symbiotic.relay;

import java.math.BigInteger;
import java.util.Arrays;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Bool;
import org.web3j.abi.datatypes.CustomError;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.abi.datatypes.generated.Uint32;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.RemoteFunctionCall;
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
public class SigVerifierBlsBn254ZK.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_TOTAL_ACTIVE_VALIDATORS_HASH = "TOTAL_ACTIVE_VALIDATORS_HASH";

    public static final String FUNC_VALIDATOR_SET_HASH_MIMC_HASH = "VALIDATOR_SET_HASH_MIMC_HASH";

    public static final String FUNC_VERIFICATION_TYPE = "VERIFICATION_TYPE";

    public static final String FUNC_MAXVALIDATORS = "maxValidators";

    public static final String FUNC_VERIFIERS = "verifiers";

    public static final String FUNC_VERIFYQUORUMSIG = "verifyQuorumSig";

    public static final CustomError INVALIDKEYTAG_ERROR = new CustomError("InvalidKeyTag", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_INVALIDLENGTH_ERROR = new CustomError("SigVerifierBlsBn254ZK_InvalidLength", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_INVALIDMAXVALIDATORS_ERROR = new CustomError("SigVerifierBlsBn254ZK_InvalidMaxValidators", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_INVALIDMAXVALIDATORSORDER_ERROR = new CustomError("SigVerifierBlsBn254ZK_InvalidMaxValidatorsOrder", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_INVALIDMESSAGELENGTH_ERROR = new CustomError("SigVerifierBlsBn254ZK_InvalidMessageLength", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_INVALIDPROOFLENGTH_ERROR = new CustomError("SigVerifierBlsBn254ZK_InvalidProofLength", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_INVALIDPROOFOFFSET_ERROR = new CustomError("SigVerifierBlsBn254ZK_InvalidProofOffset", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_INVALIDTOTALACTIVEVALIDATORS_ERROR = new CustomError("SigVerifierBlsBn254ZK_InvalidTotalActiveValidators", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_INVALIDVERIFIER_ERROR = new CustomError("SigVerifierBlsBn254ZK_InvalidVerifier", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254ZK_UNSUPPORTEDKEYTAG_ERROR = new CustomError("SigVerifierBlsBn254ZK_UnsupportedKeyTag", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected SigVerifierBlsBn254ZK.abi(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected SigVerifierBlsBn254ZK.abi(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected SigVerifierBlsBn254ZK.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected SigVerifierBlsBn254ZK.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<byte[]> TOTAL_ACTIVE_VALIDATORS_HASH() {
        final Function function = new Function(FUNC_TOTAL_ACTIVE_VALIDATORS_HASH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<byte[]> VALIDATOR_SET_HASH_MIMC_HASH() {
        final Function function = new Function(FUNC_VALIDATOR_SET_HASH_MIMC_HASH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<BigInteger> VERIFICATION_TYPE() {
        final Function function = new Function(FUNC_VERIFICATION_TYPE, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint32>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<BigInteger> maxValidators(BigInteger param0) {
        final Function function = new Function(FUNC_MAXVALIDATORS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<String> verifiers(BigInteger param0) {
        final Function function = new Function(FUNC_VERIFIERS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<Boolean> verifyQuorumSig(String settlement, BigInteger epoch,
            byte[] message, BigInteger keyTag, BigInteger quorumThreshold, byte[] proof) {
        final Function function = new Function(FUNC_VERIFYQUORUMSIG, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, settlement), 
                new org.web3j.abi.datatypes.generated.Uint48(epoch), 
                new org.web3j.abi.datatypes.DynamicBytes(message), 
                new org.web3j.abi.datatypes.generated.Uint8(keyTag), 
                new org.web3j.abi.datatypes.generated.Uint256(quorumThreshold), 
                new org.web3j.abi.datatypes.DynamicBytes(proof)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    @Deprecated
    public static SigVerifierBlsBn254ZK.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new SigVerifierBlsBn254ZK.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static SigVerifierBlsBn254ZK.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new SigVerifierBlsBn254ZK.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static SigVerifierBlsBn254ZK.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new SigVerifierBlsBn254ZK.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static SigVerifierBlsBn254ZK.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new SigVerifierBlsBn254ZK.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }
}
