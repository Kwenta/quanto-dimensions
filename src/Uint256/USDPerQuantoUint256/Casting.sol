// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerQuantoUint256} from "./ValueType.sol";

/// @notice Wraps a uint256 number into the USDPerQuantoUint256 value type.
function wrap(uint256 x) pure returns (USDPerQuantoUint256 result) {
    result = USDPerQuantoUint256.wrap(x);
}

/// @notice Unwraps a USDPerQuantoUint256 number into uint256.
function unwrap(USDPerQuantoUint256 x) pure returns (uint256 result) {
    result = USDPerQuantoUint256.unwrap(x);
}

/// @notice Converts a USDPerQuantoUint256 number into bytes32.
function toBytes32(USDPerQuantoUint256 x) pure returns (bytes32 result) {
    result = bytes32(unwrap(x));
}
