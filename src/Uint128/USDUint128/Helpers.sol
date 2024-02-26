// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {USDUint128} from "./ValueType.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the USDUint128 type.
function add(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDUint128 type.
function sub(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDUint128 type.
function and(USDUint128 x, uint128 bits) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDUint128 type.
function and2(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDUint128 type.
function eq(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDUint128 type.
function gt(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDUint128 type.
function gte(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDUint128 type.
function lt(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDUint128 type.
function lte(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDUint128 type.
function mod(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDUint128 type.
function neq(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDUint128 type.
function not(USDUint128 x) pure returns (USDUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDUint128 type.
function or(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDUint128 type.
function xor(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDUint128 type.
function increment(USDUint128 x) pure returns (USDUint128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDUint128 type.
function mul(USDUint128 x, uint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies USDUint128 and dimensionless to get USDUint128
function mulDecimal(USDUint128 x, uint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the USDUint128 type.
function div(USDUint128 x, uint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() / y);
}
