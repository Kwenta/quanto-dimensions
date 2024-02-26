// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerBaseInt256} from "./ValueType.sol";
import {USDPerBaseInt128} from "../../Int128/USDPerBaseInt128/ValueType.sol";
import {USDPerBaseUint256} from "../../Uint256/USDPerBaseUint256/ValueType.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

using SafeCastI256 for int256;

/// @notice Wraps a int256 number into the USDPerBaseInt256 value type.
function wrap(int256 x) pure returns (USDPerBaseInt256 result) {
    result = USDPerBaseInt256.wrap(x);
}

/// @notice Unwraps a USDPerBaseInt256 number into int256.
function unwrap(USDPerBaseInt256 x) pure returns (int256 result) {
    result = USDPerBaseInt256.unwrap(x);
}

/// @notice Converts a USDPerBaseInt256 number into USDPerBaseInt128.
function to128(USDPerBaseInt256 x) pure returns (USDPerBaseInt128 result) {
    result = USDPerBaseInt128.wrap(unwrap(x).to128());
}

/// @notice Converts a USDPerBaseInt256 number into USDPerBaseUint256.
function toUint(USDPerBaseInt256 x) pure returns (USDPerBaseUint256 result) {
    result = USDPerBaseUint256.wrap(unwrap(x).toUint());
}
