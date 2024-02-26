// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDUint128} from "./ValueType.sol";
import {USDInt128} from "src/Int128/USDInt128/ValueType.sol";
import {SafeCastU128} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastU128 for uint128;

/// @notice Wraps a uint128 number into the USDUint128 value type.
function wrap(uint128 x) pure returns (USDUint128 result) {
    result = USDUint128.wrap(x);
}

/// @notice Unwraps a USDUint128 number into uint128.
function unwrap(USDUint128 x) pure returns (uint128 result) {
    result = USDUint128.unwrap(x);
}

/// @notice Converts a USDUint128 number into USDInt128.
function toInt(USDUint128 x) pure returns (USDInt128 result) {
    result = USDInt128.wrap(unwrap(x).toInt());
}

/// @notice Converts a USDUint128 number into bytes32.
function toBytes32(USDUint128 x) pure returns (bytes32 result) {
    result = bytes32(uint256(unwrap(x)));
}
