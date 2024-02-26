// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {QuantoInt256} from "./ValueType.sol";

/// @notice Wraps a int256 number into the QuantoInt256 value type.
function wrap(int256 x) pure returns (QuantoInt256 result) {
    result = QuantoInt256.wrap(x);
}

/// @notice Unwraps a QuantoInt256 number into int256.
function unwrap(QuantoInt256 x) pure returns (int256 result) {
    result = QuantoInt256.unwrap(x);
}
