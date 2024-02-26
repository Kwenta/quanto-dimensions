// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDInt256} from "./ValueType.sol";
import {USDInt128} from "../../Int128/USDInt128/ValueType.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

using SafeCastI256 for int256;

/// @notice Wraps a int256 number into the USDInt256 value type.
function wrap(int256 x) pure returns (USDInt256 result) {
    result = USDInt256.wrap(x);
}

/// @notice Unwraps a USDInt256 number into int256.
function unwrap(USDInt256 x) pure returns (int256 result) {
    result = USDInt256.unwrap(x);
}

/// @notice Converts a USDInt256 number into USDInt128.
function to128(USDInt256 x) pure returns (USDInt128 result) {
    result = USDInt128.wrap(unwrap(x).to128());
}
