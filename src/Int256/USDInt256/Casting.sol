// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { USDInt256 } from "./ValueType.sol";

/// @notice Wraps a int256 number into the USDInt256 value type.
function wrap(int256 x) pure returns (USDInt256 result) {
    result = USDInt256.wrap(x);
}

/// @notice Unwraps a USDInt256 number into int256.
function unwrap(USDInt256 x) pure returns (int256 result) {
    result = USDInt256.unwrap(x);
}
