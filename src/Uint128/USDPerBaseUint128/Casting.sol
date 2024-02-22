// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { USDPerBaseUint128 } from "./ValueType.sol";
import { USDPerBaseUint256 } from "src/Uint256/USDPerBaseUint256/ValueType.sol";
import { USDPerBaseInt128 } from "src/Int128/USDPerBaseInt128/ValueType.sol";
import { SafeCastU128 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastU128 for uint128;

/// @notice Wraps a uint128 number into the USDPerBaseUint128 value type.
function wrap(uint128 x) pure returns (USDPerBaseUint128 result) {
    result = USDPerBaseUint128.wrap(x);
}

/// @notice Unwraps a USDPerBaseUint128 number into uint128.
function unwrap(USDPerBaseUint128 x) pure returns (uint128 result) {
    result = USDPerBaseUint128.unwrap(x);
}

/// @notice Converts a BaseQuantoPerUSDUint128 number into USDPerBaseUint256.
function to256(USDPerBaseUint128 x) pure returns (USDPerBaseUint256 result) {
    result = USDPerBaseUint256.wrap(unwrap(x).to256());
}

/// @notice Converts a USDPerBaseUint128 number into USDPerBaseInt128.
function toInt(USDPerBaseUint128 x) pure returns (USDPerBaseInt128 result) {
    result = USDPerBaseInt128.wrap(unwrap(x).toInt());
}

/// @notice Converts a USDPerBaseUint128 number into bytes32.
function toBytes32(USDPerBaseUint128 x) pure returns (bytes32 result) {
    result = bytes32(uint256(unwrap(x)));
}
