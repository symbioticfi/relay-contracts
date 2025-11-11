package fi.symbiotic.relay;

import java.math.BigInteger;
import java.util.Arrays;
import org.web3j.abi.TypeReference;
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
public class SigVerifierBlsBn254Simple.abi extends Contract {
    public static final String BINARY = "Bin file was not provided";

    public static final String FUNC_AGGREGATED_PUBLIC_KEY_G1_HASH = "AGGREGATED_PUBLIC_KEY_G1_HASH";

    public static final String FUNC_MAX_VALIDATORS = "MAX_VALIDATORS";

    public static final String FUNC_VALIDATOR_SET_HASH_KECCAK256_HASH = "VALIDATOR_SET_HASH_KECCAK256_HASH";

    public static final String FUNC_VERIFICATION_TYPE = "VERIFICATION_TYPE";

    public static final String FUNC_VERIFYQUORUMSIG = "verifyQuorumSig";

    public static final CustomError INVALIDKEYTAG_ERROR = new CustomError("InvalidKeyTag", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254SIMPLE_INVALIDMESSAGELENGTH_ERROR = new CustomError("SigVerifierBlsBn254Simple_InvalidMessageLength", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254SIMPLE_INVALIDNONSIGNERINDEX_ERROR = new CustomError("SigVerifierBlsBn254Simple_InvalidNonSignerIndex", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254SIMPLE_INVALIDNONSIGNERSORDER_ERROR = new CustomError("SigVerifierBlsBn254Simple_InvalidNonSignersOrder", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254SIMPLE_INVALIDPROOFLENGTH_ERROR = new CustomError("SigVerifierBlsBn254Simple_InvalidProofLength", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254SIMPLE_INVALIDPROOFOFFSET_ERROR = new CustomError("SigVerifierBlsBn254Simple_InvalidProofOffset", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254SIMPLE_TOOMANYVALIDATORS_ERROR = new CustomError("SigVerifierBlsBn254Simple_TooManyValidators", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final CustomError SIGVERIFIERBLSBN254SIMPLE_UNSUPPORTEDKEYTAG_ERROR = new CustomError("SigVerifierBlsBn254Simple_UnsupportedKeyTag", 
            Arrays.<TypeReference<?>>asList());
    ;

    @Deprecated
    protected SigVerifierBlsBn254Simple.abi(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected SigVerifierBlsBn254Simple.abi(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected SigVerifierBlsBn254Simple.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected SigVerifierBlsBn254Simple.abi(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<byte[]> AGGREGATED_PUBLIC_KEY_G1_HASH() {
        final Function function = new Function(FUNC_AGGREGATED_PUBLIC_KEY_G1_HASH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteFunctionCall<BigInteger> MAX_VALIDATORS() {
        final Function function = new Function(FUNC_MAX_VALIDATORS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<byte[]> VALIDATOR_SET_HASH_KECCAK256_HASH() {
        final Function function = new Function(FUNC_VALIDATOR_SET_HASH_KECCAK256_HASH, 
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
    public static SigVerifierBlsBn254Simple.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new SigVerifierBlsBn254Simple.abi(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static SigVerifierBlsBn254Simple.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new SigVerifierBlsBn254Simple.abi(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static SigVerifierBlsBn254Simple.abi load(String contractAddress, Web3j web3j,
            Credentials credentials, ContractGasProvider contractGasProvider) {
        return new SigVerifierBlsBn254Simple.abi(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static SigVerifierBlsBn254Simple.abi load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new SigVerifierBlsBn254Simple.abi(contractAddress, web3j, transactionManager, contractGasProvider);
    }
}
