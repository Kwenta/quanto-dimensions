// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {USDUint256} from "./ValueType.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the USDUint256 type.
function add(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDUint256 type.
function sub(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDUint256 type.
function and(USDUint256 x, uint256 bits) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDUint256 type.
function and2(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDUint256 type.
function eq(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDUint256 type.
function gt(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDUint256 type.
function gte(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDUint256 type.
function lt(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDUint256 type.
function lte(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDUint256 type.
function mod(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDUint256 type.
function neq(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDUint256 type.
function not(USDUint256 x) pure returns (USDUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDUint256 type.
function or(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDUint256 type.
function xor(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDUint256 type.
function increment(USDUint256 x) pure returns (USDUint256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDUint256 type.
function mul(USDUint256 x, uint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies USDUint256 and dimensionless to get USDUint256
function mulDecimal(USDUint256 x, uint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the USDUint256 type.
function div(USDUint256 x, uint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() / y);
}
