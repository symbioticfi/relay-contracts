///Module containing a contract's types and functions.
/**

```solidity
library IOpNetVaultAutoDeploy {
    struct AutoDeployConfig { uint48 epochDuration; address collateral; address burner; bool withSlasher; bool isBurnerHook; }
}
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
    }
}
///Module containing a contract's types and functions.
/**

```solidity
library IVault {
    struct InitParams { address collateral; address burner; uint48 epochDuration; bool depositWhitelist; bool isDepositLimit; uint256 depositLimit; address defaultAdminRoleHolder; address depositWhitelistSetRoleHolder; address depositorWhitelistRoleHolder; address isDepositLimitSetRoleHolder; address depositLimitSetRoleHolder; }
}
```*/
#[allow(
    non_camel_case_types,
    non_snake_case,
    clippy::pub_underscore_fields,
    clippy::style,
    clippy::empty_structs_with_brackets
)]
pub mod IVault {
    use super::*;
    use alloy::sol_types as alloy_sol_types;
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    /**```solidity
struct InitParams { address collateral; address burner; uint48 epochDuration; bool depositWhitelist; bool isDepositLimit; uint256 depositLimit; address defaultAdminRoleHolder; address depositWhitelistSetRoleHolder; address depositorWhitelistRoleHolder; address isDepositLimitSetRoleHolder; address depositLimitSetRoleHolder; }
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct InitParams {
        #[allow(missing_docs)]
        pub collateral: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub burner: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub epochDuration: alloy::sol_types::private::primitives::aliases::U48,
        #[allow(missing_docs)]
        pub depositWhitelist: bool,
        #[allow(missing_docs)]
        pub isDepositLimit: bool,
        #[allow(missing_docs)]
        pub depositLimit: alloy::sol_types::private::primitives::aliases::U256,
        #[allow(missing_docs)]
        pub defaultAdminRoleHolder: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub depositWhitelistSetRoleHolder: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub depositorWhitelistRoleHolder: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub isDepositLimitSetRoleHolder: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub depositLimitSetRoleHolder: alloy::sol_types::private::Address,
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
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Uint<48>,
            alloy::sol_types::sol_data::Bool,
            alloy::sol_types::sol_data::Bool,
            alloy::sol_types::sol_data::Uint<256>,
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Address,
            alloy::sol_types::sol_data::Address,
        );
        #[doc(hidden)]
        type UnderlyingRustTuple<'a> = (
            alloy::sol_types::private::Address,
            alloy::sol_types::private::Address,
            alloy::sol_types::private::primitives::aliases::U48,
            bool,
            bool,
            alloy::sol_types::private::primitives::aliases::U256,
            alloy::sol_types::private::Address,
            alloy::sol_types::private::Address,
            alloy::sol_types::private::Address,
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
        impl ::core::convert::From<InitParams> for UnderlyingRustTuple<'_> {
            fn from(value: InitParams) -> Self {
                (
                    value.collateral,
                    value.burner,
                    value.epochDuration,
                    value.depositWhitelist,
                    value.isDepositLimit,
                    value.depositLimit,
                    value.defaultAdminRoleHolder,
                    value.depositWhitelistSetRoleHolder,
                    value.depositorWhitelistRoleHolder,
                    value.isDepositLimitSetRoleHolder,
                    value.depositLimitSetRoleHolder,
                )
            }
        }
        #[automatically_derived]
        #[doc(hidden)]
        impl ::core::convert::From<UnderlyingRustTuple<'_>> for InitParams {
            fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                Self {
                    collateral: tuple.0,
                    burner: tuple.1,
                    epochDuration: tuple.2,
                    depositWhitelist: tuple.3,
                    isDepositLimit: tuple.4,
                    depositLimit: tuple.5,
                    defaultAdminRoleHolder: tuple.6,
                    depositWhitelistSetRoleHolder: tuple.7,
                    depositorWhitelistRoleHolder: tuple.8,
                    isDepositLimitSetRoleHolder: tuple.9,
                    depositLimitSetRoleHolder: tuple.10,
                }
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolValue for InitParams {
            type SolType = Self;
        }
        #[automatically_derived]
        impl alloy_sol_types::private::SolTypeValue<Self> for InitParams {
            #[inline]
            fn stv_to_tokens(&self) -> <Self as alloy_sol_types::SolType>::Token<'_> {
                (
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.collateral,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.burner,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.epochDuration),
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.depositWhitelist,
                    ),
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self.isDepositLimit,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        256,
                    > as alloy_sol_types::SolType>::tokenize(&self.depositLimit),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.defaultAdminRoleHolder,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.depositWhitelistSetRoleHolder,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.depositorWhitelistRoleHolder,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.isDepositLimitSetRoleHolder,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.depositLimitSetRoleHolder,
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
        impl alloy_sol_types::SolType for InitParams {
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
        impl alloy_sol_types::SolStruct for InitParams {
            const NAME: &'static str = "InitParams";
            #[inline]
            fn eip712_root_type() -> alloy_sol_types::private::Cow<'static, str> {
                alloy_sol_types::private::Cow::Borrowed(
                    "InitParams(address collateral,address burner,uint48 epochDuration,bool depositWhitelist,bool isDepositLimit,uint256 depositLimit,address defaultAdminRoleHolder,address depositWhitelistSetRoleHolder,address depositorWhitelistRoleHolder,address isDepositLimitSetRoleHolder,address depositLimitSetRoleHolder)",
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
                            &self.collateral,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.burner,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::eip712_data_word(&self.epochDuration)
                        .0,
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::eip712_data_word(
                            &self.depositWhitelist,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::eip712_data_word(
                            &self.isDepositLimit,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Uint<
                        256,
                    > as alloy_sol_types::SolType>::eip712_data_word(&self.depositLimit)
                        .0,
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.defaultAdminRoleHolder,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.depositWhitelistSetRoleHolder,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.depositorWhitelistRoleHolder,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.isDepositLimitSetRoleHolder,
                        )
                        .0,
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::eip712_data_word(
                            &self.depositLimitSetRoleHolder,
                        )
                        .0,
                ]
                    .concat()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::EventTopic for InitParams {
            #[inline]
            fn topic_preimage_length(rust: &Self::RustType) -> usize {
                0usize
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.collateral,
                    )
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.burner,
                    )
                    + <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.epochDuration,
                    )
                    + <alloy::sol_types::sol_data::Bool as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.depositWhitelist,
                    )
                    + <alloy::sol_types::sol_data::Bool as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.isDepositLimit,
                    )
                    + <alloy::sol_types::sol_data::Uint<
                        256,
                    > as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.depositLimit,
                    )
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.defaultAdminRoleHolder,
                    )
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.depositWhitelistSetRoleHolder,
                    )
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.depositorWhitelistRoleHolder,
                    )
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.isDepositLimitSetRoleHolder,
                    )
                    + <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::topic_preimage_length(
                        &rust.depositLimitSetRoleHolder,
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
                    &rust.collateral,
                    out,
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.burner,
                    out,
                );
                <alloy::sol_types::sol_data::Uint<
                    48,
                > as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.epochDuration,
                    out,
                );
                <alloy::sol_types::sol_data::Bool as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.depositWhitelist,
                    out,
                );
                <alloy::sol_types::sol_data::Bool as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.isDepositLimit,
                    out,
                );
                <alloy::sol_types::sol_data::Uint<
                    256,
                > as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.depositLimit,
                    out,
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.defaultAdminRoleHolder,
                    out,
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.depositWhitelistSetRoleHolder,
                    out,
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.depositorWhitelistRoleHolder,
                    out,
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.isDepositLimitSetRoleHolder,
                    out,
                );
                <alloy::sol_types::sol_data::Address as alloy_sol_types::EventTopic>::encode_topic_preimage(
                    &rust.depositLimitSetRoleHolder,
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
    /**Creates a new wrapper around an on-chain [`IVault`](self) contract instance.

See the [wrapper's documentation](`IVaultInstance`) for more details.*/
    #[inline]
    pub const fn new<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    >(
        address: alloy_sol_types::private::Address,
        __provider: P,
    ) -> IVaultInstance<P, N> {
        IVaultInstance::<P, N>::new(address, __provider)
    }
    /**A [`IVault`](self) instance.

Contains type-safe methods for interacting with an on-chain instance of the
[`IVault`](self) contract located at a given `address`, using a given
provider `P`.

If the contract bytecode is available (see the [`sol!`](alloy_sol_types::sol!)
documentation on how to provide it), the `deploy` and `deploy_builder` methods can
be used to deploy a new instance of the contract.

See the [module-level documentation](self) for all the available methods.*/
    #[derive(Clone)]
    pub struct IVaultInstance<P, N = alloy_contract::private::Ethereum> {
        address: alloy_sol_types::private::Address,
        provider: P,
        _network: ::core::marker::PhantomData<N>,
    }
    #[automatically_derived]
    impl<P, N> ::core::fmt::Debug for IVaultInstance<P, N> {
        #[inline]
        fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
            f.debug_tuple("IVaultInstance").field(&self.address).finish()
        }
    }
    /// Instantiation and getters/setters.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > IVaultInstance<P, N> {
        /**Creates a new wrapper around an on-chain [`IVault`](self) contract instance.

See the [wrapper's documentation](`IVaultInstance`) for more details.*/
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
    impl<P: ::core::clone::Clone, N> IVaultInstance<&P, N> {
        /// Clones the provider and returns a new instance with the cloned provider.
        #[inline]
        pub fn with_cloned_provider(self) -> IVaultInstance<P, N> {
            IVaultInstance {
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
    > IVaultInstance<P, N> {
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
    > IVaultInstance<P, N> {
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
library IOpNetVaultAutoDeploy {
    struct AutoDeployConfig {
        uint48 epochDuration;
        address collateral;
        address burner;
        bool withSlasher;
        bool isBurnerHook;
    }
}

library IVault {
    struct InitParams {
        address collateral;
        address burner;
        uint48 epochDuration;
        bool depositWhitelist;
        bool isDepositLimit;
        uint256 depositLimit;
        address defaultAdminRoleHolder;
        address depositWhitelistSetRoleHolder;
        address depositorWhitelistRoleHolder;
        address isDepositLimitSetRoleHolder;
        address depositLimitSetRoleHolder;
    }
}

interface OpNetVaultAutoDeployLogic {
    error OpNetVaultAutoDeploy_InvalidBurnerHook();
    error OpNetVaultAutoDeploy_InvalidCollateral();
    error OpNetVaultAutoDeploy_InvalidEpochDuration();
    error OpNetVaultAutoDeploy_InvalidWithSlasher();

    event SetAutoDeployConfig(IOpNetVaultAutoDeploy.AutoDeployConfig config);
    event SetAutoDeployStatus(bool status);
    event SetSetMaxNetworkLimitHookStatus(bool status);

    function _validateConfig(IOpNetVaultAutoDeploy.AutoDeployConfig memory config) external view;
    function getAutoDeployConfig() external view returns (IOpNetVaultAutoDeploy.AutoDeployConfig memory);
    function getAutoDeployedVault(address operator) external view returns (address);
    function getDelegatorParams(IOpNetVaultAutoDeploy.AutoDeployConfig memory, address operator) external view returns (uint64, bytes memory);
    function getOperatorNetworkSpecificDelegatorParams(address operator, address defaultAdminRoleHolder, address hook, address hookSetRoleHolder) external view returns (uint64, bytes memory);
    function getSlasherParams(bool isBurnerHook) external view returns (uint64, bytes memory);
    function getSlasherParams(IOpNetVaultAutoDeploy.AutoDeployConfig memory config) external view returns (bool, uint64, bytes memory);
    function getVaultParams(IOpNetVaultAutoDeploy.AutoDeployConfig memory config) external view returns (uint64, bytes memory);
    function getVaultParams(IVault.InitParams memory params) external view returns (uint64, bytes memory);
    function getVaultTokenizedParams(IVault.InitParams memory baseParams, string memory name, string memory symbol) external view returns (uint64, bytes memory);
    function getVetoSlasherParams(bool isBurnerHook, uint48 vetoDuration, uint256 resolverSetEpochsDelay) external view returns (uint64, bytes memory);
    function isAutoDeployEnabled() external view returns (bool);
    function isSetMaxNetworkLimitHookEnabled() external view returns (bool);
}
```

...which was generated by the following JSON ABI:
```json
[
  {
    "type": "function",
    "name": "_validateConfig",
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
    "name": "getDelegatorParams",
    "inputs": [
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
      },
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "uint64",
        "internalType": "uint64"
      },
      {
        "name": "",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getOperatorNetworkSpecificDelegatorParams",
    "inputs": [
      {
        "name": "operator",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "defaultAdminRoleHolder",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "hook",
        "type": "address",
        "internalType": "address"
      },
      {
        "name": "hookSetRoleHolder",
        "type": "address",
        "internalType": "address"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "uint64",
        "internalType": "uint64"
      },
      {
        "name": "",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getSlasherParams",
    "inputs": [
      {
        "name": "isBurnerHook",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "uint64",
        "internalType": "uint64"
      },
      {
        "name": "",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getSlasherParams",
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
    "outputs": [
      {
        "name": "",
        "type": "bool",
        "internalType": "bool"
      },
      {
        "name": "",
        "type": "uint64",
        "internalType": "uint64"
      },
      {
        "name": "",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getVaultParams",
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
    "outputs": [
      {
        "name": "",
        "type": "uint64",
        "internalType": "uint64"
      },
      {
        "name": "",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getVaultParams",
    "inputs": [
      {
        "name": "params",
        "type": "tuple",
        "internalType": "struct IVault.InitParams",
        "components": [
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
            "name": "epochDuration",
            "type": "uint48",
            "internalType": "uint48"
          },
          {
            "name": "depositWhitelist",
            "type": "bool",
            "internalType": "bool"
          },
          {
            "name": "isDepositLimit",
            "type": "bool",
            "internalType": "bool"
          },
          {
            "name": "depositLimit",
            "type": "uint256",
            "internalType": "uint256"
          },
          {
            "name": "defaultAdminRoleHolder",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "depositWhitelistSetRoleHolder",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "depositorWhitelistRoleHolder",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "isDepositLimitSetRoleHolder",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "depositLimitSetRoleHolder",
            "type": "address",
            "internalType": "address"
          }
        ]
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "uint64",
        "internalType": "uint64"
      },
      {
        "name": "",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getVaultTokenizedParams",
    "inputs": [
      {
        "name": "baseParams",
        "type": "tuple",
        "internalType": "struct IVault.InitParams",
        "components": [
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
            "name": "epochDuration",
            "type": "uint48",
            "internalType": "uint48"
          },
          {
            "name": "depositWhitelist",
            "type": "bool",
            "internalType": "bool"
          },
          {
            "name": "isDepositLimit",
            "type": "bool",
            "internalType": "bool"
          },
          {
            "name": "depositLimit",
            "type": "uint256",
            "internalType": "uint256"
          },
          {
            "name": "defaultAdminRoleHolder",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "depositWhitelistSetRoleHolder",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "depositorWhitelistRoleHolder",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "isDepositLimitSetRoleHolder",
            "type": "address",
            "internalType": "address"
          },
          {
            "name": "depositLimitSetRoleHolder",
            "type": "address",
            "internalType": "address"
          }
        ]
      },
      {
        "name": "name",
        "type": "string",
        "internalType": "string"
      },
      {
        "name": "symbol",
        "type": "string",
        "internalType": "string"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "uint64",
        "internalType": "uint64"
      },
      {
        "name": "",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "stateMutability": "view"
  },
  {
    "type": "function",
    "name": "getVetoSlasherParams",
    "inputs": [
      {
        "name": "isBurnerHook",
        "type": "bool",
        "internalType": "bool"
      },
      {
        "name": "vetoDuration",
        "type": "uint48",
        "internalType": "uint48"
      },
      {
        "name": "resolverSetEpochsDelay",
        "type": "uint256",
        "internalType": "uint256"
      }
    ],
    "outputs": [
      {
        "name": "",
        "type": "uint64",
        "internalType": "uint64"
      },
      {
        "name": "",
        "type": "bytes",
        "internalType": "bytes"
      }
    ],
    "stateMutability": "view"
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
pub mod OpNetVaultAutoDeployLogic {
    use super::*;
    use alloy::sol_types as alloy_sol_types;
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
    /**Event with signature `SetAutoDeployConfig((uint48,address,address,bool,bool))` and selector `0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05`.
```solidity
event SetAutoDeployConfig(IOpNetVaultAutoDeploy.AutoDeployConfig config);
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
        pub config: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
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
            type DataTuple<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
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
                (
                    <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy_sol_types::SolType>::tokenize(
                        &self.config,
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
    /**Function with signature `_validateConfig((uint48,address,address,bool,bool))` and selector `0x97c1ad57`.
```solidity
function _validateConfig(IOpNetVaultAutoDeploy.AutoDeployConfig memory config) external view;
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct _validateConfigCall {
        #[allow(missing_docs)]
        pub config: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
    }
    ///Container type for the return parameters of the [`_validateConfig((uint48,address,address,bool,bool))`](_validateConfigCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct _validateConfigReturn {}
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
            type UnderlyingSolTuple<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
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
            impl ::core::convert::From<_validateConfigCall> for UnderlyingRustTuple<'_> {
                fn from(value: _validateConfigCall) -> Self {
                    (value.config,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>> for _validateConfigCall {
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
            impl ::core::convert::From<_validateConfigReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: _validateConfigReturn) -> Self {
                    ()
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for _validateConfigReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {}
                }
            }
        }
        impl _validateConfigReturn {
            fn _tokenize(
                &self,
            ) -> <_validateConfigCall as alloy_sol_types::SolCall>::ReturnToken<'_> {
                ()
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for _validateConfigCall {
            type Parameters<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = _validateConfigReturn;
            type ReturnTuple<'a> = ();
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "_validateConfig((uint48,address,address,bool,bool))";
            const SELECTOR: [u8; 4] = [151u8, 193u8, 173u8, 87u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy_sol_types::SolType>::tokenize(
                        &self.config,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                _validateConfigReturn::_tokenize(ret)
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
    /**Function with signature `getAutoDeployConfig()` and selector `0xa149c987`.
```solidity
function getAutoDeployConfig() external view returns (IOpNetVaultAutoDeploy.AutoDeployConfig memory);
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
        pub _0: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
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
            type UnderlyingSolTuple<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
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
            type Return = <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType;
            type ReturnTuple<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
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
                (
                    <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy_sol_types::SolType>::tokenize(
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
    /**Function with signature `getDelegatorParams((uint48,address,address,bool,bool),address)` and selector `0x4c0098f2`.
```solidity
function getDelegatorParams(IOpNetVaultAutoDeploy.AutoDeployConfig memory, address operator) external view returns (uint64, bytes memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getDelegatorParamsCall {
        #[allow(missing_docs)]
        pub _0: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getDelegatorParams((uint48,address,address,bool,bool),address)`](getDelegatorParamsCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getDelegatorParamsReturn {
        #[allow(missing_docs)]
        pub _0: u64,
        #[allow(missing_docs)]
        pub _1: alloy::sol_types::private::Bytes,
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
                IOpNetVaultAutoDeploy::AutoDeployConfig,
                alloy::sol_types::sol_data::Address,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
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
            impl ::core::convert::From<getDelegatorParamsCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getDelegatorParamsCall) -> Self {
                    (value._0, value.operator)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getDelegatorParamsCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        _0: tuple.0,
                        operator: tuple.1,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (u64, alloy::sol_types::private::Bytes);
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
            impl ::core::convert::From<getDelegatorParamsReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getDelegatorParamsReturn) -> Self {
                    (value._0, value._1)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getDelegatorParamsReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0, _1: tuple.1 }
                }
            }
        }
        impl getDelegatorParamsReturn {
            fn _tokenize(
                &self,
            ) -> <getDelegatorParamsCall as alloy_sol_types::SolCall>::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        64,
                    > as alloy_sol_types::SolType>::tokenize(&self._0),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self._1,
                    ),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getDelegatorParamsCall {
            type Parameters<'a> = (
                IOpNetVaultAutoDeploy::AutoDeployConfig,
                alloy::sol_types::sol_data::Address,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getDelegatorParamsReturn;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getDelegatorParams((uint48,address,address,bool,bool),address)";
            const SELECTOR: [u8; 4] = [76u8, 0u8, 152u8, 242u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy_sol_types::SolType>::tokenize(
                        &self._0,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.operator,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getDelegatorParamsReturn::_tokenize(ret)
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
    /**Function with signature `getOperatorNetworkSpecificDelegatorParams(address,address,address,address)` and selector `0xb21fe3ed`.
```solidity
function getOperatorNetworkSpecificDelegatorParams(address operator, address defaultAdminRoleHolder, address hook, address hookSetRoleHolder) external view returns (uint64, bytes memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorNetworkSpecificDelegatorParamsCall {
        #[allow(missing_docs)]
        pub operator: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub defaultAdminRoleHolder: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub hook: alloy::sol_types::private::Address,
        #[allow(missing_docs)]
        pub hookSetRoleHolder: alloy::sol_types::private::Address,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getOperatorNetworkSpecificDelegatorParams(address,address,address,address)`](getOperatorNetworkSpecificDelegatorParamsCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getOperatorNetworkSpecificDelegatorParamsReturn {
        #[allow(missing_docs)]
        pub _0: u64,
        #[allow(missing_docs)]
        pub _1: alloy::sol_types::private::Bytes,
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
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                alloy::sol_types::private::Address,
                alloy::sol_types::private::Address,
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
            impl ::core::convert::From<getOperatorNetworkSpecificDelegatorParamsCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorNetworkSpecificDelegatorParamsCall) -> Self {
                    (
                        value.operator,
                        value.defaultAdminRoleHolder,
                        value.hook,
                        value.hookSetRoleHolder,
                    )
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorNetworkSpecificDelegatorParamsCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        operator: tuple.0,
                        defaultAdminRoleHolder: tuple.1,
                        hook: tuple.2,
                        hookSetRoleHolder: tuple.3,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (u64, alloy::sol_types::private::Bytes);
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
            impl ::core::convert::From<getOperatorNetworkSpecificDelegatorParamsReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getOperatorNetworkSpecificDelegatorParamsReturn) -> Self {
                    (value._0, value._1)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getOperatorNetworkSpecificDelegatorParamsReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0, _1: tuple.1 }
                }
            }
        }
        impl getOperatorNetworkSpecificDelegatorParamsReturn {
            fn _tokenize(
                &self,
            ) -> <getOperatorNetworkSpecificDelegatorParamsCall as alloy_sol_types::SolCall>::ReturnToken<
                '_,
            > {
                (
                    <alloy::sol_types::sol_data::Uint<
                        64,
                    > as alloy_sol_types::SolType>::tokenize(&self._0),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self._1,
                    ),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getOperatorNetworkSpecificDelegatorParamsCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
                alloy::sol_types::sol_data::Address,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getOperatorNetworkSpecificDelegatorParamsReturn;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getOperatorNetworkSpecificDelegatorParams(address,address,address,address)";
            const SELECTOR: [u8; 4] = [178u8, 31u8, 227u8, 237u8];
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
                        &self.defaultAdminRoleHolder,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.hook,
                    ),
                    <alloy::sol_types::sol_data::Address as alloy_sol_types::SolType>::tokenize(
                        &self.hookSetRoleHolder,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getOperatorNetworkSpecificDelegatorParamsReturn::_tokenize(ret)
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
    /**Function with signature `getSlasherParams(bool)` and selector `0x2b45a2f9`.
```solidity
function getSlasherParams(bool isBurnerHook) external view returns (uint64, bytes memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSlasherParams_0Call {
        #[allow(missing_docs)]
        pub isBurnerHook: bool,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getSlasherParams(bool)`](getSlasherParams_0Call) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSlasherParams_0Return {
        #[allow(missing_docs)]
        pub _0: u64,
        #[allow(missing_docs)]
        pub _1: alloy::sol_types::private::Bytes,
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
            impl ::core::convert::From<getSlasherParams_0Call>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSlasherParams_0Call) -> Self {
                    (value.isBurnerHook,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSlasherParams_0Call {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { isBurnerHook: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (u64, alloy::sol_types::private::Bytes);
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
            impl ::core::convert::From<getSlasherParams_0Return>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSlasherParams_0Return) -> Self {
                    (value._0, value._1)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSlasherParams_0Return {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0, _1: tuple.1 }
                }
            }
        }
        impl getSlasherParams_0Return {
            fn _tokenize(
                &self,
            ) -> <getSlasherParams_0Call as alloy_sol_types::SolCall>::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        64,
                    > as alloy_sol_types::SolType>::tokenize(&self._0),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self._1,
                    ),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getSlasherParams_0Call {
            type Parameters<'a> = (alloy::sol_types::sol_data::Bool,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getSlasherParams_0Return;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getSlasherParams(bool)";
            const SELECTOR: [u8; 4] = [43u8, 69u8, 162u8, 249u8];
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
                        &self.isBurnerHook,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getSlasherParams_0Return::_tokenize(ret)
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
    /**Function with signature `getSlasherParams((uint48,address,address,bool,bool))` and selector `0xac296ec2`.
```solidity
function getSlasherParams(IOpNetVaultAutoDeploy.AutoDeployConfig memory config) external view returns (bool, uint64, bytes memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSlasherParams_1Call {
        #[allow(missing_docs)]
        pub config: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getSlasherParams((uint48,address,address,bool,bool))`](getSlasherParams_1Call) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getSlasherParams_1Return {
        #[allow(missing_docs)]
        pub _0: bool,
        #[allow(missing_docs)]
        pub _1: u64,
        #[allow(missing_docs)]
        pub _2: alloy::sol_types::private::Bytes,
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
            type UnderlyingSolTuple<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
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
            impl ::core::convert::From<getSlasherParams_1Call>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSlasherParams_1Call) -> Self {
                    (value.config,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSlasherParams_1Call {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { config: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (bool, u64, alloy::sol_types::private::Bytes);
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
            impl ::core::convert::From<getSlasherParams_1Return>
            for UnderlyingRustTuple<'_> {
                fn from(value: getSlasherParams_1Return) -> Self {
                    (value._0, value._1, value._2)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getSlasherParams_1Return {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        _0: tuple.0,
                        _1: tuple.1,
                        _2: tuple.2,
                    }
                }
            }
        }
        impl getSlasherParams_1Return {
            fn _tokenize(
                &self,
            ) -> <getSlasherParams_1Call as alloy_sol_types::SolCall>::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Bool as alloy_sol_types::SolType>::tokenize(
                        &self._0,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        64,
                    > as alloy_sol_types::SolType>::tokenize(&self._1),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self._2,
                    ),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getSlasherParams_1Call {
            type Parameters<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getSlasherParams_1Return;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getSlasherParams((uint48,address,address,bool,bool))";
            const SELECTOR: [u8; 4] = [172u8, 41u8, 110u8, 194u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy_sol_types::SolType>::tokenize(
                        &self.config,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getSlasherParams_1Return::_tokenize(ret)
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
    /**Function with signature `getVaultParams((uint48,address,address,bool,bool))` and selector `0xea8ea5c7`.
```solidity
function getVaultParams(IOpNetVaultAutoDeploy.AutoDeployConfig memory config) external view returns (uint64, bytes memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVaultParams_0Call {
        #[allow(missing_docs)]
        pub config: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getVaultParams((uint48,address,address,bool,bool))`](getVaultParams_0Call) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVaultParams_0Return {
        #[allow(missing_docs)]
        pub _0: u64,
        #[allow(missing_docs)]
        pub _1: alloy::sol_types::private::Bytes,
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
            type UnderlyingSolTuple<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
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
            impl ::core::convert::From<getVaultParams_0Call>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVaultParams_0Call) -> Self {
                    (value.config,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVaultParams_0Call {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { config: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (u64, alloy::sol_types::private::Bytes);
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
            impl ::core::convert::From<getVaultParams_0Return>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVaultParams_0Return) -> Self {
                    (value._0, value._1)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVaultParams_0Return {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0, _1: tuple.1 }
                }
            }
        }
        impl getVaultParams_0Return {
            fn _tokenize(
                &self,
            ) -> <getVaultParams_0Call as alloy_sol_types::SolCall>::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        64,
                    > as alloy_sol_types::SolType>::tokenize(&self._0),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self._1,
                    ),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getVaultParams_0Call {
            type Parameters<'a> = (IOpNetVaultAutoDeploy::AutoDeployConfig,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getVaultParams_0Return;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getVaultParams((uint48,address,address,bool,bool))";
            const SELECTOR: [u8; 4] = [234u8, 142u8, 165u8, 199u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy_sol_types::SolType>::tokenize(
                        &self.config,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getVaultParams_0Return::_tokenize(ret)
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
    /**Function with signature `getVaultParams((address,address,uint48,bool,bool,uint256,address,address,address,address,address))` and selector `0x168432da`.
```solidity
function getVaultParams(IVault.InitParams memory params) external view returns (uint64, bytes memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVaultParams_1Call {
        #[allow(missing_docs)]
        pub params: <IVault::InitParams as alloy::sol_types::SolType>::RustType,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getVaultParams((address,address,uint48,bool,bool,uint256,address,address,address,address,address))`](getVaultParams_1Call) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVaultParams_1Return {
        #[allow(missing_docs)]
        pub _0: u64,
        #[allow(missing_docs)]
        pub _1: alloy::sol_types::private::Bytes,
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
            type UnderlyingSolTuple<'a> = (IVault::InitParams,);
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <IVault::InitParams as alloy::sol_types::SolType>::RustType,
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
            impl ::core::convert::From<getVaultParams_1Call>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVaultParams_1Call) -> Self {
                    (value.params,)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVaultParams_1Call {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { params: tuple.0 }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (u64, alloy::sol_types::private::Bytes);
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
            impl ::core::convert::From<getVaultParams_1Return>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVaultParams_1Return) -> Self {
                    (value._0, value._1)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVaultParams_1Return {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0, _1: tuple.1 }
                }
            }
        }
        impl getVaultParams_1Return {
            fn _tokenize(
                &self,
            ) -> <getVaultParams_1Call as alloy_sol_types::SolCall>::ReturnToken<'_> {
                (
                    <alloy::sol_types::sol_data::Uint<
                        64,
                    > as alloy_sol_types::SolType>::tokenize(&self._0),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self._1,
                    ),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getVaultParams_1Call {
            type Parameters<'a> = (IVault::InitParams,);
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getVaultParams_1Return;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getVaultParams((address,address,uint48,bool,bool,uint256,address,address,address,address,address))";
            const SELECTOR: [u8; 4] = [22u8, 132u8, 50u8, 218u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <IVault::InitParams as alloy_sol_types::SolType>::tokenize(
                        &self.params,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getVaultParams_1Return::_tokenize(ret)
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
    /**Function with signature `getVaultTokenizedParams((address,address,uint48,bool,bool,uint256,address,address,address,address,address),string,string)` and selector `0x49b6cfc6`.
```solidity
function getVaultTokenizedParams(IVault.InitParams memory baseParams, string memory name, string memory symbol) external view returns (uint64, bytes memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVaultTokenizedParamsCall {
        #[allow(missing_docs)]
        pub baseParams: <IVault::InitParams as alloy::sol_types::SolType>::RustType,
        #[allow(missing_docs)]
        pub name: alloy::sol_types::private::String,
        #[allow(missing_docs)]
        pub symbol: alloy::sol_types::private::String,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getVaultTokenizedParams((address,address,uint48,bool,bool,uint256,address,address,address,address,address),string,string)`](getVaultTokenizedParamsCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVaultTokenizedParamsReturn {
        #[allow(missing_docs)]
        pub _0: u64,
        #[allow(missing_docs)]
        pub _1: alloy::sol_types::private::Bytes,
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
                IVault::InitParams,
                alloy::sol_types::sol_data::String,
                alloy::sol_types::sol_data::String,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                <IVault::InitParams as alloy::sol_types::SolType>::RustType,
                alloy::sol_types::private::String,
                alloy::sol_types::private::String,
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
            impl ::core::convert::From<getVaultTokenizedParamsCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVaultTokenizedParamsCall) -> Self {
                    (value.baseParams, value.name, value.symbol)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVaultTokenizedParamsCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        baseParams: tuple.0,
                        name: tuple.1,
                        symbol: tuple.2,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (u64, alloy::sol_types::private::Bytes);
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
            impl ::core::convert::From<getVaultTokenizedParamsReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVaultTokenizedParamsReturn) -> Self {
                    (value._0, value._1)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVaultTokenizedParamsReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0, _1: tuple.1 }
                }
            }
        }
        impl getVaultTokenizedParamsReturn {
            fn _tokenize(
                &self,
            ) -> <getVaultTokenizedParamsCall as alloy_sol_types::SolCall>::ReturnToken<
                '_,
            > {
                (
                    <alloy::sol_types::sol_data::Uint<
                        64,
                    > as alloy_sol_types::SolType>::tokenize(&self._0),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self._1,
                    ),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getVaultTokenizedParamsCall {
            type Parameters<'a> = (
                IVault::InitParams,
                alloy::sol_types::sol_data::String,
                alloy::sol_types::sol_data::String,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getVaultTokenizedParamsReturn;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getVaultTokenizedParams((address,address,uint48,bool,bool,uint256,address,address,address,address,address),string,string)";
            const SELECTOR: [u8; 4] = [73u8, 182u8, 207u8, 198u8];
            #[inline]
            fn new<'a>(
                tuple: <Self::Parameters<'a> as alloy_sol_types::SolType>::RustType,
            ) -> Self {
                tuple.into()
            }
            #[inline]
            fn tokenize(&self) -> Self::Token<'_> {
                (
                    <IVault::InitParams as alloy_sol_types::SolType>::tokenize(
                        &self.baseParams,
                    ),
                    <alloy::sol_types::sol_data::String as alloy_sol_types::SolType>::tokenize(
                        &self.name,
                    ),
                    <alloy::sol_types::sol_data::String as alloy_sol_types::SolType>::tokenize(
                        &self.symbol,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getVaultTokenizedParamsReturn::_tokenize(ret)
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
    /**Function with signature `getVetoSlasherParams(bool,uint48,uint256)` and selector `0xae500700`.
```solidity
function getVetoSlasherParams(bool isBurnerHook, uint48 vetoDuration, uint256 resolverSetEpochsDelay) external view returns (uint64, bytes memory);
```*/
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVetoSlasherParamsCall {
        #[allow(missing_docs)]
        pub isBurnerHook: bool,
        #[allow(missing_docs)]
        pub vetoDuration: alloy::sol_types::private::primitives::aliases::U48,
        #[allow(missing_docs)]
        pub resolverSetEpochsDelay: alloy::sol_types::private::primitives::aliases::U256,
    }
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Default, Debug, PartialEq, Eq, Hash)]
    ///Container type for the return parameters of the [`getVetoSlasherParams(bool,uint48,uint256)`](getVetoSlasherParamsCall) function.
    #[allow(non_camel_case_types, non_snake_case, clippy::pub_underscore_fields)]
    #[derive(Clone)]
    pub struct getVetoSlasherParamsReturn {
        #[allow(missing_docs)]
        pub _0: u64,
        #[allow(missing_docs)]
        pub _1: alloy::sol_types::private::Bytes,
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
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<48>,
                alloy::sol_types::sol_data::Uint<256>,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (
                bool,
                alloy::sol_types::private::primitives::aliases::U48,
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
            impl ::core::convert::From<getVetoSlasherParamsCall>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVetoSlasherParamsCall) -> Self {
                    (
                        value.isBurnerHook,
                        value.vetoDuration,
                        value.resolverSetEpochsDelay,
                    )
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVetoSlasherParamsCall {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self {
                        isBurnerHook: tuple.0,
                        vetoDuration: tuple.1,
                        resolverSetEpochsDelay: tuple.2,
                    }
                }
            }
        }
        {
            #[doc(hidden)]
            #[allow(dead_code)]
            type UnderlyingSolTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            #[doc(hidden)]
            type UnderlyingRustTuple<'a> = (u64, alloy::sol_types::private::Bytes);
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
            impl ::core::convert::From<getVetoSlasherParamsReturn>
            for UnderlyingRustTuple<'_> {
                fn from(value: getVetoSlasherParamsReturn) -> Self {
                    (value._0, value._1)
                }
            }
            #[automatically_derived]
            #[doc(hidden)]
            impl ::core::convert::From<UnderlyingRustTuple<'_>>
            for getVetoSlasherParamsReturn {
                fn from(tuple: UnderlyingRustTuple<'_>) -> Self {
                    Self { _0: tuple.0, _1: tuple.1 }
                }
            }
        }
        impl getVetoSlasherParamsReturn {
            fn _tokenize(
                &self,
            ) -> <getVetoSlasherParamsCall as alloy_sol_types::SolCall>::ReturnToken<
                '_,
            > {
                (
                    <alloy::sol_types::sol_data::Uint<
                        64,
                    > as alloy_sol_types::SolType>::tokenize(&self._0),
                    <alloy::sol_types::sol_data::Bytes as alloy_sol_types::SolType>::tokenize(
                        &self._1,
                    ),
                )
            }
        }
        #[automatically_derived]
        impl alloy_sol_types::SolCall for getVetoSlasherParamsCall {
            type Parameters<'a> = (
                alloy::sol_types::sol_data::Bool,
                alloy::sol_types::sol_data::Uint<48>,
                alloy::sol_types::sol_data::Uint<256>,
            );
            type Token<'a> = <Self::Parameters<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            type Return = getVetoSlasherParamsReturn;
            type ReturnTuple<'a> = (
                alloy::sol_types::sol_data::Uint<64>,
                alloy::sol_types::sol_data::Bytes,
            );
            type ReturnToken<'a> = <Self::ReturnTuple<
                'a,
            > as alloy_sol_types::SolType>::Token<'a>;
            const SIGNATURE: &'static str = "getVetoSlasherParams(bool,uint48,uint256)";
            const SELECTOR: [u8; 4] = [174u8, 80u8, 7u8, 0u8];
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
                        &self.isBurnerHook,
                    ),
                    <alloy::sol_types::sol_data::Uint<
                        48,
                    > as alloy_sol_types::SolType>::tokenize(&self.vetoDuration),
                    <alloy::sol_types::sol_data::Uint<
                        256,
                    > as alloy_sol_types::SolType>::tokenize(
                        &self.resolverSetEpochsDelay,
                    ),
                )
            }
            #[inline]
            fn tokenize_returns(ret: &Self::Return) -> Self::ReturnToken<'_> {
                getVetoSlasherParamsReturn::_tokenize(ret)
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
    ///Container for all the [`OpNetVaultAutoDeployLogic`](self) function calls.
    #[derive(Clone)]
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive()]
    pub enum OpNetVaultAutoDeployLogicCalls {
        #[allow(missing_docs)]
        _validateConfig(_validateConfigCall),
        #[allow(missing_docs)]
        getAutoDeployConfig(getAutoDeployConfigCall),
        #[allow(missing_docs)]
        getAutoDeployedVault(getAutoDeployedVaultCall),
        #[allow(missing_docs)]
        getDelegatorParams(getDelegatorParamsCall),
        #[allow(missing_docs)]
        getOperatorNetworkSpecificDelegatorParams(
            getOperatorNetworkSpecificDelegatorParamsCall,
        ),
        #[allow(missing_docs)]
        getSlasherParams_0(getSlasherParams_0Call),
        #[allow(missing_docs)]
        getSlasherParams_1(getSlasherParams_1Call),
        #[allow(missing_docs)]
        getVaultParams_0(getVaultParams_0Call),
        #[allow(missing_docs)]
        getVaultParams_1(getVaultParams_1Call),
        #[allow(missing_docs)]
        getVaultTokenizedParams(getVaultTokenizedParamsCall),
        #[allow(missing_docs)]
        getVetoSlasherParams(getVetoSlasherParamsCall),
        #[allow(missing_docs)]
        isAutoDeployEnabled(isAutoDeployEnabledCall),
        #[allow(missing_docs)]
        isSetMaxNetworkLimitHookEnabled(isSetMaxNetworkLimitHookEnabledCall),
    }
    impl OpNetVaultAutoDeployLogicCalls {
        /// All the selectors of this enum.
        ///
        /// Note that the selectors might not be in the same order as the variants.
        /// No guarantees are made about the order of the selectors.
        ///
        /// Prefer using `SolInterface` methods instead.
        pub const SELECTORS: &'static [[u8; 4usize]] = &[
            [22u8, 132u8, 50u8, 218u8],
            [43u8, 47u8, 208u8, 21u8],
            [43u8, 69u8, 162u8, 249u8],
            [73u8, 182u8, 207u8, 198u8],
            [76u8, 0u8, 152u8, 242u8],
            [151u8, 193u8, 173u8, 87u8],
            [161u8, 73u8, 201u8, 135u8],
            [172u8, 41u8, 110u8, 194u8],
            [174u8, 80u8, 7u8, 0u8],
            [178u8, 31u8, 227u8, 237u8],
            [222u8, 176u8, 24u8, 220u8],
            [231u8, 123u8, 19u8, 109u8],
            [234u8, 142u8, 165u8, 199u8],
        ];
        /// The names of the variants in the same order as `SELECTORS`.
        pub const VARIANT_NAMES: &'static [&'static str] = &[
            ::core::stringify!(getVaultParams_1),
            ::core::stringify!(getAutoDeployedVault),
            ::core::stringify!(getSlasherParams_0),
            ::core::stringify!(getVaultTokenizedParams),
            ::core::stringify!(getDelegatorParams),
            ::core::stringify!(_validateConfig),
            ::core::stringify!(getAutoDeployConfig),
            ::core::stringify!(getSlasherParams_1),
            ::core::stringify!(getVetoSlasherParams),
            ::core::stringify!(getOperatorNetworkSpecificDelegatorParams),
            ::core::stringify!(isAutoDeployEnabled),
            ::core::stringify!(isSetMaxNetworkLimitHookEnabled),
            ::core::stringify!(getVaultParams_0),
        ];
        /// The signatures in the same order as `SELECTORS`.
        pub const SIGNATURES: &'static [&'static str] = &[
            <getVaultParams_1Call as alloy_sol_types::SolCall>::SIGNATURE,
            <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getSlasherParams_0Call as alloy_sol_types::SolCall>::SIGNATURE,
            <getVaultTokenizedParamsCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getDelegatorParamsCall as alloy_sol_types::SolCall>::SIGNATURE,
            <_validateConfigCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getAutoDeployConfigCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getSlasherParams_1Call as alloy_sol_types::SolCall>::SIGNATURE,
            <getVetoSlasherParamsCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getOperatorNetworkSpecificDelegatorParamsCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::SIGNATURE,
            <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::SIGNATURE,
            <getVaultParams_0Call as alloy_sol_types::SolCall>::SIGNATURE,
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
    impl alloy_sol_types::SolInterface for OpNetVaultAutoDeployLogicCalls {
        const NAME: &'static str = "OpNetVaultAutoDeployLogicCalls";
        const MIN_DATA_LENGTH: usize = 0usize;
        const COUNT: usize = 13usize;
        #[inline]
        fn selector(&self) -> [u8; 4] {
            match self {
                Self::_validateConfig(_) => {
                    <_validateConfigCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getAutoDeployConfig(_) => {
                    <getAutoDeployConfigCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getAutoDeployedVault(_) => {
                    <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getDelegatorParams(_) => {
                    <getDelegatorParamsCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getOperatorNetworkSpecificDelegatorParams(_) => {
                    <getOperatorNetworkSpecificDelegatorParamsCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getSlasherParams_0(_) => {
                    <getSlasherParams_0Call as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getSlasherParams_1(_) => {
                    <getSlasherParams_1Call as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getVaultParams_0(_) => {
                    <getVaultParams_0Call as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getVaultParams_1(_) => {
                    <getVaultParams_1Call as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getVaultTokenizedParams(_) => {
                    <getVaultTokenizedParamsCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::getVetoSlasherParams(_) => {
                    <getVetoSlasherParamsCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isAutoDeployEnabled(_) => {
                    <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::SELECTOR
                }
                Self::isSetMaxNetworkLimitHookEnabled(_) => {
                    <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::SELECTOR
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
            ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls>] = &[
                {
                    fn getVaultParams_1(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getVaultParams_1Call as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getVaultParams_1)
                    }
                    getVaultParams_1
                },
                {
                    fn getAutoDeployedVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getAutoDeployedVault)
                    }
                    getAutoDeployedVault
                },
                {
                    fn getSlasherParams_0(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getSlasherParams_0Call as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getSlasherParams_0)
                    }
                    getSlasherParams_0
                },
                {
                    fn getVaultTokenizedParams(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getVaultTokenizedParamsCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getVaultTokenizedParams)
                    }
                    getVaultTokenizedParams
                },
                {
                    fn getDelegatorParams(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getDelegatorParamsCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getDelegatorParams)
                    }
                    getDelegatorParams
                },
                {
                    fn _validateConfig(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <_validateConfigCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::_validateConfig)
                    }
                    _validateConfig
                },
                {
                    fn getAutoDeployConfig(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getAutoDeployConfig)
                    }
                    getAutoDeployConfig
                },
                {
                    fn getSlasherParams_1(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getSlasherParams_1Call as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getSlasherParams_1)
                    }
                    getSlasherParams_1
                },
                {
                    fn getVetoSlasherParams(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getVetoSlasherParamsCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getVetoSlasherParams)
                    }
                    getVetoSlasherParams
                },
                {
                    fn getOperatorNetworkSpecificDelegatorParams(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getOperatorNetworkSpecificDelegatorParamsCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicCalls::getOperatorNetworkSpecificDelegatorParams,
                            )
                    }
                    getOperatorNetworkSpecificDelegatorParams
                },
                {
                    fn isAutoDeployEnabled(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::isAutoDeployEnabled)
                    }
                    isAutoDeployEnabled
                },
                {
                    fn isSetMaxNetworkLimitHookEnabled(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicCalls::isSetMaxNetworkLimitHookEnabled,
                            )
                    }
                    isSetMaxNetworkLimitHookEnabled
                },
                {
                    fn getVaultParams_0(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getVaultParams_0Call as alloy_sol_types::SolCall>::abi_decode_raw(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getVaultParams_0)
                    }
                    getVaultParams_0
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
            ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls>] = &[
                {
                    fn getVaultParams_1(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getVaultParams_1Call as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getVaultParams_1)
                    }
                    getVaultParams_1
                },
                {
                    fn getAutoDeployedVault(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getAutoDeployedVaultCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getAutoDeployedVault)
                    }
                    getAutoDeployedVault
                },
                {
                    fn getSlasherParams_0(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getSlasherParams_0Call as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getSlasherParams_0)
                    }
                    getSlasherParams_0
                },
                {
                    fn getVaultTokenizedParams(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getVaultTokenizedParamsCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getVaultTokenizedParams)
                    }
                    getVaultTokenizedParams
                },
                {
                    fn getDelegatorParams(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getDelegatorParamsCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getDelegatorParams)
                    }
                    getDelegatorParams
                },
                {
                    fn _validateConfig(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <_validateConfigCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::_validateConfig)
                    }
                    _validateConfig
                },
                {
                    fn getAutoDeployConfig(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getAutoDeployConfigCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getAutoDeployConfig)
                    }
                    getAutoDeployConfig
                },
                {
                    fn getSlasherParams_1(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getSlasherParams_1Call as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getSlasherParams_1)
                    }
                    getSlasherParams_1
                },
                {
                    fn getVetoSlasherParams(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getVetoSlasherParamsCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getVetoSlasherParams)
                    }
                    getVetoSlasherParams
                },
                {
                    fn getOperatorNetworkSpecificDelegatorParams(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getOperatorNetworkSpecificDelegatorParamsCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicCalls::getOperatorNetworkSpecificDelegatorParams,
                            )
                    }
                    getOperatorNetworkSpecificDelegatorParams
                },
                {
                    fn isAutoDeployEnabled(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::isAutoDeployEnabled)
                    }
                    isAutoDeployEnabled
                },
                {
                    fn isSetMaxNetworkLimitHookEnabled(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicCalls::isSetMaxNetworkLimitHookEnabled,
                            )
                    }
                    isSetMaxNetworkLimitHookEnabled
                },
                {
                    fn getVaultParams_0(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicCalls> {
                        <getVaultParams_0Call as alloy_sol_types::SolCall>::abi_decode_raw_validate(
                                data,
                            )
                            .map(OpNetVaultAutoDeployLogicCalls::getVaultParams_0)
                    }
                    getVaultParams_0
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
                Self::_validateConfig(inner) => {
                    <_validateConfigCall as alloy_sol_types::SolCall>::abi_encoded_size(
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
                Self::getDelegatorParams(inner) => {
                    <getDelegatorParamsCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getOperatorNetworkSpecificDelegatorParams(inner) => {
                    <getOperatorNetworkSpecificDelegatorParamsCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getSlasherParams_0(inner) => {
                    <getSlasherParams_0Call as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getSlasherParams_1(inner) => {
                    <getSlasherParams_1Call as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getVaultParams_0(inner) => {
                    <getVaultParams_0Call as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getVaultParams_1(inner) => {
                    <getVaultParams_1Call as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getVaultTokenizedParams(inner) => {
                    <getVaultTokenizedParamsCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::getVetoSlasherParams(inner) => {
                    <getVetoSlasherParamsCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isAutoDeployEnabled(inner) => {
                    <isAutoDeployEnabledCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
                Self::isSetMaxNetworkLimitHookEnabled(inner) => {
                    <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::abi_encoded_size(
                        inner,
                    )
                }
            }
        }
        #[inline]
        fn abi_encode_raw(&self, out: &mut alloy_sol_types::private::Vec<u8>) {
            match self {
                Self::_validateConfig(inner) => {
                    <_validateConfigCall as alloy_sol_types::SolCall>::abi_encode_raw(
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
                Self::getDelegatorParams(inner) => {
                    <getDelegatorParamsCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getOperatorNetworkSpecificDelegatorParams(inner) => {
                    <getOperatorNetworkSpecificDelegatorParamsCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getSlasherParams_0(inner) => {
                    <getSlasherParams_0Call as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getSlasherParams_1(inner) => {
                    <getSlasherParams_1Call as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getVaultParams_0(inner) => {
                    <getVaultParams_0Call as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getVaultParams_1(inner) => {
                    <getVaultParams_1Call as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getVaultTokenizedParams(inner) => {
                    <getVaultTokenizedParamsCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
                Self::getVetoSlasherParams(inner) => {
                    <getVetoSlasherParamsCall as alloy_sol_types::SolCall>::abi_encode_raw(
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
                Self::isSetMaxNetworkLimitHookEnabled(inner) => {
                    <isSetMaxNetworkLimitHookEnabledCall as alloy_sol_types::SolCall>::abi_encode_raw(
                        inner,
                        out,
                    )
                }
            }
        }
    }
    ///Container for all the [`OpNetVaultAutoDeployLogic`](self) custom errors.
    #[derive(Clone)]
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Debug, PartialEq, Eq, Hash)]
    pub enum OpNetVaultAutoDeployLogicErrors {
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
    }
    impl OpNetVaultAutoDeployLogicErrors {
        /// All the selectors of this enum.
        ///
        /// Note that the selectors might not be in the same order as the variants.
        /// No guarantees are made about the order of the selectors.
        ///
        /// Prefer using `SolInterface` methods instead.
        pub const SELECTORS: &'static [[u8; 4usize]] = &[
            [22u8, 72u8, 233u8, 106u8],
            [35u8, 213u8, 173u8, 198u8],
            [54u8, 62u8, 131u8, 94u8],
            [133u8, 226u8, 253u8, 201u8],
        ];
        /// The names of the variants in the same order as `SELECTORS`.
        pub const VARIANT_NAMES: &'static [&'static str] = &[
            ::core::stringify!(OpNetVaultAutoDeploy_InvalidEpochDuration),
            ::core::stringify!(OpNetVaultAutoDeploy_InvalidBurnerHook),
            ::core::stringify!(OpNetVaultAutoDeploy_InvalidCollateral),
            ::core::stringify!(OpNetVaultAutoDeploy_InvalidWithSlasher),
        ];
        /// The signatures in the same order as `SELECTORS`.
        pub const SIGNATURES: &'static [&'static str] = &[
            <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::SIGNATURE,
            <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::SIGNATURE,
            <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::SIGNATURE,
            <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::SIGNATURE,
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
    impl alloy_sol_types::SolInterface for OpNetVaultAutoDeployLogicErrors {
        const NAME: &'static str = "OpNetVaultAutoDeployLogicErrors";
        const MIN_DATA_LENGTH: usize = 0usize;
        const COUNT: usize = 4usize;
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
            ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors>] = &[
                {
                    fn OpNetVaultAutoDeploy_InvalidEpochDuration(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors> {
                        <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicErrors::OpNetVaultAutoDeploy_InvalidEpochDuration,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidEpochDuration
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidBurnerHook(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors> {
                        <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicErrors::OpNetVaultAutoDeploy_InvalidBurnerHook,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidBurnerHook
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidCollateral(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors> {
                        <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicErrors::OpNetVaultAutoDeploy_InvalidCollateral,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidCollateral
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidWithSlasher(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors> {
                        <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::abi_decode_raw(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicErrors::OpNetVaultAutoDeploy_InvalidWithSlasher,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidWithSlasher
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
            ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors>] = &[
                {
                    fn OpNetVaultAutoDeploy_InvalidEpochDuration(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors> {
                        <OpNetVaultAutoDeploy_InvalidEpochDuration as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicErrors::OpNetVaultAutoDeploy_InvalidEpochDuration,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidEpochDuration
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidBurnerHook(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors> {
                        <OpNetVaultAutoDeploy_InvalidBurnerHook as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicErrors::OpNetVaultAutoDeploy_InvalidBurnerHook,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidBurnerHook
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidCollateral(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors> {
                        <OpNetVaultAutoDeploy_InvalidCollateral as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicErrors::OpNetVaultAutoDeploy_InvalidCollateral,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidCollateral
                },
                {
                    fn OpNetVaultAutoDeploy_InvalidWithSlasher(
                        data: &[u8],
                    ) -> alloy_sol_types::Result<OpNetVaultAutoDeployLogicErrors> {
                        <OpNetVaultAutoDeploy_InvalidWithSlasher as alloy_sol_types::SolError>::abi_decode_raw_validate(
                                data,
                            )
                            .map(
                                OpNetVaultAutoDeployLogicErrors::OpNetVaultAutoDeploy_InvalidWithSlasher,
                            )
                    }
                    OpNetVaultAutoDeploy_InvalidWithSlasher
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
            }
        }
    }
    ///Container for all the [`OpNetVaultAutoDeployLogic`](self) events.
    #[derive(Clone)]
    #[derive(serde::Serialize, serde::Deserialize)]
    #[derive(Debug, PartialEq, Eq, Hash)]
    pub enum OpNetVaultAutoDeployLogicEvents {
        #[allow(missing_docs)]
        SetAutoDeployConfig(SetAutoDeployConfig),
        #[allow(missing_docs)]
        SetAutoDeployStatus(SetAutoDeployStatus),
        #[allow(missing_docs)]
        SetSetMaxNetworkLimitHookStatus(SetSetMaxNetworkLimitHookStatus),
    }
    impl OpNetVaultAutoDeployLogicEvents {
        /// All the selectors of this enum.
        ///
        /// Note that the selectors might not be in the same order as the variants.
        /// No guarantees are made about the order of the selectors.
        ///
        /// Prefer using `SolInterface` methods instead.
        pub const SELECTORS: &'static [[u8; 32usize]] = &[
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
        ];
        /// The names of the variants in the same order as `SELECTORS`.
        pub const VARIANT_NAMES: &'static [&'static str] = &[
            ::core::stringify!(SetAutoDeployConfig),
            ::core::stringify!(SetAutoDeployStatus),
            ::core::stringify!(SetSetMaxNetworkLimitHookStatus),
        ];
        /// The signatures in the same order as `SELECTORS`.
        pub const SIGNATURES: &'static [&'static str] = &[
            <SetAutoDeployConfig as alloy_sol_types::SolEvent>::SIGNATURE,
            <SetAutoDeployStatus as alloy_sol_types::SolEvent>::SIGNATURE,
            <SetSetMaxNetworkLimitHookStatus as alloy_sol_types::SolEvent>::SIGNATURE,
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
    impl alloy_sol_types::SolEventInterface for OpNetVaultAutoDeployLogicEvents {
        const NAME: &'static str = "OpNetVaultAutoDeployLogicEvents";
        const COUNT: usize = 3usize;
        fn decode_raw_log(
            topics: &[alloy_sol_types::Word],
            data: &[u8],
        ) -> alloy_sol_types::Result<Self> {
            match topics.first().copied() {
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
    impl alloy_sol_types::private::IntoLogData for OpNetVaultAutoDeployLogicEvents {
        fn to_log_data(&self) -> alloy_sol_types::private::LogData {
            match self {
                Self::SetAutoDeployConfig(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::SetAutoDeployStatus(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
                Self::SetSetMaxNetworkLimitHookStatus(inner) => {
                    alloy_sol_types::private::IntoLogData::to_log_data(inner)
                }
            }
        }
        fn into_log_data(self) -> alloy_sol_types::private::LogData {
            match self {
                Self::SetAutoDeployConfig(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::SetAutoDeployStatus(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
                Self::SetSetMaxNetworkLimitHookStatus(inner) => {
                    alloy_sol_types::private::IntoLogData::into_log_data(inner)
                }
            }
        }
    }
    use alloy::contract as alloy_contract;
    /**Creates a new wrapper around an on-chain [`OpNetVaultAutoDeployLogic`](self) contract instance.

See the [wrapper's documentation](`OpNetVaultAutoDeployLogicInstance`) for more details.*/
    #[inline]
    pub const fn new<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    >(
        address: alloy_sol_types::private::Address,
        __provider: P,
    ) -> OpNetVaultAutoDeployLogicInstance<P, N> {
        OpNetVaultAutoDeployLogicInstance::<P, N>::new(address, __provider)
    }
    /**A [`OpNetVaultAutoDeployLogic`](self) instance.

Contains type-safe methods for interacting with an on-chain instance of the
[`OpNetVaultAutoDeployLogic`](self) contract located at a given `address`, using a given
provider `P`.

If the contract bytecode is available (see the [`sol!`](alloy_sol_types::sol!)
documentation on how to provide it), the `deploy` and `deploy_builder` methods can
be used to deploy a new instance of the contract.

See the [module-level documentation](self) for all the available methods.*/
    #[derive(Clone)]
    pub struct OpNetVaultAutoDeployLogicInstance<
        P,
        N = alloy_contract::private::Ethereum,
    > {
        address: alloy_sol_types::private::Address,
        provider: P,
        _network: ::core::marker::PhantomData<N>,
    }
    #[automatically_derived]
    impl<P, N> ::core::fmt::Debug for OpNetVaultAutoDeployLogicInstance<P, N> {
        #[inline]
        fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
            f.debug_tuple("OpNetVaultAutoDeployLogicInstance")
                .field(&self.address)
                .finish()
        }
    }
    /// Instantiation and getters/setters.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > OpNetVaultAutoDeployLogicInstance<P, N> {
        /**Creates a new wrapper around an on-chain [`OpNetVaultAutoDeployLogic`](self) contract instance.

See the [wrapper's documentation](`OpNetVaultAutoDeployLogicInstance`) for more details.*/
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
    impl<P: ::core::clone::Clone, N> OpNetVaultAutoDeployLogicInstance<&P, N> {
        /// Clones the provider and returns a new instance with the cloned provider.
        #[inline]
        pub fn with_cloned_provider(self) -> OpNetVaultAutoDeployLogicInstance<P, N> {
            OpNetVaultAutoDeployLogicInstance {
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
    > OpNetVaultAutoDeployLogicInstance<P, N> {
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
        ///Creates a new call builder for the [`_validateConfig`] function.
        pub fn _validateConfig(
            &self,
            config: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
        ) -> alloy_contract::SolCallBuilder<&P, _validateConfigCall, N> {
            self.call_builder(&_validateConfigCall { config })
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
        ///Creates a new call builder for the [`getDelegatorParams`] function.
        pub fn getDelegatorParams(
            &self,
            _0: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
            operator: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<&P, getDelegatorParamsCall, N> {
            self.call_builder(
                &getDelegatorParamsCall {
                    _0,
                    operator,
                },
            )
        }
        ///Creates a new call builder for the [`getOperatorNetworkSpecificDelegatorParams`] function.
        pub fn getOperatorNetworkSpecificDelegatorParams(
            &self,
            operator: alloy::sol_types::private::Address,
            defaultAdminRoleHolder: alloy::sol_types::private::Address,
            hook: alloy::sol_types::private::Address,
            hookSetRoleHolder: alloy::sol_types::private::Address,
        ) -> alloy_contract::SolCallBuilder<
            &P,
            getOperatorNetworkSpecificDelegatorParamsCall,
            N,
        > {
            self.call_builder(
                &getOperatorNetworkSpecificDelegatorParamsCall {
                    operator,
                    defaultAdminRoleHolder,
                    hook,
                    hookSetRoleHolder,
                },
            )
        }
        ///Creates a new call builder for the [`getSlasherParams_0`] function.
        pub fn getSlasherParams_0(
            &self,
            isBurnerHook: bool,
        ) -> alloy_contract::SolCallBuilder<&P, getSlasherParams_0Call, N> {
            self.call_builder(
                &getSlasherParams_0Call {
                    isBurnerHook,
                },
            )
        }
        ///Creates a new call builder for the [`getSlasherParams_1`] function.
        pub fn getSlasherParams_1(
            &self,
            config: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
        ) -> alloy_contract::SolCallBuilder<&P, getSlasherParams_1Call, N> {
            self.call_builder(&getSlasherParams_1Call { config })
        }
        ///Creates a new call builder for the [`getVaultParams_0`] function.
        pub fn getVaultParams_0(
            &self,
            config: <IOpNetVaultAutoDeploy::AutoDeployConfig as alloy::sol_types::SolType>::RustType,
        ) -> alloy_contract::SolCallBuilder<&P, getVaultParams_0Call, N> {
            self.call_builder(&getVaultParams_0Call { config })
        }
        ///Creates a new call builder for the [`getVaultParams_1`] function.
        pub fn getVaultParams_1(
            &self,
            params: <IVault::InitParams as alloy::sol_types::SolType>::RustType,
        ) -> alloy_contract::SolCallBuilder<&P, getVaultParams_1Call, N> {
            self.call_builder(&getVaultParams_1Call { params })
        }
        ///Creates a new call builder for the [`getVaultTokenizedParams`] function.
        pub fn getVaultTokenizedParams(
            &self,
            baseParams: <IVault::InitParams as alloy::sol_types::SolType>::RustType,
            name: alloy::sol_types::private::String,
            symbol: alloy::sol_types::private::String,
        ) -> alloy_contract::SolCallBuilder<&P, getVaultTokenizedParamsCall, N> {
            self.call_builder(
                &getVaultTokenizedParamsCall {
                    baseParams,
                    name,
                    symbol,
                },
            )
        }
        ///Creates a new call builder for the [`getVetoSlasherParams`] function.
        pub fn getVetoSlasherParams(
            &self,
            isBurnerHook: bool,
            vetoDuration: alloy::sol_types::private::primitives::aliases::U48,
            resolverSetEpochsDelay: alloy::sol_types::private::primitives::aliases::U256,
        ) -> alloy_contract::SolCallBuilder<&P, getVetoSlasherParamsCall, N> {
            self.call_builder(
                &getVetoSlasherParamsCall {
                    isBurnerHook,
                    vetoDuration,
                    resolverSetEpochsDelay,
                },
            )
        }
        ///Creates a new call builder for the [`isAutoDeployEnabled`] function.
        pub fn isAutoDeployEnabled(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, isAutoDeployEnabledCall, N> {
            self.call_builder(&isAutoDeployEnabledCall)
        }
        ///Creates a new call builder for the [`isSetMaxNetworkLimitHookEnabled`] function.
        pub fn isSetMaxNetworkLimitHookEnabled(
            &self,
        ) -> alloy_contract::SolCallBuilder<&P, isSetMaxNetworkLimitHookEnabledCall, N> {
            self.call_builder(&isSetMaxNetworkLimitHookEnabledCall)
        }
    }
    /// Event filters.
    impl<
        P: alloy_contract::private::Provider<N>,
        N: alloy_contract::private::Network,
    > OpNetVaultAutoDeployLogicInstance<P, N> {
        /// Creates a new event filter using this contract instance's provider and address.
        ///
        /// Note that the type can be any event, not just those defined in this contract.
        /// Prefer using the other methods for building type-safe event filters.
        pub fn event_filter<E: alloy_sol_types::SolEvent>(
            &self,
        ) -> alloy_contract::Event<&P, E, N> {
            alloy_contract::Event::new_sol(&self.provider, &self.address)
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
    }
}
