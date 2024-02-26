// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerQuantoInt256} from "./ValueType.sol";
import {USDPerQuantoInt128} from "src/Int128/USDPerQuantoInt128/ValueType.sol";
import {USDPerQuantoUint256} from
    "src/Uint256/USDPerQuantoUint256/ValueType.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";

using SafeCastI256 for int256;

/// @notice Wraps a int256 number into the USDPerQuantoInt256 value type.
function wrap(int256 x) pure returns (USDPerQuantoInt256 result) {
    result = USDPerQuantoInt256.wrap(x);
}

/// @notice Unwraps a USDPerQuantoInt256 number into int256.
function unwrap(USDPerQuantoInt256 x) pure returns (int256 result) {
    result = USDPerQuantoInt256.unwrap(x);
}

/// @notice Converts a USDPerQuantoInt256 number into USDPerQuantoInt128.
function to128(USDPerQuantoInt256 x) pure returns (USDPerQuantoInt128 result) {
    result = USDPerQuantoInt128.wrap(unwrap(x).to128());
}

/// @notice Converts a USDPerQuantoInt256 number into USDPerQuantoUint256.
function toUint(USDPerQuantoInt256 x)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = USDPerQuantoUint256.wrap(unwrap(x).toUint());
}
