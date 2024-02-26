// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseQuantoPerUSDInt128} from "./ValueType.sol";
import {BaseQuantoPerUSDUint128} from
    "src/Uint128/BaseQuantoPerUSDUint128/ValueType.sol";
import {SafeCastI128} from "src/utils/SafeCast.sol";

using SafeCastI128 for int128;

/// @notice Wraps a int128 number into the BaseQuantoPerUSDInt128 value type.
function wrap(int128 x) pure returns (BaseQuantoPerUSDInt128 result) {
    result = BaseQuantoPerUSDInt128.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDInt128 number into int128.
function unwrap(BaseQuantoPerUSDInt128 x) pure returns (int128 result) {
    result = BaseQuantoPerUSDInt128.unwrap(x);
}

/// @notice Converts a BaseQuantoPerUSDInt128 number into BaseQuantoPerUSDUint128.
function toUint(BaseQuantoPerUSDInt128 x)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = BaseQuantoPerUSDUint128.wrap(unwrap(x).toUint());
}
