// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerBaseUint256} from "./ValueType.sol";

/// @notice Wraps a uint256 number into the USDPerBaseUint256 value type.
function wrap(uint256 x) pure returns (USDPerBaseUint256 result) {
    result = USDPerBaseUint256.wrap(x);
}

/// @notice Unwraps a USDPerBaseUint256 number into uint256.
function unwrap(USDPerBaseUint256 x) pure returns (uint256 result) {
    result = USDPerBaseUint256.unwrap(x);
}
