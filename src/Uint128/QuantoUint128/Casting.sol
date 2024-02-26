// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {QuantoUint128} from "./ValueType.sol";
import {QuantoInt128} from "../../Int128/QuantoInt128/ValueType.sol";
import {SafeCastU128} from "../../utils/SafeCast.sol";

using SafeCastU128 for uint128;

/// @notice Wraps a uint128 number into the QuantoUint128 value type.
function wrap(uint128 x) pure returns (QuantoUint128 result) {
    result = QuantoUint128.wrap(x);
}

/// @notice Unwraps a QuantoUint128 number into uint128.
function unwrap(QuantoUint128 x) pure returns (uint128 result) {
    result = QuantoUint128.unwrap(x);
}

/// @notice Converts a QuantoUint128 number into QuantoInt128.
function toInt(QuantoUint128 x) pure returns (QuantoInt128 result) {
    result = QuantoInt128.wrap(unwrap(x).toInt());
}

/// @notice Converts a QuantoUint128 number into bytes32.
function toBytes32(QuantoUint128 x) pure returns (bytes32 result) {
    result = bytes32(uint256(unwrap(x)));
}
