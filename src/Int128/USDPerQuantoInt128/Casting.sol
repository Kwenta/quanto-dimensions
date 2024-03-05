// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerQuantoInt128} from "./ValueType.sol";
import {USDPerQuantoInt256} from "../../Int256/USDPerQuantoInt256/ValueType.sol";
import {USDPerQuantoUint128} from "../../Uint128/USDPerQuantoUint128/ValueType.sol";
import {SafeCastI128} from "../../utils/SafeCast.sol";

using SafeCastI128 for int128;

/// @notice Wraps a int128 number into the USDPerQuantoInt128 value type.
function wrap(int128 x) pure returns (USDPerQuantoInt128 result) {
    result = USDPerQuantoInt128.wrap(x);
}

/// @notice Unwraps a USDPerQuantoInt128 number into int128.
function unwrap(USDPerQuantoInt128 x) pure returns (int128 result) {
    result = USDPerQuantoInt128.unwrap(x);
}

/// @notice Converts a USDPerQuantoInt128 number into USDPerQuantoInt256.
function to256(USDPerQuantoInt128 x) pure returns (USDPerQuantoInt256 result) {
    result = USDPerQuantoInt256.wrap(USDPerQuantoInt128.unwrap(x).to256());
}

/// @notice Converts a USDPerQuantoInt128 number into USDPerQuantoUint128.
function toUint(USDPerQuantoInt128 x) pure returns (USDPerQuantoUint128 result) {
    result = USDPerQuantoUint128.wrap(USDPerQuantoInt128.unwrap(x).toUint());
}
