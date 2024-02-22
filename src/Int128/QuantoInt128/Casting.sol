// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { QuantoInt128 } from "./ValueType.sol";
import { QuantoInt256 } from "src/Int256/QuantoInt256/ValueType.sol";
import { QuantoUint128 } from "src/Uint128/QuantoUint128/ValueType.sol";
import { SafeCastI128 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastI128 for int128;

/// @notice Wraps a int128 number into the QuantoInt128 value type.
function wrap(int128 x) pure returns (QuantoInt128 result) {
    result = QuantoInt128.wrap(x);
}

/// @notice Unwraps a QuantoInt128 number into int128.
function unwrap(QuantoInt128 x) pure returns (int128 result) {
    result = QuantoInt128.unwrap(x);
}

/// @notice Converts a QuantoInt128 number into QuantoInt256.
function to256(QuantoInt128 x) pure returns (QuantoInt256 result) {
    result = QuantoInt256.wrap(unwrap(x).to256());
}

/// @notice Converts a QuantoInt128 number into QuantoUint128.
function toUint(QuantoInt128 x) pure returns (QuantoUint128 result) {
    result = QuantoUint128.wrap(unwrap(x).toUint());
}
