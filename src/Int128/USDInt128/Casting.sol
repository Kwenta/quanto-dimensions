// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDInt128} from "./ValueType.sol";
import {USDUint128} from "../../Uint128/USDUint128/ValueType.sol";
import {SafeCastI128} from "../../utils/SafeCast.sol";

using SafeCastI128 for int128;

/// @notice Wraps a int128 number into the USDInt128 value type.
function wrap(int128 x) pure returns (USDInt128 result) {
    result = USDInt128.wrap(x);
}

/// @notice Unwraps a USDInt128 number into int128.
function unwrap(USDInt128 x) pure returns (int128 result) {
    result = USDInt128.unwrap(x);
}

/// @notice Converts a USDInt128 number into USDUint128.
function toUint(USDInt128 x) pure returns (USDUint128 result) {
    result = USDUint128.wrap(unwrap(x).toUint());
}
