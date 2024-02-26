// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDUint256} from "./ValueType.sol";
import {USDUint128} from "../../Uint128/USDUint128/ValueType.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

using SafeCastU256 for uint256;

/// @notice Wraps a uint256 number into the USDUint256 value type.
function wrap(uint256 x) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x);
}

/// @notice Unwraps a USDUint256 number into uint256.
function unwrap(USDUint256 x) pure returns (uint256 result) {
    result = USDUint256.unwrap(x);
}

/// @notice Converts a USDUint256 number into USDUint128.
function to128(USDUint256 x) pure returns (USDUint128 result) {
    result = USDUint128.wrap(unwrap(x).to128());
}

/// @notice Converts a USDUint256 number into bytes32.
function toBytes32(USDUint256 x) pure returns (bytes32 result) {
    result = bytes32(unwrap(x));
}
