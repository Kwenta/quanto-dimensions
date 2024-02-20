// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { USDUint256 } from "./ValueType.sol";

/// @notice Implements the checked addition operation (+) in the USDUint256 type.
function add(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDUint256 type.
function increment(USDUint256 x) pure returns (USDUint256 result) {
    result = x + wrap(1);
}