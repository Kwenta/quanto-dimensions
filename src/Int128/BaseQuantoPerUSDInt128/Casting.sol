// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { BaseQuantoPerUSDInt128 } from "./ValueType.sol";

/// @notice Wraps a int128 number into the BaseQuantoPerUSDInt128 value type.
function wrap(int128 x) pure returns (BaseQuantoPerUSDInt128 result) {
    result = BaseQuantoPerUSDInt128.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDInt128 number into int128.
function unwrap(BaseQuantoPerUSDInt128 x) pure returns (int128 result) {
    result = BaseQuantoPerUSDInt128.unwrap(x);
}
