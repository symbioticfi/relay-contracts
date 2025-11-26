///Module containing a contract's types and functions.
/**

```solidity
library IVotingPowerProvider {
    struct OperatorVotingPower { address operator; VaultValue[] vaults; }
    struct VaultValue { address vault; uint256 value; }
}
```*/
#[allow(
    non_camel_case_types,
    non_snake_case,
    clippy::pub_underscore_fields,
    clippy::style,
    clippy::empty_structs_with_brackets
)]
pub mod IVotingPowerProvider {
    use super::*;
    use alloy::sol_types as alloy_sol_types;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**```solidity
struct OperatorVotingPower { address operator; VaultValue[] vaults; }
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct OperatorVotingPower {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub vaults: alloy::sol_types::private::Vec<
            <VaultValue as alloy::sol_types::SolType>::RustType,
        >,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = (
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Array<VaultValue>,
        );
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = (
            alloy::sol_types::private::Address,
            alloy::sol_types::private::Vec<
                <VaultValue as alloy::sol_types::SolType>::RustType,
            >,
        );
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<OperatorVotingPower> for UnderlyingRustTuple<'_> {
            fn from(value: OperatorVotingPower) -> Self {
                (value.operator, value.vaults)
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>> for OperatorVotingPower {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self {
                    operator: tuple.0,
                    vaults: tuple.1,
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolValue for OperatorVotingPower {
            type SolType = Self;
        }
        #[automatically_derived]
        impl alloy_sol_types::private::SolTypeValue<Self> for OperatorVotingPower {
            #[inline]
            fn stv_to_tokens(&self) -> <Self as alloy_sol_types::SolType>::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Array<
                        VaultValue,
                    > as alloy_sol_types::SolType>::tokenize(&self.vaults),
                )
            }
            #[inline]
            fn stv_abi_encoded_size(&self) -> usize {
                if let Some(size) = <Self as alloy_sol_types::SolType>::ENCODED_SIZE {
                    return size;
                }
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_encoded_size(&tuple)
            }
            #[inline]
            fn stv_eip712_data_word(&self) -> alloy_sol_types::Word {
                <Self as alloy_sol_types::SolStruct>::eip712_hash_struct(self)
            }
            #[inline]
            fn stv_abi_encode_packed_to(
                &self,
                out: &mut alloy_sol_types::private::Vec<u8>,
            ) {
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_encode_packed_to(&tuple, out)
            }
            #[inline]
            fn stv_abi_packed_encoded_size(&self) -> usize {
                if let Some(size) = <Self as alloy_sol_types::SolType>::PACKED_ENCODED_SIZE {
                    return size;
                }
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_packed_encoded_size(&tuple)
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolType for OperatorVotingPower {
            type RustType = Self;
            type Token<'a> = <UnderlyingSolTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SOL_NAME: &'static str = <Self as alloy_sol_types::SolStruct>::NAME;
            const ENCODED_SIZE: Option<usize> = <UnderlyingSolTuple<
                '_,
            > as alloy_sol_types::SolType>::ENCODED_SIZE;
            const PACKED_ENCODED_SIZE: Option<usize> = <UnderlyingSolTuple<
                '_,
            > as alloy_sol_types::SolType>::PACKED_ENCODED_SIZE;
            #[inline]
            fn valid_token(token: &Self::Token<'_>) -> bool {
                <UnderlyingSolTuple<'_> as alloy_sol_types::SolType>::valid_token(token)
            }
            #[inline]
            fn detokenize(token: Self::Token<'_>) -> Self::RustType {
                let tuple = <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::detokenize(token);
                <Self as ::core::convert::From<UnderlyingRustTuple<'_>>>::from(tuple)
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolStruct for OperatorVotingPower {
            const NAME: &'static str = "OperatorVotingPower";
            #[inline]
            fn eip712_root_type() -> alloy_sol_types::private::Cow<'static, str> {
                alloy_sol_types::private::Cow::Borrowed(
                    "OperatorVotingPower(address operator,VaultValue[] vaults)",
                )
            }
            #[inline]
            fn eip712_components() -> alloy_sol_types::private::Vec<
                alloy_sol_types::private::Cow<'static, str>,
            > {
                let mut components = alloy_sol_types::private::Vec::with_capacity(1);
                components
                    .push(
                        <VaultValue as alloy_sol_types::SolStruct>::eip712_root_type(),
                    );
                components
                    .extend(
                        <VaultValue as alloy_sol_types::SolStruct>::eip712_components(),
                    );
                components
            }
            #[inline]
            fn eip712_encode_data(&self) -> alloy_sol_types::private::Vec<u8> {
                [
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.operator,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Array<
                        VaultValue,
                    > as alloy_sol_types::SolType>::eip712_data_word(&self.vaults)
                        .0,
                ]
                    .concat()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::EventTopic for OperatorVotingPower {
            #[inline]
            fn topic_preimage_length(rust: &Self::RustType) -> usize {
                0usize
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.operator,
                    )
                    + <alloy::sol_types::sol_data::Array<
                        VaultValue,
                    > as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.vaults,
                    )
            }
            #[inline]
            fn encode_topic_preimage(
                rust: &Self::RustType,
                out: &mut alloy_sol_types::private::Vec<u8>,
            ) {
                out.reserve(
                    <Self as alloy_sol_types::EventTopic>::topic_preimage_length(rust),
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.operator,
                    out,
                );
                <alloy::sol_types::sol_data::Array<
                    VaultValue,
                > as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.vaults,
                    out,
                );
            }
            #[inline]
            fn encode_topic(
                rust: &Self::RustType,
            ) -> alloy_sol_types::abi::token::WordToken {
                let mut out = alloy_sol_types::private::Vec::new();
                <Self as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    rust,
                    &mut out,
                );
                alloy_sol_types::abi::token::WordToken(
                    alloy_sol_types::private::keccak256(out),
                )
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**```solidity
struct VaultValue { address vault; uint256 value; }
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VaultValue {
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub value: alloy::sol_types::private::primitives::aliases::U256,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = (
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Uint<256>,
        );
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = (
            alloy::sol_types::private::Address,
            alloy::sol_types::private::primitives::aliases::U256,
        );
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VaultValue> for UnderlyingRustTuple<'_> {
            fn from(value: VaultValue) -> Self {
                (value.vault, value.value)
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>> for VaultValue {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self {
                    vault: tuple.0,
                    value: tuple.1,
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolValue for VaultValue {
            type SolType = Self;
        }
        #[automatically_derived]
        impl alloy_sol_types::private::SolTypeValue<Self> for VaultValue {
            #[inline]
            fn stv_to_tokens(&self) -> <Self as alloy_sol_types::SolType>::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.vault,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        256,
                    > as alloy_sol_types::SolType>::tokenize(&self.value),
                )
            }
            #[inline]
            fn stv_abi_encoded_size(&self) -> usize {
                if let Some(size) = <Self as alloy_sol_types::SolType>::ENCODED_SIZE {
                    return size;
                }
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_encoded_size(&tuple)
            }
            #[inline]
            fn stv_eip712_data_word(&self) -> alloy_sol_types::Word {
                <Self as alloy_sol_types::SolStruct>::eip712_hash_struct(self)
            }
            #[inline]
            fn stv_abi_encode_packed_to(
                &self,
                out: &mut alloy_sol_types::private::Vec<u8>,
            ) {
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_encode_packed_to(&tuple, out)
            }
            #[inline]
            fn stv_abi_packed_encoded_size(&self) -> usize {
                if let Some(size) = <Self as alloy_sol_types::SolType>::PACKED_ENCODED_SIZE {
                    return size;
                }
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_packed_encoded_size(&tuple)
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolType for VaultValue {
            type RustType = Self;
            type Token<'a> = <UnderlyingSolTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SOL_NAME: &'static str = <Self as alloy_sol_types::SolStruct>::NAME;
            const ENCODED_SIZE: Option<usize> = <UnderlyingSolTuple<
                '_,
            > as alloy_sol_types::SolType>::ENCODED_SIZE;
            const PACKED_ENCODED_SIZE: Option<usize> = <UnderlyingSolTuple<
                '_,
            > as alloy_sol_types::SolType>::PACKED_ENCODED_SIZE;
            #[inline]
            fn valid_token(token: &Self::Token<'_>) -> bool {
                <UnderlyingSolTuple<'_> as alloy_sol_types::SolType>::valid_token(token)
            }
            #[inline]
            fn detokenize(token: Self::Token<'_>) -> Self::RustType {
                let tuple = <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::detokenize(token);
                <Self as ::core::convert::From<UnderlyingRustTuple<'_>>>::from(tuple)
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolStruct for VaultValue {
            const NAME: &'static str = "VaultValue";
            #[inline]
            fn eip712_root_type() -> alloy_sol_types::private::Cow<'static, str> {
                alloy_sol_types::private::Cow::Borrowed(
                    "VaultValue(address vault,uint256 value)",
                )
            }
            #[inline]
            fn eip712_components() -> alloy_sol_types::private::Vec<
                alloy_sol_types::private::Cow<'static, str>,
            > {
                alloy_sol_types::private::Vec::new()
            }
            #[inline]
            fn eip712_encode_type() -> alloy_sol_types::private::Cow<'static, str> {
                <Self as alloy_sol_types::SolStruct>::eip712_root_type()
            }
            #[inline]
            fn eip712_encode_data(&self) -> alloy_sol_types::private::Vec<u8> {
                [
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.vault,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Uint<
                        256,
                    > as alloy_sol_types::SolType>::eip712_data_word(&self.value)
                        .0,
                ]
                    .concat()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::EventTopic for VaultValue {
            #[inline]
            fn topic_preimage_length(rust: &Self::RustType) -> usize {
                0usize
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.vault,
                    )
                    + <alloy::sol_types::sol_data::Uint<
                        256,
                    > as alloy_sol_types::EventTopic>::topic_preimage_length(&rust.value)
            }
            #[inline]
            fn encode_topic_preimage(
                rust: &Self::RustType,
                out: &mut alloy_sol_types::private::Vec<u8>,
            ) {
                out.reserve(
                    <Self as alloy_sol_types::EventTopic>::topic_preimage_length(rust),
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.vault,
                    out,
                );
                <alloy::sol_types::sol_data::Uint<
                    256,
                > as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.value,
                    out,
                );
            }
            #[inline]
            fn encode_topic(
                rust: &Self::RustType,
            ) -> alloy_sol_types::abi::token::WordToken {
                let mut out = alloy_sol_types::private::Vec::new();
                <Self as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    rust,
                    &mut out,
                );
                alloy_sol_types::abi::token::WordToken(
                    alloy_sol_types::private::keccak256(out),
                )
            }
        }
    };
    use alloy::contract as alloy_contract;
    /**Creates a new wrapper around an on-chain [`IVotingPowerProvider`](self) contract instance.

See the [wrapper's documentation](`IVotingPowerProviderInstance`) for more details.*/
    #[inline]
    pub const fn new<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    >(
        address: alloy_sol_types::private::Address,
        __provider: P,
    ) -> IVotingPowerProviderInstance<P, N> {
        IVotingPowerProviderInstance::<P, N>::new(address, __provider)
    }
    /**A [`IVotingPowerProvider`](self) instance.

Contains type-safe methods for interacting with an on-chain instance of the
[`IVotingPowerProvider`](self) contract located at a given `address`, using a given
provider `P`.

If the contract bytecode is available (see the [`sol!`](alloy_sol_types::sol!)
documentation on how to provide it), the `deploy` and `deploy_builder` methods can
be used to deploy a new instance of the contract.

See the [module-level documentation](self) for all the available methods.*/
    #[derive(Clone)]
    pub struct IVotingPowerProviderInstance<P, N = alloy_contract::private::Ethereum> {
        address: alloy_sol_types::private::Address,
        provider: P,
        _network: ::core::marker::PhantomData<N>,
    }
    #[automatically_derived]
    impl<P, N> ::core::fmt::Debug for IVotingPowerProviderInstance<P, N> {
        #[inline]
        fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
            f.debug_tuple("IVotingPowerProviderInstance").field(&self.address).finish()
        }
    }
    /// Instantiation and getters/setters.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > IVotingPowerProviderInstance<P, N> {
        /**Creates a new wrapper around an on-chain [`IVotingPowerProvider`](self) contract instance.

See the [wrapper's documentation](`IVotingPowerProviderInstance`) for more details.*/
        #[inline]
        pub const fn new(
            address: alloy_sol_types::private::Address,
            __provider: P,
        ) -> Self {
            Self {
                address,
                provider: __provider,
                _network: ::core::marker::PhantomData,
            }
        }
        /// Returns a reference to the address.
        #[inline]
        pub const fn address(&self) -> &alloy_sol_types::private::Address {
            &self.address
        }
        /// Sets the address.
        #[inline]
        pub fn set_address(&mut self, address: alloy_sol_types::private::Address) {
            self.address = address;
        }
        /// Sets the address and returns `self`.
        pub fn at(mut self, address: alloy_sol_types::private::Address) -> Self {
            self.set_address(address);
            self
        }
        /// Returns a reference to the provider.
        #[inline]
        pub const fn provider(&self) -> &P {
            &self.provider
        }
    }
    impl<P: ::core::clone::Clone, N> IVotingPowerProviderInstance<&P, N> {
        /// Clones the provider and returns a new instance with the cloned provider.
        #[inline]
        pub fn with_cloned_provider(self) -> IVotingPowerProviderInstance<P, N> {
            IVotingPowerProviderInstance {
                address: self.address,
                provider: ::core::clone::Clone::clone(&self.provider),
                _network: ::core::marker::PhantomData,
            }
        }
    }
    /// Function calls.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > IVotingPowerProviderInstance<P, N> {
        /// Creates a new call builder using this contract instance's provider and address.
        ///
        /// Note that the call can be any function call, not just those defined in this
        /// contract. Prefer using the other methods for building type-safe contract calls.
        pub fn call_builder<C: alloy_sol_types::SolCall>(
            &self,
            call: &C,
        ) -> alloy_contract::SolCallBuilder<&P, C, N> {
            alloy_contract::SolCallBuilder::new_sol(&self.provider, &self.address, call)
        }
    }
    /// Event filters.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > IVotingPowerProviderInstance<P, N> {
        /// Creates a new event filter using this contract instance's provider and address.
        ///
        /// Note that the type can be any event, not just those defined in this contract.
        /// Prefer using the other methods for building type-safe event filters.
        pub fn event_filter<E: alloy_sol_types::SolEvent>(
            &self,
        ) -> alloy_contract::Event<&P, E, N> {
            alloy_contract::Event::new_sol(&self.provider, &self.address)
        }
    }
}
/**

Generated by the following Solidity interface...
```solidity
library IVotingPowerProvider {
    struct OperatorVotingPower {
        address operator;
        VaultValue[] vaults;
    }
    struct VaultValue {
        address vault;
        uint256 value;
    }
}

interface IOpNetVaultAutoDeploy {
    struct AutoDeployConfig {
        uint48 epochDuration;
        address collateral;
        address burner;
        bool withSlasher;
        bool isBurnerHook;
    }

    error OpNetVaultAutoDeploy_InvalidBurnerHook();
    error OpNetVaultAutoDeploy_InvalidCollateral();
    error OpNetVaultAutoDeploy_InvalidEpochDuration();
    error OpNetVaultAutoDeploy_InvalidWithSlasher();
    error VotingPowerProvider_InvalidOperator();
    error VotingPowerProvider_InvalidOperatorVault();
    error VotingPowerProvider_InvalidSharedVault();
    error VotingPowerProvider_InvalidSignature();
    error VotingPowerProvider_InvalidToken();
    error VotingPowerProvider_InvalidVault();
    error VotingPowerProvider_OperatorAlreadyRegistered();
    error VotingPowerProvider_OperatorNotRegistered();
    error VotingPowerProvider_OperatorVaultAlreadyIsRegistered();
    error VotingPowerProvider_OperatorVaultNotRegistered();
    error VotingPowerProvider_SharedVaultAlreadyIsRegistered();
    error VotingPowerProvider_SharedVaultNotRegistered();
    error VotingPowerProvider_TokenAlreadyIsRegistered();
    error VotingPowerProvider_TokenNotRegistered();

    event RegisterOperator(address indexed operator);
    event RegisterOperatorVault(address indexed operator, address indexed vault);
    event RegisterSharedVault(address indexed vault);
    event RegisterToken(address indexed token);
    event SetAutoDeployConfig(AutoDeployConfig config);
    event SetAutoDeployStatus(bool status);
    event SetSetMaxNetworkLimitHookStatus(bool status);
    event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration);
    event UnregisterOperator(address indexed operator);
    event UnregisterOperatorVault(address indexed operator, address indexed vault);
    event UnregisterSharedVault(address indexed vault);
    event UnregisterToken(address indexed token);

    function OPERATOR_REGISTRY() external view returns (address);
    function VAULT_CONFIGURATOR() external view returns (address);
    function VAULT_FACTORY() external view returns (address);
    function getAutoDeployConfig() external view returns (AutoDeployConfig memory);
    function getAutoDeployedVault(address operator) external view returns (address);
    function getOperatorStakes(address operator) external view returns (IVotingPowerProvider.VaultValue[] memory);
    function getOperatorStakesAt(address operator, uint48 timestamp) external view returns (IVotingPowerProvider.VaultValue[] memory);
    function getOperatorVaults(address operator) external view returns (address[] memory);
    function getOperatorVaultsAt(address operator, uint48 timestamp) external view returns (address[] memory);
    function getOperatorVotingPowers(address operator, bytes memory extraData) external view returns (IVotingPowerProvider.VaultValue[] memory);
    function getOperatorVotingPowersAt(address operator, bytes memory extraData, uint48 timestamp) external view returns (IVotingPowerProvider.VaultValue[] memory);
    function getOperators() external view returns (address[] memory);
    function getOperatorsAt(uint48 timestamp) external view returns (address[] memory);
    function getSharedVaults() external view returns (address[] memory);
    function getSharedVaultsAt(uint48 timestamp) external view returns (address[] memory);
    function getSlashingData() external view returns (bool requireSlasher, uint48 minVaultEpochDuration);
    function getSlashingDataAt(uint48 timestamp, bytes memory hint) external view returns (bool requireSlasher, uint48 minVaultEpochDuration);
    function getTokens() external view returns (address[] memory);
    function getTokensAt(uint48 timestamp) external view returns (address[] memory);
    function getVotingPowers(bytes[] memory extraData) external view returns (IVotingPowerProvider.OperatorVotingPower[] memory);
    function getVotingPowersAt(bytes[] memory extraData, uint48 timestamp) external view returns (IVotingPowerProvider.OperatorVotingPower[] memory);
    function invalidateOldSignatures() external;
    function isAutoDeployEnabled() external view returns (bool);
    function isOperatorRegistered(address operator) external view returns (bool);
    function isOperatorRegisteredAt(address operator, uint48 timestamp) external view returns (bool);
    function isOperatorVaultRegistered(address vault) external view returns (bool);
    function isOperatorVaultRegistered(address operator, address vault) external view returns (bool);
    function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) external view returns (bool);
    function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) external view returns (bool);
    function isSetMaxNetworkLimitHookEnabled() external view returns (bool);
    function isSharedVaultRegistered(address vault) external view returns (bool);
    function isSharedVaultRegisteredAt(address vault, uint48 timestamp) external view returns (bool);
    function isTokenRegistered(address token) external view returns (bool);
    function isTokenRegisteredAt(address token, uint48 timestamp) external view returns (bool);
    function registerOperator() external;
    function registerOperatorWithSignature(address operator, bytes memory signature) external;
    function setAutoDeployConfig(AutoDeployConfig memory config) external;
    function setAutoDeployStatus(bool status) external;
    function setSetMaxNetworkLimitHookStatus(bool status) external;
    function unregisterOperator() external;
    function unregisterOperatorWithSignature(address operator, bytes memory signature) external;
}
```

...which was generated by the following JSON ABI:
```json
[
  {
    "type": "function",
    "name": "OPERATOR_REGISTRY",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "address",
        "internalType": "address"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "VAULT_CONFIGURATOR",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "address",
        "internalType": "address"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "VAULT_FACTORY",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "address",
        "internalType": "address"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getAutoDeployConfig",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "tuple",
        "internalType": "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        "components": [
          {
            "name": "epochDuration",
            "type": "uint48",
            "internalType": "uint48"
          },
          {
            "name": "collateral",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "burner",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "withSlasher",
            "type": "bool",
            "internalType": "bool"
          },
          {
            "name": "isBurnerHook",
            "type": "bool",
            "internalType": "bool"
          }
        ]
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getAutoDeployedVault",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "address",
        "internalType": "address"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperatorStakes",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "tuple[]",
        "internalType": "struct IVotingPowerProvider.VaultValue[]",
        "components": [
          {
            "name": "vault",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "value",
            "type": "uint256",
            "internalType": "uint256"
          }
        ]
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperatorStakesAt",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "tuple[]",
        "internalType": "struct IVotingPowerProvider.VaultValue[]",
        "components": [
          {
            "name": "vault",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "value",
            "type": "uint256",
            "internalType": "uint256"
          }
        ]
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperatorVaults",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "address[]",
        "internalType": "address[]"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperatorVaultsAt",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "address[]",
        "internalType": "address[]"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperatorVotingPowers",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "extraData",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "tuple[]",
        "internalType": "struct IVotingPowerProvider.VaultValue[]",
        "components": [
          {
            "name": "vault",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "value",
            "type": "uint256",
            "internalType": "uint256"
          }
        ]
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperatorVotingPowersAt",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "extraData",
        "type": "bytes",
        "internalType": "bytes"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "tuple[]",
        "internalType": "struct IVotingPowerProvider.VaultValue[]",
        "components": [
          {
            "name": "vault",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "value",
            "type": "uint256",
            "internalType": "uint256"
          }
        ]
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperators",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "address[]",
        "internalType": "address[]"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperatorsAt",
    "inputs": [
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "address[]",
        "internalType": "address[]"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getSharedVaults",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "address[]",
        "internalType": "address[]"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getSharedVaultsAt",
    "inputs": [
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "address[]",
        "internalType": "address[]"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getSlashingData",
    "inputs": [],
    "outputs": [
      {
        "name": "requireSlasher",
        "type": "bool",
        "internalType": "bool"
      },
      {
        "name": "minVaultEpochDuration",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getSlashingDataAt",
    "inputs": [
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      },
      {
        "name": "hint",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "outputs": [
      {
        "name": "requireSlasher",
        "type": "bool",
        "internalType": "bool"
      },
      {
        "name": "minVaultEpochDuration",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getTokens",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "address[]",
        "internalType": "address[]"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getTokensAt",
    "inputs": [
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "address[]",
        "internalType": "address[]"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getVotingPowers",
    "inputs": [
      {
        "name": "extraData",
        "type": "bytes[]",
        "internalType": "bytes[]"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "tuple[]",
        "internalType": "struct IVotingPowerProvider.OperatorVotingPower[]",
        "components": [
          {
            "name": "operator",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "vaults",
            "type": "tuple[]",
            "internalType": "struct IVotingPowerProvider.VaultValue[]",
            "components": [
              {
                "name": "vault",
                "type": "address",
                "internalType": "address"
              },
              {
                "name": "value",
                "type": "uint256",
                "internalType": "uint256"
              }
            ]
          }
        ]
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getVotingPowersAt",
    "inputs": [
      {
        "name": "extraData",
        "type": "bytes[]",
        "internalType": "bytes[]"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "tuple[]",
        "internalType": "struct IVotingPowerProvider.OperatorVotingPower[]",
        "components": [
          {
            "name": "operator",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "vaults",
            "type": "tuple[]",
            "internalType": "struct IVotingPowerProvider.VaultValue[]",
            "components": [
              {
                "name": "vault",
                "type": "address",
                "internalType": "address"
              },
              {
                "name": "value",
                "type": "uint256",
                "internalType": "uint256"
              }
            ]
          }
        ]
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "invalidateOldSignatures",
    "inputs": [],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "isAutoDeployEnabled",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isOperatorRegistered",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isOperatorRegisteredAt",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isOperatorVaultRegistered",
    "inputs": [
      {
        "name": "vault",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isOperatorVaultRegistered",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "vault",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isOperatorVaultRegisteredAt",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "vault",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isOperatorVaultRegisteredAt",
    "inputs": [
      {
        "name": "vault",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isSetMaxNetworkLimitHookEnabled",
    "inputs": [],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isSharedVaultRegistered",
    "inputs": [
      {
        "name": "vault",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isSharedVaultRegisteredAt",
    "inputs": [
      {
        "name": "vault",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isTokenRegistered",
    "inputs": [
      {
        "name": "token",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "isTokenRegisteredAt",
    "inputs": [
      {
        "name": "token",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "timestamp",
        "type": "uint48",
        "internalType": "uint48"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "registerOperator",
    "inputs": [],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "registerOperatorWithSignature",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "signature",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "setAutoDeployConfig",
    "inputs": [
      {
        "name": "config",
        "type": "tuple",
        "internalType": "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        "components": [
          {
            "name": "epochDuration",
            "type": "uint48",
            "internalType": "uint48"
          },
          {
            "name": "collateral",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "burner",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "withSlasher",
            "type": "bool",
            "internalType": "bool"
          },
          {
            "name": "isBurnerHook",
            "type": "bool",
            "internalType": "bool"
          }
        ]
      }
    ],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "setAutoDeployStatus",
    "inputs": [
      {
        "name": "status",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "setSetMaxNetworkLimitHookStatus",
    "inputs": [
      {
        "name": "status",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "unregisterOperator",
    "inputs": [],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "unregisterOperatorWithSignature",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "signature",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "event",
    "name": "RegisterOperator",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "RegisterOperatorVault",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      },
      {
        "name": "vault",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "RegisterSharedVault",
    "inputs": [
      {
        "name": "vault",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "RegisterToken",
    "inputs": [
      {
        "name": "token",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "SetAutoDeployConfig",
    "inputs": [
      {
        "name": "config",
        "type": "tuple",
        "indexed": false,
        "internalType": "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        "components": [
          {
            "name": "epochDuration",
            "type": "uint48",
            "internalType": "uint48"
          },
          {
            "name": "collateral",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "burner",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "withSlasher",
            "type": "bool",
            "internalType": "bool"
          },
          {
            "name": "isBurnerHook",
            "type": "bool",
            "internalType": "bool"
          }
        ]
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "SetAutoDeployStatus",
    "inputs": [
      {
        "name": "status",
        "type": "bool",
        "indexed": false,
        "internalType": "bool"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "SetSetMaxNetworkLimitHookStatus",
    "inputs": [
      {
        "name": "status",
        "type": "bool",
        "indexed": false,
        "internalType": "bool"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "SetSlashingData",
    "inputs": [
      {
        "name": "requireSlasher",
        "type": "bool",
        "indexed": false,
        "internalType": "bool"
      },
      {
        "name": "minVaultEpochDuration",
        "type": "uint48",
        "indexed": false,
        "internalType": "uint48"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "UnregisterOperator",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "UnregisterOperatorVault",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      },
      {
        "name": "vault",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "UnregisterSharedVault",
    "inputs": [
      {
        "name": "vault",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      }
    ],
    "anonymous": false
  },
  {
    "type": "event",
    "name": "UnregisterToken",
    "inputs": [
      {
        "name": "token",
        "type": "address",
        "indexed": true,
        "internalType": "address"
      }
    ],
    "anonymous": false
  },
  {
    "type": "error",
    "name": "OpNetVaultAutoDeploy_InvalidBurnerHook",
    "inputs": []
  },
  {
    "type": "error",
    "name": "OpNetVaultAutoDeploy_InvalidCollateral",
    "inputs": []
  },
  {
    "type": "error",
    "name": "OpNetVaultAutoDeploy_InvalidEpochDuration",
    "inputs": []
  },
  {
    "type": "error",
    "name": "OpNetVaultAutoDeploy_InvalidWithSlasher",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_InvalidOperator",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_InvalidOperatorVault",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_InvalidSharedVault",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_InvalidSignature",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_InvalidToken",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_InvalidVault",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_OperatorAlreadyRegistered",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_OperatorNotRegistered",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_OperatorVaultAlreadyIsRegistered",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_OperatorVaultNotRegistered",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_SharedVaultAlreadyIsRegistered",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_SharedVaultNotRegistered",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_TokenAlreadyIsRegistered",
    "inputs": []
  },
  {
    "type": "error",
    "name": "VotingPowerProvider_TokenNotRegistered",
    "inputs": []
  }
]
```*/
#[allow(
    non_camel_case_types,
    non_snake_case,
    clippy::pub_underscore_fields,
    clippy::style,
    clippy::empty_structs_with_brackets
)]
pub mod IOpNetVaultAutoDeploy {
    use super::*;
    use alloy::sol_types as alloy_sol_types;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**```solidity
struct AutoDeployConfig { uint48 epochDuration; address collateral; address burner; bool withSlasher; bool isBurnerHook; }
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct AutoDeployConfig {
        #[allow(missing_docs)]
        pub epochDuration: alloy::sol_types::private::primitives::aliases::U48,
        #[allow(missing_docs)]
        pub collateral: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub burner: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub withSlasher: bool,
        #[allow(missing_docs)]
        pub isBurnerHook: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = (
            alloy::sol_types::sol_data::Uint<48>,
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Bool,
            alloy::sol_types::sol_data::Bool,
        );
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = (
            alloy::sol_types::private::primitives::aliases::U48,
            alloy::sol_types::private::Address,
            alloy::sol_types::private::Address,
            bool,
            bool,
        );
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<AutoDeployConfig> for UnderlyingRustTuple<'_> {
            fn from(value: AutoDeployConfig) -> Self {
                (
                    value.epochDuration,
                    value.collateral,
                    value.burner,
                    value.withSlasher,
                    value.isBurnerHook,
                )
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>> for AutoDeployConfig {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self {
                    epochDuration: tuple.0,
                    collateral: tuple.1,
                    burner: tuple.2,
                    withSlasher: tuple.3,
                    isBurnerHook: tuple.4,
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolValue for AutoDeployConfig {
            type SolType = Self;
        }
        #[automatically_derived]
        impl alloy_sol_types::private::SolTypeValue<Self> for AutoDeployConfig {
            #[inline]
            fn stv_to_tokens(&self) -> <Self as alloy_sol_types::SolType>::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.epochDuration),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.collateral,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.burner,
                    ),
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.withSlasher,
                    ),
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.isBurnerHook,
                    ),
                )
            }
            #[inline]
            fn stv_abi_encoded_size(&self) -> usize {
                if let Some(size) = <Self as alloy_sol_types::SolType>::ENCODED_SIZE {
                    return size;
                }
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_encoded_size(&tuple)
            }
            #[inline]
            fn stv_eip712_data_word(&self) -> alloy_sol_types::Word {
                <Self as alloy_sol_types::SolStruct>::eip712_hash_struct(self)
            }
            #[inline]
            fn stv_abi_encode_packed_to(
                &self,
                out: &mut alloy_sol_types::private::Vec<u8>,
            ) {
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_encode_packed_to(&tuple, out)
            }
            #[inline]
            fn stv_abi_packed_encoded_size(&self) -> usize {
                if let Some(size) = <Self as alloy_sol_types::SolType>::PACKED_ENCODED_SIZE {
                    return size;
                }
                let tuple = <UnderlyingRustTuple<
                    '_,
                > as ::core::convert::From<Self>>::from(self.clone());
                <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_packed_encoded_size(&tuple)
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolType for AutoDeployConfig {
            type RustType = Self;
            type Token<'a> = <UnderlyingSolTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SOL_NAME: &'static str = <Self as alloy_sol_types::SolStruct>::NAME;
            const ENCODED_SIZE: Option<usize> = <UnderlyingSolTuple<
                '_,
            > as alloy_sol_types::SolType>::ENCODED_SIZE;
            const PACKED_ENCODED_SIZE: Option<usize> = <UnderlyingSolTuple<
                '_,
            > as alloy_sol_types::SolType>::PACKED_ENCODED_SIZE;
            #[inline]
            fn valid_token(token: &Self::Token<'_>) -> bool {
                <UnderlyingSolTuple<'_> as alloy_sol_types::SolType>::valid_token(token)
            }
            #[inline]
            fn detokenize(token: Self::Token<'_>) -> Self::RustType {
                let tuple = <UnderlyingSolTuple<
                    '_,
                > as alloy_sol_types::SolType>::detokenize(token);
                <Self as ::core::convert::From<UnderlyingRustTuple<'_>>>::from(tuple)
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolStruct for AutoDeployConfig {
            const NAME: &'static str = "AutoDeployConfig";
            #[inline]
            fn eip712_root_type() -> alloy_sol_types::private::Cow<'static, str> {
                alloy_sol_types::private::Cow::Borrowed(
                    "AutoDeployConfig(uint48 epochDuration,address collateral,address burner,bool withSlasher,bool isBurnerHook)",
                )
            }
            #[inline]
            fn eip712_components() -> alloy_sol_types::private::Vec<
                alloy_sol_types::private::Cow<'static, str>,
            > {
                alloy_sol_types::private::Vec::new()
            }
            #[inline]
            fn eip712_encode_type() -> alloy_sol_types::private::Cow<'static, str> {
                <Self as alloy_sol_types::SolStruct>::eip712_root_type()
            }
            #[inline]
            fn eip712_encode_data(&self) -> alloy_sol_types::private::Vec<u8> {
                [
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::eip712_data_word(&self.epochDuration)
                        .0,
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.collateral,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.burner,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::eip712_data_word(
                            &self.withSlasher,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::eip712_data_word(
                            &self.isBurnerHook,
                        )
                        .0,
                ]
                    .concat()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::EventTopic for AutoDeployConfig {
            #[inline]
            fn topic_preimage_length(rust: &Self::RustType) -> usize {
                0usize
                    + <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.epochDuration,
                    )
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.collateral,
                    )
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.burner,
                    )
                    + <alloy::sol_types::sol_data::Bool as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.withSlasher,
                    )
                    + <alloy::sol_types::sol_data::Bool as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.isBurnerHook,
                    )
            }
            #[inline]
            fn encode_topic_preimage(
                rust: &Self::RustType,
                out: &mut alloy_sol_types::private::Vec<u8>,
            ) {
                out.reserve(
                    <Self as alloy_sol_types::EventTopic>::topic_preimage_length(rust),
                );
                <alloy::sol_types::sol_data::Uint<
                    48,
                > as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.epochDuration,
                    out,
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.collateral,
                    out,
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.burner,
                    out,
                );
                <alloy::sol_types::sol_data::Bool as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.withSlasher,
                    out,
                );
                <alloy::sol_types::sol_data::Bool as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.isBurnerHook,
                    out,
                );
            }
            #[inline]
            fn encode_topic(
                rust: &Self::RustType,
            ) -> alloy_sol_types::abi::token::WordToken {
                let mut out = alloy_sol_types::private::Vec::new();
                <Self as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    rust,
                    &mut out,
                );
                alloy_sol_types::abi::token::WordToken(
                    alloy_sol_types::private::keccak256(out),
                )
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `OpNetVaultAutoDeploy_InvalidBurnerHook()` and selector `0x23d5adc6`.
```solidity
error OpNetVaultAutoDeploy_InvalidBurnerHook();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct OpNetVaultAutoDeploy_InvalidBurnerHook;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<OpNetVaultAutoDeploy_InvalidBurnerHook>
        for UnderlyingRustTuple<'_> {
            fn from(value: OpNetVaultAutoDeploy_InvalidBurnerHook) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for OpNetVaultAutoDeploy_InvalidBurnerHook {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for OpNetVaultAutoDeploy_InvalidBurnerHook {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "OpNetVaultAutoDeploy_InvalidBurnerHook()";
            const SELECTOR: [u8; 4] = [35u8, 213u8, 173u8, 198u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `OpNetVaultAutoDeploy_InvalidCollateral()` and selector `0x363e835e`.
```solidity
error OpNetVaultAutoDeploy_InvalidCollateral();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct OpNetVaultAutoDeploy_InvalidCollateral;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<OpNetVaultAutoDeploy_InvalidCollateral>
        for UnderlyingRustTuple<'_> {
            fn from(value: OpNetVaultAutoDeploy_InvalidCollateral) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for OpNetVaultAutoDeploy_InvalidCollateral {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for OpNetVaultAutoDeploy_InvalidCollateral {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "OpNetVaultAutoDeploy_InvalidCollateral()";
            const SELECTOR: [u8; 4] = [54u8, 62u8, 131u8, 94u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `OpNetVaultAutoDeploy_InvalidEpochDuration()` and selector `0x1648e96a`.
```solidity
error OpNetVaultAutoDeploy_InvalidEpochDuration();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct OpNetVaultAutoDeploy_InvalidEpochDuration;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<OpNetVaultAutoDeploy_InvalidEpochDuration>
        for UnderlyingRustTuple<'_> {
            fn from(value: OpNetVaultAutoDeploy_InvalidEpochDuration) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for OpNetVaultAutoDeploy_InvalidEpochDuration {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for OpNetVaultAutoDeploy_InvalidEpochDuration {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "OpNetVaultAutoDeploy_InvalidEpochDuration()";
            const SELECTOR: [u8; 4] = [22u8, 72u8, 233u8, 106u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `OpNetVaultAutoDeploy_InvalidWithSlasher()` and selector `0x85e2fdc9`.
```solidity
error OpNetVaultAutoDeploy_InvalidWithSlasher();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct OpNetVaultAutoDeploy_InvalidWithSlasher;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<OpNetVaultAutoDeploy_InvalidWithSlasher>
        for UnderlyingRustTuple<'_> {
            fn from(value: OpNetVaultAutoDeploy_InvalidWithSlasher) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for OpNetVaultAutoDeploy_InvalidWithSlasher {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for OpNetVaultAutoDeploy_InvalidWithSlasher {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "OpNetVaultAutoDeploy_InvalidWithSlasher()";
            const SELECTOR: [u8; 4] = [133u8, 226u8, 253u8, 201u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_InvalidOperator()` and selector `0x62dd74a9`.
```solidity
error VotingPowerProvider_InvalidOperator();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_InvalidOperator;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_InvalidOperator>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_InvalidOperator) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_InvalidOperator {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_InvalidOperator {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_InvalidOperator()";
            const SELECTOR: [u8; 4] = [98u8, 221u8, 116u8, 169u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_InvalidOperatorVault()` and selector `0x19902533`.
```solidity
error VotingPowerProvider_InvalidOperatorVault();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_InvalidOperatorVault;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_InvalidOperatorVault>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_InvalidOperatorVault) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_InvalidOperatorVault {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_InvalidOperatorVault {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_InvalidOperatorVault()";
            const SELECTOR: [u8; 4] = [25u8, 144u8, 37u8, 51u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_InvalidSharedVault()` and selector `0x19416e36`.
```solidity
error VotingPowerProvider_InvalidSharedVault();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_InvalidSharedVault;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_InvalidSharedVault>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_InvalidSharedVault) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_InvalidSharedVault {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_InvalidSharedVault {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_InvalidSharedVault()";
            const SELECTOR: [u8; 4] = [25u8, 65u8, 110u8, 54u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_InvalidSignature()` and selector `0xb1f1fda1`.
```solidity
error VotingPowerProvider_InvalidSignature();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_InvalidSignature;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_InvalidSignature>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_InvalidSignature) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_InvalidSignature {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_InvalidSignature {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_InvalidSignature()";
            const SELECTOR: [u8; 4] = [177u8, 241u8, 253u8, 161u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_InvalidToken()` and selector `0xa18f3007`.
```solidity
error VotingPowerProvider_InvalidToken();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_InvalidToken;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_InvalidToken>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_InvalidToken) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_InvalidToken {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_InvalidToken {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_InvalidToken()";
            const SELECTOR: [u8; 4] = [161u8, 143u8, 48u8, 7u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_InvalidVault()` and selector `0xc2169d2a`.
```solidity
error VotingPowerProvider_InvalidVault();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_InvalidVault;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_InvalidVault>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_InvalidVault) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_InvalidVault {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_InvalidVault {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_InvalidVault()";
            const SELECTOR: [u8; 4] = [194u8, 22u8, 157u8, 42u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_OperatorAlreadyRegistered()` and selector `0x210d8132`.
```solidity
error VotingPowerProvider_OperatorAlreadyRegistered();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_OperatorAlreadyRegistered;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_OperatorAlreadyRegistered>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_OperatorAlreadyRegistered) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_OperatorAlreadyRegistered {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError
        for VotingPowerProvider_OperatorAlreadyRegistered {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_OperatorAlreadyRegistered()";
            const SELECTOR: [u8; 4] = [33u8, 13u8, 129u8, 50u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_OperatorNotRegistered()` and selector `0x7135ac30`.
```solidity
error VotingPowerProvider_OperatorNotRegistered();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_OperatorNotRegistered;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_OperatorNotRegistered>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_OperatorNotRegistered) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_OperatorNotRegistered {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_OperatorNotRegistered {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_OperatorNotRegistered()";
            const SELECTOR: [u8; 4] = [113u8, 53u8, 172u8, 48u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_OperatorVaultAlreadyIsRegistered()` and selector `0xc9fd1bce`.
```solidity
error VotingPowerProvider_OperatorVaultAlreadyIsRegistered();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_OperatorVaultAlreadyIsRegistered;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_OperatorVaultAlreadyIsRegistered>
        for UnderlyingRustTuple<'_> {
            fn from(
                value: VotingPowerProvider_OperatorVaultAlreadyIsRegistered,
            ) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_OperatorVaultAlreadyIsRegistered {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError
        for VotingPowerProvider_OperatorVaultAlreadyIsRegistered {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_OperatorVaultAlreadyIsRegistered()";
            const SELECTOR: [u8; 4] = [201u8, 253u8, 27u8, 206u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_OperatorVaultNotRegistered()` and selector `0x3e2675c6`.
```solidity
error VotingPowerProvider_OperatorVaultNotRegistered();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_OperatorVaultNotRegistered;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_OperatorVaultNotRegistered>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_OperatorVaultNotRegistered) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_OperatorVaultNotRegistered {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError
        for VotingPowerProvider_OperatorVaultNotRegistered {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_OperatorVaultNotRegistered()";
            const SELECTOR: [u8; 4] = [62u8, 38u8, 117u8, 198u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_SharedVaultAlreadyIsRegistered()` and selector `0xe3124af7`.
```solidity
error VotingPowerProvider_SharedVaultAlreadyIsRegistered();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_SharedVaultAlreadyIsRegistered;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_SharedVaultAlreadyIsRegistered>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_SharedVaultAlreadyIsRegistered) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_SharedVaultAlreadyIsRegistered {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError
        for VotingPowerProvider_SharedVaultAlreadyIsRegistered {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_SharedVaultAlreadyIsRegistered()";
            const SELECTOR: [u8; 4] = [227u8, 18u8, 74u8, 247u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_SharedVaultNotRegistered()` and selector `0x96afc454`.
```solidity
error VotingPowerProvider_SharedVaultNotRegistered();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_SharedVaultNotRegistered;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_SharedVaultNotRegistered>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_SharedVaultNotRegistered) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_SharedVaultNotRegistered {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_SharedVaultNotRegistered {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_SharedVaultNotRegistered()";
            const SELECTOR: [u8; 4] = [150u8, 175u8, 196u8, 84u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_TokenAlreadyIsRegistered()` and selector `0xc5bcd8fa`.
```solidity
error VotingPowerProvider_TokenAlreadyIsRegistered();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_TokenAlreadyIsRegistered;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_TokenAlreadyIsRegistered>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_TokenAlreadyIsRegistered) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_TokenAlreadyIsRegistered {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_TokenAlreadyIsRegistered {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_TokenAlreadyIsRegistered()";
            const SELECTOR: [u8; 4] = [197u8, 188u8, 216u8, 250u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Custom error with signature `VotingPowerProvider_TokenNotRegistered()` and selector `0xd69e1d91`.
```solidity
error VotingPowerProvider_TokenNotRegistered();
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VotingPowerProvider_TokenNotRegistered;
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[doc(hidden)]
        #[allow(dead_code)]
        type UnderlyingSolTuple<'a> = ();
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = ();
        #[cfg(test)]
        #[allow(dead_code, unreachable_patterns)]
        fn _type_assertion(
            _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
        ) {
            match _t {
                alloy_sol_types::private::AssertTypeEq::<
                    <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                >(_) => {}
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<VotingPowerProvider_TokenNotRegistered>
        for UnderlyingRustTuple<'_> {
            fn from(value: VotingPowerProvider_TokenNotRegistered) -> Self {
                ()
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>>
        for VotingPowerProvider_TokenNotRegistered {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolError for VotingPowerProvider_TokenNotRegistered {
            type Parameters<'a> = UnderlyingSolTuple<'a>;
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VotingPowerProvider_TokenNotRegistered()";
            const SELECTOR: [u8; 4] = [214u8, 158u8, 29u8, 145u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn abi_decode_raw_validate(data: &[u8]) -> alloy_sol_types::Result<Self> {
                <Self::Parameters<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Self::new)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `RegisterOperator(address)` and selector `0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa`.
```solidity
event RegisterOperator(address indexed operator);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct RegisterOperator {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for RegisterOperator {
            type DataTuple<'a> = ();
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (
                alloy_sol_types::sol_data::FixedBytes<32>,
                alloy::sol_types::sol_data::Address,
            );
            const SIGNATURE: &'static str = "RegisterOperator(address)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                223u8, 217u8, 224u8, 57u8, 41u8, 18u8, 190u8, 233u8, 119u8, 119u8, 236u8,
                88u8, 141u8, 47u8, 247u8, 174u8, 1u8, 14u8, 162u8, 66u8, 2u8, 209u8,
                83u8, 160u8, 191u8, 241u8, 179u8, 10u8, 237u8, 100u8, 61u8, 170u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { operator: topics.1 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                ()
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(), self.operator.clone())
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                out[1usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.operator,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for RegisterOperator {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&RegisterOperator> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &RegisterOperator) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `RegisterOperatorVault(address,address)` and selector `0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc`.
```solidity
event RegisterOperatorVault(address indexed operator, address indexed vault);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct RegisterOperatorVault {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for RegisterOperatorVault {
            type DataTuple<'a> = ();
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (
                alloy_sol_types::sol_data::FixedBytes<32>,
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
            );
            const SIGNATURE: &'static str = "RegisterOperatorVault(address,address)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                109u8, 184u8, 209u8, 173u8, 121u8, 3u8, 50u8, 146u8, 80u8, 219u8, 155u8,
                122u8, 101u8, 61u8, 58u8, 160u8, 9u8, 128u8, 124u8, 133u8, 218u8, 162u8,
                40u8, 26u8, 117u8, 224u8, 99u8, 128u8, 139u8, 206u8, 239u8, 220u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self {
                    operator: topics.1,
                    vault: topics.2,
                }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                ()
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(), self.operator.clone(), self.vault.clone())
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                out[1usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.operator,
                );
                out[2usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.vault,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for RegisterOperatorVault {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&RegisterOperatorVault> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &RegisterOperatorVault) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `RegisterSharedVault(address)` and selector `0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c`.
```solidity
event RegisterSharedVault(address indexed vault);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct RegisterSharedVault {
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for RegisterSharedVault {
            type DataTuple<'a> = ();
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (
                alloy_sol_types::sol_data::FixedBytes<32>,
                alloy::sol_types::sol_data::Address,
            );
            const SIGNATURE: &'static str = "RegisterSharedVault(address)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                153u8, 82u8, 128u8, 101u8, 230u8, 84u8, 214u8, 212u8, 185u8, 84u8, 71u8,
                214u8, 120u8, 113u8, 72u8, 168u8, 75u8, 126u8, 152u8, 169u8, 94u8, 117u8,
                39u8, 132u8, 233u8, 157u8, 160u8, 86u8, 180u8, 3u8, 178u8, 92u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { vault: topics.1 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                ()
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(), self.vault.clone())
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                out[1usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.vault,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for RegisterSharedVault {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&RegisterSharedVault> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &RegisterSharedVault) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `RegisterToken(address)` and selector `0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16`.
```solidity
event RegisterToken(address indexed token);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct RegisterToken {
        #[allow(missing_docs)]
        pub token: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for RegisterToken {
            type DataTuple<'a> = ();
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (
                alloy_sol_types::sol_data::FixedBytes<32>,
                alloy::sol_types::sol_data::Address,
            );
            const SIGNATURE: &'static str = "RegisterToken(address)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                247u8, 254u8, 128u8, 35u8, 203u8, 46u8, 54u8, 189u8, 225u8, 213u8, 154u8,
                136u8, 172u8, 87u8, 99u8, 168u8, 193u8, 27u8, 230u8, 210u8, 94u8, 104u8,
                25u8, 247u8, 27u8, 183u8, 226u8, 62u8, 91u8, 240u8, 220u8, 22u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { token: topics.1 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                ()
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(), self.token.clone())
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                out[1usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.token,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for RegisterToken {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&RegisterToken> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &RegisterToken) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `SetAutoDeployConfig((uint48,address,address,bool,bool))` and selector `0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05`.
```solidity
event SetAutoDeployConfig(AutoDeployConfig config);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct SetAutoDeployConfig {
        #[allow(missing_docs)]
        pub config: <AutoDeployConfig as alloy::sol_types::SolType>::RustType,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for SetAutoDeployConfig {
            type DataTuple<'a> = (AutoDeployConfig,);
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (alloy_sol_types::sol_data::FixedBytes<32>,);
            const SIGNATURE: &'static str = "SetAutoDeployConfig((uint48,address,address,bool,bool))";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                119u8, 228u8, 125u8, 161u8, 246u8, 2u8, 81u8, 134u8, 176u8, 10u8, 218u8,
                229u8, 53u8, 31u8, 98u8, 62u8, 186u8, 26u8, 181u8, 21u8, 31u8, 125u8,
                21u8, 188u8, 68u8, 198u8, 163u8, 155u8, 232u8, 110u8, 108u8, 5u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { config: data.0 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                (<AutoDeployConfig as alloy_sol_types::SolType>::tokenize(&self.config),)
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(),)
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for SetAutoDeployConfig {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&SetAutoDeployConfig> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &SetAutoDeployConfig) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `SetAutoDeployStatus(bool)` and selector `0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d`.
```solidity
event SetAutoDeployStatus(bool status);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct SetAutoDeployStatus {
        #[allow(missing_docs)]
        pub status: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for SetAutoDeployStatus {
            type DataTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (alloy_sol_types::sol_data::FixedBytes<32>,);
            const SIGNATURE: &'static str = "SetAutoDeployStatus(bool)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                137u8, 81u8, 196u8, 109u8, 137u8, 87u8, 224u8, 7u8, 196u8, 244u8, 34u8,
                46u8, 118u8, 142u8, 232u8, 229u8, 155u8, 179u8, 103u8, 182u8, 199u8,
                37u8, 105u8, 233u8, 46u8, 51u8, 122u8, 91u8, 25u8, 75u8, 240u8, 77u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { status: data.0 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.status,
                    ),
                )
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(),)
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for SetAutoDeployStatus {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&SetAutoDeployStatus> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &SetAutoDeployStatus) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `SetSetMaxNetworkLimitHookStatus(bool)` and selector `0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c`.
```solidity
event SetSetMaxNetworkLimitHookStatus(bool status);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct SetSetMaxNetworkLimitHookStatus {
        #[allow(missing_docs)]
        pub status: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for SetSetMaxNetworkLimitHookStatus {
            type DataTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (alloy_sol_types::sol_data::FixedBytes<32>,);
            const SIGNATURE: &'static str = "SetSetMaxNetworkLimitHookStatus(bool)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                139u8, 215u8, 27u8, 185u8, 40u8, 113u8, 199u8, 203u8, 101u8, 212u8,
                186u8, 117u8, 84u8, 218u8, 222u8, 176u8, 42u8, 188u8, 244u8, 217u8,
                233u8, 154u8, 255u8, 131u8, 103u8, 113u8, 76u8, 90u8, 21u8, 189u8, 1u8,
                156u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { status: data.0 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.status,
                    ),
                )
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(),)
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for SetSetMaxNetworkLimitHookStatus {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&SetSetMaxNetworkLimitHookStatus>
        for alloy_sol_types::private::LogData {
            #[inline]
            fn from(
                this: &SetSetMaxNetworkLimitHookStatus,
            ) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `SetSlashingData(bool,uint48)` and selector `0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0`.
```solidity
event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct SetSlashingData {
        #[allow(missing_docs)]
        pub requireSlasher: bool,
        #[allow(missing_docs)]
        pub minVaultEpochDuration: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for SetSlashingData {
            type DataTuple<'a> = (
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (alloy_sol_types::sol_data::FixedBytes<32>,);
            const SIGNATURE: &'static str = "SetSlashingData(bool,uint48)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                250u8, 49u8, 193u8, 185u8, 126u8, 217u8, 101u8, 50u8, 48u8, 25u8, 73u8,
                229u8, 253u8, 52u8, 210u8, 224u8, 89u8, 80u8, 11u8, 13u8, 229u8, 153u8,
                25u8, 82u8, 69u8, 221u8, 248u8, 251u8, 251u8, 179u8, 109u8, 176u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self {
                    requireSlasher: data.0,
                    minVaultEpochDuration: data.1,
                }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.requireSlasher,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.minVaultEpochDuration),
                )
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(),)
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for SetSlashingData {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&SetSlashingData> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &SetSlashingData) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `UnregisterOperator(address)` and selector `0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7`.
```solidity
event UnregisterOperator(address indexed operator);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct UnregisterOperator {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for UnregisterOperator {
            type DataTuple<'a> = ();
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (
                alloy_sol_types::sol_data::FixedBytes<32>,
                alloy::sol_types::sol_data::Address,
            );
            const SIGNATURE: &'static str = "UnregisterOperator(address)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                209u8, 180u8, 141u8, 30u8, 73u8, 136u8, 82u8, 152u8, 175u8, 93u8, 200u8,
                173u8, 199u8, 119u8, 120u8, 54u8, 239u8, 128u8, 75u8, 56u8, 175u8, 136u8,
                234u8, 191u8, 78u8, 7u8, 156u8, 4u8, 238u8, 21u8, 56u8, 167u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { operator: topics.1 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                ()
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(), self.operator.clone())
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                out[1usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.operator,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for UnregisterOperator {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&UnregisterOperator> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &UnregisterOperator) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `UnregisterOperatorVault(address,address)` and selector `0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e`.
```solidity
event UnregisterOperatorVault(address indexed operator, address indexed vault);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct UnregisterOperatorVault {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for UnregisterOperatorVault {
            type DataTuple<'a> = ();
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (
                alloy_sol_types::sol_data::FixedBytes<32>,
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
            );
            const SIGNATURE: &'static str = "UnregisterOperatorVault(address,address)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                52u8, 85u8, 182u8, 18u8, 134u8, 117u8, 239u8, 248u8, 67u8, 112u8, 48u8,
                39u8, 135u8, 156u8, 201u8, 181u8, 45u8, 108u8, 230u8, 132u8, 221u8,
                198u8, 7u8, 124u8, 190u8, 13u8, 25u8, 26u8, 217u8, 139u8, 37u8, 94u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self {
                    operator: topics.1,
                    vault: topics.2,
                }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                ()
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(), self.operator.clone(), self.vault.clone())
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                out[1usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.operator,
                );
                out[2usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.vault,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for UnregisterOperatorVault {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&UnregisterOperatorVault> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(
                this: &UnregisterOperatorVault,
            ) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `UnregisterSharedVault(address)` and selector `0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee`.
```solidity
event UnregisterSharedVault(address indexed vault);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct UnregisterSharedVault {
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for UnregisterSharedVault {
            type DataTuple<'a> = ();
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (
                alloy_sol_types::sol_data::FixedBytes<32>,
                alloy::sol_types::sol_data::Address,
            );
            const SIGNATURE: &'static str = "UnregisterSharedVault(address)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                234u8, 216u8, 63u8, 132u8, 130u8, 208u8, 250u8, 93u8, 226u8, 181u8,
                194u8, 143u8, 179u8, 158u8, 226u8, 136u8, 57u8, 32u8, 118u8, 209u8, 80u8,
                219u8, 112u8, 32u8, 225u8, 10u8, 146u8, 149u8, 74u8, 234u8, 130u8, 238u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { vault: topics.1 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                ()
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(), self.vault.clone())
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                out[1usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.vault,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for UnregisterSharedVault {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&UnregisterSharedVault> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &UnregisterSharedVault) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Event with signature `UnregisterToken(address)` and selector `0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b`.
```solidity
event UnregisterToken(address indexed token);
```*/
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    #[derive(Clone)]
    pub struct UnregisterToken {
        #[allow(missing_docs)]
        pub token: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        #[automatically_derived]
        impl alloy_sol_types::SolEvent for UnregisterToken {
            type DataTuple<'a> = ();
            type DataToken<'a> = <Self::DataTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type TopicList = (
                alloy_sol_types::sol_data::FixedBytes<32>,
                alloy::sol_types::sol_data::Address,
            );
            const SIGNATURE: &'static str = "UnregisterToken(address)";
            const SIGNATURE_HASH: alloy_sol_types::private::B256 = alloy_sol_types::private::B256::new([
                202u8, 42u8, 137u8, 9u8, 57u8, 39u8, 98u8, 35u8, 169u8, 18u8, 34u8, 23u8,
                117u8, 44u8, 103u8, 96u8, 132u8, 102u8, 250u8, 238u8, 56u8, 138u8, 255u8,
                83u8, 240u8, 119u8, 208u8, 10u8, 24u8, 106u8, 56u8, 155u8,
            ]);
            const ANONYMOUS: bool = false;
            #[allow(unused_variables)]
            #[inline]
            fn new(
                topics: <Self::TopicList as alloy_sol_types::SolType>::RustType,
                data: <Self::DataTuple<'_> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                Self { token: topics.1 }
            }
            #[inline]
            fn check_signature(
                topics: &<Self::TopicList as alloy_sol_types::SolType>::RustType,
            ) -> alloy_sol_types::Result<()> {
                if topics.0 != Self::SIGNATURE_HASH {
                    return Err(
                        alloy_sol_types::Error::invalid_event_signature_hash(
                            Self::SIGNATURE,
                            topics.0,
                            Self::SIGNATURE_HASH,
                        ),
                    );
                }
                Ok(())
            }
            #[inline]
            fn tokenize_body(&self) -> Self::DataToken<'_> {
                ()
            }
            #[inline]
            fn topics(&self) -> <Self::TopicList as alloy_sol_types::SolType>::RustType {
                (Self::SIGNATURE_HASH.into(), self.token.clone())
            }
            #[inline]
            fn encode_topics_raw(
                &self,
                out: &mut [alloy_sol_types::abi::token::WordToken],
            ) -> alloy_sol_types::Result<()> {
                if out.len() < <Self::TopicList as alloy_sol_types::TopicList>::COUNT {
                    return Err(alloy_sol_types::Error::Overrun);
                }
                out[0usize] = alloy_sol_types::abi::token::WordToken(
                    Self::SIGNATURE_HASH,
                );
                out[1usize] = <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic(
                    &self.token,
                );
                Ok(())
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::private::IntoLogData for UnregisterToken {
            fn to_log_data(&self) -> alloy_sol_types::private::LogData {
                From::from(self)
            }
            fn into_log_data(self) -> alloy_sol_types::private::LogData {
                From::from(&self)
            }
        }
        #[automatically_derived]
        impl From<&UnregisterToken> for alloy_sol_types::private::LogData {
            #[inline]
            fn from(this: &UnregisterToken) -> alloy_sol_types::private::LogData {
                alloy_sol_types::SolEvent::encode_log_data(this)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `OPERATOR_REGISTRY()` and selector `0x83ce0322`.
```solidity
function OPERATOR_REGISTRY() external view returns (address);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct OPERATOR_REGISTRYCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`OPERATOR_REGISTRY()`](OPERATOR_REGISTRYCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct OPERATOR_REGISTRYReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<OPERATOR_REGISTRYCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: OPERATOR_REGISTRYCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for OPERATOR_REGISTRYCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<OPERATOR_REGISTRYReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: OPERATOR_REGISTRYReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for OPERATOR_REGISTRYReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for OPERATOR_REGISTRYCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Address;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Address,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "OPERATOR_REGISTRY()";
            const SELECTOR: [u8; 4] = [131u8, 206u8, 3u8, 34u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: OPERATOR_REGISTRYReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: OPERATOR_REGISTRYReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `VAULT_CONFIGURATOR()` and selector `0xb25bc0c0`.
```solidity
function VAULT_CONFIGURATOR() external view returns (address);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VAULT_CONFIGURATORCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`VAULT_CONFIGURATOR()`](VAULT_CONFIGURATORCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VAULT_CONFIGURATORReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<VAULT_CONFIGURATORCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: VAULT_CONFIGURATORCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for VAULT_CONFIGURATORCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<VAULT_CONFIGURATORReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: VAULT_CONFIGURATORReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for VAULT_CONFIGURATORReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for VAULT_CONFIGURATORCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Address;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Address,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VAULT_CONFIGURATOR()";
            const SELECTOR: [u8; 4] = [178u8, 91u8, 192u8, 192u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: VAULT_CONFIGURATORReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: VAULT_CONFIGURATORReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `VAULT_FACTORY()` and selector `0x103f2907`.
```solidity
function VAULT_FACTORY() external view returns (address);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VAULT_FACTORYCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`VAULT_FACTORY()`](VAULT_FACTORYCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct VAULT_FACTORYReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<VAULT_FACTORYCall> for UnderlyingRustTuple<'_> {
                fn from(value: VAULT_FACTORYCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for VAULT_FACTORYCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<VAULT_FACTORYReturn> for UnderlyingRustTuple<'_> {
                fn from(value: VAULT_FACTORYReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for VAULT_FACTORYReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for VAULT_FACTORYCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Address;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Address,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "VAULT_FACTORY()";
            const SELECTOR: [u8; 4] = [16u8, 63u8, 41u8, 7u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: VAULT_FACTORYReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: VAULT_FACTORYReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getAutoDeployConfig()` and selector `0xa149c987`.
```solidity
function getAutoDeployConfig() external view returns (AutoDeployConfig memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getAutoDeployConfigCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getAutoDeployConfig()`](getAutoDeployConfigCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getAutoDeployConfigReturn {
        #[allow(missing_docs)]
        pub _0: <AutoDeployConfig as alloy::sol_types::SolType>::RustType,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getAutoDeployConfigCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getAutoDeployConfigCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getAutoDeployConfigCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (AutoDeployConfig,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <AutoDeployConfig as alloy::sol_types::SolType>::RustType,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getAutoDeployConfigReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getAutoDeployConfigReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getAutoDeployConfigReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getAutoDeployConfigCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = <AutoDeployConfig as alloy::sol_types::SolType>::RustType;
            type ReturnTuple<'a> = (AutoDeployConfig,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getAutoDeployConfig()";
            const SELECTOR: [u8; 4] = [161u8, 73u8, 201u8, 135u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (<AutoDeployConfig as alloy_sol_types::SolType>::tokenize(ret),)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getAutoDeployConfigReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getAutoDeployConfigReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getAutoDeployedVault(address)` and selector `0x2b2fd015`.
```solidity
function getAutoDeployedVault(address operator) external view returns (address);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getAutoDeployedVaultCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getAutoDeployedVault(address)`](getAutoDeployedVaultCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getAutoDeployedVaultReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Address,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getAutoDeployedVaultCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getAutoDeployedVaultCall) -> Self {
                    (value.operator,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getAutoDeployedVaultCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { operator: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getAutoDeployedVaultReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getAutoDeployedVaultReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getAutoDeployedVaultReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getAutoDeployedVaultCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Address,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Address;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Address,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getAutoDeployedVault(address)";
            const SELECTOR: [u8; 4] = [43u8, 47u8, 208u8, 21u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getAutoDeployedVaultReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getAutoDeployedVaultReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getOperatorStakes(address)` and selector `0x93816a13`.
```solidity
function getOperatorStakes(address operator) external view returns (IVotingPowerProvider.VaultValue[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorStakesCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperatorStakes(address)`](getOperatorStakesCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorStakesReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<
            <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
        >,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorStakesCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorStakesCall) -> Self {
                    (value.operator,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorStakesCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { operator: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<IVotingPowerProvider::VaultValue>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<
                    <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
                >,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorStakesReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorStakesReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorStakesReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorStakesCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Address,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<IVotingPowerProvider::VaultValue>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperatorStakes(address)";
            const SELECTOR: [u8; 4] = [147u8, 129u8, 106u8, 19u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        IVotingPowerProvider::VaultValue,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getOperatorStakesReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getOperatorStakesReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getOperatorStakesAt(address,uint48)` and selector `0xa54e116e`.
```solidity
function getOperatorStakesAt(address operator, uint48 timestamp) external view returns (IVotingPowerProvider.VaultValue[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorStakesAtCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperatorStakesAt(address,uint48)`](getOperatorStakesAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorStakesAtReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<
            <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
        >,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorStakesAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorStakesAtCall) -> Self {
                    (value.operator, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorStakesAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        timestamp: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<IVotingPowerProvider::VaultValue>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<
                    <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
                >,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorStakesAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorStakesAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorStakesAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorStakesAtCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<IVotingPowerProvider::VaultValue>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperatorStakesAt(address,uint48)";
            const SELECTOR: [u8; 4] = [165u8, 78u8, 17u8, 110u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        IVotingPowerProvider::VaultValue,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getOperatorStakesAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getOperatorStakesAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getOperatorVaults(address)` and selector `0x14d7e25b`.
```solidity
function getOperatorVaults(address operator) external view returns (address[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorVaultsCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperatorVaults(address)`](getOperatorVaultsCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorVaultsReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorVaultsCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorVaultsCall) -> Self {
                    (value.operator,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorVaultsCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { operator: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorVaultsReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorVaultsReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorVaultsReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorVaultsCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Address,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                alloy::sol_types::private::Address,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperatorVaults(address)";
            const SELECTOR: [u8; 4] = [20u8, 215u8, 226u8, 91u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Address,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getOperatorVaultsReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getOperatorVaultsReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getOperatorVaultsAt(address,uint48)` and selector `0x49f993ec`.
```solidity
function getOperatorVaultsAt(address operator, uint48 timestamp) external view returns (address[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorVaultsAtCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperatorVaultsAt(address,uint48)`](getOperatorVaultsAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorVaultsAtReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorVaultsAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorVaultsAtCall) -> Self {
                    (value.operator, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorVaultsAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        timestamp: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorVaultsAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorVaultsAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorVaultsAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorVaultsAtCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                alloy::sol_types::private::Address,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperatorVaultsAt(address,uint48)";
            const SELECTOR: [u8; 4] = [73u8, 249u8, 147u8, 236u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Address,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getOperatorVaultsAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getOperatorVaultsAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getOperatorVotingPowers(address,bytes)` and selector `0x63ff1140`.
```solidity
function getOperatorVotingPowers(address operator, bytes memory extraData) external view returns (IVotingPowerProvider.VaultValue[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorVotingPowersCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub extraData: alloy::sol_types::private::Bytes,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperatorVotingPowers(address,bytes)`](getOperatorVotingPowersCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorVotingPowersReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<
            <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
        >,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::Bytes,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorVotingPowersCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorVotingPowersCall) -> Self {
                    (value.operator, value.extraData)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorVotingPowersCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        extraData: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<IVotingPowerProvider::VaultValue>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<
                    <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
                >,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorVotingPowersReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorVotingPowersReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorVotingPowersReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorVotingPowersCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Bytes,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<IVotingPowerProvider::VaultValue>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperatorVotingPowers(address,bytes)";
            const SELECTOR: [u8; 4] = [99u8, 255u8, 17u8, 64u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self.extraData,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        IVotingPowerProvider::VaultValue,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getOperatorVotingPowersReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getOperatorVotingPowersReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getOperatorVotingPowersAt(address,bytes,uint48)` and selector `0x380f9945`.
```solidity
function getOperatorVotingPowersAt(address operator, bytes memory extraData, uint48 timestamp) external view returns (IVotingPowerProvider.VaultValue[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorVotingPowersAtCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub extraData: alloy::sol_types::private::Bytes,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperatorVotingPowersAt(address,bytes,uint48)`](getOperatorVotingPowersAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorVotingPowersAtReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<
            <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
        >,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Bytes,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::Bytes,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorVotingPowersAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorVotingPowersAtCall) -> Self {
                    (value.operator, value.extraData, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorVotingPowersAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        extraData: tuple.1,
                        timestamp: tuple.2,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<IVotingPowerProvider::VaultValue>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<
                    <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
                >,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorVotingPowersAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorVotingPowersAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorVotingPowersAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorVotingPowersAtCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Bytes,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                <IVotingPowerProvider::VaultValue as alloy::sol_types::SolType>::RustType,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<IVotingPowerProvider::VaultValue>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperatorVotingPowersAt(address,bytes,uint48)";
            const SELECTOR: [u8; 4] = [56u8, 15u8, 153u8, 69u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self.extraData,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        IVotingPowerProvider::VaultValue,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getOperatorVotingPowersAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getOperatorVotingPowersAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getOperators()` and selector `0x27a099d8`.
```solidity
function getOperators() external view returns (address[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorsCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperators()`](getOperatorsCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorsReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorsCall> for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorsCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getOperatorsCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorsReturn> for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorsReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getOperatorsReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorsCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                alloy::sol_types::private::Address,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperators()";
            const SELECTOR: [u8; 4] = [39u8, 160u8, 153u8, 216u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Address,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getOperatorsReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getOperatorsReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getOperatorsAt(uint48)` and selector `0xa2e33009`.
```solidity
function getOperatorsAt(uint48 timestamp) external view returns (address[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorsAtCall {
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperatorsAt(uint48)`](getOperatorsAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorsAtReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Uint<48>,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorsAtCall> for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorsAtCall) -> Self {
                    (value.timestamp,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getOperatorsAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { timestamp: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getOperatorsAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorsAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorsAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorsAtCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Uint<48>,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                alloy::sol_types::private::Address,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperatorsAt(uint48)";
            const SELECTOR: [u8; 4] = [162u8, 227u8, 48u8, 9u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Address,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getOperatorsAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getOperatorsAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getSharedVaults()` and selector `0xc28474cd`.
```solidity
function getSharedVaults() external view returns (address[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSharedVaultsCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getSharedVaults()`](getSharedVaultsCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSharedVaultsReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getSharedVaultsCall> for UnderlyingRustTuple<'_> {
                fn from(value: getSharedVaultsCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getSharedVaultsCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getSharedVaultsReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSharedVaultsReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSharedVaultsReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getSharedVaultsCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                alloy::sol_types::private::Address,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getSharedVaults()";
            const SELECTOR: [u8; 4] = [194u8, 132u8, 116u8, 205u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Address,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getSharedVaultsReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getSharedVaultsReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getSharedVaultsAt(uint48)` and selector `0x4a0c7c17`.
```solidity
function getSharedVaultsAt(uint48 timestamp) external view returns (address[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSharedVaultsAtCall {
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getSharedVaultsAt(uint48)`](getSharedVaultsAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSharedVaultsAtReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Uint<48>,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getSharedVaultsAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSharedVaultsAtCall) -> Self {
                    (value.timestamp,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSharedVaultsAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { timestamp: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getSharedVaultsAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSharedVaultsAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSharedVaultsAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getSharedVaultsAtCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Uint<48>,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                alloy::sol_types::private::Address,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getSharedVaultsAt(uint48)";
            const SELECTOR: [u8; 4] = [74u8, 12u8, 124u8, 23u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Address,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getSharedVaultsAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getSharedVaultsAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getSlashingData()` and selector `0xf7dfb974`.
```solidity
function getSlashingData() external view returns (bool requireSlasher, uint48 minVaultEpochDuration);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSlashingDataCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getSlashingData()`](getSlashingDataCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSlashingDataReturn {
        #[allow(missing_docs)]
        pub requireSlasher: bool,
        #[allow(missing_docs)]
        pub minVaultEpochDuration: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getSlashingDataCall> for UnderlyingRustTuple<'_> {
                fn from(value: getSlashingDataCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getSlashingDataCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                bool,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getSlashingDataReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSlashingDataReturn) -> Self {
                    (value.requireSlasher, value.minVaultEpochDuration)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSlashingDataReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        requireSlasher: tuple.0,
                        minVaultEpochDuration: tuple.1,
                    }
                }
            }
        }
        impl getSlashingDataReturn {
            fn _tokenize(
                &self,
            ) -> <getSlashingDataCall as alloy_sol_types::SolCall>::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.requireSlasher,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.minVaultEpochDuration),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getSlashingDataCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getSlashingDataReturn;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getSlashingData()";
            const SELECTOR: [u8; 4] = [247u8, 223u8, 185u8, 116u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getSlashingDataReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getSlashingDataAt(uint48,bytes)` and selector `0x7a74c7fd`.
```solidity
function getSlashingDataAt(uint48 timestamp, bytes memory hint) external view returns (bool requireSlasher, uint48 minVaultEpochDuration);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSlashingDataAtCall {
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
        #[allow(missing_docs)]
        pub hint: alloy::sol_types::private::Bytes,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getSlashingDataAt(uint48,bytes)`](getSlashingDataAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSlashingDataAtReturn {
        #[allow(missing_docs)]
        pub requireSlasher: bool,
        #[allow(missing_docs)]
        pub minVaultEpochDuration: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Uint<48>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::primitives::aliases::U48,
                alloy::sol_types::private::Bytes,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getSlashingDataAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSlashingDataAtCall) -> Self {
                    (value.timestamp, value.hint)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSlashingDataAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        timestamp: tuple.0,
                        hint: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                bool,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getSlashingDataAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSlashingDataAtReturn) -> Self {
                    (value.requireSlasher, value.minVaultEpochDuration)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSlashingDataAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        requireSlasher: tuple.0,
                        minVaultEpochDuration: tuple.1,
                    }
                }
            }
        }
        impl getSlashingDataAtReturn {
            fn _tokenize(
                &self,
            ) -> <getSlashingDataAtCall as alloy_sol_types::SolCall>::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.requireSlasher,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.minVaultEpochDuration),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getSlashingDataAtCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Uint<48>,
                alloy::sol_types::sol_data::Bytes,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getSlashingDataAtReturn;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getSlashingDataAt(uint48,bytes)";
            const SELECTOR: [u8; 4] = [122u8, 116u8, 199u8, 253u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self.hint,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getSlashingDataAtReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getTokens()` and selector `0xaa6ca808`.
```solidity
function getTokens() external view returns (address[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getTokensCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getTokens()`](getTokensCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getTokensReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getTokensCall> for UnderlyingRustTuple<'_> {
                fn from(value: getTokensCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getTokensCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getTokensReturn> for UnderlyingRustTuple<'_> {
                fn from(value: getTokensReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getTokensReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getTokensCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                alloy::sol_types::private::Address,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getTokens()";
            const SELECTOR: [u8; 4] = [170u8, 108u8, 168u8, 8u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Address,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getTokensReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getTokensReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getTokensAt(uint48)` and selector `0x1796df1b`.
```solidity
function getTokensAt(uint48 timestamp) external view returns (address[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getTokensAtCall {
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getTokensAt(uint48)`](getTokensAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getTokensAtReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Uint<48>,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getTokensAtCall> for UnderlyingRustTuple<'_> {
                fn from(value: getTokensAtCall) -> Self {
                    (value.timestamp,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getTokensAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { timestamp: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Address>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getTokensAtReturn> for UnderlyingRustTuple<'_> {
                fn from(value: getTokensAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getTokensAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getTokensAtCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Uint<48>,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                alloy::sol_types::private::Address,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Address>,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getTokensAt(uint48)";
            const SELECTOR: [u8; 4] = [23u8, 150u8, 223u8, 27u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Address,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getTokensAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getTokensAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getVotingPowers(bytes[])` and selector `0xff7cd71c`.
```solidity
function getVotingPowers(bytes[] memory extraData) external view returns (IVotingPowerProvider.OperatorVotingPower[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVotingPowersCall {
        #[allow(missing_docs)]
        pub extraData: alloy::sol_types::private::Vec<alloy::sol_types::private::Bytes>,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive()]
    ///Container type for the return parameters of the [`getVotingPowers(bytes[])`](getVotingPowersCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVotingPowersReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<
            <IVotingPowerProvider::OperatorVotingPower as alloy::sol_types::SolType>::RustType,
        >,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Bytes>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Bytes>,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getVotingPowersCall> for UnderlyingRustTuple<'_> {
                fn from(value: getVotingPowersCall) -> Self {
                    (value.extraData,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for getVotingPowersCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { extraData: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<
                    IVotingPowerProvider::OperatorVotingPower,
                >,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<
                    <IVotingPowerProvider::OperatorVotingPower as alloy::sol_types::SolType>::RustType,
                >,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getVotingPowersReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVotingPowersReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVotingPowersReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getVotingPowersCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Bytes>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                <IVotingPowerProvider::OperatorVotingPower as alloy::sol_types::SolType>::RustType,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<
                    IVotingPowerProvider::OperatorVotingPower,
                >,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getVotingPowers(bytes[])";
            const SELECTOR: [u8; 4] = [255u8, 124u8, 215u8, 28u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Bytes,
                    > as alloy_sol_types::SolType>::tokenize(&self.extraData),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        IVotingPowerProvider::OperatorVotingPower,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getVotingPowersReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getVotingPowersReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `getVotingPowersAt(bytes[],uint48)` and selector `0x77adea5f`.
```solidity
function getVotingPowersAt(bytes[] memory extraData, uint48 timestamp) external view returns (IVotingPowerProvider.OperatorVotingPower[] memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVotingPowersAtCall {
        #[allow(missing_docs)]
        pub extraData: alloy::sol_types::private::Vec<alloy::sol_types::private::Bytes>,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive()]
    ///Container type for the return parameters of the [`getVotingPowersAt(bytes[],uint48)`](getVotingPowersAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVotingPowersAtReturn {
        #[allow(missing_docs)]
        pub _0: alloy::sol_types::private::Vec<
            <IVotingPowerProvider::OperatorVotingPower as alloy::sol_types::SolType>::RustType,
        >,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Bytes>,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<alloy::sol_types::private::Bytes>,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getVotingPowersAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVotingPowersAtCall) -> Self {
                    (value.extraData, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVotingPowersAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        extraData: tuple.0,
                        timestamp: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Array<
                    IVotingPowerProvider::OperatorVotingPower,
                >,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Vec<
                    <IVotingPowerProvider::OperatorVotingPower as alloy::sol_types::SolType>::RustType,
                >,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<getVotingPowersAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVotingPowersAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVotingPowersAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getVotingPowersAtCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Array<alloy::sol_types::sol_data::Bytes>,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = alloy::sol_types::private::Vec<
                <IVotingPowerProvider::OperatorVotingPower as alloy::sol_types::SolType>::RustType,
            >;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Array<
                    IVotingPowerProvider::OperatorVotingPower,
                >,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getVotingPowersAt(bytes[],uint48)";
            const SELECTOR: [u8; 4] = [119u8, 173u8, 234u8, 95u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        alloy::sol_types::sol_data::Bytes,
                    > as alloy_sol_types::SolType>::tokenize(&self.extraData),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Array<
                        IVotingPowerProvider::OperatorVotingPower,
                    > as alloy_sol_types::SolType>::tokenize(ret),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: getVotingPowersAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: getVotingPowersAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `invalidateOldSignatures()` and selector `0x622e4dba`.
```solidity
function invalidateOldSignatures() external;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct invalidateOldSignaturesCall;
    ///Container type for the return parameters of the [`invalidateOldSignatures()`](invalidateOldSignaturesCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct invalidateOldSignaturesReturn {}
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<invalidateOldSignaturesCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: invalidateOldSignaturesCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for invalidateOldSignaturesCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<invalidateOldSignaturesReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: invalidateOldSignaturesReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for invalidateOldSignaturesReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl invalidateOldSignaturesReturn {
            fn _tokenize(
                &self,
            ) -> <invalidateOldSignaturesCall as alloy_sol_types::SolCall>::ReturnToken<
                '_,
            > {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for invalidateOldSignaturesCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = invalidateOldSignaturesReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "invalidateOldSignatures()";
            const SELECTOR: [u8; 4] = [98u8, 46u8, 77u8, 186u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                invalidateOldSignaturesReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isAutoDeployEnabled()` and selector `0xdeb018dc`.
```solidity
function isAutoDeployEnabled() external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isAutoDeployEnabledCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isAutoDeployEnabled()`](isAutoDeployEnabledCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isAutoDeployEnabledReturn {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isAutoDeployEnabledCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: isAutoDeployEnabledCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isAutoDeployEnabledCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isAutoDeployEnabledReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: isAutoDeployEnabledReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isAutoDeployEnabledReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isAutoDeployEnabledCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isAutoDeployEnabled()";
            const SELECTOR: [u8; 4] = [222u8, 176u8, 24u8, 220u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isAutoDeployEnabledReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isAutoDeployEnabledReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isOperatorRegistered(address)` and selector `0x6b1906f8`.
```solidity
function isOperatorRegistered(address operator) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorRegisteredCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isOperatorRegistered(address)`](isOperatorRegisteredCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorRegisteredReturn {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorRegisteredCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorRegisteredCall) -> Self {
                    (value.operator,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorRegisteredCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { operator: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorRegisteredReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorRegisteredReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorRegisteredReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isOperatorRegisteredCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Address,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isOperatorRegistered(address)";
            const SELECTOR: [u8; 4] = [107u8, 25u8, 6u8, 248u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isOperatorRegisteredReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isOperatorRegisteredReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isOperatorRegisteredAt(address,uint48)` and selector `0x8a5aef51`.
```solidity
function isOperatorRegisteredAt(address operator, uint48 timestamp) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorRegisteredAtCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isOperatorRegisteredAt(address,uint48)`](isOperatorRegisteredAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorRegisteredAtReturn {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorRegisteredAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorRegisteredAtCall) -> Self {
                    (value.operator, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorRegisteredAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        timestamp: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorRegisteredAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorRegisteredAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorRegisteredAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isOperatorRegisteredAtCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isOperatorRegisteredAt(address,uint48)";
            const SELECTOR: [u8; 4] = [138u8, 90u8, 239u8, 81u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isOperatorRegisteredAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isOperatorRegisteredAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isOperatorVaultRegistered(address)` and selector `0x0f6e0743`.
```solidity
function isOperatorVaultRegistered(address vault) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorVaultRegistered_0Call {
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isOperatorVaultRegistered(address)`](isOperatorVaultRegistered_0Call) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorVaultRegistered_0Return {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorVaultRegistered_0Call>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorVaultRegistered_0Call) -> Self {
                    (value.vault,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorVaultRegistered_0Call {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { vault: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorVaultRegistered_0Return>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorVaultRegistered_0Return) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorVaultRegistered_0Return {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isOperatorVaultRegistered_0Call {
            type Parameters<'a> = (alloy::sol_types::sol_data::Address,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isOperatorVaultRegistered(address)";
            const SELECTOR: [u8; 4] = [15u8, 110u8, 7u8, 67u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.vault,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isOperatorVaultRegistered_0Return = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isOperatorVaultRegistered_0Return = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isOperatorVaultRegistered(address,address)` and selector `0x669fa8c7`.
```solidity
function isOperatorVaultRegistered(address operator, address vault) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorVaultRegistered_1Call {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isOperatorVaultRegistered(address,address)`](isOperatorVaultRegistered_1Call) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorVaultRegistered_1Return {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::Address,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorVaultRegistered_1Call>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorVaultRegistered_1Call) -> Self {
                    (value.operator, value.vault)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorVaultRegistered_1Call {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        vault: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorVaultRegistered_1Return>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorVaultRegistered_1Return) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorVaultRegistered_1Return {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isOperatorVaultRegistered_1Call {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isOperatorVaultRegistered(address,address)";
            const SELECTOR: [u8; 4] = [102u8, 159u8, 168u8, 199u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.vault,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isOperatorVaultRegistered_1Return = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isOperatorVaultRegistered_1Return = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isOperatorVaultRegisteredAt(address,address,uint48)` and selector `0xdae8f803`.
```solidity
function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorVaultRegisteredAt_0Call {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isOperatorVaultRegisteredAt(address,address,uint48)`](isOperatorVaultRegisteredAt_0Call) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorVaultRegisteredAt_0Return {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::Address,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorVaultRegisteredAt_0Call>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorVaultRegisteredAt_0Call) -> Self {
                    (value.operator, value.vault, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorVaultRegisteredAt_0Call {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        vault: tuple.1,
                        timestamp: tuple.2,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorVaultRegisteredAt_0Return>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorVaultRegisteredAt_0Return) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorVaultRegisteredAt_0Return {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isOperatorVaultRegisteredAt_0Call {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isOperatorVaultRegisteredAt(address,address,uint48)";
            const SELECTOR: [u8; 4] = [218u8, 232u8, 248u8, 3u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.vault,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isOperatorVaultRegisteredAt_0Return = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isOperatorVaultRegisteredAt_0Return = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isOperatorVaultRegisteredAt(address,uint48)` and selector `0xf6c011de`.
```solidity
function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorVaultRegisteredAt_1Call {
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isOperatorVaultRegisteredAt(address,uint48)`](isOperatorVaultRegisteredAt_1Call) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isOperatorVaultRegisteredAt_1Return {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorVaultRegisteredAt_1Call>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorVaultRegisteredAt_1Call) -> Self {
                    (value.vault, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorVaultRegisteredAt_1Call {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        vault: tuple.0,
                        timestamp: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isOperatorVaultRegisteredAt_1Return>
            for UnderlyingRustTuple<'_> {
                fn from(value: isOperatorVaultRegisteredAt_1Return) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isOperatorVaultRegisteredAt_1Return {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isOperatorVaultRegisteredAt_1Call {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isOperatorVaultRegisteredAt(address,uint48)";
            const SELECTOR: [u8; 4] = [246u8, 192u8, 17u8, 222u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.vault,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isOperatorVaultRegisteredAt_1Return = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isOperatorVaultRegisteredAt_1Return = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isSetMaxNetworkLimitHookEnabled()` and selector `0xe77b136d`.
```solidity
function isSetMaxNetworkLimitHookEnabled() external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isSetMaxNetworkLimitHookEnabledCall;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isSetMaxNetworkLimitHookEnabled()`](isSetMaxNetworkLimitHookEnabledCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isSetMaxNetworkLimitHookEnabledReturn {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isSetMaxNetworkLimitHookEnabledCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: isSetMaxNetworkLimitHookEnabledCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isSetMaxNetworkLimitHookEnabledCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isSetMaxNetworkLimitHookEnabledReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: isSetMaxNetworkLimitHookEnabledReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isSetMaxNetworkLimitHookEnabledReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isSetMaxNetworkLimitHookEnabledCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isSetMaxNetworkLimitHookEnabled()";
            const SELECTOR: [u8; 4] = [231u8, 123u8, 19u8, 109u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isSetMaxNetworkLimitHookEnabledReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isSetMaxNetworkLimitHookEnabledReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isSharedVaultRegistered(address)` and selector `0x9a1ebee9`.
```solidity
function isSharedVaultRegistered(address vault) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isSharedVaultRegisteredCall {
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isSharedVaultRegistered(address)`](isSharedVaultRegisteredCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isSharedVaultRegisteredReturn {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isSharedVaultRegisteredCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: isSharedVaultRegisteredCall) -> Self {
                    (value.vault,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isSharedVaultRegisteredCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { vault: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isSharedVaultRegisteredReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: isSharedVaultRegisteredReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isSharedVaultRegisteredReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isSharedVaultRegisteredCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Address,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isSharedVaultRegistered(address)";
            const SELECTOR: [u8; 4] = [154u8, 30u8, 190u8, 233u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.vault,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isSharedVaultRegisteredReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isSharedVaultRegisteredReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isSharedVaultRegisteredAt(address,uint48)` and selector `0xe66e1ed2`.
```solidity
function isSharedVaultRegisteredAt(address vault, uint48 timestamp) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isSharedVaultRegisteredAtCall {
        #[allow(missing_docs)]
        pub vault: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isSharedVaultRegisteredAt(address,uint48)`](isSharedVaultRegisteredAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isSharedVaultRegisteredAtReturn {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isSharedVaultRegisteredAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: isSharedVaultRegisteredAtCall) -> Self {
                    (value.vault, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isSharedVaultRegisteredAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        vault: tuple.0,
                        timestamp: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isSharedVaultRegisteredAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: isSharedVaultRegisteredAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isSharedVaultRegisteredAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isSharedVaultRegisteredAtCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isSharedVaultRegisteredAt(address,uint48)";
            const SELECTOR: [u8; 4] = [230u8, 110u8, 30u8, 210u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.vault,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isSharedVaultRegisteredAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isSharedVaultRegisteredAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isTokenRegistered(address)` and selector `0x26aa101f`.
```solidity
function isTokenRegistered(address token) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isTokenRegisteredCall {
        #[allow(missing_docs)]
        pub token: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isTokenRegistered(address)`](isTokenRegisteredCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isTokenRegisteredReturn {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Address,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (alloy::sol_types::private::Address,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isTokenRegisteredCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: isTokenRegisteredCall) -> Self {
                    (value.token,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isTokenRegisteredCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { token: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isTokenRegisteredReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: isTokenRegisteredReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isTokenRegisteredReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isTokenRegisteredCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Address,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isTokenRegistered(address)";
            const SELECTOR: [u8; 4] = [38u8, 170u8, 16u8, 31u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.token,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isTokenRegisteredReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isTokenRegisteredReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `isTokenRegisteredAt(address,uint48)` and selector `0x6a496108`.
```solidity
function isTokenRegisteredAt(address token, uint48 timestamp) external view returns (bool);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isTokenRegisteredAtCall {
        #[allow(missing_docs)]
        pub token: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub timestamp: alloy::sol_types::private::primitives::aliases::U48,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`isTokenRegisteredAt(address,uint48)`](isTokenRegisteredAtCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct isTokenRegisteredAtReturn {
        #[allow(missing_docs)]
        pub _0: bool,
    }
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::primitives::aliases::U48,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isTokenRegisteredAtCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: isTokenRegisteredAtCall) -> Self {
                    (value.token, value.timestamp)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isTokenRegisteredAtCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        token: tuple.0,
                        timestamp: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<isTokenRegisteredAtReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: isTokenRegisteredAtReturn) -> Self {
                    (value._0,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for isTokenRegisteredAtReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0 }
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for isTokenRegisteredAtCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Uint<48>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = bool;
            type ReturnTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "isTokenRegisteredAt(address,uint48)";
            const SELECTOR: [u8; 4] = [106u8, 73u8, 97u8, 8u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.token,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.timestamp),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        ret,
                    ),
                )
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(|r| {
                        let r: isTokenRegisteredAtReturn = r.into();
                        r._0
                    })
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(|r| {
                        let r: isTokenRegisteredAtReturn = r.into();
                        r._0
                    })
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `registerOperator()` and selector `0x2acde098`.
```solidity
function registerOperator() external;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct registerOperatorCall;
    ///Container type for the return parameters of the [`registerOperator()`](registerOperatorCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct registerOperatorReturn {}
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<registerOperatorCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: registerOperatorCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for registerOperatorCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<registerOperatorReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: registerOperatorReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for registerOperatorReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl registerOperatorReturn {
            fn _tokenize(
                &self,
            ) -> <registerOperatorCall as alloy_sol_types::SolCall>::ReturnToken<'_> {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for registerOperatorCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = registerOperatorReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "registerOperator()";
            const SELECTOR: [u8; 4] = [42u8, 205u8, 224u8, 152u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                registerOperatorReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `registerOperatorWithSignature(address,bytes)` and selector `0xeb5e940d`.
```solidity
function registerOperatorWithSignature(address operator, bytes memory signature) external;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct registerOperatorWithSignatureCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub signature: alloy::sol_types::private::Bytes,
    }
    ///Container type for the return parameters of the [`registerOperatorWithSignature(address,bytes)`](registerOperatorWithSignatureCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct registerOperatorWithSignatureReturn {}
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::Bytes,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<registerOperatorWithSignatureCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: registerOperatorWithSignatureCall) -> Self {
                    (value.operator, value.signature)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for registerOperatorWithSignatureCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        signature: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<registerOperatorWithSignatureReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: registerOperatorWithSignatureReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for registerOperatorWithSignatureReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl registerOperatorWithSignatureReturn {
            fn _tokenize(
                &self,
            ) -> <registerOperatorWithSignatureCall as alloy_sol_types::SolCall>::ReturnToken<
                '_,
            > {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for registerOperatorWithSignatureCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Bytes,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = registerOperatorWithSignatureReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "registerOperatorWithSignature(address,bytes)";
            const SELECTOR: [u8; 4] = [235u8, 94u8, 148u8, 13u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self.signature,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                registerOperatorWithSignatureReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `setAutoDeployConfig((uint48,address,address,bool,bool))` and selector `0x8cecaab4`.
```solidity
function setAutoDeployConfig(AutoDeployConfig memory config) external;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct setAutoDeployConfigCall {
        #[allow(missing_docs)]
        pub config: <AutoDeployConfig as alloy::sol_types::SolType>::RustType,
    }
    ///Container type for the return parameters of the [`setAutoDeployConfig((uint48,address,address,bool,bool))`](setAutoDeployConfigCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct setAutoDeployConfigReturn {}
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (AutoDeployConfig,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <AutoDeployConfig as alloy::sol_types::SolType>::RustType,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<setAutoDeployConfigCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: setAutoDeployConfigCall) -> Self {
                    (value.config,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for setAutoDeployConfigCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { config: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<setAutoDeployConfigReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: setAutoDeployConfigReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for setAutoDeployConfigReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl setAutoDeployConfigReturn {
            fn _tokenize(
                &self,
            ) -> <setAutoDeployConfigCall as alloy_sol_types::SolCall>::ReturnToken<'_> {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for setAutoDeployConfigCall {
            type Parameters<'a> = (AutoDeployConfig,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = setAutoDeployConfigReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "setAutoDeployConfig((uint48,address,address,bool,bool))";
            const SELECTOR: [u8; 4] = [140u8, 236u8, 170u8, 180u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (<AutoDeployConfig as alloy_sol_types::SolType>::tokenize(&self.config),)
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                setAutoDeployConfigReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `setAutoDeployStatus(bool)` and selector `0x79e3bf0e`.
```solidity
function setAutoDeployStatus(bool status) external;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct setAutoDeployStatusCall {
        #[allow(missing_docs)]
        pub status: bool,
    }
    ///Container type for the return parameters of the [`setAutoDeployStatus(bool)`](setAutoDeployStatusCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct setAutoDeployStatusReturn {}
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<setAutoDeployStatusCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: setAutoDeployStatusCall) -> Self {
                    (value.status,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for setAutoDeployStatusCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { status: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<setAutoDeployStatusReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: setAutoDeployStatusReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for setAutoDeployStatusReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl setAutoDeployStatusReturn {
            fn _tokenize(
                &self,
            ) -> <setAutoDeployStatusCall as alloy_sol_types::SolCall>::ReturnToken<'_> {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for setAutoDeployStatusCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Bool,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = setAutoDeployStatusReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "setAutoDeployStatus(bool)";
            const SELECTOR: [u8; 4] = [121u8, 227u8, 191u8, 14u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.status,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                setAutoDeployStatusReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `setSetMaxNetworkLimitHookStatus(bool)` and selector `0xda3fad7a`.
```solidity
function setSetMaxNetworkLimitHookStatus(bool status) external;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct setSetMaxNetworkLimitHookStatusCall {
        #[allow(missing_docs)]
        pub status: bool,
    }
    ///Container type for the return parameters of the [`setSetMaxNetworkLimitHookStatus(bool)`](setSetMaxNetworkLimitHookStatusCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct setSetMaxNetworkLimitHookStatusReturn {}
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (alloy::sol_types::sol_data::Bool,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool,);
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<setSetMaxNetworkLimitHookStatusCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: setSetMaxNetworkLimitHookStatusCall) -> Self {
                    (value.status,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for setSetMaxNetworkLimitHookStatusCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { status: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<setSetMaxNetworkLimitHookStatusReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: setSetMaxNetworkLimitHookStatusReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for setSetMaxNetworkLimitHookStatusReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl setSetMaxNetworkLimitHookStatusReturn {
            fn _tokenize(
                &self,
            ) -> <setSetMaxNetworkLimitHookStatusCall as alloy_sol_types::SolCall>::ReturnToken<
                '_,
            > {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for setSetMaxNetworkLimitHookStatusCall {
            type Parameters<'a> = (alloy::sol_types::sol_data::Bool,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = setSetMaxNetworkLimitHookStatusReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "setSetMaxNetworkLimitHookStatus(bool)";
            const SELECTOR: [u8; 4] = [218u8, 63u8, 173u8, 122u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.status,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                setSetMaxNetworkLimitHookStatusReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `unregisterOperator()` and selector `0xa876b89a`.
```solidity
function unregisterOperator() external;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct unregisterOperatorCall;
    ///Container type for the return parameters of the [`unregisterOperator()`](unregisterOperatorCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct unregisterOperatorReturn {}
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<unregisterOperatorCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: unregisterOperatorCall) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for unregisterOperatorCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<unregisterOperatorReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: unregisterOperatorReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for unregisterOperatorReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl unregisterOperatorReturn {
            fn _tokenize(
                &self,
            ) -> <unregisterOperatorCall as alloy_sol_types::SolCall>::ReturnToken<'_> {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for unregisterOperatorCall {
            type Parameters<'a> = ();
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = unregisterOperatorReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "unregisterOperator()";
            const SELECTOR: [u8; 4] = [168u8, 118u8, 184u8, 154u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                ()
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                unregisterOperatorReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**Function with signature `unregisterOperatorWithSignature(address,bytes)` and selector `0xf96d1946`.
```solidity
function unregisterOperatorWithSignature(address operator, bytes memory signature) external;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct unregisterOperatorWithSignatureCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub signature: alloy::sol_types::private::Bytes,
    }
    ///Container type for the return parameters of the [`unregisterOperatorWithSignature(address,bytes)`](unregisterOperatorWithSignatureCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct unregisterOperatorWithSignatureReturn {}
    #[allow(
        non_camel_case_types,
        non_snake_case,
        clippy::pub_underscore_fields,
        clippy::style
    )]
    const _: () = {
        use alloy::sol_types as alloy_sol_types;
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::Bytes,
            );
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<unregisterOperatorWithSignatureCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: unregisterOperatorWithSignatureCall) -> Self {
                    (value.operator, value.signature)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for unregisterOperatorWithSignatureCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        signature: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = ();
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = ();
            #[cfg(test)]
            #[allow(dead_code, unreachable_patterns)]
            fn _type_assertion(
                _t: alloy_sol_types::private::AssertTypeEq<UnderlyingRustTuple>,
            ) {
                match _t {
                    alloy_sol_types::private::AssertTypeEq::<
                        <UnderlyingSolTuple as alloy_sol_types::SolType>::RustType,
                    >(_) => {}
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<unregisterOperatorWithSignatureReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: unregisterOperatorWithSignatureReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for unregisterOperatorWithSignatureReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl unregisterOperatorWithSignatureReturn {
            fn _tokenize(
                &self,
            ) -> <unregisterOperatorWithSignatureCall as alloy_sol_types::SolCall>::ReturnToken<
                '_,
            > {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for unregisterOperatorWithSignatureCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Bytes,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = unregisterOperatorWithSignatureReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "unregisterOperatorWithSignature(address,bytes)";
            const SELECTOR: [u8; 4] = [249u8, 109u8, 25u8, 70u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self.signature,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                unregisterOperatorWithSignatureReturn::_tokenize(ret)
            }
            #[inline]
            fn abi_decode_returns(data: &[u8]) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence(data)
                    .map(Into::into)
            }
            #[inline]
            fn abi_decode_returns_validate(
                data: &[u8],
            ) -> alloy_sol_types::Result<Self::Return> {
                <Self::ReturnTuple<
                    '_,
                > as alloy_sol_types::SolType>::abi_decode_sequence_validate(data)
                    .map(Into::into)
            }
        }
    };
    ///Container for all the [`IOpNetVaultAutoDeploy`](self) function calls.
    #[derive(Clone)]
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive()]
    pub enum IOpNetVaultAutoDeployCalls {
        #[allow(missing_docs)]
        OPERATOR_REGISTRY(OPERATOR_REGISTRYCall),
        #[allow(missing_docs)]
        VAULT_CONFIGURATOR(VAULT_CONFIGURATORCall),
        #[allow(missing_docs)]
        VAULT_FACTORY(VAULT_FACTORYCall),
        #[allow(missing_docs)]
        getAutoDeployConfig(getAutoDeployConfigCall),
        #[allow(missing_docs)]
        getAutoDeployedVault(getAutoDeployedVaultCall),
        #[allow(missing_docs)]
        getOperatorStakes(getOperatorStakesCall),
        #[allow(missing_docs)]
        getOperatorStakesAt(getOperatorStakesAtCall),
        #[allow(missing_docs)]
        getOperatorVaults(getOperatorVaultsCall),
        #[allow(missing_docs)]
        getOperatorVaultsAt(getOperatorVaultsAtCall),
        #[allow(missing_docs)]
        getOperatorVotingPowers(getOperatorVotingPowersCall),
        #[allow(missing_docs)]
        getOperatorVotingPowersAt(getOperatorVotingPowersAtCall),
        #[allow(missing_docs)]
        getOperators(getOperatorsCall),
        #[allow(missing_docs)]
        getOperatorsAt(getOperatorsAtCall),
        #[allow(missing_docs)]
        getSharedVaults(getSharedVaultsCall),
        #[allow(missing_docs)]
        getSharedVaultsAt(getSharedVaultsAtCall),
        #[allow(missing_docs)]
        getSlashingData(getSlashingDataCall),
        #[allow(missing_docs)]
        getSlashingDataAt(getSlashingDataAtCall),
        #[allow(missing_docs)]
        getTokens(getTokensCall),
        #[allow(missing_docs)]
        getTokensAt(getTokensAtCall),
        #[allow(missing_docs)]
        getVotingPowers(getVotingPowersCall),
        #[allow(missing_docs)]
        getVotingPowersAt(getVotingPowersAtCall),
        #[allow(missing_docs)]
        invalidateOldSignatures(invalidateOldSignaturesCall),
        #[allow(missing_docs)]
        isAutoDeployEnabled(isAutoDeployEnabledCall),
        #[allow(missing_docs)]
        isOperatorRegistered(isOperatorRegisteredCall),
        #[allow(missing_docs)]
        isOperatorRegisteredAt(isOperatorRegisteredAtCall),
        #[allow(missing_docs)]
        isOperatorVaultRegistered_0(isOperatorVaultRegistered_0Call),
        #[allow(missing_docs)]
        isOperatorVaultRegistered_1(isOperatorVaultRegistered_1Call),
        #[allow(missing_docs)]
        isOperatorVaultRegisteredAt_0(isOperatorVaultRegisteredAt_0Call),
        #[allow(missing_docs)]
        isOperatorVaultRegisteredAt_1(isOperatorVaultRegisteredAt_1Call),
        #[allow(missing_docs)]
        isSetMaxNetworkLimitHookEnabled(isSetMaxNetworkLimitHookEnabledCall),
        #[allow(missing_docs)]
        isSharedVaultRegistered(isSharedVaultRegisteredCall),
        #[allow(missing_docs)]
        isSharedVaultRegisteredAt(isSharedVaultRegisteredAtCall),
        #[allow(missing_docs)]
        isTokenRegistered(isTokenRegisteredCall),
        #[allow(missing_docs)]
        isTokenRegisteredAt(isTokenRegisteredAtCall),
        #[allow(missing_docs)]
        registerOperator(registerOperatorCall),
        #[allow(missing_docs)]
        registerOperatorWithSignature(registerOperatorWithSignatureCall),
        #[allow(missing_docs)]
        setAutoDeployConfig(setAutoDeployConfigCall),
        #[allow(missing_docs)]
        setAutoDeployStatus(setAutoDeployStatusCall),
        #[allow(missing_docs)]
        setSetMaxNetworkLimitHookStatus(setSetMaxNetworkLimitHookStatusCall),
        #[allow(missing_docs)]
        unregisterOperator(unregisterOperatorCall),
        #[allow(missing_docs)]
        unregisterOperatorWithSignature(unregisterOperatorWithSignatureCall),
    }
    impl IOpNetVaultAutoDeployCalls {
        /// All the selectors of this enum.
        ///
        /// Note that the selectors might not be in the same order as the variants.
        /// No guarantees are made about the order of the selectors.
        ///
        /// Prefer using `SolInterface` methods instead.
        pub const SELECTORS: &'static [[u8; 4usize]] = &[
            [15u8, 110u8, 7u8, 67u8],
            [16u8, 63u8, 41u8, 7u8],
            [20u8, 215u8, 226u8, 91u8],
            [23u8, 150u8, 223u8, 27u8],
            [38u8, 170u8, 16u8, 31u8],
            [39u8, 160u8, 153u8, 216u8],
            [42u8, 205u8, 224u8, 152u8],
            [43u8, 47u8, 208u8, 21u8],
            [56u8, 15u8, 153u8, 69u8],
            [73u8, 249u8, 147u8, 236u8],
            [74u8, 12u8, 124u8, 23u8],
            [98u8, 46u8, 77u8, 186u8],
            [99u8, 255u8, 17u8, 64u8],
            [102u8, 159u8, 168u8, 199u8],
            [106u8, 73u8, 97u8, 8u8],
            [107u8, 25u8, 6u8, 248u8],
            [119u8, 173u8, 234u8, 95u8],
            [121u8, 227u8, 191u8, 14u8],
            [122u8, 116u8, 199u8, 253u8],
            [131u8, 206u8, 3u8, 34u8],
            [138u8, 90u8, 239u8, 81u8],
            [140u8, 236u8, 170u8, 180u8],
            [147u8, 129u8, 106u8, 19u8],
            [154u8, 30u8, 190u8, 233u8],
            [161u8, 73u8, 201u8, 135u8],
            [162u8, 227u8, 48u8, 9u8],
            [165u8, 78u8, 17u8, 110u8],
            [168u8, 118u8, 184u8, 154u8],
            [170u8, 108u8, 168u8, 8u8],
            [178u8, 91u8, 192u8, 192u8],
            [194u8, 132u8, 116u8, 205u8],
            [218u8, 63u8, 173u8, 122u8],
            [218u8, 232u8, 248u8, 3u8],
            [222u8, 176u8, 24u8, 220u8],
            [230u8, 110u8, 30u8, 210u8],
            [231u8, 123u8, 19u8, 109u8],
            [235u8, 94u8, 148u8, 13u8],
            [246u8, 192u8, 17u8, 222u8],
            [247u8, 223u8, 185u8, 116u8],
            [249u8, 109u8, 25u8, 70u8],
            [255u8, 124u8, 215u8, 28u8],
        ];
        /// The names of the variants in the same order as `SELECTORS`.
        pub const VARIANT_NAMES: &'static [&'static str] = &[
            ::core::stringify!(isOperatorVaultRegistered_0),
            ::core::stringify!(VAULT_FACTORY),
            ::core::stringify!(getOperatorVaults),
            ::core::stringify!(getTokensAt),
            ::core::stringify!(isTokenRegistered),
            ::core::stringify!(getOperators),
            ::core::stringify!(registerOperator),
            ::core::stringify!(getAutoDeployedVault),
            ::core::stringify!(getOperatorVotingPowersAt),
            ::core::stringify!(getOperatorVaultsAt),
            ::core::stringify!(getSharedVaultsAt),
            ::core::stringify!(invalidateOldSignatures),
            ::core::stringify!(getOperatorVotingPowers),
            ::core::stringify!(isOperatorVaultRegistered_1),
            ::core::stringify!(isTokenRegisteredAt),
            ::core::stringify!(isOperatorRegistered),
            ::core::stringify!(getVotingPowersAt),
            ::core::stringify!(setAutoDeployStatus),
            ::core::stringify!(getSlashingDataAt),
            ::core::stringify!(OPERATOR_REGISTRY),
            ::core::stringify!(isOperatorRegisteredAt),
            ::core::stringify!(setAutoDeployConfig),
            ::core::stringify!(getOperatorStakes),
            ::core::stringify!(isSharedVaultRegistered),
            ::core::stringify!(getAutoDeployConfig),
            ::core::stringify!(getOperatorsAt),
            ::core::stringify!(getOperatorStakesAt),
            ::core::stringify!(unregisterOperator),
            ::core::stringify!(getTokens),
            ::core::stringify!(VAULT_CONFIGURATOR),
            ::core::stringify!(getSharedVaults),
            ::core::stringify!(setSetMaxNetworkLimitHookStatus),
            ::core::stringify!(isOperatorVaultRegisteredAt_0),
            ::core::stringify!(isAutoDeployEnabled),
            ::core::stringify!(isSharedVaultRegisteredAt),
            ::core::stringify!(isSetMaxNetworkLimitHookEnabled),
            ::core::stringify!(registerOperatorWithSignature),
            ::core::stringify!(isOperatorVaultRegisteredAt_1),
            ::core::stringify!(getSlashingData),
            ::core::stringify!(unregisterOperatorWithSignature),
            ::core::stringify!(getVotingPowers),
        ];
        /// The signatures in the same order as `SELECTORS`.
        pub const SIGNATURES: &'static [&'static str] = &[
            <isOperatorVaultRegistered_0Call as alloy_sol_types::SolCall>::SIGNATURE,
            <VAULT_FACTORYCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorVaultsCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getTokensAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isTokenRegisteredCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorsCall as alloy_sol_types::SolCall>::SIGNATURE,
            <registerOperatorCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorVotingPowersAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorVaultsAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getSharedVaultsAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <invalidateOldSignaturesCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorVotingPowersCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isOperatorVaultRegistered_1Call as alloy_sol_types::SolCall>::SIGNATURE,
            <isTokenRegisteredAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isOperatorRegisteredCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getVotingPowersAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <setAutoDeployStatusCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getSlashingDataAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <OPERATOR_REGISTRYCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isOperatorRegisteredAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <setAutoDeployConfigCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorStakesCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isSharedVaultRegisteredCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getAutoDeployConfigCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorsAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorStakesAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <unregisterOperatorCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getTokensCall as alloy_sol_types::SolCall>::SIGNATURE,
            <VAULT_CONFIGURATORCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getSharedVaultsCall as alloy_sol_types::SolCall>::SIGNATURE,
            <setSetMaxNetworkLimitHookStatusCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isOperatorVaultRegisteredAt_0Call as alloy_sol_types::SolCall>::SIGNATURE,
            <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isSharedVaultRegisteredAtCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::SIGNATURE,
            <registerOperatorWithSignatureCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isOperatorVaultRegisteredAt_1Call as alloy_sol_types::SolCall>::SIGNATURE,
            <getSlashingDataCall as alloy_sol_types::SolCall>::SIGNATURE,
            <unregisterOperatorWithSignatureCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getVotingPowersCall as alloy_sol_types::SolCall>::SIGNATURE,
        ];
        /// Returns the signature for the given selector, if known.
        #[inline]
        pub fn signature_by_selector(
            selector: [u8; 4usize],
        ) -> ::core::option::Option<&'static str> {
            match Self::SELECTORS.binary_search(&selector) {
                ::core::result::Result::Ok(idx) => {
                    ::core::option::Option::Some(Self::SIGNATURES[idx])
                }
                ::core::result::Result::Err(_) => ::core::option::Option::None,
            }
        }
        /// Returns the enum variant name for the given selector, if known.
        #[inline]
        pub fn name_by_selector(
            selector: [u8; 4usize],
        ) -> ::core::option::Option<&'static str> {
            let sig = Self::signature_by_selector(selector)?;
            sig.split_once('(').map(|(name, _)| name)
        }
    }
    #[automatically_derived]
    impl alloy_sol_types::SolInterface for IOpNetVaultAutoDeployCalls {
        const NAME: &'static str = "IOpNetVaultAutoDeployCalls";
        const MIN_DATA_LENGTH: usize = 0usize;
        const COUNT: usize = 41usize;
        #[inline]
        fn selector(&self) -> [u8; 4] {
            match self {
                Self::OPERATOR_REGISTRY(_) => {
                    <OPERATOR_REGISTRYCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::VAULT_CONFIGURATOR(_) => {
                    <VAULT_CONFIGURATORCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::VAULT_FACTORY(_) => {
                    <VAULT_FACTORYCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getAutoDeployConfig(_) => {
                    <getAutoDeployConfigCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getAutoDeployedVault(_) => {
                    <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperatorStakes(_) => {
                    <getOperatorStakesCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperatorStakesAt(_) => {
                    <getOperatorStakesAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperatorVaults(_) => {
                    <getOperatorVaultsCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperatorVaultsAt(_) => {
                    <getOperatorVaultsAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperatorVotingPowers(_) => {
                    <getOperatorVotingPowersCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperatorVotingPowersAt(_) => {
                    <getOperatorVotingPowersAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperators(_) => {
                    <getOperatorsCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperatorsAt(_) => {
                    <getOperatorsAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getSharedVaults(_) => {
                    <getSharedVaultsCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getSharedVaultsAt(_) => {
                    <getSharedVaultsAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getSlashingData(_) => {
                    <getSlashingDataCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getSlashingDataAt(_) => {
                    <getSlashingDataAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getTokens(_) => {
                    <getTokensCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getTokensAt(_) => {
                    <getTokensAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getVotingPowers(_) => {
                    <getVotingPowersCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getVotingPowersAt(_) => {
                    <getVotingPowersAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::invalidateOldSignatures(_) => {
                    <invalidateOldSignaturesCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isAutoDeployEnabled(_) => {
                    <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isOperatorRegistered(_) => {
                    <isOperatorRegisteredCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isOperatorRegisteredAt(_) => {
                    <isOperatorRegisteredAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isOperatorVaultRegistered_0(_) => {
                    <isOperatorVaultRegistered_0Call as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isOperatorVaultRegistered_1(_) => {
                    <isOperatorVaultRegistered_1Call as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isOperatorVaultRegisteredAt_0(_) => {
                    <isOperatorVaultRegisteredAt_0Call as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isOperatorVaultRegisteredAt_1(_) => {
                    <isOperatorVaultRegisteredAt_1Call as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isSetMaxNetworkLimitHookEnabled(_) => {
                    <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isSharedVaultRegistered(_) => {
                    <isSharedVaultRegisteredCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isSharedVaultRegisteredAt(_) => {
                    <isSharedVaultRegisteredAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isTokenRegistered(_) => {
                    <isTokenRegisteredCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isTokenRegisteredAt(_) => {
                    <isTokenRegisteredAtCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::registerOperator(_) => {
                    <registerOperatorCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::registerOperatorWithSignature(_) => {
                    <registerOperatorWithSignatureCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::setAutoDeployConfig(_) => {
                    <setAutoDeployConfigCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::setAutoDeployStatus(_) => {
                    <setAutoDeployStatusCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::setSetMaxNetworkLimitHookStatus(_) => {
                    <setSetMaxNetworkLimitHookStatusCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::unregisterOperator(_) => {
                    <unregisterOperatorCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::unregisterOperatorWithSignature(_) => {
                    <unregisterOperatorWithSignatureCall as alloy_sol_types::SolCall>::SELECTOR
                }
            }
        }
        #[inline]
        fn selector_at(i: usize) -> ::core::option::Option<[u8; 4]> {
            Self::SELECTORS.get(i).copied()
        }
        #[inline]
        fn valid_selector(selector: [u8; 4]) -> bool {
            Self::SELECTORS.binary_search(&selector).is_ok()
        }
        #[inline]
        #[allow(non_snake_case)]
        fn abi_decode_raw(
            selector: [u8; 4],
            data: &[u8],
        ) -> alloy_sol_types::Result<Self> {
            static DECODE_SHIMS: &[fn(
                &[u8],
            ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls>] = &[
                {
                    fn isOperatorVaultRegistered_0(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorVaultRegistered_0Call as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isOperatorVaultRegistered_0)
                    }
                    isOperatorVaultRegistered_0
                },
                {
                    fn VAULT_FACTORY(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <VAULT_FACTORYCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::VAULT_FACTORY)
                    }
                    VAULT_FACTORY
                },
                {
                    fn getOperatorVaults(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorVaultsCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorVaults)
                    }
                    getOperatorVaults
                },
                {
                    fn getTokensAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getTokensAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getTokensAt)
                    }
                    getTokensAt
                },
                {
                    fn isTokenRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isTokenRegisteredCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isTokenRegistered)
                    }
                    isTokenRegistered
                },
                {
                    fn getOperators(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorsCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperators)
                    }
                    getOperators
                },
                {
                    fn registerOperator(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <registerOperatorCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::registerOperator)
                    }
                    registerOperator
                },
                {
                    fn getAutoDeployedVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getAutoDeployedVault)
                    }
                    getAutoDeployedVault
                },
                {
                    fn getOperatorVotingPowersAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorVotingPowersAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorVotingPowersAt)
                    }
                    getOperatorVotingPowersAt
                },
                {
                    fn getOperatorVaultsAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorVaultsAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorVaultsAt)
                    }
                    getOperatorVaultsAt
                },
                {
                    fn getSharedVaultsAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getSharedVaultsAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getSharedVaultsAt)
                    }
                    getSharedVaultsAt
                },
                {
                    fn invalidateOldSignatures(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <invalidateOldSignaturesCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::invalidateOldSignatures)
                    }
                    invalidateOldSignatures
                },
                {
                    fn getOperatorVotingPowers(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorVotingPowersCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorVotingPowers)
                    }
                    getOperatorVotingPowers
                },
                {
                    fn isOperatorVaultRegistered_1(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorVaultRegistered_1Call as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isOperatorVaultRegistered_1)
                    }
                    isOperatorVaultRegistered_1
                },
                {
                    fn isTokenRegisteredAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isTokenRegisteredAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isTokenRegisteredAt)
                    }
                    isTokenRegisteredAt
                },
                {
                    fn isOperatorRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorRegisteredCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isOperatorRegistered)
                    }
                    isOperatorRegistered
                },
                {
                    fn getVotingPowersAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getVotingPowersAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getVotingPowersAt)
                    }
                    getVotingPowersAt
                },
                {
                    fn setAutoDeployStatus(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <setAutoDeployStatusCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::setAutoDeployStatus)
                    }
                    setAutoDeployStatus
                },
                {
                    fn getSlashingDataAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getSlashingDataAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getSlashingDataAt)
                    }
                    getSlashingDataAt
                },
                {
                    fn OPERATOR_REGISTRY(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <OPERATOR_REGISTRYCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::OPERATOR_REGISTRY)
                    }
                    OPERATOR_REGISTRY
                },
                {
                    fn isOperatorRegisteredAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorRegisteredAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isOperatorRegisteredAt)
                    }
                    isOperatorRegisteredAt
                },
                {
                    fn setAutoDeployConfig(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <setAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::setAutoDeployConfig)
                    }
                    setAutoDeployConfig
                },
                {
                    fn getOperatorStakes(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorStakesCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorStakes)
                    }
                    getOperatorStakes
                },
                {
                    fn isSharedVaultRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isSharedVaultRegisteredCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isSharedVaultRegistered)
                    }
                    isSharedVaultRegistered
                },
                {
                    fn getAutoDeployConfig(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getAutoDeployConfig)
                    }
                    getAutoDeployConfig
                },
                {
                    fn getOperatorsAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorsAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorsAt)
                    }
                    getOperatorsAt
                },
                {
                    fn getOperatorStakesAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorStakesAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorStakesAt)
                    }
                    getOperatorStakesAt
                },
                {
                    fn unregisterOperator(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <unregisterOperatorCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::unregisterOperator)
                    }
                    unregisterOperator
                },
                {
                    fn getTokens(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getTokensCall as alloy_sol_types::SolCall>::abi_decode_raw(data)
                            .map(IOpNetVaultAutoDeployCalls::getTokens)
                    }
                    getTokens
                },
                {
                    fn VAULT_CONFIGURATOR(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <VAULT_CONFIGURATORCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::VAULT_CONFIGURATOR)
                    }
                    VAULT_CONFIGURATOR
                },
                {
                    fn getSharedVaults(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getSharedVaultsCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getSharedVaults)
                    }
                    getSharedVaults
                },
                {
                    fn setSetMaxNetworkLimitHookStatus(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <setSetMaxNetworkLimitHookStatusCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::setSetMaxNetworkLimitHookStatus,
                            )
                    }
                    setSetMaxNetworkLimitHookStatus
                },
                {
                    fn isOperatorVaultRegisteredAt_0(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorVaultRegisteredAt_0Call as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::isOperatorVaultRegisteredAt_0,
                            )
                    }
                    isOperatorVaultRegisteredAt_0
                },
                {
                    fn isAutoDeployEnabled(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isAutoDeployEnabled)
                    }
                    isAutoDeployEnabled
                },
                {
                    fn isSharedVaultRegisteredAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isSharedVaultRegisteredAtCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isSharedVaultRegisteredAt)
                    }
                    isSharedVaultRegisteredAt
                },
                {
                    fn isSetMaxNetworkLimitHookEnabled(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::isSetMaxNetworkLimitHookEnabled,
                            )
                    }
                    isSetMaxNetworkLimitHookEnabled
                },
                {
                    fn registerOperatorWithSignature(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <registerOperatorWithSignatureCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::registerOperatorWithSignature,
                            )
                    }
                    registerOperatorWithSignature
                },
                {
                    fn isOperatorVaultRegisteredAt_1(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorVaultRegisteredAt_1Call as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::isOperatorVaultRegisteredAt_1,
                            )
                    }
                    isOperatorVaultRegisteredAt_1
                },
                {
                    fn getSlashingData(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getSlashingDataCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getSlashingData)
                    }
                    getSlashingData
                },
                {
                    fn unregisterOperatorWithSignature(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <unregisterOperatorWithSignatureCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::unregisterOperatorWithSignature,
                            )
                    }
                    unregisterOperatorWithSignature
                },
                {
                    fn getVotingPowers(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getVotingPowersCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getVotingPowers)
                    }
                    getVotingPowers
                },
            ];
            let Ok(idx) = Self::SELECTORS.binary_search(&selector) else {
                return Err(
                    alloy_sol_types::Error::unknown_selector(
                        <Self as alloy_sol_types::SolInterface>::NAME,
                        selector,
                    ),
                );
            };
            DECODE_SHIMS[idx](data)
        }
        #[inline]
        #[allow(non_snake_case)]
        fn abi_decode_raw_validate(
            selector: [u8; 4],
            data: &[u8],
        ) -> alloy_sol_types::Result<Self> {
            static DECODE_VALIDATE_SHIMS: &[fn(
                &[u8],
            ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls>] = &[
                {
                    fn isOperatorVaultRegistered_0(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorVaultRegistered_0Call as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isOperatorVaultRegistered_0)
                    }
                    isOperatorVaultRegistered_0
                },
                {
                    fn VAULT_FACTORY(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <VAULT_FACTORYCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::VAULT_FACTORY)
                    }
                    VAULT_FACTORY
                },
                {
                    fn getOperatorVaults(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorVaultsCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorVaults)
                    }
                    getOperatorVaults
                },
                {
                    fn getTokensAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getTokensAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getTokensAt)
                    }
                    getTokensAt
                },
                {
                    fn isTokenRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isTokenRegisteredCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isTokenRegistered)
                    }
                    isTokenRegistered
                },
                {
                    fn getOperators(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorsCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperators)
                    }
                    getOperators
                },
                {
                    fn registerOperator(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <registerOperatorCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::registerOperator)
                    }
                    registerOperator
                },
                {
                    fn getAutoDeployedVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getAutoDeployedVault)
                    }
                    getAutoDeployedVault
                },
                {
                    fn getOperatorVotingPowersAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorVotingPowersAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorVotingPowersAt)
                    }
                    getOperatorVotingPowersAt
                },
                {
                    fn getOperatorVaultsAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorVaultsAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorVaultsAt)
                    }
                    getOperatorVaultsAt
                },
                {
                    fn getSharedVaultsAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getSharedVaultsAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getSharedVaultsAt)
                    }
                    getSharedVaultsAt
                },
                {
                    fn invalidateOldSignatures(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <invalidateOldSignaturesCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::invalidateOldSignatures)
                    }
                    invalidateOldSignatures
                },
                {
                    fn getOperatorVotingPowers(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorVotingPowersCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorVotingPowers)
                    }
                    getOperatorVotingPowers
                },
                {
                    fn isOperatorVaultRegistered_1(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorVaultRegistered_1Call as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isOperatorVaultRegistered_1)
                    }
                    isOperatorVaultRegistered_1
                },
                {
                    fn isTokenRegisteredAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isTokenRegisteredAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isTokenRegisteredAt)
                    }
                    isTokenRegisteredAt
                },
                {
                    fn isOperatorRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorRegisteredCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isOperatorRegistered)
                    }
                    isOperatorRegistered
                },
                {
                    fn getVotingPowersAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getVotingPowersAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getVotingPowersAt)
                    }
                    getVotingPowersAt
                },
                {
                    fn setAutoDeployStatus(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <setAutoDeployStatusCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::setAutoDeployStatus)
                    }
                    setAutoDeployStatus
                },
                {
                    fn getSlashingDataAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getSlashingDataAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getSlashingDataAt)
                    }
                    getSlashingDataAt
                },
                {
                    fn OPERATOR_REGISTRY(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <OPERATOR_REGISTRYCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::OPERATOR_REGISTRY)
                    }
                    OPERATOR_REGISTRY
                },
                {
                    fn isOperatorRegisteredAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorRegisteredAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isOperatorRegisteredAt)
                    }
                    isOperatorRegisteredAt
                },
                {
                    fn setAutoDeployConfig(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <setAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::setAutoDeployConfig)
                    }
                    setAutoDeployConfig
                },
                {
                    fn getOperatorStakes(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorStakesCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorStakes)
                    }
                    getOperatorStakes
                },
                {
                    fn isSharedVaultRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isSharedVaultRegisteredCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isSharedVaultRegistered)
                    }
                    isSharedVaultRegistered
                },
                {
                    fn getAutoDeployConfig(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getAutoDeployConfig)
                    }
                    getAutoDeployConfig
                },
                {
                    fn getOperatorsAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorsAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorsAt)
                    }
                    getOperatorsAt
                },
                {
                    fn getOperatorStakesAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getOperatorStakesAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getOperatorStakesAt)
                    }
                    getOperatorStakesAt
                },
                {
                    fn unregisterOperator(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <unregisterOperatorCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::unregisterOperator)
                    }
                    unregisterOperator
                },
                {
                    fn getTokens(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getTokensCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getTokens)
                    }
                    getTokens
                },
                {
                    fn VAULT_CONFIGURATOR(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <VAULT_CONFIGURATORCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::VAULT_CONFIGURATOR)
                    }
                    VAULT_CONFIGURATOR
                },
                {
                    fn getSharedVaults(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getSharedVaultsCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getSharedVaults)
                    }
                    getSharedVaults
                },
                {
                    fn setSetMaxNetworkLimitHookStatus(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <setSetMaxNetworkLimitHookStatusCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::setSetMaxNetworkLimitHookStatus,
                            )
                    }
                    setSetMaxNetworkLimitHookStatus
                },
                {
                    fn isOperatorVaultRegisteredAt_0(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorVaultRegisteredAt_0Call as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::isOperatorVaultRegisteredAt_0,
                            )
                    }
                    isOperatorVaultRegisteredAt_0
                },
                {
                    fn isAutoDeployEnabled(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isAutoDeployEnabled)
                    }
                    isAutoDeployEnabled
                },
                {
                    fn isSharedVaultRegisteredAt(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isSharedVaultRegisteredAtCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::isSharedVaultRegisteredAt)
                    }
                    isSharedVaultRegisteredAt
                },
                {
                    fn isSetMaxNetworkLimitHookEnabled(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::isSetMaxNetworkLimitHookEnabled,
                            )
                    }
                    isSetMaxNetworkLimitHookEnabled
                },
                {
                    fn registerOperatorWithSignature(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <registerOperatorWithSignatureCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::registerOperatorWithSignature,
                            )
                    }
                    registerOperatorWithSignature
                },
                {
                    fn isOperatorVaultRegisteredAt_1(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <isOperatorVaultRegisteredAt_1Call as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::isOperatorVaultRegisteredAt_1,
                            )
                    }
                    isOperatorVaultRegisteredAt_1
                },
                {
                    fn getSlashingData(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getSlashingDataCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getSlashingData)
                    }
                    getSlashingData
                },
                {
                    fn unregisterOperatorWithSignature(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <unregisterOperatorWithSignatureCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployCalls::unregisterOperatorWithSignature,
                            )
                    }
                    unregisterOperatorWithSignature
                },
                {
                    fn getVotingPowers(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployCalls> {
                        <getVotingPowersCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(IOpNetVaultAutoDeployCalls::getVotingPowers)
                    }
                    getVotingPowers
                },
            ];
            let Ok(idx) = Self::SELECTORS.binary_search(&selector) else {
                return Err(
                    alloy_sol_types::Error::unknown_selector(
                        <Self as alloy_sol_types::SolInterface>::NAME,
                        selector,
                    ),
                );
            };
            DECODE_VALIDATE_SHIMS[idx](data)
        }
        #[inline]
        fn abi_encoded_size(&self) -> usize {
            match self {
                Self::OPERATOR_REGISTRY(inner) => {
                    <OPERATOR_REGISTRYCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VAULT_CONFIGURATOR(inner) => {
                    <VAULT_CONFIGURATORCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VAULT_FACTORY(inner) => {
                    <VAULT_FACTORYCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getAutoDeployConfig(inner) => {
                    <getAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getAutoDeployedVault(inner) => {
                    <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperatorStakes(inner) => {
                    <getOperatorStakesCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperatorStakesAt(inner) => {
                    <getOperatorStakesAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperatorVaults(inner) => {
                    <getOperatorVaultsCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperatorVaultsAt(inner) => {
                    <getOperatorVaultsAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperatorVotingPowers(inner) => {
                    <getOperatorVotingPowersCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperatorVotingPowersAt(inner) => {
                    <getOperatorVotingPowersAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperators(inner) => {
                    <getOperatorsCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperatorsAt(inner) => {
                    <getOperatorsAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getSharedVaults(inner) => {
                    <getSharedVaultsCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getSharedVaultsAt(inner) => {
                    <getSharedVaultsAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getSlashingData(inner) => {
                    <getSlashingDataCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getSlashingDataAt(inner) => {
                    <getSlashingDataAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getTokens(inner) => {
                    <getTokensCall as alloy_sol_types::SolCall>::abi_encoded_size(inner)
                }
                Self::getTokensAt(inner) => {
                    <getTokensAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getVotingPowers(inner) => {
                    <getVotingPowersCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getVotingPowersAt(inner) => {
                    <getVotingPowersAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::invalidateOldSignatures(inner) => {
                    <invalidateOldSignaturesCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isAutoDeployEnabled(inner) => {
                    <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isOperatorRegistered(inner) => {
                    <isOperatorRegisteredCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isOperatorRegisteredAt(inner) => {
                    <isOperatorRegisteredAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isOperatorVaultRegistered_0(inner) => {
                    <isOperatorVaultRegistered_0Call as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isOperatorVaultRegistered_1(inner) => {
                    <isOperatorVaultRegistered_1Call as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isOperatorVaultRegisteredAt_0(inner) => {
                    <isOperatorVaultRegisteredAt_0Call as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isOperatorVaultRegisteredAt_1(inner) => {
                    <isOperatorVaultRegisteredAt_1Call as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isSetMaxNetworkLimitHookEnabled(inner) => {
                    <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isSharedVaultRegistered(inner) => {
                    <isSharedVaultRegisteredCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isSharedVaultRegisteredAt(inner) => {
                    <isSharedVaultRegisteredAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isTokenRegistered(inner) => {
                    <isTokenRegisteredCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isTokenRegisteredAt(inner) => {
                    <isTokenRegisteredAtCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::registerOperator(inner) => {
                    <registerOperatorCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::registerOperatorWithSignature(inner) => {
                    <registerOperatorWithSignatureCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::setAutoDeployConfig(inner) => {
                    <setAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::setAutoDeployStatus(inner) => {
                    <setAutoDeployStatusCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::setSetMaxNetworkLimitHookStatus(inner) => {
                    <setSetMaxNetworkLimitHookStatusCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::unregisterOperator(inner) => {
                    <unregisterOperatorCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::unregisterOperatorWithSignature(inner) => {
                    <unregisterOperatorWithSignatureCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
            }
        }
        #[inline]
        fn abi_encode_raw(&self, out: &mut alloy_sol_types::private::Vec<u8>) {
            match self {
                Self::OPERATOR_REGISTRY(inner) => {
                    <OPERATOR_REGISTRYCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VAULT_CONFIGURATOR(inner) => {
                    <VAULT_CONFIGURATORCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VAULT_FACTORY(inner) => {
                    <VAULT_FACTORYCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getAutoDeployConfig(inner) => {
                    <getAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getAutoDeployedVault(inner) => {
                    <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperatorStakes(inner) => {
                    <getOperatorStakesCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperatorStakesAt(inner) => {
                    <getOperatorStakesAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperatorVaults(inner) => {
                    <getOperatorVaultsCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperatorVaultsAt(inner) => {
                    <getOperatorVaultsAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperatorVotingPowers(inner) => {
                    <getOperatorVotingPowersCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperatorVotingPowersAt(inner) => {
                    <getOperatorVotingPowersAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperators(inner) => {
                    <getOperatorsCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperatorsAt(inner) => {
                    <getOperatorsAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getSharedVaults(inner) => {
                    <getSharedVaultsCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getSharedVaultsAt(inner) => {
                    <getSharedVaultsAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getSlashingData(inner) => {
                    <getSlashingDataCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getSlashingDataAt(inner) => {
                    <getSlashingDataAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getTokens(inner) => {
                    <getTokensCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getTokensAt(inner) => {
                    <getTokensAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getVotingPowers(inner) => {
                    <getVotingPowersCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getVotingPowersAt(inner) => {
                    <getVotingPowersAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::invalidateOldSignatures(inner) => {
                    <invalidateOldSignaturesCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isAutoDeployEnabled(inner) => {
                    <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isOperatorRegistered(inner) => {
                    <isOperatorRegisteredCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isOperatorRegisteredAt(inner) => {
                    <isOperatorRegisteredAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isOperatorVaultRegistered_0(inner) => {
                    <isOperatorVaultRegistered_0Call as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isOperatorVaultRegistered_1(inner) => {
                    <isOperatorVaultRegistered_1Call as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isOperatorVaultRegisteredAt_0(inner) => {
                    <isOperatorVaultRegisteredAt_0Call as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isOperatorVaultRegisteredAt_1(inner) => {
                    <isOperatorVaultRegisteredAt_1Call as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isSetMaxNetworkLimitHookEnabled(inner) => {
                    <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isSharedVaultRegistered(inner) => {
                    <isSharedVaultRegisteredCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isSharedVaultRegisteredAt(inner) => {
                    <isSharedVaultRegisteredAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isTokenRegistered(inner) => {
                    <isTokenRegisteredCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::isTokenRegisteredAt(inner) => {
                    <isTokenRegisteredAtCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::registerOperator(inner) => {
                    <registerOperatorCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::registerOperatorWithSignature(inner) => {
                    <registerOperatorWithSignatureCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::setAutoDeployConfig(inner) => {
                    <setAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::setAutoDeployStatus(inner) => {
                    <setAutoDeployStatusCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::setSetMaxNetworkLimitHookStatus(inner) => {
                    <setSetMaxNetworkLimitHookStatusCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::unregisterOperator(inner) => {
                    <unregisterOperatorCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::unregisterOperatorWithSignature(inner) => {
                    <unregisterOperatorWithSignatureCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
            }
        }
    }
    ///Container for all the [`IOpNetVaultAutoDeploy`](self) custom errors.
    #[derive(Clone)]
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Debug, PartialEq, Eq, Hash)]
    pub enum IOpNetVaultAutoDeployErrors {
        #[allow(missing_docs)]
        OpNetVaultAutoDeploy_InvalidBurnerHook(OpNetVaultAutoDeploy_InvalidBurnerHook),
        #[allow(missing_docs)]
        OpNetVaultAutoDeploy_InvalidCollateral(OpNetVaultAutoDeploy_InvalidCollateral),
        #[allow(missing_docs)]
        OpNetVaultAutoDeploy_InvalidEpochDuration(
            OpNetVaultAutoDeploy_InvalidEpochDuration,
        ),
        #[allow(missing_docs)]
        OpNetVaultAutoDeploy_InvalidWithSlasher(OpNetVaultAutoDeploy_InvalidWithSlasher),
        #[allow(missing_docs)]
        VotingPowerProvider_InvalidOperator(VotingPowerProvider_InvalidOperator),
        #[allow(missing_docs)]
        VotingPowerProvider_InvalidOperatorVault(
            VotingPowerProvider_InvalidOperatorVault,
        ),
        #[allow(missing_docs)]
        VotingPowerProvider_InvalidSharedVault(VotingPowerProvider_InvalidSharedVault),
        #[allow(missing_docs)]
        VotingPowerProvider_InvalidSignature(VotingPowerProvider_InvalidSignature),
        #[allow(missing_docs)]
        VotingPowerProvider_InvalidToken(VotingPowerProvider_InvalidToken),
        #[allow(missing_docs)]
        VotingPowerProvider_InvalidVault(VotingPowerProvider_InvalidVault),
        #[allow(missing_docs)]
        VotingPowerProvider_OperatorAlreadyRegistered(
            VotingPowerProvider_OperatorAlreadyRegistered,
        ),
        #[allow(missing_docs)]
        VotingPowerProvider_OperatorNotRegistered(
            VotingPowerProvider_OperatorNotRegistered,
        ),
        #[allow(missing_docs)]
        VotingPowerProvider_OperatorVaultAlreadyIsRegistered(
            VotingPowerProvider_OperatorVaultAlreadyIsRegistered,
        ),
        #[allow(missing_docs)]
        VotingPowerProvider_OperatorVaultNotRegistered(
            VotingPowerProvider_OperatorVaultNotRegistered,
        ),
        #[allow(missing_docs)]
        VotingPowerProvider_SharedVaultAlreadyIsRegistered(
            VotingPowerProvider_SharedVaultAlreadyIsRegistered,
        ),
        #[allow(missing_docs)]
        VotingPowerProvider_SharedVaultNotRegistered(
            VotingPowerProvider_SharedVaultNotRegistered,
        ),
        #[allow(missing_docs)]
        VotingPowerProvider_TokenAlreadyIsRegistered(
            VotingPowerProvider_TokenAlreadyIsRegistered,
        ),
        #[allow(missing_docs)]
        VotingPowerProvider_TokenNotRegistered(VotingPowerProvider_TokenNotRegistered),
    }
    impl IOpNetVaultAutoDeployErrors {
        /// All the selectors of this enum.
        ///
        /// Note that the selectors might not be in the same order as the variants.
        /// No guarantees are made about the order of the selectors.
        ///
        /// Prefer using `SolInterface` methods instead.
        pub const SELECTORS: &'static [[u8; 4usize]] = &[
            [22u8, 72u8, 233u8, 106u8],
            [25u8, 65u8, 110u8, 54u8],
            [25u8, 144u8, 37u8, 51u8],
            [33u8, 13u8, 129u8, 50u8],
            [35u8, 213u8, 173u8, 198u8],
            [54u8, 62u8, 131u8, 94u8],
            [62u8, 38u8, 117u8, 198u8],
            [98u8, 221u8, 116u8, 169u8],
            [113u8, 53u8, 172u8, 48u8],
            [133u8, 226u8, 253u8, 201u8],
            [150u8, 175u8, 196u8, 84u8],
            [161u8, 143u8, 48u8, 7u8],
            [177u8, 241u8, 253u8, 161u8],
            [194u8, 22u8, 157u8, 42u8],
            [197u8, 188u8, 216u8, 250u8],
            [201u8, 253u8, 27u8, 206u8],
            [214u8, 158u8, 29u8, 145u8],
            [227u8, 18u8, 74u8, 247u8],
        ];
        /// The names of the variants in the same order as `SELECTORS`.
        pub const VARIANT_NAMES: &'static [&'static str] = &[
            ::core::stringify!(OpNetVaultAutoDeploy_InvalidEpochDuration),
            ::core::stringify!(VotingPowerProvider_InvalidSharedVault),
            ::core::stringify!(VotingPowerProvider_InvalidOperatorVault),
            ::core::stringify!(VotingPowerProvider_OperatorAlreadyRegistered),
            ::core::stringify!(OpNetVaultAutoDeploy_InvalidBurnerHook),
            ::core::stringify!(OpNetVaultAutoDeploy_InvalidCollateral),
            ::core::stringify!(VotingPowerProvider_OperatorVaultNotRegistered),
            ::core::stringify!(VotingPowerProvider_InvalidOperator),
            ::core::stringify!(VotingPowerProvider_OperatorNotRegistered),
            ::core::stringify!(OpNetVaultAutoDeploy_InvalidWithSlasher),
            ::core::stringify!(VotingPowerProvider_SharedVaultNotRegistered),
            ::core::stringify!(VotingPowerProvider_InvalidToken),
            ::core::stringify!(VotingPowerProvider_InvalidSignature),
            ::core::stringify!(VotingPowerProvider_InvalidVault),
            ::core::stringify!(VotingPowerProvider_TokenAlreadyIsRegistered),
            ::core::stringify!(VotingPowerProvider_OperatorVaultAlreadyIsRegistered),
            ::core::stringify!(VotingPowerProvider_TokenNotRegistered),
            ::core::stringify!(VotingPowerProvider_SharedVaultAlreadyIsRegistered),
        ];
        /// The signatures in the same order as `SELECTORS`.
        pub const SIGNATURES: &'static [&'static str] = &[
            <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_InvalidSharedVault as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_InvalidOperatorVault as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_OperatorAlreadyRegistered as alloy_sol_types::SolError>::SIGNATURE,
            <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::SIGNATURE,
            <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_OperatorVaultNotRegistered as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_InvalidOperator as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_OperatorNotRegistered as alloy_sol_types::SolError>::SIGNATURE,
            <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_SharedVaultNotRegistered as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_InvalidToken as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_InvalidSignature as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_InvalidVault as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_TokenAlreadyIsRegistered as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_OperatorVaultAlreadyIsRegistered as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_TokenNotRegistered as alloy_sol_types::SolError>::SIGNATURE,
            <VotingPowerProvider_SharedVaultAlreadyIsRegistered as alloy_sol_types::SolError>::SIGNATURE,
        ];
        /// Returns the signature for the given selector, if known.
        #[inline]
        pub fn signature_by_selector(
            selector: [u8; 4usize],
        ) -> ::core::option::Option<&'static str> {
            match Self::SELECTORS.binary_search(&selector) {
                ::core::result::Result::Ok(idx) => {
                    ::core::option::Option::Some(Self::SIGNATURES[idx])
                }
                ::core::result::Result::Err(_) => ::core::option::Option::None,
            }
        }
        /// Returns the enum variant name for the given selector, if known.
        #[inline]
        pub fn name_by_selector(
            selector: [u8; 4usize],
        ) -> ::core::option::Option<&'static str> {
            let sig = Self::signature_by_selector(selector)?;
            sig.split_once('(').map(|(name, _)| name)
        }
    }
    #[automatically_derived]
    impl alloy_sol_types::SolInterface for IOpNetVaultAutoDeployErrors {
        const NAME: &'static str = "IOpNetVaultAutoDeployErrors";
        const MIN_DATA_LENGTH: usize = 0usize;
        const COUNT: usize = 18usize;
        #[inline]
        fn selector(&self) -> [u8; 4] {
            match self {
                Self::OpNetVaultAutoDeploy_InvalidBurnerHook(_) => {
                    <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::SELECTOR
                }
                Self::OpNetVaultAutoDeploy_InvalidCollateral(_) => {
                    <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::SELECTOR
                }
                Self::OpNetVaultAutoDeploy_InvalidEpochDuration(_) => {
                    <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::SELECTOR
                }
                Self::OpNetVaultAutoDeploy_InvalidWithSlasher(_) => {
                    <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_InvalidOperator(_) => {
                    <VotingPowerProvider_InvalidOperator as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_InvalidOperatorVault(_) => {
                    <VotingPowerProvider_InvalidOperatorVault as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_InvalidSharedVault(_) => {
                    <VotingPowerProvider_InvalidSharedVault as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_InvalidSignature(_) => {
                    <VotingPowerProvider_InvalidSignature as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_InvalidToken(_) => {
                    <VotingPowerProvider_InvalidToken as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_InvalidVault(_) => {
                    <VotingPowerProvider_InvalidVault as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_OperatorAlreadyRegistered(_) => {
                    <VotingPowerProvider_OperatorAlreadyRegistered as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_OperatorNotRegistered(_) => {
                    <VotingPowerProvider_OperatorNotRegistered as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_OperatorVaultAlreadyIsRegistered(_) => {
                    <VotingPowerProvider_OperatorVaultAlreadyIsRegistered as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_OperatorVaultNotRegistered(_) => {
                    <VotingPowerProvider_OperatorVaultNotRegistered as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_SharedVaultAlreadyIsRegistered(_) => {
                    <VotingPowerProvider_SharedVaultAlreadyIsRegistered as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_SharedVaultNotRegistered(_) => {
                    <VotingPowerProvider_SharedVaultNotRegistered as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_TokenAlreadyIsRegistered(_) => {
                    <VotingPowerProvider_TokenAlreadyIsRegistered as alloy_sol_types::SolError>::SELECTOR
                }
                Self::VotingPowerProvider_TokenNotRegistered(_) => {
                    <VotingPowerProvider_TokenNotRegistered as alloy_sol_types::SolError>::SELECTOR
                }
            }
        }
        #[inline]
        fn selector_at(i: usize) -> ::core::option::Option<[u8; 4]> {
            Self::SELECTORS.get(i).copied()
        }
        #[inline]
        fn valid_selector(selector: [u8; 4]) -> bool {
            Self::SELECTORS.binary_search(&selector).is_ok()
        }
        #[inline]
        #[allow(non_snake_case)]
        fn abi_decode_raw(
            selector: [u8; 4],
            data: &[u8],
        ) -> alloy_sol_types::Result<Self> {
            static DECODE_SHIMS: &[fn(
                &[u8],
            ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors>] = &[
                {
                    fn OpNetVaultAutoDeploy_InvalidEpochDuration(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::OpNetVaultAutoDeploy_InvalidEpochDuration,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidEpochDuration
                },
                {
                    fn VotingPowerProvider_InvalidSharedVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidSharedVault as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidSharedVault,
                            )
                    }
                    VotingPowerProvider_InvalidSharedVault
                },
                {
                    fn VotingPowerProvider_InvalidOperatorVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidOperatorVault as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidOperatorVault,
                            )
                    }
                    VotingPowerProvider_InvalidOperatorVault
                },
                {
                    fn VotingPowerProvider_OperatorAlreadyRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_OperatorAlreadyRegistered as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_OperatorAlreadyRegistered,
                            )
                    }
                    VotingPowerProvider_OperatorAlreadyRegistered
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidBurnerHook(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::OpNetVaultAutoDeploy_InvalidBurnerHook,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidBurnerHook
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidCollateral(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::OpNetVaultAutoDeploy_InvalidCollateral,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidCollateral
                },
                {
                    fn VotingPowerProvider_OperatorVaultNotRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_OperatorVaultNotRegistered as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_OperatorVaultNotRegistered,
                            )
                    }
                    VotingPowerProvider_OperatorVaultNotRegistered
                },
                {
                    fn VotingPowerProvider_InvalidOperator(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidOperator as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidOperator,
                            )
                    }
                    VotingPowerProvider_InvalidOperator
                },
                {
                    fn VotingPowerProvider_OperatorNotRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_OperatorNotRegistered as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_OperatorNotRegistered,
                            )
                    }
                    VotingPowerProvider_OperatorNotRegistered
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidWithSlasher(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::OpNetVaultAutoDeploy_InvalidWithSlasher,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidWithSlasher
                },
                {
                    fn VotingPowerProvider_SharedVaultNotRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_SharedVaultNotRegistered as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_SharedVaultNotRegistered,
                            )
                    }
                    VotingPowerProvider_SharedVaultNotRegistered
                },
                {
                    fn VotingPowerProvider_InvalidToken(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidToken as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidToken,
                            )
                    }
                    VotingPowerProvider_InvalidToken
                },
                {
                    fn VotingPowerProvider_InvalidSignature(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidSignature as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidSignature,
                            )
                    }
                    VotingPowerProvider_InvalidSignature
                },
                {
                    fn VotingPowerProvider_InvalidVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidVault as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidVault,
                            )
                    }
                    VotingPowerProvider_InvalidVault
                },
                {
                    fn VotingPowerProvider_TokenAlreadyIsRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_TokenAlreadyIsRegistered as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_TokenAlreadyIsRegistered,
                            )
                    }
                    VotingPowerProvider_TokenAlreadyIsRegistered
                },
                {
                    fn VotingPowerProvider_OperatorVaultAlreadyIsRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_OperatorVaultAlreadyIsRegistered as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_OperatorVaultAlreadyIsRegistered,
                            )
                    }
                    VotingPowerProvider_OperatorVaultAlreadyIsRegistered
                },
                {
                    fn VotingPowerProvider_TokenNotRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_TokenNotRegistered as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_TokenNotRegistered,
                            )
                    }
                    VotingPowerProvider_TokenNotRegistered
                },
                {
                    fn VotingPowerProvider_SharedVaultAlreadyIsRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_SharedVaultAlreadyIsRegistered as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_SharedVaultAlreadyIsRegistered,
                            )
                    }
                    VotingPowerProvider_SharedVaultAlreadyIsRegistered
                },
            ];
            let Ok(idx) = Self::SELECTORS.binary_search(&selector) else {
                return Err(
                    alloy_sol_types::Error::unknown_selector(
                        <Self as alloy_sol_types::SolInterface>::NAME,
                        selector,
                    ),
                );
            };
            DECODE_SHIMS[idx](data)
        }
        #[inline]
        #[allow(non_snake_case)]
        fn abi_decode_raw_validate(
            selector: [u8; 4],
            data: &[u8],
        ) -> alloy_sol_types::Result<Self> {
            static DECODE_VALIDATE_SHIMS: &[fn(
                &[u8],
            ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors>] = &[
                {
                    fn OpNetVaultAutoDeploy_InvalidEpochDuration(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::OpNetVaultAutoDeploy_InvalidEpochDuration,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidEpochDuration
                },
                {
                    fn VotingPowerProvider_InvalidSharedVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidSharedVault as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidSharedVault,
                            )
                    }
                    VotingPowerProvider_InvalidSharedVault
                },
                {
                    fn VotingPowerProvider_InvalidOperatorVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidOperatorVault as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidOperatorVault,
                            )
                    }
                    VotingPowerProvider_InvalidOperatorVault
                },
                {
                    fn VotingPowerProvider_OperatorAlreadyRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_OperatorAlreadyRegistered as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_OperatorAlreadyRegistered,
                            )
                    }
                    VotingPowerProvider_OperatorAlreadyRegistered
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidBurnerHook(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::OpNetVaultAutoDeploy_InvalidBurnerHook,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidBurnerHook
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidCollateral(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::OpNetVaultAutoDeploy_InvalidCollateral,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidCollateral
                },
                {
                    fn VotingPowerProvider_OperatorVaultNotRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_OperatorVaultNotRegistered as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_OperatorVaultNotRegistered,
                            )
                    }
                    VotingPowerProvider_OperatorVaultNotRegistered
                },
                {
                    fn VotingPowerProvider_InvalidOperator(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidOperator as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidOperator,
                            )
                    }
                    VotingPowerProvider_InvalidOperator
                },
                {
                    fn VotingPowerProvider_OperatorNotRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_OperatorNotRegistered as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_OperatorNotRegistered,
                            )
                    }
                    VotingPowerProvider_OperatorNotRegistered
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidWithSlasher(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::OpNetVaultAutoDeploy_InvalidWithSlasher,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidWithSlasher
                },
                {
                    fn VotingPowerProvider_SharedVaultNotRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_SharedVaultNotRegistered as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_SharedVaultNotRegistered,
                            )
                    }
                    VotingPowerProvider_SharedVaultNotRegistered
                },
                {
                    fn VotingPowerProvider_InvalidToken(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidToken as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidToken,
                            )
                    }
                    VotingPowerProvider_InvalidToken
                },
                {
                    fn VotingPowerProvider_InvalidSignature(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidSignature as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidSignature,
                            )
                    }
                    VotingPowerProvider_InvalidSignature
                },
                {
                    fn VotingPowerProvider_InvalidVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_InvalidVault as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_InvalidVault,
                            )
                    }
                    VotingPowerProvider_InvalidVault
                },
                {
                    fn VotingPowerProvider_TokenAlreadyIsRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_TokenAlreadyIsRegistered as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_TokenAlreadyIsRegistered,
                            )
                    }
                    VotingPowerProvider_TokenAlreadyIsRegistered
                },
                {
                    fn VotingPowerProvider_OperatorVaultAlreadyIsRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_OperatorVaultAlreadyIsRegistered as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_OperatorVaultAlreadyIsRegistered,
                            )
                    }
                    VotingPowerProvider_OperatorVaultAlreadyIsRegistered
                },
                {
                    fn VotingPowerProvider_TokenNotRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_TokenNotRegistered as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_TokenNotRegistered,
                            )
                    }
                    VotingPowerProvider_TokenNotRegistered
                },
                {
                    fn VotingPowerProvider_SharedVaultAlreadyIsRegistered(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<IOpNetVaultAutoDeployErrors> {
                        <VotingPowerProvider_SharedVaultAlreadyIsRegistered as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                IOpNetVaultAutoDeployErrors::VotingPowerProvider_SharedVaultAlreadyIsRegistered,
                            )
                    }
                    VotingPowerProvider_SharedVaultAlreadyIsRegistered
                },
            ];
            let Ok(idx) = Self::SELECTORS.binary_search(&selector) else {
                return Err(
                    alloy_sol_types::Error::unknown_selector(
                        <Self as alloy_sol_types::SolInterface>::NAME,
                        selector,
                    ),
                );
            };
            DECODE_VALIDATE_SHIMS[idx](data)
        }
        #[inline]
        fn abi_encoded_size(&self) -> usize {
            match self {
                Self::OpNetVaultAutoDeploy_InvalidBurnerHook(inner) => {
                    <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::OpNetVaultAutoDeploy_InvalidCollateral(inner) => {
                    <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::OpNetVaultAutoDeploy_InvalidEpochDuration(inner) => {
                    <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::OpNetVaultAutoDeploy_InvalidWithSlasher(inner) => {
                    <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_InvalidOperator(inner) => {
                    <VotingPowerProvider_InvalidOperator as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_InvalidOperatorVault(inner) => {
                    <VotingPowerProvider_InvalidOperatorVault as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_InvalidSharedVault(inner) => {
                    <VotingPowerProvider_InvalidSharedVault as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_InvalidSignature(inner) => {
                    <VotingPowerProvider_InvalidSignature as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_InvalidToken(inner) => {
                    <VotingPowerProvider_InvalidToken as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_InvalidVault(inner) => {
                    <VotingPowerProvider_InvalidVault as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_OperatorAlreadyRegistered(inner) => {
                    <VotingPowerProvider_OperatorAlreadyRegistered as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_OperatorNotRegistered(inner) => {
                    <VotingPowerProvider_OperatorNotRegistered as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_OperatorVaultAlreadyIsRegistered(inner) => {
                    <VotingPowerProvider_OperatorVaultAlreadyIsRegistered as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_OperatorVaultNotRegistered(inner) => {
                    <VotingPowerProvider_OperatorVaultNotRegistered as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_SharedVaultAlreadyIsRegistered(inner) => {
                    <VotingPowerProvider_SharedVaultAlreadyIsRegistered as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_SharedVaultNotRegistered(inner) => {
                    <VotingPowerProvider_SharedVaultNotRegistered as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_TokenAlreadyIsRegistered(inner) => {
                    <VotingPowerProvider_TokenAlreadyIsRegistered as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
                Self::VotingPowerProvider_TokenNotRegistered(inner) => {
                    <VotingPowerProvider_TokenNotRegistered as alloy_sol_types::SolError>::abi_encoded_size(
                        inner,
                    )
                }
            }
        }
        #[inline]
        fn abi_encode_raw(&self, out: &mut alloy_sol_types::private::Vec<u8>) {
            match self {
                Self::OpNetVaultAutoDeploy_InvalidBurnerHook(inner) => {
                    <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::OpNetVaultAutoDeploy_InvalidCollateral(inner) => {
                    <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::OpNetVaultAutoDeploy_InvalidEpochDuration(inner) => {
                    <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::OpNetVaultAutoDeploy_InvalidWithSlasher(inner) => {
                    <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_InvalidOperator(inner) => {
                    <VotingPowerProvider_InvalidOperator as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_InvalidOperatorVault(inner) => {
                    <VotingPowerProvider_InvalidOperatorVault as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_InvalidSharedVault(inner) => {
                    <VotingPowerProvider_InvalidSharedVault as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_InvalidSignature(inner) => {
                    <VotingPowerProvider_InvalidSignature as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_InvalidToken(inner) => {
                    <VotingPowerProvider_InvalidToken as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_InvalidVault(inner) => {
                    <VotingPowerProvider_InvalidVault as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_OperatorAlreadyRegistered(inner) => {
                    <VotingPowerProvider_OperatorAlreadyRegistered as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_OperatorNotRegistered(inner) => {
                    <VotingPowerProvider_OperatorNotRegistered as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_OperatorVaultAlreadyIsRegistered(inner) => {
                    <VotingPowerProvider_OperatorVaultAlreadyIsRegistered as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_OperatorVaultNotRegistered(inner) => {
                    <VotingPowerProvider_OperatorVaultNotRegistered as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_SharedVaultAlreadyIsRegistered(inner) => {
                    <VotingPowerProvider_SharedVaultAlreadyIsRegistered as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_SharedVaultNotRegistered(inner) => {
                    <VotingPowerProvider_SharedVaultNotRegistered as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_TokenAlreadyIsRegistered(inner) => {
                    <VotingPowerProvider_TokenAlreadyIsRegistered as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::VotingPowerProvider_TokenNotRegistered(inner) => {
                    <VotingPowerProvider_TokenNotRegistered as alloy_sol_types::SolError>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
            }
        }
    }
    ///Container for all the [`IOpNetVaultAutoDeploy`](self) events.
    #[derive(Clone)]
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Debug, PartialEq, Eq, Hash)]
    pub enum IOpNetVaultAutoDeployEvents {
        #[allow(missing_docs)]
        RegisterOperator(RegisterOperator),
        #[allow(missing_docs)]
        RegisterOperatorVault(RegisterOperatorVault),
        #[allow(missing_docs)]
        RegisterSharedVault(RegisterSharedVault),
        #[allow(missing_docs)]
        RegisterToken(RegisterToken),
        #[allow(missing_docs)]
        SetAutoDeployConfig(SetAutoDeployConfig),
        #[allow(missing_docs)]
        SetAutoDeployStatus(SetAutoDeployStatus),
        #[allow(missing_docs)]
        SetSetMaxNetworkLimitHookStatus(SetSetMaxNetworkLimitHookStatus),
        #[allow(missing_docs)]
        SetSlashingData(SetSlashingData),
        #[allow(missing_docs)]
        UnregisterOperator(UnregisterOperator),
        #[allow(missing_docs)]
        UnregisterOperatorVault(UnregisterOperatorVault),
        #[allow(missing_docs)]
        UnregisterSharedVault(UnregisterSharedVault),
        #[allow(missing_docs)]
        UnregisterToken(UnregisterToken),
    }
    impl IOpNetVaultAutoDeployEvents {
        /// All the selectors of this enum.
        ///
        /// Note that the selectors might not be in the same order as the variants.
        /// No guarantees are made about the order of the selectors.
        ///
        /// Prefer using `SolInterface` methods instead.
        pub const SELECTORS: &'static [[u8; 32usize]] = &[
            [
                52u8, 85u8, 182u8, 18u8, 134u8, 117u8, 239u8, 248u8, 67u8, 112u8, 48u8,
                39u8, 135u8, 156u8, 201u8, 181u8, 45u8, 108u8, 230u8, 132u8, 221u8,
                198u8, 7u8, 124u8, 190u8, 13u8, 25u8, 26u8, 217u8, 139u8, 37u8, 94u8,
            ],
            [
                109u8, 184u8, 209u8, 173u8, 121u8, 3u8, 50u8, 146u8, 80u8, 219u8, 155u8,
                122u8, 101u8, 61u8, 58u8, 160u8, 9u8, 128u8, 124u8, 133u8, 218u8, 162u8,
                40u8, 26u8, 117u8, 224u8, 99u8, 128u8, 139u8, 206u8, 239u8, 220u8,
            ],
            [
                119u8, 228u8, 125u8, 161u8, 246u8, 2u8, 81u8, 134u8, 176u8, 10u8, 218u8,
                229u8, 53u8, 31u8, 98u8, 62u8, 186u8, 26u8, 181u8, 21u8, 31u8, 125u8,
                21u8, 188u8, 68u8, 198u8, 163u8, 155u8, 232u8, 110u8, 108u8, 5u8,
            ],
            [
                137u8, 81u8, 196u8, 109u8, 137u8, 87u8, 224u8, 7u8, 196u8, 244u8, 34u8,
                46u8, 118u8, 142u8, 232u8, 229u8, 155u8, 179u8, 103u8, 182u8, 199u8,
                37u8, 105u8, 233u8, 46u8, 51u8, 122u8, 91u8, 25u8, 75u8, 240u8, 77u8,
            ],
            [
                139u8, 215u8, 27u8, 185u8, 40u8, 113u8, 199u8, 203u8, 101u8, 212u8,
                186u8, 117u8, 84u8, 218u8, 222u8, 176u8, 42u8, 188u8, 244u8, 217u8,
                233u8, 154u8, 255u8, 131u8, 103u8, 113u8, 76u8, 90u8, 21u8, 189u8, 1u8,
                156u8,
            ],
            [
                153u8, 82u8, 128u8, 101u8, 230u8, 84u8, 214u8, 212u8, 185u8, 84u8, 71u8,
                214u8, 120u8, 113u8, 72u8, 168u8, 75u8, 126u8, 152u8, 169u8, 94u8, 117u8,
                39u8, 132u8, 233u8, 157u8, 160u8, 86u8, 180u8, 3u8, 178u8, 92u8,
            ],
            [
                202u8, 42u8, 137u8, 9u8, 57u8, 39u8, 98u8, 35u8, 169u8, 18u8, 34u8, 23u8,
                117u8, 44u8, 103u8, 96u8, 132u8, 102u8, 250u8, 238u8, 56u8, 138u8, 255u8,
                83u8, 240u8, 119u8, 208u8, 10u8, 24u8, 106u8, 56u8, 155u8,
            ],
            [
                209u8, 180u8, 141u8, 30u8, 73u8, 136u8, 82u8, 152u8, 175u8, 93u8, 200u8,
                173u8, 199u8, 119u8, 120u8, 54u8, 239u8, 128u8, 75u8, 56u8, 175u8, 136u8,
                234u8, 191u8, 78u8, 7u8, 156u8, 4u8, 238u8, 21u8, 56u8, 167u8,
            ],
            [
                223u8, 217u8, 224u8, 57u8, 41u8, 18u8, 190u8, 233u8, 119u8, 119u8, 236u8,
                88u8, 141u8, 47u8, 247u8, 174u8, 1u8, 14u8, 162u8, 66u8, 2u8, 209u8,
                83u8, 160u8, 191u8, 241u8, 179u8, 10u8, 237u8, 100u8, 61u8, 170u8,
            ],
            [
                234u8, 216u8, 63u8, 132u8, 130u8, 208u8, 250u8, 93u8, 226u8, 181u8,
                194u8, 143u8, 179u8, 158u8, 226u8, 136u8, 57u8, 32u8, 118u8, 209u8, 80u8,
                219u8, 112u8, 32u8, 225u8, 10u8, 146u8, 149u8, 74u8, 234u8, 130u8, 238u8,
            ],
            [
                247u8, 254u8, 128u8, 35u8, 203u8, 46u8, 54u8, 189u8, 225u8, 213u8, 154u8,
                136u8, 172u8, 87u8, 99u8, 168u8, 193u8, 27u8, 230u8, 210u8, 94u8, 104u8,
                25u8, 247u8, 27u8, 183u8, 226u8, 62u8, 91u8, 240u8, 220u8, 22u8,
            ],
            [
                250u8, 49u8, 193u8, 185u8, 126u8, 217u8, 101u8, 50u8, 48u8, 25u8, 73u8,
                229u8, 253u8, 52u8, 210u8, 224u8, 89u8, 80u8, 11u8, 13u8, 229u8, 153u8,
                25u8, 82u8, 69u8, 221u8, 248u8, 251u8, 251u8, 179u8, 109u8, 176u8,
            ],
        ];
        /// The names of the variants in the same order as `SELECTORS`.
        pub const VARIANT_NAMES: &'static [&'static str] = &[
            ::core::stringify!(UnregisterOperatorVault),
            ::core::stringify!(RegisterOperatorVault),
            ::core::stringify!(SetAutoDeployConfig),
            ::core::stringify!(SetAutoDeployStatus),
            ::core::stringify!(SetSetMaxNetworkLimitHookStatus),
            ::core::stringify!(RegisterSharedVault),
            ::core::stringify!(UnregisterToken),
            ::core::stringify!(UnregisterOperator),
            ::core::stringify!(RegisterOperator),
            ::core::stringify!(UnregisterSharedVault),
            ::core::stringify!(RegisterToken),
            ::core::stringify!(SetSlashingData),
        ];
        /// The signatures in the same order as `SELECTORS`.
        pub const SIGNATURES: &'static [&'static str] = &[
            <UnregisterOperatorVault as alloy_sol_types::SolEvent>::SIGNATURE,
            <RegisterOperatorVault as alloy_sol_types::SolEvent>::SIGNATURE,
            <SetAutoDeployConfig as alloy_sol_types::SolEvent>::SIGNATURE,
            <SetAutoDeployStatus as alloy_sol_types::SolEvent>::SIGNATURE,
            <SetSetMaxNetworkLimitHookStatus as alloy_sol_types::SolEvent>::SIGNATURE,
            <RegisterSharedVault as alloy_sol_types::SolEvent>::SIGNATURE,
            <UnregisterToken as alloy_sol_types::SolEvent>::SIGNATURE,
            <UnregisterOperator as alloy_sol_types::SolEvent>::SIGNATURE,
            <RegisterOperator as alloy_sol_types::SolEvent>::SIGNATURE,
            <UnregisterSharedVault as alloy_sol_types::SolEvent>::SIGNATURE,
            <RegisterToken as alloy_sol_types::SolEvent>::SIGNATURE,
            <SetSlashingData as alloy_sol_types::SolEvent>::SIGNATURE,
        ];
        /// Returns the signature for the given selector, if known.
        #[inline]
        pub fn signature_by_selector(
            selector: [u8; 32usize],
        ) -> ::core::option::Option<&'static str> {
            match Self::SELECTORS.binary_search(&selector) {
                ::core::result::Result::Ok(idx) => {
                    ::core::option::Option::Some(Self::SIGNATURES[idx])
                }
                ::core::result::Result::Err(_) => ::core::option::Option::None,
            }
        }
        /// Returns the enum variant name for the given selector, if known.
        #[inline]
        pub fn name_by_selector(
            selector: [u8; 32usize],
        ) -> ::core::option::Option<&'static str> {
            let sig = Self::signature_by_selector(selector)?;
            sig.split_once('(').map(|(name, _)| name)
        }
    }
    #[automatically_derived]
    impl alloy_sol_types::SolEventInterface for IOpNetVaultAutoDeployEvents {
        const NAME: &'static str = "IOpNetVaultAutoDeployEvents";
        const COUNT: usize = 12usize;
        fn decode_raw_log(
            topics: &[alloy_sol_types::Word],
            data: &[u8],
        ) -> alloy_sol_types::Result<Self> {
            match topics.first().copied() {
                Some(<RegisterOperator as alloy_sol_types::SolEvent>::SIGNATURE_HASH) => {
                    <RegisterOperator as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::RegisterOperator)
                }
                Some(
                    <RegisterOperatorVault as alloy_sol_types::SolEvent>::SIGNATURE_HASH,
                ) => {
                    <RegisterOperatorVault as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::RegisterOperatorVault)
                }
                Some(
                    <RegisterSharedVault as alloy_sol_types::SolEvent>::SIGNATURE_HASH,
                ) => {
                    <RegisterSharedVault as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::RegisterSharedVault)
                }
                Some(<RegisterToken as alloy_sol_types::SolEvent>::SIGNATURE_HASH) => {
                    <RegisterToken as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::RegisterToken)
                }
                Some(
                    <SetAutoDeployConfig as alloy_sol_types::SolEvent>::SIGNATURE_HASH,
                ) => {
                    <SetAutoDeployConfig as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::SetAutoDeployConfig)
                }
                Some(
                    <SetAutoDeployStatus as alloy_sol_types::SolEvent>::SIGNATURE_HASH,
                ) => {
                    <SetAutoDeployStatus as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::SetAutoDeployStatus)
                }
                Some(
                    <SetSetMaxNetworkLimitHookStatus as alloy_sol_types::SolEvent>::SIGNATURE_HASH,
                ) => {
                    <SetSetMaxNetworkLimitHookStatus as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::SetSetMaxNetworkLimitHookStatus)
                }
                Some(<SetSlashingData as alloy_sol_types::SolEvent>::SIGNATURE_HASH) => {
                    <SetSlashingData as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::SetSlashingData)
                }
                Some(
                    <UnregisterOperator as alloy_sol_types::SolEvent>::SIGNATURE_HASH,
                ) => {
                    <UnregisterOperator as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::UnregisterOperator)
                }
                Some(
                    <UnregisterOperatorVault as alloy_sol_types::SolEvent>::SIGNATURE_HASH,
                ) => {
                    <UnregisterOperatorVault as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::UnregisterOperatorVault)
                }
                Some(
                    <UnregisterSharedVault as alloy_sol_types::SolEvent>::SIGNATURE_HASH,
                ) => {
                    <UnregisterSharedVault as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::UnregisterSharedVault)
                }
                Some(<UnregisterToken as alloy_sol_types::SolEvent>::SIGNATURE_HASH) => {
                    <UnregisterToken as alloy_sol_types::SolEvent>::decode_raw_log(
                            topics,
                            data,
                        )
                        .map(Self::UnregisterToken)
                }
                _ => {
                    alloy_sol_types::private::Err(alloy_sol_types::Error::InvalidLog {
                        name: <Self as alloy_sol_types::SolEventInterface>::NAME,
                        log: alloy_sol_types::private::Box::new(
                            alloy_sol_types::private::LogData::new_unchecked(
                                topics.to_vec(),
                                data.to_vec().into(),
                            ),
                        ),
                    })
                }
            }
        }
    }
    #[automatically_derived]
    impl alloy_sol_types::private::IntoLogData for IOpNetVaultAutoDeployEvents {
        fn to_log_data(&self) -> alloy_sol_types::private::LogData {
            match self {
                Self::RegisterOperator(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::RegisterOperatorVault(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::RegisterSharedVault(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::RegisterToken(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::SetAutoDeployConfig(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::SetAutoDeployStatus(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::SetSetMaxNetworkLimitHookStatus(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::SetSlashingData(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::UnregisterOperator(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::UnregisterOperatorVault(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::UnregisterSharedVault(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::UnregisterToken(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
            }
        }
        fn into_log_data(self) -> alloy_sol_types::private::LogData {
            match self {
                Self::RegisterOperator(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::RegisterOperatorVault(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::RegisterSharedVault(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::RegisterToken(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::SetAutoDeployConfig(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::SetAutoDeployStatus(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::SetSetMaxNetworkLimitHookStatus(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::SetSlashingData(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::UnregisterOperator(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::UnregisterOperatorVault(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::UnregisterSharedVault(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::UnregisterToken(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
            }
        }
    }
    use alloy::contract as alloy_contract;
    /**Creates a new wrapper around an on-chain [`IOpNetVaultAutoDeploy`](self) contract instance.

See the [wrapper's documentation](`IOpNetVaultAutoDeployInstance`) for more details.*/
    #[inline]
    pub const fn new<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    >(
        address: alloy_sol_types::private::Address,
        __provider: P,
    ) -> IOpNetVaultAutoDeployInstance<P, N> {
        IOpNetVaultAutoDeployInstance::<P, N>::new(address, __provider)
    }
    /**A [`IOpNetVaultAutoDeploy`](self) instance.

Contains type-safe methods for interacting with an on-chain instance of the
[`IOpNetVaultAutoDeploy`](self) contract located at a given `address`, using a given
provider `P`.

If the contract bytecode is available (see the [`sol!`](alloy_sol_types::sol!)
documentation on how to provide it), the `deploy` and `deploy_builder` methods can
be used to deploy a new instance of the contract.

See the [module-level documentation](self) for all the available methods.*/
    #[derive(Clone)]
    pub struct IOpNetVaultAutoDeployInstance<P, N = alloy_contract::private::Ethereum> {
        address: alloy_sol_types::private::Address,
        provider: P,
        _network: ::core::marker::PhantomData<N>,
    }
    #[automatically_derived]
    impl<P, N> ::core::fmt::Debug for IOpNetVaultAutoDeployInstance<P, N> {
        #[inline]
        fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
            f.debug_tuple("IOpNetVaultAutoDeployInstance").field(&self.address).finish()
        }
    }
    /// Instantiation and getters/setters.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > IOpNetVaultAutoDeployInstance<P, N> {
        /**Creates a new wrapper around an on-chain [`IOpNetVaultAutoDeploy`](self) contract instance.

See the [wrapper's documentation](`IOpNetVaultAutoDeployInstance`) for more details.*/
        #[inline]
        pub const fn new(
            address: alloy_sol_types::private::Address,
            __provider: P,
        ) -> Self {
            Self {
                address,
                provider: __provider,
                _network: ::core::marker::PhantomData,
            }
        }
        /// Returns a reference to the address.
        #[inline]
        pub const fn address(&self) -> &alloy_sol_types::private::Address {
            &self.address
        }
        /// Sets the address.
        #[inline]
        pub fn set_address(&mut self, address: alloy_sol_types::private::Address) {
            self.address = address;
        }
        /// Sets the address and returns `self`.
        pub fn at(mut self, address: alloy_sol_types::private::Address) -> Self {
            self.set_address(address);
            self
        }
        /// Returns a reference to the provider.
        #[inline]
        pub const fn provider(&self) -> &P {
            &self.provider
        }
    }
    impl<P: ::core::clone::Clone, N> IOpNetVaultAutoDeployInstance<&P, N> {
        /// Clones the provider and returns a new instance with the cloned provider.
        #[inline]
        pub fn with_cloned_provider(self) -> IOpNetVaultAutoDeployInstance<P, N> {
            IOpNetVaultAutoDeployInstance {
                address: self.address,
                provider: ::core::clone::Clone::clone(&self.provider),
                _network: ::core::marker::PhantomData,
            }
        }
    }
    /// Function calls.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > IOpNetVaultAutoDeployInstance<P, N> {
        /// Creates a new call builder using this contract instance's provider and address.
        ///
        /// Note that the call can be any function call, not just those defined in this
        /// contract. Prefer using the other methods for building type-safe contract calls.
        pub fn call_builder<C: alloy_sol_types::SolCall>(
            &self,
            call: &C,
        ) -> alloy_contract::SolCallBuilder<&P, C, N> {
            alloy_contract::SolCallBuilder::new_sol(&self.provider, &self.address, call)
        }
        ///Creates a new call builder for the [`OPERATOR_REGISTRY`] function.
        pub fn OPERATOR_REGISTRY(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, OPERATOR_REGISTRYCall, N> {
            self.call_builder(&OPERATOR_REGISTRYCall)
        }
        ///Creates a new call builder for the [`VAULT_CONFIGURATOR`] function.
        pub fn VAULT_CONFIGURATOR(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, VAULT_CONFIGURATORCall, N> {
            self.call_builder(&VAULT_CONFIGURATORCall)
        }
        ///Creates a new call builder for the [`VAULT_FACTORY`] function.
        pub fn VAULT_FACTORY(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, VAULT_FACTORYCall, N> {
            self.call_builder(&VAULT_FACTORYCall)
        }
        ///Creates a new call builder for the [`getAutoDeployConfig`] function.
        pub fn getAutoDeployConfig(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, getAutoDeployConfigCall, N> {
            self.call_builder(&getAutoDeployConfigCall)
        }
        ///Creates a new call builder for the [`getAutoDeployedVault`] function.
        pub fn getAutoDeployedVault(
            &self,
            operator: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, getAutoDeployedVaultCall, N> {
            self.call_builder(
                &getAutoDeployedVaultCall {
                    operator,
                },
            )
        }
        ///Creates a new call builder for the [`getOperatorStakes`] function.
        pub fn getOperatorStakes(
            &self,
            operator: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, getOperatorStakesCall, N> {
            self.call_builder(&getOperatorStakesCall { operator })
        }
        ///Creates a new call builder for the [`getOperatorStakesAt`] function.
        pub fn getOperatorStakesAt(
            &self,
            operator: alloy::sol_types::private::Address,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, getOperatorStakesAtCall, N> {
            self.call_builder(
                &getOperatorStakesAtCall {
                    operator,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`getOperatorVaults`] function.
        pub fn getOperatorVaults(
            &self,
            operator: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, getOperatorVaultsCall, N> {
            self.call_builder(&getOperatorVaultsCall { operator })
        }
        ///Creates a new call builder for the [`getOperatorVaultsAt`] function.
        pub fn getOperatorVaultsAt(
            &self,
            operator: alloy::sol_types::private::Address,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, getOperatorVaultsAtCall, N> {
            self.call_builder(
                &getOperatorVaultsAtCall {
                    operator,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`getOperatorVotingPowers`] function.
        pub fn getOperatorVotingPowers(
            &self,
            operator: alloy::sol_types::private::Address,
            extraData: alloy::sol_types::private::Bytes,
        ) -> alloy_contract::SolCallBuilder<&P, getOperatorVotingPowersCall, N> {
            self.call_builder(
                &getOperatorVotingPowersCall {
                    operator,
                    extraData,
                },
            )
        }
        ///Creates a new call builder for the [`getOperatorVotingPowersAt`] function.
        pub fn getOperatorVotingPowersAt(
            &self,
            operator: alloy::sol_types::private::Address,
            extraData: alloy::sol_types::private::Bytes,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, getOperatorVotingPowersAtCall, N> {
            self.call_builder(
                &getOperatorVotingPowersAtCall {
                    operator,
                    extraData,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`getOperators`] function.
        pub fn getOperators(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, getOperatorsCall, N> {
            self.call_builder(&getOperatorsCall)
        }
        ///Creates a new call builder for the [`getOperatorsAt`] function.
        pub fn getOperatorsAt(
            &self,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, getOperatorsAtCall, N> {
            self.call_builder(&getOperatorsAtCall { timestamp })
        }
        ///Creates a new call builder for the [`getSharedVaults`] function.
        pub fn getSharedVaults(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, getSharedVaultsCall, N> {
            self.call_builder(&getSharedVaultsCall)
        }
        ///Creates a new call builder for the [`getSharedVaultsAt`] function.
        pub fn getSharedVaultsAt(
            &self,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, getSharedVaultsAtCall, N> {
            self.call_builder(&getSharedVaultsAtCall { timestamp })
        }
        ///Creates a new call builder for the [`getSlashingData`] function.
        pub fn getSlashingData(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, getSlashingDataCall, N> {
            self.call_builder(&getSlashingDataCall)
        }
        ///Creates a new call builder for the [`getSlashingDataAt`] function.
        pub fn getSlashingDataAt(
            &self,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
            hint: alloy::sol_types::private::Bytes,
        ) -> alloy_contract::SolCallBuilder<&P, getSlashingDataAtCall, N> {
            self.call_builder(
                &getSlashingDataAtCall {
                    timestamp,
                    hint,
                },
            )
        }
        ///Creates a new call builder for the [`getTokens`] function.
        pub fn getTokens(&self) -> alloy_contract::SolCallBuilder<&P, getTokensCall, N> {
            self.call_builder(&getTokensCall)
        }
        ///Creates a new call builder for the [`getTokensAt`] function.
        pub fn getTokensAt(
            &self,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, getTokensAtCall, N> {
            self.call_builder(&getTokensAtCall { timestamp })
        }
        ///Creates a new call builder for the [`getVotingPowers`] function.
        pub fn getVotingPowers(
            &self,
            extraData: alloy::sol_types::private::Vec<alloy::sol_types::private::Bytes>,
        ) -> alloy_contract::SolCallBuilder<&P, getVotingPowersCall, N> {
            self.call_builder(&getVotingPowersCall { extraData })
        }
        ///Creates a new call builder for the [`getVotingPowersAt`] function.
        pub fn getVotingPowersAt(
            &self,
            extraData: alloy::sol_types::private::Vec<alloy::sol_types::private::Bytes>,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, getVotingPowersAtCall, N> {
            self.call_builder(
                &getVotingPowersAtCall {
                    extraData,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`invalidateOldSignatures`] function.
        pub fn invalidateOldSignatures(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, invalidateOldSignaturesCall, N> {
            self.call_builder(&invalidateOldSignaturesCall)
        }
        ///Creates a new call builder for the [`isAutoDeployEnabled`] function.
        pub fn isAutoDeployEnabled(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, isAutoDeployEnabledCall, N> {
            self.call_builder(&isAutoDeployEnabledCall)
        }
        ///Creates a new call builder for the [`isOperatorRegistered`] function.
        pub fn isOperatorRegistered(
            &self,
            operator: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, isOperatorRegisteredCall, N> {
            self.call_builder(
                &isOperatorRegisteredCall {
                    operator,
                },
            )
        }
        ///Creates a new call builder for the [`isOperatorRegisteredAt`] function.
        pub fn isOperatorRegisteredAt(
            &self,
            operator: alloy::sol_types::private::Address,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, isOperatorRegisteredAtCall, N> {
            self.call_builder(
                &isOperatorRegisteredAtCall {
                    operator,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`isOperatorVaultRegistered_0`] function.
        pub fn isOperatorVaultRegistered_0(
            &self,
            vault: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, isOperatorVaultRegistered_0Call, N> {
            self.call_builder(
                &isOperatorVaultRegistered_0Call {
                    vault,
                },
            )
        }
        ///Creates a new call builder for the [`isOperatorVaultRegistered_1`] function.
        pub fn isOperatorVaultRegistered_1(
            &self,
            operator: alloy::sol_types::private::Address,
            vault: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, isOperatorVaultRegistered_1Call, N> {
            self.call_builder(
                &isOperatorVaultRegistered_1Call {
                    operator,
                    vault,
                },
            )
        }
        ///Creates a new call builder for the [`isOperatorVaultRegisteredAt_0`] function.
        pub fn isOperatorVaultRegisteredAt_0(
            &self,
            operator: alloy::sol_types::private::Address,
            vault: alloy::sol_types::private::Address,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, isOperatorVaultRegisteredAt_0Call, N> {
            self.call_builder(
                &isOperatorVaultRegisteredAt_0Call {
                    operator,
                    vault,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`isOperatorVaultRegisteredAt_1`] function.
        pub fn isOperatorVaultRegisteredAt_1(
            &self,
            vault: alloy::sol_types::private::Address,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, isOperatorVaultRegisteredAt_1Call, N> {
            self.call_builder(
                &isOperatorVaultRegisteredAt_1Call {
                    vault,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`isSetMaxNetworkLimitHookEnabled`] function.
        pub fn isSetMaxNetworkLimitHookEnabled(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, isSetMaxNetworkLimitHookEnabledCall, N> {
            self.call_builder(&isSetMaxNetworkLimitHookEnabledCall)
        }
        ///Creates a new call builder for the [`isSharedVaultRegistered`] function.
        pub fn isSharedVaultRegistered(
            &self,
            vault: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, isSharedVaultRegisteredCall, N> {
            self.call_builder(
                &isSharedVaultRegisteredCall {
                    vault,
                },
            )
        }
        ///Creates a new call builder for the [`isSharedVaultRegisteredAt`] function.
        pub fn isSharedVaultRegisteredAt(
            &self,
            vault: alloy::sol_types::private::Address,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, isSharedVaultRegisteredAtCall, N> {
            self.call_builder(
                &isSharedVaultRegisteredAtCall {
                    vault,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`isTokenRegistered`] function.
        pub fn isTokenRegistered(
            &self,
            token: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, isTokenRegisteredCall, N> {
            self.call_builder(&isTokenRegisteredCall { token })
        }
        ///Creates a new call builder for the [`isTokenRegisteredAt`] function.
        pub fn isTokenRegisteredAt(
            &self,
            token: alloy::sol_types::private::Address,
            timestamp: alloy::sol_types::private::primitives::aliases::U48,
        ) -> alloy_contract::SolCallBuilder<&P, isTokenRegisteredAtCall, N> {
            self.call_builder(
                &isTokenRegisteredAtCall {
                    token,
                    timestamp,
                },
            )
        }
        ///Creates a new call builder for the [`registerOperator`] function.
        pub fn registerOperator(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, registerOperatorCall, N> {
            self.call_builder(&registerOperatorCall)
        }
        ///Creates a new call builder for the [`registerOperatorWithSignature`] function.
        pub fn registerOperatorWithSignature(
            &self,
            operator: alloy::sol_types::private::Address,
            signature: alloy::sol_types::private::Bytes,
        ) -> alloy_contract::SolCallBuilder<&P, registerOperatorWithSignatureCall, N> {
            self.call_builder(
                &registerOperatorWithSignatureCall {
                    operator,
                    signature,
                },
            )
        }
        ///Creates a new call builder for the [`setAutoDeployConfig`] function.
        pub fn setAutoDeployConfig(
            &self,
            config: <AutoDeployConfig as alloy::sol_types::SolType>::RustType,
        ) -> alloy_contract::SolCallBuilder<&P, setAutoDeployConfigCall, N> {
            self.call_builder(&setAutoDeployConfigCall { config })
        }
        ///Creates a new call builder for the [`setAutoDeployStatus`] function.
        pub fn setAutoDeployStatus(
            &self,
            status: bool,
        ) -> alloy_contract::SolCallBuilder<&P, setAutoDeployStatusCall, N> {
            self.call_builder(&setAutoDeployStatusCall { status })
        }
        ///Creates a new call builder for the [`setSetMaxNetworkLimitHookStatus`] function.
        pub fn setSetMaxNetworkLimitHookStatus(
            &self,
            status: bool,
        ) -> alloy_contract::SolCallBuilder<&P, setSetMaxNetworkLimitHookStatusCall, N> {
            self.call_builder(
                &setSetMaxNetworkLimitHookStatusCall {
                    status,
                },
            )
        }
        ///Creates a new call builder for the [`unregisterOperator`] function.
        pub fn unregisterOperator(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, unregisterOperatorCall, N> {
            self.call_builder(&unregisterOperatorCall)
        }
        ///Creates a new call builder for the [`unregisterOperatorWithSignature`] function.
        pub fn unregisterOperatorWithSignature(
            &self,
            operator: alloy::sol_types::private::Address,
            signature: alloy::sol_types::private::Bytes,
        ) -> alloy_contract::SolCallBuilder<&P, unregisterOperatorWithSignatureCall, N> {
            self.call_builder(
                &unregisterOperatorWithSignatureCall {
                    operator,
                    signature,
                },
            )
        }
    }
    /// Event filters.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > IOpNetVaultAutoDeployInstance<P, N> {
        /// Creates a new event filter using this contract instance's provider and address.
        ///
        /// Note that the type can be any event, not just those defined in this contract.
        /// Prefer using the other methods for building type-safe event filters.
        pub fn event_filter<E: alloy_sol_types::SolEvent>(
            &self,
        ) -> alloy_contract::Event<&P, E, N> {
            alloy_contract::Event::new_sol(&self.provider, &self.address)
        }
        ///Creates a new event filter for the [`RegisterOperator`] event.
        pub fn RegisterOperator_filter(
            &self,
        ) -> alloy_contract::Event<&P, RegisterOperator, N> {
            self.event_filter::<RegisterOperator>()
        }
        ///Creates a new event filter for the [`RegisterOperatorVault`] event.
        pub fn RegisterOperatorVault_filter(
            &self,
        ) -> alloy_contract::Event<&P, RegisterOperatorVault, N> {
            self.event_filter::<RegisterOperatorVault>()
        }
        ///Creates a new event filter for the [`RegisterSharedVault`] event.
        pub fn RegisterSharedVault_filter(
            &self,
        ) -> alloy_contract::Event<&P, RegisterSharedVault, N> {
            self.event_filter::<RegisterSharedVault>()
        }
        ///Creates a new event filter for the [`RegisterToken`] event.
        pub fn RegisterToken_filter(
            &self,
        ) -> alloy_contract::Event<&P, RegisterToken, N> {
            self.event_filter::<RegisterToken>()
        }
        ///Creates a new event filter for the [`SetAutoDeployConfig`] event.
        pub fn SetAutoDeployConfig_filter(
            &self,
        ) -> alloy_contract::Event<&P, SetAutoDeployConfig, N> {
            self.event_filter::<SetAutoDeployConfig>()
        }
        ///Creates a new event filter for the [`SetAutoDeployStatus`] event.
        pub fn SetAutoDeployStatus_filter(
            &self,
        ) -> alloy_contract::Event<&P, SetAutoDeployStatus, N> {
            self.event_filter::<SetAutoDeployStatus>()
        }
        ///Creates a new event filter for the [`SetSetMaxNetworkLimitHookStatus`] event.
        pub fn SetSetMaxNetworkLimitHookStatus_filter(
            &self,
        ) -> alloy_contract::Event<&P, SetSetMaxNetworkLimitHookStatus, N> {
            self.event_filter::<SetSetMaxNetworkLimitHookStatus>()
        }
        ///Creates a new event filter for the [`SetSlashingData`] event.
        pub fn SetSlashingData_filter(
            &self,
        ) -> alloy_contract::Event<&P, SetSlashingData, N> {
            self.event_filter::<SetSlashingData>()
        }
        ///Creates a new event filter for the [`UnregisterOperator`] event.
        pub fn UnregisterOperator_filter(
            &self,
        ) -> alloy_contract::Event<&P, UnregisterOperator, N> {
            self.event_filter::<UnregisterOperator>()
        }
        ///Creates a new event filter for the [`UnregisterOperatorVault`] event.
        pub fn UnregisterOperatorVault_filter(
            &self,
        ) -> alloy_contract::Event<&P, UnregisterOperatorVault, N> {
            self.event_filter::<UnregisterOperatorVault>()
        }
        ///Creates a new event filter for the [`UnregisterSharedVault`] event.
        pub fn UnregisterSharedVault_filter(
            &self,
        ) -> alloy_contract::Event<&P, UnregisterSharedVault, N> {
            self.event_filter::<UnregisterSharedVault>()
        }
        ///Creates a new event filter for the [`UnregisterToken`] event.
        pub fn UnregisterToken_filter(
            &self,
        ) -> alloy_contract::Event<&P, UnregisterToken, N> {
            self.event_filter::<UnregisterToken>()
        }
    }
}
