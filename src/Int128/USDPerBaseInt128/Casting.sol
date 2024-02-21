// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { USDPerBaseInt128 } from "./ValueType.sol";

/// @notice Wraps a int128 number into the USDPerBaseInt128 value type.
function wrap(int128 x) pure returns (USDPerBaseInt128 result) {
    result = USDPerBaseInt128.wrap(x);
}

/// @notice Unwraps a USDPerBaseInt128 number into int128.
function unwrap(USDPerBaseInt128 x) pure returns (int128 result) {
    result = USDPerBaseInt128.unwrap(x);
}
