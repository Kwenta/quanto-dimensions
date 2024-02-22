// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {QuantoInt256} from "./ValueType.sol";
import {QuantoInt128} from "src/Int128/QuantoInt128/ValueType.sol";
import {QuantoUint256} from "src/Uint256/QuantoUint256/ValueType.sol";
import {SafeCastI256} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastI256 for int256;

/// @notice Wraps a int256 number into the QuantoInt256 value type.
function wrap(int256 x) pure returns (QuantoInt256 result) {
    result = QuantoInt256.wrap(x);
}

/// @notice Unwraps a QuantoInt256 number into int256.
function unwrap(QuantoInt256 x) pure returns (int256 result) {
    result = QuantoInt256.unwrap(x);
}

/// @notice Converts a QuantoInt256 number into QuantoInt128.
function to128(QuantoInt256 x) pure returns (QuantoInt128 result) {
    result = QuantoInt128.wrap(unwrap(x).to128());
}

/// @notice Converts a QuantoInt256 number into QuantoUint256.
function toUint(QuantoInt256 x) pure returns (QuantoUint256 result) {
    result = QuantoUint256.wrap(unwrap(x).toUint());
}
