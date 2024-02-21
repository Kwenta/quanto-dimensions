// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { BaseQuantoPerUSDUint128 } from "./ValueType.sol";

/// @notice Wraps a uint128 number into the BaseQuantoPerUSDUint128 value type.
function wrap(uint128 x) pure returns (BaseQuantoPerUSDUint128 result) {
    result = BaseQuantoPerUSDUint128.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDUint128 number into uint128.
function unwrap(BaseQuantoPerUSDUint128 x) pure returns (uint128 result) {
    result = BaseQuantoPerUSDUint128.unwrap(x);
}
