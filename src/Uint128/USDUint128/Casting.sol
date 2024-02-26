// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDUint128} from "./ValueType.sol";

/// @notice Wraps a uint128 number into the USDUint128 value type.
function wrap(uint128 x) pure returns (USDUint128 result) {
    result = USDUint128.wrap(x);
}

/// @notice Unwraps a USDUint128 number into uint128.
function unwrap(USDUint128 x) pure returns (uint128 result) {
    result = USDUint128.unwrap(x);
}

/// @notice Converts a USDUint128 number into bytes32.
function toBytes32(USDUint128 x) pure returns (bytes32 result) {
    result = bytes32(uint256(unwrap(x)));
}
