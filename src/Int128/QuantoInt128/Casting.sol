// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { QuantoInt128 } from "./ValueType.sol";

/// @notice Wraps a int128 number into the QuantoInt128 value type.
function wrap(int128 x) pure returns (QuantoInt128 result) {
    result = QuantoInt128.wrap(x);
}

/// @notice Unwraps a QuantoInt128 number into int128.
function unwrap(QuantoInt128 x) pure returns (int128 result) {
    result = QuantoInt128.unwrap(x);
}
