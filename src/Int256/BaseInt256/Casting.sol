// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseInt256} from "./ValueType.sol";
import {BaseInt128} from "src/Int128/BaseInt128/ValueType.sol";
import {BaseUint256} from "src/Uint256/BaseUint256/ValueType.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";

using SafeCastI256 for int256;

/// @notice Wraps a int256 number into the BaseInt256 value type.
function wrap(int256 x) pure returns (BaseInt256 result) {
    result = BaseInt256.wrap(x);
}

/// @notice Unwraps a BaseInt256 number into int256.
function unwrap(BaseInt256 x) pure returns (int256 result) {
    result = BaseInt256.unwrap(x);
}

/// @notice Converts a BaseInt256 number into BaseInt128.
function to128(BaseInt256 x) pure returns (BaseInt128 result) {
    result = BaseInt128.wrap(unwrap(x).to128());
}

/// @notice Converts a BaseInt256 number into BaseUint256.
function toUint(BaseInt256 x) pure returns (BaseUint256 result) {
    result = BaseUint256.wrap(unwrap(x).toUint());
}
