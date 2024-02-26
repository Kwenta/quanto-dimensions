// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseQuantoPerUSDUint128} from "./ValueType.sol";
import {BaseQuantoPerUSDInt128} from
    "src/Int128/BaseQuantoPerUSDInt128/ValueType.sol";
import {SafeCastU128} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastU128 for uint128;

/// @notice Wraps a uint128 number into the BaseQuantoPerUSDUint128 value type.
function wrap(uint128 x) pure returns (BaseQuantoPerUSDUint128 result) {
    result = BaseQuantoPerUSDUint128.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDUint128 number into uint128.
function unwrap(BaseQuantoPerUSDUint128 x) pure returns (uint128 result) {
    result = BaseQuantoPerUSDUint128.unwrap(x);
}

/// @notice Converts a BaseQuantoPerUSDUint128 number into BaseQuantoPerUSDInt128.
function toInt(BaseQuantoPerUSDUint128 x)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = BaseQuantoPerUSDInt128.wrap(unwrap(x).toInt());
}

/// @notice Converts a BaseQuantoPerUSDUint128 number into bytes32.
function toBytes32(BaseQuantoPerUSDUint128 x) pure returns (bytes32 result) {
    result = bytes32(uint256(unwrap(x)));
}
