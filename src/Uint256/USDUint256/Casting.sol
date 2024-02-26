// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDUint256} from "./ValueType.sol";

/// @notice Wraps a uint256 number into the USDUint256 value type.
function wrap(uint256 x) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x);
}

/// @notice Unwraps a USDUint256 number into uint256.
function unwrap(USDUint256 x) pure returns (uint256 result) {
    result = USDUint256.unwrap(x);
}

/// @notice Converts a USDUint256 number into bytes32.
function toBytes32(USDUint256 x) pure returns (bytes32 result) {
    result = bytes32(unwrap(x));
}
