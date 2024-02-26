// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerQuantoInt256} from "./ValueType.sol";

/// @notice Wraps a int256 number into the USDPerQuantoInt256 value type.
function wrap(int256 x) pure returns (USDPerQuantoInt256 result) {
    result = USDPerQuantoInt256.wrap(x);
}

/// @notice Unwraps a USDPerQuantoInt256 number into int256.
function unwrap(USDPerQuantoInt256 x) pure returns (int256 result) {
    result = USDPerQuantoInt256.unwrap(x);
}
