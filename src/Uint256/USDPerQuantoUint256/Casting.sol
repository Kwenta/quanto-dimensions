// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerQuantoUint256} from "./ValueType.sol";
import {USDPerQuantoUint128} from
    "src/Uint128/USDPerQuantoUint128/ValueType.sol";
import {USDPerQuantoInt256} from "src/Int256/USDPerQuantoInt256/ValueType.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";

using SafeCastU256 for uint256;

/// @notice Wraps a uint256 number into the USDPerQuantoUint256 value type.
function wrap(uint256 x) pure returns (USDPerQuantoUint256 result) {
    result = USDPerQuantoUint256.wrap(x);
}

/// @notice Unwraps a USDPerQuantoUint256 number into uint256.
function unwrap(USDPerQuantoUint256 x) pure returns (uint256 result) {
    result = USDPerQuantoUint256.unwrap(x);
}

/// @notice Converts a USDPerQuantoUint256 number into USDPerQuantoUint128.
function to128(USDPerQuantoUint256 x)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = USDPerQuantoUint128.wrap(unwrap(x).to128());
}

/// @notice Converts a USDPerQuantoUint256 number into USDPerQuantoInt256.
function toInt(USDPerQuantoUint256 x)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = USDPerQuantoInt256.wrap(unwrap(x).toInt());
}

/// @notice Converts a USDPerQuantoUint256 number into bytes32.
function toBytes32(USDPerQuantoUint256 x) pure returns (bytes32 result) {
    result = bytes32(unwrap(x));
}
