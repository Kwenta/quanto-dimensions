// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseQuantoPerUSDUint256} from "./ValueType.sol";
import {BaseQuantoPerUSDUint128} from
    "src/Uint128/BaseQuantoPerUSDUint128/ValueType.sol";
import {BaseQuantoPerUSDInt256} from
    "src/Int256/BaseQuantoPerUSDInt256/ValueType.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";

using SafeCastU256 for uint256;

/// @notice Wraps a uint256 number into the BaseQuantoPerUSDUint256 value type.
function wrap(uint256 x) pure returns (BaseQuantoPerUSDUint256 result) {
    result = BaseQuantoPerUSDUint256.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDUint256 number into uint256.
function unwrap(BaseQuantoPerUSDUint256 x) pure returns (uint256 result) {
    result = BaseQuantoPerUSDUint256.unwrap(x);
}

/// @notice Converts a BaseQuantoPerUSDUint256 number into BaseQuantoPerUSDUint128.
function to128(BaseQuantoPerUSDUint256 x)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = BaseQuantoPerUSDUint128.wrap(unwrap(x).to128());
}

/// @notice Converts a BaseQuantoPerUSDUint256 number into BaseQuantoPerUSDInt256.
function toInt(BaseQuantoPerUSDUint256 x)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = BaseQuantoPerUSDInt256.wrap(unwrap(x).toInt());
}

/// @notice Converts a BaseQuantoPerUSDUint256 number into bytes32.
function toBytes32(BaseQuantoPerUSDUint256 x) pure returns (bytes32 result) {
    result = bytes32(unwrap(x));
}
