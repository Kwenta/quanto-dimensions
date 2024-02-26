// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseQuantoPerUSDInt256} from "./ValueType.sol";

/// @notice Wraps a int256 number into the BaseQuantoPerUSDInt256 value type.
function wrap(int256 x) pure returns (BaseQuantoPerUSDInt256 result) {
    result = BaseQuantoPerUSDInt256.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDInt256 number into int256.
function unwrap(BaseQuantoPerUSDInt256 x) pure returns (int256 result) {
    result = BaseQuantoPerUSDInt256.unwrap(x);
}
