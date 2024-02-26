// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseUint256} from "./ValueType.sol";

/// @notice Wraps a uint256 number into the BaseUint256 value type.
function wrap(uint256 x) pure returns (BaseUint256 result) {
    result = BaseUint256.wrap(x);
}

/// @notice Unwraps a BaseUint256 number into uint256.
function unwrap(BaseUint256 x) pure returns (uint256 result) {
    result = BaseUint256.unwrap(x);
}
