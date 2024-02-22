// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { BaseQuantoPerUSDInt128 } from "./ValueType.sol";
import { BaseQuantoPerUSDInt256 } from "src/Int256/BaseQuantoPerUSDInt256/ValueType.sol";
import { BaseQuantoPerUSDUint128 } from "src/Uint128/BaseQuantoPerUSDUint128/ValueType.sol";
import { SafeCastI128 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastI128 for int128;

/// @notice Wraps a int128 number into the BaseQuantoPerUSDInt128 value type.
function wrap(int128 x) pure returns (BaseQuantoPerUSDInt128 result) {
    result = BaseQuantoPerUSDInt128.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDInt128 number into int128.
function unwrap(BaseQuantoPerUSDInt128 x) pure returns (int128 result) {
    result = BaseQuantoPerUSDInt128.unwrap(x);
}

/// @notice Converts a BaseQuantoPerUSDInt128 number into BaseQuantoPerUSDInt256.
function to256(BaseQuantoPerUSDInt128 x) pure returns (BaseQuantoPerUSDInt256 result) {
    result = BaseQuantoPerUSDInt256.wrap(unwrap(x).to256());
}

/// @notice Converts a BaseQuantoPerUSDInt128 number into BaseQuantoPerUSDUint128.
function toUint(BaseQuantoPerUSDInt128 x) pure returns (BaseQuantoPerUSDUint128 result) {
    result = BaseQuantoPerUSDUint128.wrap(unwrap(x).toUint());
}
