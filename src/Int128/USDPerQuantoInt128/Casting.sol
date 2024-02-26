// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerQuantoInt128} from "./ValueType.sol";

/// @notice Wraps a int128 number into the USDPerQuantoInt128 value type.
function wrap(int128 x) pure returns (USDPerQuantoInt128 result) {
    result = USDPerQuantoInt128.wrap(x);
}

/// @notice Unwraps a USDPerQuantoInt128 number into int128.
function unwrap(USDPerQuantoInt128 x) pure returns (int128 result) {
    result = USDPerQuantoInt128.unwrap(x);
}
