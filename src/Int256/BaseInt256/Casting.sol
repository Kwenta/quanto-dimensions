// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseInt256} from "./ValueType.sol";

/// @notice Wraps a int256 number into the BaseInt256 value type.
function wrap(int256 x) pure returns (BaseInt256 result) {
    result = BaseInt256.wrap(x);
}

/// @notice Unwraps a BaseInt256 number into int256.
function unwrap(BaseInt256 x) pure returns (int256 result) {
    result = BaseInt256.unwrap(x);
}
