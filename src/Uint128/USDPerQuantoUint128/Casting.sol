// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { USDPerQuantoUint128 } from "./ValueType.sol";

/// @notice Wraps a uint128 number into the USDPerQuantoUint128 value type.
function wrap(uint128 x) pure returns (USDPerQuantoUint128 result) {
    result = USDPerQuantoUint128.wrap(x);
}

/// @notice Unwraps a USDPerQuantoUint128 number into uint128.
function unwrap(USDPerQuantoUint128 x) pure returns (uint128 result) {
    result = USDPerQuantoUint128.unwrap(x);
}
