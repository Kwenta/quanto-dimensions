// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { BaseUint128 } from "./ValueType.sol";
import { BaseUint256 } from "src/Uint256/BaseUint256/ValueType.sol";
import { BaseInt128 } from "src/Int128/BaseInt128/ValueType.sol";
import { SafeCastU128 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastU128 for uint128;

/// @notice Wraps a uint128 number into the BaseUint128 value type.
function wrap(uint128 x) pure returns (BaseUint128 result) {
    result = BaseUint128.wrap(x);
}

/// @notice Unwraps a BaseUint128 number into uint128.
function unwrap(BaseUint128 x) pure returns (uint128 result) {
    result = BaseUint128.unwrap(x);
}

/// @notice Converts a BaseUint128 number into BaseUint256.
function to256(BaseUint128 x) pure returns (BaseUint256 result) {
    result = BaseUint256.wrap(unwrap(x).to256());
}

/// @notice Converts a BaseUint128 number into BaseInt128.
function toInt(BaseUint128 x) pure returns (BaseInt128 result) {
    result = BaseInt128.wrap(unwrap(x).toInt());
}

/// @notice Converts a BaseUint128 number into bytes32.
function toBytes32(BaseUint128 x) pure returns (bytes32 result) {
    result = bytes32(uint256(unwrap(x)));
}
