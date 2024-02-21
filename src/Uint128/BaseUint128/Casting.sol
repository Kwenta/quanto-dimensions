// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { BaseUint128 } from "./ValueType.sol";

/// @notice Wraps a uint128 number into the BaseUint128 value type.
function wrap(uint128 x) pure returns (BaseUint128 result) {
    result = BaseUint128.wrap(x);
}

/// @notice Unwraps a BaseUint128 number into uint128.
function unwrap(BaseUint128 x) pure returns (uint128 result) {
    result = BaseUint128.unwrap(x);
}
