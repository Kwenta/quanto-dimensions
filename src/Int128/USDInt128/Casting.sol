// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDInt128} from "./ValueType.sol";

/// @notice Wraps a int128 number into the USDInt128 value type.
function wrap(int128 x) pure returns (USDInt128 result) {
    result = USDInt128.wrap(x);
}

/// @notice Unwraps a USDInt128 number into int128.
function unwrap(USDInt128 x) pure returns (int128 result) {
    result = USDInt128.unwrap(x);
}
