//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AggregatorV3Interface
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const aggregatorV3InterfaceAbi = [
  {
    type: "function",
    inputs: [],
    name: "decimals",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "description",
    outputs: [{ name: "", internalType: "string", type: "string" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "_roundId", internalType: "uint80", type: "uint80" }],
    name: "getRoundData",
    outputs: [
      { name: "roundId", internalType: "uint80", type: "uint80" },
      { name: "answer", internalType: "int256", type: "int256" },
      { name: "startedAt", internalType: "uint256", type: "uint256" },
      { name: "updatedAt", internalType: "uint256", type: "uint256" },
      { name: "answeredInRound", internalType: "uint80", type: "uint80" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "latestRoundData",
    outputs: [
      { name: "roundId", internalType: "uint80", type: "uint80" },
      { name: "answer", internalType: "int256", type: "int256" },
      { name: "startedAt", internalType: "uint256", type: "uint256" },
      { name: "updatedAt", internalType: "uint256", type: "uint256" },
      { name: "answeredInRound", internalType: "uint80", type: "uint80" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "version",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// BaseRewards
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const baseRewardsAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operatorRewards", internalType: "address", type: "address" },
      { name: "token", internalType: "address", type: "address" },
      { name: "amount", internalType: "uint256", type: "uint256" },
      { name: "root", internalType: "bytes32", type: "bytes32" },
    ],
    name: "distributeOperatorRewards",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "stakerRewards", internalType: "address", type: "address" },
      { name: "token", internalType: "address", type: "address" },
      { name: "amount", internalType: "uint256", type: "uint256" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "distributeStakerRewards",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getRewarder",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "rewarder", internalType: "address", type: "address" }],
    name: "setRewarder",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operatorRewards", internalType: "address", type: "address", indexed: true },
      { name: "token", internalType: "address", type: "address", indexed: true },
      { name: "amount", internalType: "uint256", type: "uint256", indexed: false },
      { name: "root", internalType: "bytes32", type: "bytes32", indexed: false },
    ],
    name: "DistributeOperatorRewards",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "stakerRewards", internalType: "address", type: "address", indexed: true },
      { name: "token", internalType: "address", type: "address", indexed: true },
      { name: "amount", internalType: "uint256", type: "uint256", indexed: false },
      { name: "data", internalType: "bytes", type: "bytes", indexed: false },
    ],
    name: "DistributeStakerRewards",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "rewarder", internalType: "address", type: "address", indexed: false }],
    name: "SetRewarder",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "BaseRewards_NotRewarder" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// BaseSlashing
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const baseSlashingAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "slashIndex", internalType: "uint256", type: "uint256" },
      { name: "hints", internalType: "bytes", type: "bytes" },
    ],
    name: "executeSlashVault",
    outputs: [
      { name: "success", internalType: "bool", type: "bool" },
      { name: "slashedAmount", internalType: "uint256", type: "uint256" },
    ],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlasher",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "slasher", internalType: "address", type: "address" }],
    name: "setSlasher",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "operator", internalType: "address", type: "address" },
      { name: "amount", internalType: "uint256", type: "uint256" },
      { name: "hints", internalType: "bytes", type: "bytes" },
    ],
    name: "slashVault",
    outputs: [
      { name: "success", internalType: "bool", type: "bool" },
      { name: "response", internalType: "bytes", type: "bytes" },
    ],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "slasher", internalType: "address", type: "address", indexed: true },
      { name: "slashIndex", internalType: "uint256", type: "uint256", indexed: true },
      { name: "success", internalType: "bool", type: "bool", indexed: true },
      { name: "slashedAmount", internalType: "uint256", type: "uint256", indexed: false },
    ],
    name: "ExecuteSlash",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "slasher", internalType: "address", type: "address", indexed: true },
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "success", internalType: "bool", type: "bool", indexed: true },
      { name: "slashedAmount", internalType: "uint256", type: "uint256", indexed: false },
    ],
    name: "InstantSlash",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "slasher", internalType: "address", type: "address", indexed: false }],
    name: "SetSlasher",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "slasher", internalType: "address", type: "address", indexed: true },
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "success", internalType: "bool", type: "bool", indexed: true },
      { name: "slashIndex", internalType: "uint256", type: "uint256", indexed: false },
    ],
    name: "VetoSlash",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "BaseSlashing_NoSlasher" },
  { type: "error", inputs: [], name: "BaseSlashing_NoSlashing" },
  { type: "error", inputs: [], name: "BaseSlashing_NotSlasher" },
  { type: "error", inputs: [], name: "BaseSlashing_NotVetoSlasher" },
  { type: "error", inputs: [], name: "BaseSlashing_UnknownSlasherType" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// EpochManager
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const epochManagerAbi = [
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpoch",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpochDuration",
    outputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getEpochDuration",
    outputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getEpochIndex",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpoch",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpochDuration",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48" }],
    name: "setEpochDuration",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "epochDuration", internalType: "uint48", type: "uint48", indexed: false },
      { name: "epochDurationTimestamp", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "InitEpochDuration",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48", indexed: false }],
    name: "SetEpochDuration",
  },
  { type: "error", inputs: [], name: "CheckpointUnorderedInsertion" },
  { type: "error", inputs: [], name: "EpochManager_InvalidEpochDuration" },
  { type: "error", inputs: [], name: "EpochManager_InvalidEpochDurationTimestamp" },
  { type: "error", inputs: [], name: "EpochManager_TooOldTimestamp" },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// EqualStakeVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const equalStakeVpCalcAbi = [
  {
    type: "function",
    inputs: [
      { name: "", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "", internalType: "bytes", type: "bytes" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IBaseRewards
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iBaseRewardsAbi = [
  {
    type: "function",
    inputs: [
      { name: "operatorRewards", internalType: "address", type: "address" },
      { name: "token", internalType: "address", type: "address" },
      { name: "amount", internalType: "uint256", type: "uint256" },
      { name: "root", internalType: "bytes32", type: "bytes32" },
    ],
    name: "distributeOperatorRewards",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "stakerRewards", internalType: "address", type: "address" },
      { name: "token", internalType: "address", type: "address" },
      { name: "amount", internalType: "uint256", type: "uint256" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "distributeStakerRewards",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "getRewarder",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "rewarder", internalType: "address", type: "address" }],
    name: "setRewarder",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operatorRewards", internalType: "address", type: "address", indexed: true },
      { name: "token", internalType: "address", type: "address", indexed: true },
      { name: "amount", internalType: "uint256", type: "uint256", indexed: false },
      { name: "root", internalType: "bytes32", type: "bytes32", indexed: false },
    ],
    name: "DistributeOperatorRewards",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "stakerRewards", internalType: "address", type: "address", indexed: true },
      { name: "token", internalType: "address", type: "address", indexed: true },
      { name: "amount", internalType: "uint256", type: "uint256", indexed: false },
      { name: "data", internalType: "bytes", type: "bytes", indexed: false },
    ],
    name: "DistributeStakerRewards",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "rewarder", internalType: "address", type: "address", indexed: false }],
    name: "SetRewarder",
  },
  { type: "error", inputs: [], name: "BaseRewards_NotRewarder" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IBaseSlashing
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iBaseSlashingAbi = [
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "slashIndex", internalType: "uint256", type: "uint256" },
      { name: "hints", internalType: "bytes", type: "bytes" },
    ],
    name: "executeSlashVault",
    outputs: [
      { name: "success", internalType: "bool", type: "bool" },
      { name: "slashedAmount", internalType: "uint256", type: "uint256" },
    ],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlasher",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "slasher", internalType: "address", type: "address" }],
    name: "setSlasher",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "operator", internalType: "address", type: "address" },
      { name: "amount", internalType: "uint256", type: "uint256" },
      { name: "hints", internalType: "bytes", type: "bytes" },
    ],
    name: "slashVault",
    outputs: [
      { name: "success", internalType: "bool", type: "bool" },
      { name: "response", internalType: "bytes", type: "bytes" },
    ],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "slasher", internalType: "address", type: "address", indexed: true },
      { name: "slashIndex", internalType: "uint256", type: "uint256", indexed: true },
      { name: "success", internalType: "bool", type: "bool", indexed: true },
      { name: "slashedAmount", internalType: "uint256", type: "uint256", indexed: false },
    ],
    name: "ExecuteSlash",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "slasher", internalType: "address", type: "address", indexed: true },
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "success", internalType: "bool", type: "bool", indexed: true },
      { name: "slashedAmount", internalType: "uint256", type: "uint256", indexed: false },
    ],
    name: "InstantSlash",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "slasher", internalType: "address", type: "address", indexed: false }],
    name: "SetSlasher",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "slasher", internalType: "address", type: "address", indexed: true },
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "success", internalType: "bool", type: "bool", indexed: true },
      { name: "slashIndex", internalType: "uint256", type: "uint256", indexed: false },
    ],
    name: "VetoSlash",
  },
  { type: "error", inputs: [], name: "BaseSlashing_NoSlasher" },
  { type: "error", inputs: [], name: "BaseSlashing_NoSlashing" },
  { type: "error", inputs: [], name: "BaseSlashing_NotSlasher" },
  { type: "error", inputs: [], name: "BaseSlashing_NotVetoSlasher" },
  { type: "error", inputs: [], name: "BaseSlashing_UnknownSlasherType" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IEpochManager
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iEpochManagerAbi = [
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpoch",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpochDuration",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getEpochDuration",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getEpochIndex",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpoch",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpochDuration",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48" }],
    name: "setEpochDuration",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "epochDuration", internalType: "uint48", type: "uint48", indexed: false },
      { name: "epochDurationTimestamp", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "InitEpochDuration",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48", indexed: false }],
    name: "SetEpochDuration",
  },
  { type: "error", inputs: [], name: "EpochManager_InvalidEpochDuration" },
  { type: "error", inputs: [], name: "EpochManager_InvalidEpochDurationTimestamp" },
  { type: "error", inputs: [], name: "EpochManager_TooOldTimestamp" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IEqualStakeVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iEqualStakeVpCalcAbi = [] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IKeyRegistry
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iKeyRegistryAbi = [
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "tag", internalType: "uint8", type: "uint8" },
    ],
    name: "getKey",
    outputs: [{ name: "", internalType: "bytes", type: "bytes" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "tag", internalType: "uint8", type: "uint8" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getKeyAt",
    outputs: [{ name: "", internalType: "bytes", type: "bytes" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getKeys",
    outputs: [
      {
        name: "",
        internalType: "struct IKeyRegistry.OperatorWithKeys[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "keys",
            internalType: "struct IKeyRegistry.Key[]",
            type: "tuple[]",
            components: [
              { name: "tag", internalType: "uint8", type: "uint8" },
              { name: "payload", internalType: "bytes", type: "bytes" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getKeys",
    outputs: [
      {
        name: "",
        internalType: "struct IKeyRegistry.Key[]",
        type: "tuple[]",
        components: [
          { name: "tag", internalType: "uint8", type: "uint8" },
          { name: "payload", internalType: "bytes", type: "bytes" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getKeysAt",
    outputs: [
      {
        name: "",
        internalType: "struct IKeyRegistry.OperatorWithKeys[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "keys",
            internalType: "struct IKeyRegistry.Key[]",
            type: "tuple[]",
            components: [
              { name: "tag", internalType: "uint8", type: "uint8" },
              { name: "payload", internalType: "bytes", type: "bytes" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getKeysAt",
    outputs: [
      {
        name: "",
        internalType: "struct IKeyRegistry.Key[]",
        type: "tuple[]",
        components: [
          { name: "tag", internalType: "uint8", type: "uint8" },
          { name: "payload", internalType: "bytes", type: "bytes" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getKeysOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getKeysOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getKeysOperatorsLength",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "key", internalType: "bytes", type: "bytes" }],
    name: "getOperator",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "tag", internalType: "uint8", type: "uint8" },
      { name: "key", internalType: "bytes", type: "bytes" },
      { name: "signature", internalType: "bytes", type: "bytes" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "setKey",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "tag", internalType: "uint8", type: "uint8", indexed: true },
      { name: "key", internalType: "bytes", type: "bytes", indexed: true },
      { name: "extraData", internalType: "bytes", type: "bytes", indexed: false },
    ],
    name: "SetKey",
  },
  { type: "error", inputs: [], name: "KeyRegistry_AlreadyUsed" },
  { type: "error", inputs: [], name: "KeyRegistry_InvalidKeySignature" },
  { type: "error", inputs: [], name: "KeyRegistry_InvalidKeyType" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IMultiToken
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iMultiTokenAbi = [
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "registerToken",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "unregisterToken",
    outputs: [],
    stateMutability: "nonpayable",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// INetworkManager
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iNetworkManagerAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// INormalizedTokenDecimalsVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iNormalizedTokenDecimalsVpCalcAbi = [] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOpNetVaultAutoDeploy
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOpNetVaultAutoDeployAbi = [
  {
    type: "function",
    inputs: [],
    name: "VAULT_CONFIGURATOR",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getAutoDeployConfig",
    outputs: [
      {
        name: "",
        internalType: "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        type: "tuple",
        components: [
          { name: "epochDuration", internalType: "uint48", type: "uint48" },
          { name: "collateral", internalType: "address", type: "address" },
          { name: "burner", internalType: "address", type: "address" },
          { name: "withSlasher", internalType: "bool", type: "bool" },
          { name: "isBurnerHook", internalType: "bool", type: "bool" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getAutoDeployedVault",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "isAutoDeployEnabled",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "isSetMaxNetworkLimitHookEnabled",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "config",
        internalType: "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        type: "tuple",
        components: [
          { name: "epochDuration", internalType: "uint48", type: "uint48" },
          { name: "collateral", internalType: "address", type: "address" },
          { name: "burner", internalType: "address", type: "address" },
          { name: "withSlasher", internalType: "bool", type: "bool" },
          { name: "isBurnerHook", internalType: "bool", type: "bool" },
        ],
      },
    ],
    name: "setAutoDeployConfig",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "status", internalType: "bool", type: "bool" }],
    name: "setAutoDeployStatus",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "status", internalType: "bool", type: "bool" }],
    name: "setSetMaxNetworkLimitHookStatus",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "config",
        internalType: "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        type: "tuple",
        components: [
          { name: "epochDuration", internalType: "uint48", type: "uint48" },
          { name: "collateral", internalType: "address", type: "address" },
          { name: "burner", internalType: "address", type: "address" },
          { name: "withSlasher", internalType: "bool", type: "bool" },
          { name: "isBurnerHook", internalType: "bool", type: "bool" },
        ],
        indexed: false,
      },
    ],
    name: "SetAutoDeployConfig",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "status", internalType: "bool", type: "bool", indexed: false }],
    name: "SetAutoDeployStatus",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "status", internalType: "bool", type: "bool", indexed: false }],
    name: "SetSetMaxNetworkLimitHookStatus",
  },
  { type: "error", inputs: [], name: "OpNetVaultAutoDeploy_InvalidBurnerHook" },
  { type: "error", inputs: [], name: "OpNetVaultAutoDeploy_InvalidCollateral" },
  { type: "error", inputs: [], name: "OpNetVaultAutoDeploy_InvalidEpochDuration" },
  { type: "error", inputs: [], name: "OpNetVaultAutoDeploy_InvalidWithSlasher" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOperatorVaults
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOperatorVaultsAbi = [
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "registerOperatorVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "unregisterOperatorVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "unregisterOperatorVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOperatorsBlacklist
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOperatorsBlacklistAbi = [
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "blacklistOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorBlacklisted",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "unblacklistOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "BlacklistOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnblacklistOperator",
  },
  { type: "error", inputs: [], name: "OperatorsBlacklist_OperatorBlacklisted" },
  { type: "error", inputs: [], name: "OperatorsBlacklist_OperatorNotBlacklisted" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOperatorsJail
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOperatorsJailAbi = [
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorJailedUntil",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorJailed",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "duration", internalType: "uint48", type: "uint48" },
    ],
    name: "jailOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "unjailOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "JailOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnjailOperator",
  },
  { type: "error", inputs: [], name: "OperatorsJail_AlreadyJailed" },
  { type: "error", inputs: [], name: "OperatorsJail_InvalidDuration" },
  { type: "error", inputs: [], name: "OperatorsJail_OperatorJailed" },
  { type: "error", inputs: [], name: "OperatorsJail_OperatorNotJailed" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOperatorsWhitelist
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOperatorsWhitelistAbi = [
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorWhitelisted",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "isWhitelistEnabled",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "status", internalType: "bool", type: "bool" }],
    name: "setWhitelistStatus",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "unwhitelistOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "whitelistOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "status", internalType: "bool", type: "bool", indexed: false }],
    name: "SetWhitelistStatus",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnwhitelistOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "WhitelistOperator",
  },
  { type: "error", inputs: [], name: "OperatorsWhitelist_OperatorNotWhitelisted" },
  { type: "error", inputs: [], name: "OperatorsWhitelist_OperatorWhitelisted" },
  { type: "error", inputs: [], name: "OperatorsWhitelist_StatusAlreadySet" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOzAccessControl
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOzAccessControlAbi = [
  {
    type: "function",
    inputs: [{ name: "selector", internalType: "bytes4", type: "bytes4" }],
    name: "getRole",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "selector", internalType: "bytes4", type: "bytes4", indexed: true },
      { name: "role", internalType: "bytes32", type: "bytes32", indexed: true },
    ],
    name: "SetSelectorRole",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOzAccessManaged
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOzAccessManagedAbi = [] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOzEIP712
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOzEip712Abi = [
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IOzOwnable
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iOzOwnableAbi = [] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IPermissionManager
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iPermissionManagerAbi = [] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IPricedTokensChainlinkVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iPricedTokensChainlinkVpCalcAbi = [
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "getTokenHops",
    outputs: [
      { name: "", internalType: "address[2]", type: "address[2]" },
      { name: "", internalType: "bool[2]", type: "bool[2]" },
      { name: "", internalType: "uint48[2]", type: "uint48[2]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getTokenHopsAt",
    outputs: [
      { name: "", internalType: "address[2]", type: "address[2]" },
      { name: "", internalType: "bool[2]", type: "bool[2]" },
      { name: "", internalType: "uint48[2]", type: "uint48[2]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "getTokenPrice",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getTokenPriceAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "aggregators", internalType: "address[2]", type: "address[2]" },
      { name: "inverts", internalType: "bool[2]", type: "bool[2]" },
      { name: "stalenessDurations", internalType: "uint48[2]", type: "uint48[2]" },
    ],
    name: "setTokenHops",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "token", internalType: "address", type: "address", indexed: true },
      { name: "aggregators", internalType: "address[2]", type: "address[2]", indexed: false },
      { name: "inverts", internalType: "bool[2]", type: "bool[2]", indexed: false },
      { name: "stalenessDurations", internalType: "uint48[2]", type: "uint48[2]", indexed: false },
    ],
    name: "SetTokenHops",
  },
  { type: "error", inputs: [], name: "PricedTokensChainlinkVPCalc_InvalidAggregator" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ISettlement
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iSettlementAbi = [
  {
    type: "function",
    inputs: [],
    name: "VALIDATOR_SET_VERSION",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "header",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
      },
      {
        name: "extraData",
        internalType: "struct ISettlement.ExtraData[]",
        type: "tuple[]",
        components: [
          { name: "key", internalType: "bytes32", type: "bytes32" },
          { name: "value", internalType: "bytes32", type: "bytes32" },
        ],
      },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "commitValSetHeader",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "getCaptureTimestampFromValSetHeader",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getCaptureTimestampFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "key", internalType: "bytes32", type: "bytes32" }],
    name: "getExtraData",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "key", internalType: "bytes32", type: "bytes32" },
    ],
    name: "getExtraDataAt",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getLastCommittedHeaderEpoch",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getQuorumThresholdFromValSetHeader",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getQuorumThresholdFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getRequiredKeyTagFromValSetHeader",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getRequiredKeyTagFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSigVerifier",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSigVerifierAt",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTotalVotingPowerFromValSetHeader",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getTotalVotingPowerFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getValSetHeader",
    outputs: [
      {
        name: "",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getValSetHeaderAt",
    outputs: [
      {
        name: "",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getValSetHeaderHash",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getValSetHeaderHashAt",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getValidatorsSszMRootFromValSetHeader",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getValidatorsSszMRootFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getVersionFromValSetHeader",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getVersionFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "isValSetHeaderCommittedAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "valSetHeader",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
      },
      {
        name: "extraData",
        internalType: "struct ISettlement.ExtraData[]",
        type: "tuple[]",
        components: [
          { name: "key", internalType: "bytes32", type: "bytes32" },
          { name: "value", internalType: "bytes32", type: "bytes32" },
        ],
      },
    ],
    name: "setGenesis",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "sigVerifier", internalType: "address", type: "address" }],
    name: "setSigVerifier",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSig",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSigAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "valSetHeader",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
        indexed: false,
      },
      {
        name: "extraData",
        internalType: "struct ISettlement.ExtraData[]",
        type: "tuple[]",
        components: [
          { name: "key", internalType: "bytes32", type: "bytes32" },
          { name: "value", internalType: "bytes32", type: "bytes32" },
        ],
        indexed: false,
      },
    ],
    name: "CommitValSetHeader",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "sigVerifier", internalType: "address", type: "address", indexed: false }],
    name: "InitSigVerifier",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "valSetHeader",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
        indexed: false,
      },
      {
        name: "extraData",
        internalType: "struct ISettlement.ExtraData[]",
        type: "tuple[]",
        components: [
          { name: "key", internalType: "bytes32", type: "bytes32" },
          { name: "value", internalType: "bytes32", type: "bytes32" },
        ],
        indexed: false,
      },
    ],
    name: "SetGenesis",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "sigVerifier", internalType: "address", type: "address", indexed: false }],
    name: "SetSigVerifier",
  },
  { type: "error", inputs: [], name: "Settlement_DuplicateExtraDataKey" },
  { type: "error", inputs: [], name: "Settlement_InvalidCaptureTimestamp" },
  { type: "error", inputs: [], name: "Settlement_InvalidEpoch" },
  { type: "error", inputs: [], name: "Settlement_InvalidSigVerifier" },
  { type: "error", inputs: [], name: "Settlement_InvalidValidatorsSszMRoot" },
  { type: "error", inputs: [], name: "Settlement_InvalidVersion" },
  { type: "error", inputs: [], name: "Settlement_QuorumThresholdGtTotalVotingPower" },
  { type: "error", inputs: [], name: "Settlement_ValSetHeaderAlreadyCommitted" },
  { type: "error", inputs: [], name: "Settlement_VerificationFailed" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ISharedVaults
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iSharedVaultsAbi = [
  {
    type: "function",
    inputs: [{ name: "sharedVault", internalType: "address", type: "address" }],
    name: "registerSharedVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "sharedVault", internalType: "address", type: "address" }],
    name: "unregisterSharedVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ISigVerifier
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iSigVerifierAbi = [
  {
    type: "function",
    inputs: [],
    name: "VERIFICATION_TYPE",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "settlement", internalType: "address", type: "address" },
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSig",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ISigVerifierBlsBn254Simple
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iSigVerifierBlsBn254SimpleAbi = [
  {
    type: "function",
    inputs: [],
    name: "AGGREGATED_PUBLIC_KEY_G1_HASH",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "MAX_VALIDATORS",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VALIDATOR_SET_HASH_KECCAK256_HASH",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VERIFICATION_TYPE",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "settlement", internalType: "address", type: "address" },
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSig",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidMessageLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidNonSignerIndex" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidNonSignersOrder" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidProofLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidProofOffset" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_TooManyValidators" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_UnsupportedKeyTag" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ISigVerifierBlsBn254ZK
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iSigVerifierBlsBn254ZkAbi = [
  {
    type: "function",
    inputs: [],
    name: "TOTAL_ACTIVE_VALIDATORS_HASH",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VALIDATOR_SET_HASH_MIMC_HASH",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VERIFICATION_TYPE",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "index", internalType: "uint256", type: "uint256" }],
    name: "maxValidators",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "index", internalType: "uint256", type: "uint256" }],
    name: "verifiers",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "settlement", internalType: "address", type: "address" },
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSig",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidMaxValidators" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidMaxValidatorsOrder" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidMessageLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidProofLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidProofOffset" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidTotalActiveValidators" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidVerifier" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_UnsupportedKeyTag" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IValSetDriver
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iValSetDriverAbi = [
  {
    type: "function",
    inputs: [],
    name: "MAX_QUORUM_THRESHOLD",
    outputs: [{ name: "", internalType: "uint248", type: "uint248" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    name: "addQuorumThreshold",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "addSettlement",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "addVotingPowerProvider",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "getCommitterSlotDuration",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getCommitterSlotDurationAt",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getConfig",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.Config",
        type: "tuple",
        components: [
          { name: "numAggregators", internalType: "uint208", type: "uint208" },
          { name: "numCommitters", internalType: "uint208", type: "uint208" },
          { name: "committerSlotDuration", internalType: "uint48", type: "uint48" },
          {
            name: "votingPowerProviders",
            internalType: "struct IValSetDriver.CrossChainAddress[]",
            type: "tuple[]",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          {
            name: "keysProvider",
            internalType: "struct IValSetDriver.CrossChainAddress",
            type: "tuple",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          {
            name: "settlements",
            internalType: "struct IValSetDriver.CrossChainAddress[]",
            type: "tuple[]",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          { name: "maxVotingPower", internalType: "uint256", type: "uint256" },
          { name: "minInclusionVotingPower", internalType: "uint256", type: "uint256" },
          { name: "maxValidatorsCount", internalType: "uint208", type: "uint208" },
          { name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]" },
          {
            name: "quorumThresholds",
            internalType: "struct IValSetDriver.QuorumThreshold[]",
            type: "tuple[]",
            components: [
              { name: "keyTag", internalType: "uint8", type: "uint8" },
              { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
            ],
          },
          { name: "requiredHeaderKeyTag", internalType: "uint8", type: "uint8" },
          { name: "verificationType", internalType: "uint32", type: "uint32" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getConfigAt",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.Config",
        type: "tuple",
        components: [
          { name: "numAggregators", internalType: "uint208", type: "uint208" },
          { name: "numCommitters", internalType: "uint208", type: "uint208" },
          { name: "committerSlotDuration", internalType: "uint48", type: "uint48" },
          {
            name: "votingPowerProviders",
            internalType: "struct IValSetDriver.CrossChainAddress[]",
            type: "tuple[]",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          {
            name: "keysProvider",
            internalType: "struct IValSetDriver.CrossChainAddress",
            type: "tuple",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          {
            name: "settlements",
            internalType: "struct IValSetDriver.CrossChainAddress[]",
            type: "tuple[]",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          { name: "maxVotingPower", internalType: "uint256", type: "uint256" },
          { name: "minInclusionVotingPower", internalType: "uint256", type: "uint256" },
          { name: "maxValidatorsCount", internalType: "uint208", type: "uint208" },
          { name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]" },
          {
            name: "quorumThresholds",
            internalType: "struct IValSetDriver.QuorumThreshold[]",
            type: "tuple[]",
            components: [
              { name: "keyTag", internalType: "uint8", type: "uint8" },
              { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
            ],
          },
          { name: "requiredHeaderKeyTag", internalType: "uint8", type: "uint8" },
          { name: "verificationType", internalType: "uint32", type: "uint32" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getKeysProvider",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getKeysProviderAt",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getMaxValidatorsCount",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getMaxValidatorsCountAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getMaxVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getMaxVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getMinInclusionVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getMinInclusionVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNumAggregators",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getNumAggregatorsAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNumCommitters",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getNumCommittersAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getQuorumThresholds",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.QuorumThreshold[]",
        type: "tuple[]",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getQuorumThresholdsAt",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.QuorumThreshold[]",
        type: "tuple[]",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getRequiredHeaderKeyTag",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getRequiredHeaderKeyTagAt",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getRequiredKeyTags",
    outputs: [{ name: "", internalType: "uint8[]", type: "uint8[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getRequiredKeyTagsAt",
    outputs: [{ name: "", internalType: "uint8[]", type: "uint8[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSettlements",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.CrossChainAddress[]",
        type: "tuple[]",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSettlementsAt",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.CrossChainAddress[]",
        type: "tuple[]",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getVerificationType",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getVerificationTypeAt",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getVotingPowerProviders",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.CrossChainAddress[]",
        type: "tuple[]",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getVotingPowerProvidersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.CrossChainAddress[]",
        type: "tuple[]",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    name: "isQuorumThresholdRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isQuorumThresholdRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "isSettlementRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSettlementRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "isVotingPowerProviderRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isVotingPowerProviderRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    name: "removeQuorumThreshold",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "removeSettlement",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "removeVotingPowerProvider",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "slotDuration", internalType: "uint48", type: "uint48" }],
    name: "setCommitterSlotDuration",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "keysProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "setKeysProvider",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "maxValidatorsCount", internalType: "uint208", type: "uint208" }],
    name: "setMaxValidatorsCount",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "maxVotingPower", internalType: "uint256", type: "uint256" }],
    name: "setMaxVotingPower",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "minInclusionVotingPower", internalType: "uint256", type: "uint256" }],
    name: "setMinInclusionVotingPower",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "numAggregators", internalType: "uint208", type: "uint208" }],
    name: "setNumAggregators",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "numCommitters", internalType: "uint208", type: "uint208" }],
    name: "setNumCommitters",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "requiredHeaderKeyTag", internalType: "uint8", type: "uint8" }],
    name: "setRequiredHeaderKeyTag",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]" }],
    name: "setRequiredKeyTags",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "verificationType", internalType: "uint32", type: "uint32" }],
    name: "setVerificationType",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
        indexed: false,
      },
    ],
    name: "AddQuorumThreshold",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "AddSettlement",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "AddVotingPowerProvider",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
        indexed: false,
      },
    ],
    name: "RemoveQuorumThreshold",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "RemoveSettlement",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "RemoveVotingPowerProvider",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "committerSlotDuration", internalType: "uint48", type: "uint48", indexed: false }],
    name: "SetCommitterSlotDuration",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "keysProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "SetKeysProvider",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "maxValidatorsCount", internalType: "uint208", type: "uint208", indexed: false }],
    name: "SetMaxValidatorsCount",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "maxVotingPower", internalType: "uint256", type: "uint256", indexed: false }],
    name: "SetMaxVotingPower",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "minInclusionVotingPower", internalType: "uint256", type: "uint256", indexed: false }],
    name: "SetMinInclusionVotingPower",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "numAggregators", internalType: "uint208", type: "uint208", indexed: false }],
    name: "SetNumAggregators",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "numCommitters", internalType: "uint208", type: "uint208", indexed: false }],
    name: "SetNumCommitters",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "requiredHeaderKeyTag", internalType: "uint8", type: "uint8", indexed: false }],
    name: "SetRequiredHeaderKeyTag",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]", indexed: false }],
    name: "SetRequiredKeyTags",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "verificationType", internalType: "uint32", type: "uint32", indexed: false }],
    name: "SetVerificationType",
  },
  { type: "error", inputs: [], name: "ValSetDriver_ChainAlreadyAdded" },
  { type: "error", inputs: [], name: "ValSetDriver_InvalidCrossChainAddress" },
  { type: "error", inputs: [], name: "ValSetDriver_InvalidMaxValidatorsCount" },
  { type: "error", inputs: [], name: "ValSetDriver_InvalidQuorumThreshold" },
  { type: "error", inputs: [], name: "ValSetDriver_KeyTagAlreadyAdded" },
  { type: "error", inputs: [], name: "ValSetDriver_NotAdded" },
  { type: "error", inputs: [], name: "ValSetDriver_ZeroCommitterSlotDuration" },
  { type: "error", inputs: [], name: "ValSetDriver_ZeroNumAggregators" },
  { type: "error", inputs: [], name: "ValSetDriver_ZeroNumCommitters" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IVerifier
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iVerifierAbi = [
  {
    type: "function",
    inputs: [
      { name: "proof", internalType: "uint256[8]", type: "uint256[8]" },
      { name: "commitments", internalType: "uint256[2]", type: "uint256[2]" },
      { name: "commitmentPok", internalType: "uint256[2]", type: "uint256[2]" },
      { name: "input", internalType: "uint256[1]", type: "uint256[1]" },
    ],
    name: "verifyProof",
    outputs: [],
    stateMutability: "view",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IVotingPowerCalcManager
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iVotingPowerCalcManagerAbi = [
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IVotingPowerProvider
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iVotingPowerProviderAbi = [
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool" },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool" },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IWeightedTokensVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iWeightedTokensVpCalcAbi = [
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "getTokenWeight",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getTokenWeightAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "weight", internalType: "uint208", type: "uint208" },
    ],
    name: "setTokenWeight",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "token", internalType: "address", type: "address", indexed: true },
      { name: "weight", internalType: "uint208", type: "uint208", indexed: false },
    ],
    name: "SetTokenWeight",
  },
  { type: "error", inputs: [], name: "WeightedTokensVPCalc_TooLargeWeight" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IWeightedVaultsVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iWeightedVaultsVpCalcAbi = [
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "getVaultWeight",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVaultWeightAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "weight", internalType: "uint208", type: "uint208" },
    ],
    name: "setVaultWeight",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "vault", internalType: "address", type: "address", indexed: true },
      { name: "weight", internalType: "uint208", type: "uint208", indexed: false },
    ],
    name: "SetVaultWeight",
  },
  { type: "error", inputs: [], name: "WeightedVaultsVPCalc_TooLargeWeight" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// KeyRegistry
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const keyRegistryAbi = [
  {
    type: "function",
    inputs: [
      {
        name: "keyRegistryInitParams",
        internalType: "struct IKeyRegistry.KeyRegistryInitParams",
        type: "tuple",
        components: [
          {
            name: "ozEip712InitParams",
            internalType: "struct IOzEIP712.OzEIP712InitParams",
            type: "tuple",
            components: [
              { name: "name", internalType: "string", type: "string" },
              { name: "version", internalType: "string", type: "string" },
            ],
          },
        ],
      },
    ],
    name: "__KeyRegistry_init",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "tag", internalType: "uint8", type: "uint8" },
    ],
    name: "getKey",
    outputs: [{ name: "", internalType: "bytes", type: "bytes" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "tag", internalType: "uint8", type: "uint8" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getKeyAt",
    outputs: [{ name: "", internalType: "bytes", type: "bytes" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getKeys",
    outputs: [
      {
        name: "operatorsKeys",
        internalType: "struct IKeyRegistry.OperatorWithKeys[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "keys",
            internalType: "struct IKeyRegistry.Key[]",
            type: "tuple[]",
            components: [
              { name: "tag", internalType: "uint8", type: "uint8" },
              { name: "payload", internalType: "bytes", type: "bytes" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getKeys",
    outputs: [
      {
        name: "keys",
        internalType: "struct IKeyRegistry.Key[]",
        type: "tuple[]",
        components: [
          { name: "tag", internalType: "uint8", type: "uint8" },
          { name: "payload", internalType: "bytes", type: "bytes" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getKeysAt",
    outputs: [
      {
        name: "operatorsKeys",
        internalType: "struct IKeyRegistry.OperatorWithKeys[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "keys",
            internalType: "struct IKeyRegistry.Key[]",
            type: "tuple[]",
            components: [
              { name: "tag", internalType: "uint8", type: "uint8" },
              { name: "payload", internalType: "bytes", type: "bytes" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getKeysAt",
    outputs: [
      {
        name: "keys",
        internalType: "struct IKeyRegistry.Key[]",
        type: "tuple[]",
        components: [
          { name: "tag", internalType: "uint8", type: "uint8" },
          { name: "payload", internalType: "bytes", type: "bytes" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getKeysOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getKeysOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getKeysOperatorsLength",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "key", internalType: "bytes", type: "bytes" }],
    name: "getOperator",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "tag", internalType: "uint8", type: "uint8" },
      { name: "key", internalType: "bytes", type: "bytes" },
      { name: "signature", internalType: "bytes", type: "bytes" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "setKey",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "tag", internalType: "uint8", type: "uint8", indexed: true },
      { name: "key", internalType: "bytes", type: "bytes", indexed: true },
      { name: "extraData", internalType: "bytes", type: "bytes", indexed: false },
    ],
    name: "SetKey",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "CheckpointUnorderedInsertion" },
  { type: "error", inputs: [], name: "FailedCall" },
  { type: "error", inputs: [{ name: "", internalType: "bytes", type: "bytes" }], name: "InvalidDSTLength" },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "InvalidKeyTag" },
  { type: "error", inputs: [], name: "KeyBlsBls12381_InvalidBytes" },
  { type: "error", inputs: [], name: "KeyBlsBls12381_InvalidKey" },
  { type: "error", inputs: [], name: "KeyBlsBn254_InvalidBytes" },
  { type: "error", inputs: [], name: "KeyBlsBn254_InvalidKey" },
  { type: "error", inputs: [], name: "KeyEcdsaSecp256k1_InvalidBytes" },
  { type: "error", inputs: [], name: "KeyRegistry_AlreadyUsed" },
  { type: "error", inputs: [], name: "KeyRegistry_InvalidKeySignature" },
  { type: "error", inputs: [], name: "KeyRegistry_InvalidKeyType" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "SigBlsBls12381_InvalidMessageLength" },
  { type: "error", inputs: [], name: "SigBlsBn254_InvalidMessageLength" },
  { type: "error", inputs: [], name: "SigEcdsaSecp256k1_InvalidMessageLength" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MultiToken
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const multiTokenAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "registerToken",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "unregisterToken",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// NetworkManager
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const networkManagerAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// NormalizedTokenDecimalsVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const normalizedTokenDecimalsVpCalcAbi = [
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OpNetVaultAutoDeploy
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const opNetVaultAutoDeployAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_CONFIGURATOR",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getAutoDeployConfig",
    outputs: [
      {
        name: "",
        internalType: "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        type: "tuple",
        components: [
          { name: "epochDuration", internalType: "uint48", type: "uint48" },
          { name: "collateral", internalType: "address", type: "address" },
          { name: "burner", internalType: "address", type: "address" },
          { name: "withSlasher", internalType: "bool", type: "bool" },
          { name: "isBurnerHook", internalType: "bool", type: "bool" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getAutoDeployedVault",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [],
    name: "isAutoDeployEnabled",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "isSetMaxNetworkLimitHookEnabled",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "config",
        internalType: "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        type: "tuple",
        components: [
          { name: "epochDuration", internalType: "uint48", type: "uint48" },
          { name: "collateral", internalType: "address", type: "address" },
          { name: "burner", internalType: "address", type: "address" },
          { name: "withSlasher", internalType: "bool", type: "bool" },
          { name: "isBurnerHook", internalType: "bool", type: "bool" },
        ],
      },
    ],
    name: "setAutoDeployConfig",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "status", internalType: "bool", type: "bool" }],
    name: "setAutoDeployStatus",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "status", internalType: "bool", type: "bool" }],
    name: "setSetMaxNetworkLimitHookStatus",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "config",
        internalType: "struct IOpNetVaultAutoDeploy.AutoDeployConfig",
        type: "tuple",
        components: [
          { name: "epochDuration", internalType: "uint48", type: "uint48" },
          { name: "collateral", internalType: "address", type: "address" },
          { name: "burner", internalType: "address", type: "address" },
          { name: "withSlasher", internalType: "bool", type: "bool" },
          { name: "isBurnerHook", internalType: "bool", type: "bool" },
        ],
        indexed: false,
      },
    ],
    name: "SetAutoDeployConfig",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "status", internalType: "bool", type: "bool", indexed: false }],
    name: "SetAutoDeployStatus",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "status", internalType: "bool", type: "bool", indexed: false }],
    name: "SetSetMaxNetworkLimitHookStatus",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "OpNetVaultAutoDeploy_InvalidBurnerHook" },
  { type: "error", inputs: [], name: "OpNetVaultAutoDeploy_InvalidCollateral" },
  { type: "error", inputs: [], name: "OpNetVaultAutoDeploy_InvalidEpochDuration" },
  { type: "error", inputs: [], name: "OpNetVaultAutoDeploy_InvalidWithSlasher" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OperatorVaults
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const operatorVaultsAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "registerOperatorVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "unregisterOperatorVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "unregisterOperatorVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OperatorsBlacklist
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const operatorsBlacklistAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "blacklistOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorBlacklisted",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "unblacklistOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "BlacklistOperator",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnblacklistOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "OperatorsBlacklist_OperatorBlacklisted" },
  { type: "error", inputs: [], name: "OperatorsBlacklist_OperatorNotBlacklisted" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OperatorsJail
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const operatorsJailAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorJailedUntil",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorJailed",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "duration", internalType: "uint48", type: "uint48" },
    ],
    name: "jailOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "unjailOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "JailOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnjailOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "OperatorsJail_AlreadyJailed" },
  { type: "error", inputs: [], name: "OperatorsJail_InvalidDuration" },
  { type: "error", inputs: [], name: "OperatorsJail_OperatorJailed" },
  { type: "error", inputs: [], name: "OperatorsJail_OperatorNotJailed" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OperatorsWhitelist
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const operatorsWhitelistAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorWhitelisted",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "isWhitelistEnabled",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "status", internalType: "bool", type: "bool" }],
    name: "setWhitelistStatus",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "unwhitelistOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "whitelistOperator",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "status", internalType: "bool", type: "bool", indexed: false }],
    name: "SetWhitelistStatus",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnwhitelistOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "WhitelistOperator",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "OperatorsWhitelist_OperatorNotWhitelisted" },
  { type: "error", inputs: [], name: "OperatorsWhitelist_OperatorWhitelisted" },
  { type: "error", inputs: [], name: "OperatorsWhitelist_StatusAlreadySet" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OzAccessControl
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ozAccessControlAbi = [
  {
    type: "function",
    inputs: [],
    name: "DEFAULT_ADMIN_ROLE",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "selector", internalType: "bytes4", type: "bytes4" }],
    name: "getRole",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "role", internalType: "bytes32", type: "bytes32" }],
    name: "getRoleAdmin",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "role", internalType: "bytes32", type: "bytes32" },
      { name: "account", internalType: "address", type: "address" },
    ],
    name: "grantRole",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "role", internalType: "bytes32", type: "bytes32" },
      { name: "account", internalType: "address", type: "address" },
    ],
    name: "hasRole",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "role", internalType: "bytes32", type: "bytes32" },
      { name: "callerConfirmation", internalType: "address", type: "address" },
    ],
    name: "renounceRole",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "role", internalType: "bytes32", type: "bytes32" },
      { name: "account", internalType: "address", type: "address" },
    ],
    name: "revokeRole",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "interfaceId", internalType: "bytes4", type: "bytes4" }],
    name: "supportsInterface",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "role", internalType: "bytes32", type: "bytes32", indexed: true },
      { name: "previousAdminRole", internalType: "bytes32", type: "bytes32", indexed: true },
      { name: "newAdminRole", internalType: "bytes32", type: "bytes32", indexed: true },
    ],
    name: "RoleAdminChanged",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "role", internalType: "bytes32", type: "bytes32", indexed: true },
      { name: "account", internalType: "address", type: "address", indexed: true },
      { name: "sender", internalType: "address", type: "address", indexed: true },
    ],
    name: "RoleGranted",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "role", internalType: "bytes32", type: "bytes32", indexed: true },
      { name: "account", internalType: "address", type: "address", indexed: true },
      { name: "sender", internalType: "address", type: "address", indexed: true },
    ],
    name: "RoleRevoked",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "selector", internalType: "bytes4", type: "bytes4", indexed: true },
      { name: "role", internalType: "bytes32", type: "bytes32", indexed: true },
    ],
    name: "SetSelectorRole",
  },
  { type: "error", inputs: [], name: "AccessControlBadConfirmation" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "neededRole", internalType: "bytes32", type: "bytes32" },
    ],
    name: "AccessControlUnauthorizedAccount",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OzAccessManaged
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ozAccessManagedAbi = [
  {
    type: "function",
    inputs: [],
    name: "authority",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "isConsumingScheduledOp",
    outputs: [{ name: "", internalType: "bytes4", type: "bytes4" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "newAuthority", internalType: "address", type: "address" }],
    name: "setAuthority",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "authority", internalType: "address", type: "address", indexed: false }],
    name: "AuthorityUpdated",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "error",
    inputs: [{ name: "authority", internalType: "address", type: "address" }],
    name: "AccessManagedInvalidAuthority",
  },
  {
    type: "error",
    inputs: [
      { name: "caller", internalType: "address", type: "address" },
      { name: "delay", internalType: "uint32", type: "uint32" },
    ],
    name: "AccessManagedRequiredDelay",
  },
  {
    type: "error",
    inputs: [{ name: "caller", internalType: "address", type: "address" }],
    name: "AccessManagedUnauthorized",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OzEIP712
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ozEip712Abi = [
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OzOwnable
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ozOwnableAbi = [
  {
    type: "function",
    inputs: [],
    name: "owner",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "renounceOwnership", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "newOwner", internalType: "address", type: "address" }],
    name: "transferOwnership",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "previousOwner", internalType: "address", type: "address", indexed: true },
      { name: "newOwner", internalType: "address", type: "address", indexed: true },
    ],
    name: "OwnershipTransferred",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [{ name: "owner", internalType: "address", type: "address" }], name: "OwnableInvalidOwner" },
  {
    type: "error",
    inputs: [{ name: "account", internalType: "address", type: "address" }],
    name: "OwnableUnauthorizedAccount",
  },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// PermissionManager
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const permissionManagerAbi = [
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// PricedTokensChainlinkVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const pricedTokensChainlinkVpCalcAbi = [
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "getTokenHops",
    outputs: [
      { name: "", internalType: "address[2]", type: "address[2]" },
      { name: "", internalType: "bool[2]", type: "bool[2]" },
      { name: "", internalType: "uint48[2]", type: "uint48[2]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getTokenHopsAt",
    outputs: [
      { name: "", internalType: "address[2]", type: "address[2]" },
      { name: "", internalType: "bool[2]", type: "bool[2]" },
      { name: "", internalType: "uint48[2]", type: "uint48[2]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "getTokenPrice",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getTokenPriceAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "aggregators", internalType: "address[2]", type: "address[2]" },
      { name: "inverts", internalType: "bool[2]", type: "bool[2]" },
      { name: "stalenessDurations", internalType: "uint48[2]", type: "uint48[2]" },
    ],
    name: "setTokenHops",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "token", internalType: "address", type: "address", indexed: true },
      { name: "aggregators", internalType: "address[2]", type: "address[2]", indexed: false },
      { name: "inverts", internalType: "bool[2]", type: "bool[2]", indexed: false },
      { name: "stalenessDurations", internalType: "uint48[2]", type: "uint48[2]", indexed: false },
    ],
    name: "SetTokenHops",
  },
  { type: "error", inputs: [], name: "CheckpointUnorderedInsertion" },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "PricedTokensChainlinkVPCalc_InvalidAggregator" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Settlement
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const settlementAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VALIDATOR_SET_VERSION",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "header",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
      },
      {
        name: "extraData",
        internalType: "struct ISettlement.ExtraData[]",
        type: "tuple[]",
        components: [
          { name: "key", internalType: "bytes32", type: "bytes32" },
          { name: "value", internalType: "bytes32", type: "bytes32" },
        ],
      },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "commitValSetHeader",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getCaptureTimestampFromValSetHeader",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getCaptureTimestampFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "key", internalType: "bytes32", type: "bytes32" }],
    name: "getExtraData",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "key", internalType: "bytes32", type: "bytes32" },
    ],
    name: "getExtraDataAt",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getLastCommittedHeaderEpoch",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getQuorumThresholdFromValSetHeader",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getQuorumThresholdFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getRequiredKeyTagFromValSetHeader",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getRequiredKeyTagFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSigVerifier",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSigVerifierAt",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTotalVotingPowerFromValSetHeader",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getTotalVotingPowerFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getValSetHeader",
    outputs: [
      {
        name: "header",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getValSetHeaderAt",
    outputs: [
      {
        name: "",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getValSetHeaderHash",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getValSetHeaderHashAt",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getValidatorsSszMRootFromValSetHeader",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getValidatorsSszMRootFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getVersionFromValSetHeader",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getVersionFromValSetHeaderAt",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "isValSetHeaderCommittedAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "valSetHeader",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
      },
      {
        name: "extraData",
        internalType: "struct ISettlement.ExtraData[]",
        type: "tuple[]",
        components: [
          { name: "key", internalType: "bytes32", type: "bytes32" },
          { name: "value", internalType: "bytes32", type: "bytes32" },
        ],
      },
    ],
    name: "setGenesis",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "sigVerifier", internalType: "address", type: "address" }],
    name: "setSigVerifier",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSig",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSigAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "valSetHeader",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
        indexed: false,
      },
      {
        name: "extraData",
        internalType: "struct ISettlement.ExtraData[]",
        type: "tuple[]",
        components: [
          { name: "key", internalType: "bytes32", type: "bytes32" },
          { name: "value", internalType: "bytes32", type: "bytes32" },
        ],
        indexed: false,
      },
    ],
    name: "CommitValSetHeader",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "sigVerifier", internalType: "address", type: "address", indexed: false }],
    name: "InitSigVerifier",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "valSetHeader",
        internalType: "struct ISettlement.ValSetHeader",
        type: "tuple",
        components: [
          { name: "version", internalType: "uint8", type: "uint8" },
          { name: "requiredKeyTag", internalType: "uint8", type: "uint8" },
          { name: "epoch", internalType: "uint48", type: "uint48" },
          { name: "captureTimestamp", internalType: "uint48", type: "uint48" },
          { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
          { name: "totalVotingPower", internalType: "uint256", type: "uint256" },
          { name: "validatorsSszMRoot", internalType: "bytes32", type: "bytes32" },
        ],
        indexed: false,
      },
      {
        name: "extraData",
        internalType: "struct ISettlement.ExtraData[]",
        type: "tuple[]",
        components: [
          { name: "key", internalType: "bytes32", type: "bytes32" },
          { name: "value", internalType: "bytes32", type: "bytes32" },
        ],
        indexed: false,
      },
    ],
    name: "SetGenesis",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "sigVerifier", internalType: "address", type: "address", indexed: false }],
    name: "SetSigVerifier",
  },
  { type: "error", inputs: [], name: "CheckpointUnorderedInsertion" },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "InvalidKeyTag" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "Settlement_DuplicateExtraDataKey" },
  { type: "error", inputs: [], name: "Settlement_InvalidCaptureTimestamp" },
  { type: "error", inputs: [], name: "Settlement_InvalidEpoch" },
  { type: "error", inputs: [], name: "Settlement_InvalidSigVerifier" },
  { type: "error", inputs: [], name: "Settlement_InvalidValidatorsSszMRoot" },
  { type: "error", inputs: [], name: "Settlement_InvalidVersion" },
  { type: "error", inputs: [], name: "Settlement_QuorumThresholdGtTotalVotingPower" },
  { type: "error", inputs: [], name: "Settlement_ValSetHeaderAlreadyCommitted" },
  { type: "error", inputs: [], name: "Settlement_VerificationFailed" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SharedVaults
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const sharedVaultsAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "sharedVault", internalType: "address", type: "address" }],
    name: "registerSharedVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "sharedVault", internalType: "address", type: "address" }],
    name: "unregisterSharedVault",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SigVerifierBlsBn254Simple
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const sigVerifierBlsBn254SimpleAbi = [
  {
    type: "function",
    inputs: [],
    name: "AGGREGATED_PUBLIC_KEY_G1_HASH",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "MAX_VALIDATORS",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VALIDATOR_SET_HASH_KECCAK256_HASH",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VERIFICATION_TYPE",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "settlement", internalType: "address", type: "address" },
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSig",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  { type: "error", inputs: [], name: "InvalidKeyTag" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidMessageLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidNonSignerIndex" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidNonSignersOrder" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidProofLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_InvalidProofOffset" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_TooManyValidators" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254Simple_UnsupportedKeyTag" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SigVerifierBlsBn254ZK
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const sigVerifierBlsBn254ZkAbi = [
  {
    type: "constructor",
    inputs: [
      { name: "verifiers_", internalType: "address[]", type: "address[]" },
      { name: "maxValidators_", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "TOTAL_ACTIVE_VALIDATORS_HASH",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VALIDATOR_SET_HASH_MIMC_HASH",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VERIFICATION_TYPE",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    name: "maxValidators",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    name: "verifiers",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "settlement", internalType: "address", type: "address" },
      { name: "epoch", internalType: "uint48", type: "uint48" },
      { name: "message", internalType: "bytes", type: "bytes" },
      { name: "keyTag", internalType: "uint8", type: "uint8" },
      { name: "quorumThreshold", internalType: "uint256", type: "uint256" },
      { name: "proof", internalType: "bytes", type: "bytes" },
    ],
    name: "verifyQuorumSig",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  { type: "error", inputs: [], name: "InvalidKeyTag" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidMaxValidators" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidMaxValidatorsOrder" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidMessageLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidProofLength" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidProofOffset" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidTotalActiveValidators" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_InvalidVerifier" },
  { type: "error", inputs: [], name: "SigVerifierBlsBn254ZK_UnsupportedKeyTag" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ValSetDriver
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const valSetDriverAbi = [
  {
    type: "function",
    inputs: [],
    name: "MAX_QUORUM_THRESHOLD",
    outputs: [{ name: "", internalType: "uint248", type: "uint248" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    name: "addQuorumThreshold",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "addSettlement",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "addVotingPowerProvider",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [],
    name: "getCommitterSlotDuration",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getCommitterSlotDurationAt",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getConfig",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.Config",
        type: "tuple",
        components: [
          { name: "numAggregators", internalType: "uint208", type: "uint208" },
          { name: "numCommitters", internalType: "uint208", type: "uint208" },
          { name: "committerSlotDuration", internalType: "uint48", type: "uint48" },
          {
            name: "votingPowerProviders",
            internalType: "struct IValSetDriver.CrossChainAddress[]",
            type: "tuple[]",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          {
            name: "keysProvider",
            internalType: "struct IValSetDriver.CrossChainAddress",
            type: "tuple",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          {
            name: "settlements",
            internalType: "struct IValSetDriver.CrossChainAddress[]",
            type: "tuple[]",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          { name: "maxVotingPower", internalType: "uint256", type: "uint256" },
          { name: "minInclusionVotingPower", internalType: "uint256", type: "uint256" },
          { name: "maxValidatorsCount", internalType: "uint208", type: "uint208" },
          { name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]" },
          {
            name: "quorumThresholds",
            internalType: "struct IValSetDriver.QuorumThreshold[]",
            type: "tuple[]",
            components: [
              { name: "keyTag", internalType: "uint8", type: "uint8" },
              { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
            ],
          },
          { name: "requiredHeaderKeyTag", internalType: "uint8", type: "uint8" },
          { name: "verificationType", internalType: "uint32", type: "uint32" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getConfigAt",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.Config",
        type: "tuple",
        components: [
          { name: "numAggregators", internalType: "uint208", type: "uint208" },
          { name: "numCommitters", internalType: "uint208", type: "uint208" },
          { name: "committerSlotDuration", internalType: "uint48", type: "uint48" },
          {
            name: "votingPowerProviders",
            internalType: "struct IValSetDriver.CrossChainAddress[]",
            type: "tuple[]",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          {
            name: "keysProvider",
            internalType: "struct IValSetDriver.CrossChainAddress",
            type: "tuple",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          {
            name: "settlements",
            internalType: "struct IValSetDriver.CrossChainAddress[]",
            type: "tuple[]",
            components: [
              { name: "chainId", internalType: "uint64", type: "uint64" },
              { name: "addr", internalType: "address", type: "address" },
            ],
          },
          { name: "maxVotingPower", internalType: "uint256", type: "uint256" },
          { name: "minInclusionVotingPower", internalType: "uint256", type: "uint256" },
          { name: "maxValidatorsCount", internalType: "uint208", type: "uint208" },
          { name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]" },
          {
            name: "quorumThresholds",
            internalType: "struct IValSetDriver.QuorumThreshold[]",
            type: "tuple[]",
            components: [
              { name: "keyTag", internalType: "uint8", type: "uint8" },
              { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
            ],
          },
          { name: "requiredHeaderKeyTag", internalType: "uint8", type: "uint8" },
          { name: "verificationType", internalType: "uint32", type: "uint32" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpoch",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpochDuration",
    outputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getCurrentEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getEpochDuration",
    outputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getEpochIndex",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "epoch", internalType: "uint48", type: "uint48" }],
    name: "getEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getKeysProvider",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getKeysProviderAt",
    outputs: [
      {
        name: "",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getMaxValidatorsCount",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getMaxValidatorsCountAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getMaxVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getMaxVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getMinInclusionVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getMinInclusionVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpoch",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpochDuration",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNextEpochStart",
    outputs: [{ name: "", internalType: "uint48", type: "uint48" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNumAggregators",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getNumAggregatorsAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getNumCommitters",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getNumCommittersAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getQuorumThresholds",
    outputs: [
      {
        name: "quorumThresholds",
        internalType: "struct IValSetDriver.QuorumThreshold[]",
        type: "tuple[]",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getQuorumThresholdsAt",
    outputs: [
      {
        name: "quorumThresholds",
        internalType: "struct IValSetDriver.QuorumThreshold[]",
        type: "tuple[]",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getRequiredHeaderKeyTag",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getRequiredHeaderKeyTagAt",
    outputs: [{ name: "", internalType: "uint8", type: "uint8" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getRequiredKeyTags",
    outputs: [{ name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getRequiredKeyTagsAt",
    outputs: [{ name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSettlements",
    outputs: [
      {
        name: "settlements",
        internalType: "struct IValSetDriver.CrossChainAddress[]",
        type: "tuple[]",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSettlementsAt",
    outputs: [
      {
        name: "settlements",
        internalType: "struct IValSetDriver.CrossChainAddress[]",
        type: "tuple[]",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getVerificationType",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getVerificationTypeAt",
    outputs: [{ name: "", internalType: "uint32", type: "uint32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getVotingPowerProviders",
    outputs: [
      {
        name: "votingPowerProviders",
        internalType: "struct IValSetDriver.CrossChainAddress[]",
        type: "tuple[]",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getVotingPowerProvidersAt",
    outputs: [
      {
        name: "votingPowerProviders",
        internalType: "struct IValSetDriver.CrossChainAddress[]",
        type: "tuple[]",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    name: "isQuorumThresholdRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isQuorumThresholdRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "isSettlementRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSettlementRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "isVotingPowerProviderRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isVotingPowerProviderRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
      },
    ],
    name: "removeQuorumThreshold",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "removeSettlement",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "removeVotingPowerProvider",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "slotDuration", internalType: "uint48", type: "uint48" }],
    name: "setCommitterSlotDuration",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48" }],
    name: "setEpochDuration",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      {
        name: "keysProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
      },
    ],
    name: "setKeysProvider",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "maxValidatorsCount", internalType: "uint208", type: "uint208" }],
    name: "setMaxValidatorsCount",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "maxVotingPower", internalType: "uint256", type: "uint256" }],
    name: "setMaxVotingPower",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "minInclusionVotingPower", internalType: "uint256", type: "uint256" }],
    name: "setMinInclusionVotingPower",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "numAggregators", internalType: "uint208", type: "uint208" }],
    name: "setNumAggregators",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "numCommitters", internalType: "uint208", type: "uint208" }],
    name: "setNumCommitters",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "requiredHeaderKeyTag", internalType: "uint8", type: "uint8" }],
    name: "setRequiredHeaderKeyTag",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]" }],
    name: "setRequiredKeyTags",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "verificationType", internalType: "uint32", type: "uint32" }],
    name: "setVerificationType",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
        indexed: false,
      },
    ],
    name: "AddQuorumThreshold",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "AddSettlement",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "AddVotingPowerProvider",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "epochDuration", internalType: "uint48", type: "uint48", indexed: false },
      { name: "epochDurationTimestamp", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "InitEpochDuration",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "quorumThreshold",
        internalType: "struct IValSetDriver.QuorumThreshold",
        type: "tuple",
        components: [
          { name: "keyTag", internalType: "uint8", type: "uint8" },
          { name: "quorumThreshold", internalType: "uint248", type: "uint248" },
        ],
        indexed: false,
      },
    ],
    name: "RemoveQuorumThreshold",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "settlement",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "RemoveSettlement",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "votingPowerProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "RemoveVotingPowerProvider",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "committerSlotDuration", internalType: "uint48", type: "uint48", indexed: false }],
    name: "SetCommitterSlotDuration",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "epochDuration", internalType: "uint48", type: "uint48", indexed: false }],
    name: "SetEpochDuration",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      {
        name: "keysProvider",
        internalType: "struct IValSetDriver.CrossChainAddress",
        type: "tuple",
        components: [
          { name: "chainId", internalType: "uint64", type: "uint64" },
          { name: "addr", internalType: "address", type: "address" },
        ],
        indexed: false,
      },
    ],
    name: "SetKeysProvider",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "maxValidatorsCount", internalType: "uint208", type: "uint208", indexed: false }],
    name: "SetMaxValidatorsCount",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "maxVotingPower", internalType: "uint256", type: "uint256", indexed: false }],
    name: "SetMaxVotingPower",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "minInclusionVotingPower", internalType: "uint256", type: "uint256", indexed: false }],
    name: "SetMinInclusionVotingPower",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "numAggregators", internalType: "uint208", type: "uint208", indexed: false }],
    name: "SetNumAggregators",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "numCommitters", internalType: "uint208", type: "uint208", indexed: false }],
    name: "SetNumCommitters",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "requiredHeaderKeyTag", internalType: "uint8", type: "uint8", indexed: false }],
    name: "SetRequiredHeaderKeyTag",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "requiredKeyTags", internalType: "uint8[]", type: "uint8[]", indexed: false }],
    name: "SetRequiredKeyTags",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "verificationType", internalType: "uint32", type: "uint32", indexed: false }],
    name: "SetVerificationType",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "CheckpointUnorderedInsertion" },
  { type: "error", inputs: [], name: "DuplicateKeyTag" },
  { type: "error", inputs: [], name: "EpochManager_InvalidEpochDuration" },
  { type: "error", inputs: [], name: "EpochManager_InvalidEpochDurationTimestamp" },
  { type: "error", inputs: [], name: "EpochManager_TooOldTimestamp" },
  { type: "error", inputs: [], name: "FailedCall" },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "InvalidKey" },
  { type: "error", inputs: [], name: "InvalidKeyTag" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "ValSetDriver_ChainAlreadyAdded" },
  { type: "error", inputs: [], name: "ValSetDriver_InvalidCrossChainAddress" },
  { type: "error", inputs: [], name: "ValSetDriver_InvalidMaxValidatorsCount" },
  { type: "error", inputs: [], name: "ValSetDriver_InvalidQuorumThreshold" },
  { type: "error", inputs: [], name: "ValSetDriver_KeyTagAlreadyAdded" },
  { type: "error", inputs: [], name: "ValSetDriver_NotAdded" },
  { type: "error", inputs: [], name: "ValSetDriver_ZeroCommitterSlotDuration" },
  { type: "error", inputs: [], name: "ValSetDriver_ZeroNumAggregators" },
  { type: "error", inputs: [], name: "ValSetDriver_ZeroNumCommitters" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// VotingPowerCalcManager
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const votingPowerCalcManagerAbi = [
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// VotingPowerProvider
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const votingPowerProviderAbi = [
  {
    type: "function",
    inputs: [],
    name: "NETWORK",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "OPERATOR_REGISTRY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "SUBNETWORK_IDENTIFIER",
    outputs: [{ name: "", internalType: "uint96", type: "uint96" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "VAULT_FACTORY",
    outputs: [{ name: "", internalType: "address", type: "address" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "eip712Domain",
    outputs: [
      { name: "fields", internalType: "bytes1", type: "bytes1" },
      { name: "name", internalType: "string", type: "string" },
      { name: "version", internalType: "string", type: "string" },
      { name: "chainId", internalType: "uint256", type: "uint256" },
      { name: "verifyingContract", internalType: "address", type: "address" },
      { name: "salt", internalType: "bytes32", type: "bytes32" },
      { name: "extensions", internalType: "uint256[]", type: "uint256[]" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorStakes",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorStakesAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "getOperatorVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "getOperatorVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getOperatorVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.VaultValue[]",
        type: "tuple[]",
        components: [
          { name: "vault", internalType: "address", type: "address" },
          { name: "value", internalType: "uint256", type: "uint256" },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getOperators",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getOperatorsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSharedVaults",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getSharedVaultsAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getSlashingData",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "timestamp", internalType: "uint48", type: "uint48" },
      { name: "hint", internalType: "bytes", type: "bytes" },
    ],
    name: "getSlashingDataAt",
    outputs: [
      { name: "", internalType: "bool", type: "bool" },
      { name: "", internalType: "uint48", type: "uint48" },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [],
    name: "getTokens",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "timestamp", internalType: "uint48", type: "uint48" }],
    name: "getTokensAt",
    outputs: [{ name: "", internalType: "address[]", type: "address[]" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "extraData", internalType: "bytes[]", type: "bytes[]" }],
    name: "getVotingPowers",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "extraData", internalType: "bytes[]", type: "bytes[]" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVotingPowersAt",
    outputs: [
      {
        name: "",
        internalType: "struct IVotingPowerProvider.OperatorVotingPower[]",
        type: "tuple[]",
        components: [
          { name: "operator", internalType: "address", type: "address" },
          {
            name: "vaults",
            internalType: "struct IVotingPowerProvider.VaultValue[]",
            type: "tuple[]",
            components: [
              { name: "vault", internalType: "address", type: "address" },
              { name: "value", internalType: "uint256", type: "uint256" },
            ],
          },
        ],
      },
    ],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "structHash", internalType: "bytes32", type: "bytes32" }],
    name: "hashTypedDataV4CrossChain",
    outputs: [{ name: "", internalType: "bytes32", type: "bytes32" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "invalidateOldSignatures", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [{ name: "operator", internalType: "address", type: "address" }],
    name: "isOperatorRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
    ],
    name: "isOperatorVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isOperatorVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "isSharedVaultRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isSharedVaultRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "isTokenRegistered",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "isTokenRegisteredAt",
    outputs: [{ name: "", internalType: "bool", type: "bool" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [{ name: "data", internalType: "bytes[]", type: "bytes[]" }],
    name: "multicall",
    outputs: [{ name: "results", internalType: "bytes[]", type: "bytes[]" }],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [{ name: "owner", internalType: "address", type: "address" }],
    name: "nonces",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  { type: "function", inputs: [], name: "registerOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "registerOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "power", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "target", internalType: "address", type: "address" },
      { name: "data", internalType: "bytes", type: "bytes" },
    ],
    name: "staticDelegateCall",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "function", inputs: [], name: "unregisterOperator", outputs: [], stateMutability: "nonpayable" },
  {
    type: "function",
    inputs: [
      { name: "operator", internalType: "address", type: "address" },
      { name: "signature", internalType: "bytes", type: "bytes" },
    ],
    name: "unregisterOperatorWithSignature",
    outputs: [],
    stateMutability: "nonpayable",
  },
  { type: "event", anonymous: false, inputs: [], name: "EIP712DomainChanged" },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "name", internalType: "string", type: "string", indexed: false },
      { name: "version", internalType: "string", type: "string", indexed: false },
    ],
    name: "InitEIP712",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "network", internalType: "address", type: "address", indexed: false },
      { name: "subnetworkId", internalType: "uint96", type: "uint96", indexed: false },
    ],
    name: "InitSubnetwork",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "RegisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "RegisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "RegisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "RegisterToken",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "requireSlasher", internalType: "bool", type: "bool", indexed: false },
      { name: "minVaultEpochDuration", internalType: "uint48", type: "uint48", indexed: false },
    ],
    name: "SetSlashingData",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "operator", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterOperator",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "operator", internalType: "address", type: "address", indexed: true },
      { name: "vault", internalType: "address", type: "address", indexed: true },
    ],
    name: "UnregisterOperatorVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "vault", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterSharedVault",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "token", internalType: "address", type: "address", indexed: true }],
    name: "UnregisterToken",
  },
  { type: "error", inputs: [{ name: "target", internalType: "address", type: "address" }], name: "AddressEmptyCode" },
  { type: "error", inputs: [], name: "FailedCall" },
  {
    type: "error",
    inputs: [
      { name: "account", internalType: "address", type: "address" },
      { name: "currentNonce", internalType: "uint256", type: "uint256" },
    ],
    name: "InvalidAccountNonce",
  },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NetworkManager_InvalidNetwork" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperator" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidOperatorVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSharedVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidSignature" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidToken" },
  { type: "error", inputs: [], name: "VotingPowerProvider_InvalidVault" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorAlreadyRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_OperatorVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_SharedVaultNotRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenAlreadyIsRegistered" },
  { type: "error", inputs: [], name: "VotingPowerProvider_TokenNotRegistered" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// WeightedTokensVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const weightedTokensVpCalcAbi = [
  {
    type: "function",
    inputs: [{ name: "token", internalType: "address", type: "address" }],
    name: "getTokenWeight",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getTokenWeightAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "token", internalType: "address", type: "address" },
      { name: "weight", internalType: "uint208", type: "uint208" },
    ],
    name: "setTokenWeight",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "token", internalType: "address", type: "address", indexed: true },
      { name: "weight", internalType: "uint208", type: "uint208", indexed: false },
    ],
    name: "SetTokenWeight",
  },
  { type: "error", inputs: [], name: "CheckpointUnorderedInsertion" },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "WeightedTokensVPCalc_TooLargeWeight" },
] as const;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// WeightedVaultsVPCalc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const weightedVaultsVpCalcAbi = [
  {
    type: "function",
    inputs: [{ name: "vault", internalType: "address", type: "address" }],
    name: "getVaultWeight",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "getVaultWeightAt",
    outputs: [{ name: "", internalType: "uint208", type: "uint208" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "weight", internalType: "uint208", type: "uint208" },
    ],
    name: "setVaultWeight",
    outputs: [],
    stateMutability: "nonpayable",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
    ],
    name: "stakeToVotingPower",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "function",
    inputs: [
      { name: "vault", internalType: "address", type: "address" },
      { name: "stake", internalType: "uint256", type: "uint256" },
      { name: "extraData", internalType: "bytes", type: "bytes" },
      { name: "timestamp", internalType: "uint48", type: "uint48" },
    ],
    name: "stakeToVotingPowerAt",
    outputs: [{ name: "", internalType: "uint256", type: "uint256" }],
    stateMutability: "view",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [{ name: "version", internalType: "uint64", type: "uint64", indexed: false }],
    name: "Initialized",
  },
  {
    type: "event",
    anonymous: false,
    inputs: [
      { name: "vault", internalType: "address", type: "address", indexed: true },
      { name: "weight", internalType: "uint208", type: "uint208", indexed: false },
    ],
    name: "SetVaultWeight",
  },
  { type: "error", inputs: [], name: "CheckpointUnorderedInsertion" },
  { type: "error", inputs: [], name: "InvalidInitialization" },
  { type: "error", inputs: [], name: "NotInitializing" },
  { type: "error", inputs: [], name: "WeightedVaultsVPCalc_TooLargeWeight" },
] as const;
