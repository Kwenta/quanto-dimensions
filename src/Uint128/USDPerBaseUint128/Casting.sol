// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { USDPerBaseUint128 } from "./ValueType.sol";

/// @notice Wraps a uint128 number into the USDPerBaseUint128 value type.
function wrap(uint128 x) pure returns (USDPerBaseUint128 result) {
    result = USDPerBaseUint128.wrap(x);
}

/// @notice Unwraps a USDPerBaseUint128 number into uint128.
function unwrap(USDPerBaseUint128 x) pure returns (uint128 result) {
    result = USDPerBaseUint128.unwrap(x);
}
