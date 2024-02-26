// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {QuantoUint256} from "./ValueType.sol";

/// @notice Wraps a uint256 number into the QuantoUint256 value type.
function wrap(uint256 x) pure returns (QuantoUint256 result) {
    result = QuantoUint256.wrap(x);
}

/// @notice Unwraps a QuantoUint256 number into uint256.
function unwrap(QuantoUint256 x) pure returns (uint256 result) {
    result = QuantoUint256.unwrap(x);
}
