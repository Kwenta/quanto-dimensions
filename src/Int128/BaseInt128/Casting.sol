// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseInt128} from "./ValueType.sol";
import {BaseInt256} from "../../Int256/BaseInt256/ValueType.sol";
import {BaseUint128} from "../../Uint128/BaseUint128/ValueType.sol";
import {SafeCastI128} from "../../utils/SafeCast.sol";

using SafeCastI128 for int128;

/// @notice Wraps a int128 number into the BaseInt128 value type.
function wrap(int128 x) pure returns (BaseInt128 result) {
    result = BaseInt128.wrap(x);
}

/// @notice Unwraps a BaseInt128 number into int128.
function unwrap(BaseInt128 x) pure returns (int128 result) {
    result = BaseInt128.unwrap(x);
}

/// @notice Converts a BaseInt128 number into BaseInt256.
function to256(BaseInt128 x) pure returns (BaseInt256 result) {
    result = BaseInt256.wrap(unwrap(x).to256());
}

/// @notice Converts a BaseInt128 number into BaseUint128.
function toUint(BaseInt128 x) pure returns (BaseUint128 result) {
    result = BaseUint128.wrap(unwrap(x).toUint());
}
