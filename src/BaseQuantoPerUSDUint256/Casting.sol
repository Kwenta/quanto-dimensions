// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { BaseQuantoPerUSDUint256 } from "./ValueType.sol";

/// @notice Wraps a uint256 number into the BaseQuantoPerUSDUint256 value type.
function wrap(uint256 x) pure returns (BaseQuantoPerUSDUint256 result) {
    result = BaseQuantoPerUSDUint256.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDUint256 number into uint256.
function unwrap(BaseQuantoPerUSDUint256 x) pure returns (uint256 result) {
    result = BaseQuantoPerUSDUint256.unwrap(x);
}
