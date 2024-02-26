// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerBaseInt256} from "./ValueType.sol";

/// @notice Wraps a int256 number into the USDPerBaseInt256 value type.
function wrap(int256 x) pure returns (USDPerBaseInt256 result) {
    result = USDPerBaseInt256.wrap(x);
}

/// @notice Unwraps a USDPerBaseInt256 number into int256.
function unwrap(USDPerBaseInt256 x) pure returns (int256 result) {
    result = USDPerBaseInt256.unwrap(x);
}
