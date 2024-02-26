// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerQuantoUint128} from "./ValueType.sol";
import {USDPerQuantoInt128} from "src/Int128/USDPerQuantoInt128/ValueType.sol";
import {SafeCastU128} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastU128 for uint128;

/// @notice Wraps a uint128 number into the USDPerQuantoUint128 value type.
function wrap(uint128 x) pure returns (USDPerQuantoUint128 result) {
    result = USDPerQuantoUint128.wrap(x);
}

/// @notice Unwraps a USDPerQuantoUint128 number into uint128.
function unwrap(USDPerQuantoUint128 x) pure returns (uint128 result) {
    result = USDPerQuantoUint128.unwrap(x);
}

/// @notice Converts a USDPerQuantoUint128 number into USDPerQuantoInt128.
function toInt(USDPerQuantoUint128 x)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = USDPerQuantoInt128.wrap(unwrap(x).toInt());
}

/// @notice Converts a USDPerQuantoUint128 number into bytes32.
function toBytes32(USDPerQuantoUint128 x) pure returns (bytes32 result) {
    result = bytes32(uint256(unwrap(x)));
}
