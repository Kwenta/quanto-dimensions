// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseQuantoPerUSDInt256} from "./ValueType.sol";
import {BaseQuantoPerUSDInt128} from
    "../../Int128/BaseQuantoPerUSDInt128/ValueType.sol";
import {BaseQuantoPerUSDUint256} from
    "../../Uint256/BaseQuantoPerUSDUint256/ValueType.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

using SafeCastI256 for int256;

/// @notice Wraps a int256 number into the BaseQuantoPerUSDInt256 value type.
function wrap(int256 x) pure returns (BaseQuantoPerUSDInt256 result) {
    result = BaseQuantoPerUSDInt256.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDInt256 number into int256.
function unwrap(BaseQuantoPerUSDInt256 x) pure returns (int256 result) {
    result = BaseQuantoPerUSDInt256.unwrap(x);
}

/// @notice Converts a BaseQuantoPerUSDInt256 number into BaseQuantoPerUSDInt128.
function to128(BaseQuantoPerUSDInt256 x)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = BaseQuantoPerUSDInt128.wrap(unwrap(x).to128());
}

/// @notice Converts a BaseQuantoPerUSDInt256 number into BaseQuantoPerUSDUint256.
function toUint(BaseQuantoPerUSDInt256 x)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = BaseQuantoPerUSDUint256.wrap(unwrap(x).toUint());
}
