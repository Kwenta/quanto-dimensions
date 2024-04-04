# Quanto Dimensions

[![Github Actions][gha-badge]][gha] 
[![Foundry][foundry-badge]][foundry] 
[![License: GPL-3.0][license-badge]][license]

[gha]: https://github.com/Kwenta/quanto-dimensions/actions
[gha-badge]: https://github.com/Kwenta/quanto-dimensions/actions/workflows/test.yml/badge.svg
[foundry]: https://getfoundry.sh/
[foundry-badge]: https://img.shields.io/badge/Built%20with-Foundry-FFDB1C.svg
[license]: https://opensource.org/license/GPL-3.0/
[license-badge]: https://img.shields.io/badge/GitHub-GPL--3.0-informational

This library is designed to provide units/dimension user defined types for quanto perpetual smart contracts.

## Contracts

```
src
├── Int128
│   ├── BaseInt128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── BaseQuantoPerUSDInt128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── QuantoInt128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── USDInt128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── USDPerBaseInt128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   └── USDPerQuantoInt128
│       ├── Interactions.sol
│       └── ValueType.sol
├── Int256
│   ├── BaseInt256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── BaseQuantoPerUSDInt256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── QuantoInt256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── USDInt256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── USDPerBaseInt256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   └── USDPerQuantoInt256
│       ├── Interactions.sol
│       └── ValueType.sol
├── Uint128
│   ├── BaseQuantoPerUSDUint128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── BaseUint128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── QuantoUint128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── USDPerBaseUint128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── USDPerQuantoUint128
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   └── USDUint128
│       ├── Interactions.sol
│       └── ValueType.sol
├── Uint256
│   ├── BaseQuantoPerUSDUint256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── BaseUint256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── QuantoUint256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── USDPerBaseUint256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   ├── USDPerQuantoUint256
│   │   ├── Interactions.sol
│   │   └── ValueType.sol
│   └── USDUint256
│       ├── Interactions.sol
│       └── ValueType.sol
├── UnitTypes.sol
└── utils
    ├── DecimalMath.sol
    ├── SafeCast
    │   ├── SafeCastAddress.sol
    │   ├── SafeCastBytes32.sol
    │   ├── SafeCastI128.sol
    │   ├── SafeCastI24.sol
    │   ├── SafeCastI256.sol
    │   ├── SafeCastI32.sol
    │   ├── SafeCastI56.sol
    │   ├── SafeCastI64.sol
    │   ├── SafeCastU128.sol
    │   ├── SafeCastU160.sol
    │   ├── SafeCastU256.sol
    │   ├── SafeCastU32.sol
    │   ├── SafeCastU56.sol
    │   └── SafeCastU64.sol
    └── SafeCast.sol
```

## Tests

1. Follow the [Foundry guide to working on an existing project](https://book.getfoundry.sh/projects/working-on-an-existing-project.html)

2. Build project

```
npm run compile
```

3. Execute tests

```
npm run test
```

4. Run specific test

```
forge test --match-test TEST_NAME -vv
```

5. Run specific contract test

```
forge test --match-contract CONTRACT_NAME -vv
```