# Quanto Dimensions

[![Github Actions][gha-badge]][gha] 
[![Foundry][foundry-badge]][foundry] 
[![License: GPL-3.0][license-badge]][license]

[gha]: https://github.com/Kwenta/foundry-scaffold/actions
[gha-badge]: https://github.com/Kwenta/foundry-scaffold/actions/workflows/test.yml/badge.svg
[foundry]: https://getfoundry.sh/
[foundry-badge]: https://img.shields.io/badge/Built%20with-Foundry-FFDB1C.svg
[license]: https://opensource.org/license/GPL-3.0/
[license-badge]: https://img.shields.io/badge/GitHub-GPL--3.0-informational

This library is designed to provide units/dimension user defined types for quanto perpetual smart contracts.

## Contracts

```
src
├── Int128
│   ├── BaseInt128
│   ├── BaseQuantoPerUSDInt128
│   ├── QuantoInt128
│   ├── USDInt128
│   ├── USDPerBaseInt128
│   └── USDPerQuantoInt128
├── Int256
│   ├── BaseInt256
│   ├── BaseQuantoPerUSDInt256
│   ├── QuantoInt256
│   ├── USDInt256
│   ├── USDPerBaseInt256
│   └── USDPerQuantoInt256
├── Uint128
│   ├── BaseQuantoPerUSDUint128
│   ├── BaseUint128
│   ├── QuantoUint128
│   ├── USDPerBaseUint128
│   ├── USDPerQuantoUint128
│   └── USDUint128
├── Uint256
│   ├── BaseQuantoPerUSDUint256
│   ├── BaseUint256
│   ├── QuantoUint256
│   ├── USDPerBaseUint256
│   ├── USDPerQuantoUint256
│   └── USDUint256
└── UnitTypes.sol
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
