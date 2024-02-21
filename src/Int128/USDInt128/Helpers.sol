// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { USDInt128 } from "./ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";
import { SafeCastI256 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the USDInt128 type.
function add(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDInt128 type.
function sub(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDInt128 type.
function and(USDInt128 x, int128 bits) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDInt128 type.
function and2(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDInt128 type.
function eq(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDInt128 type.
function gt(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDInt128 type.
function gte(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDInt128 type.
function lt(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDInt128 type.
function lte(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDInt128 type.
function mod(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDInt128 type.
function neq(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDInt128 type.
function not(USDInt128 x) pure returns (USDInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDInt128 type.
function or(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDInt128 type.
function xor(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDInt128 type.
function increment(USDInt128 x) pure returns (USDInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDInt128 type.
function mul(USDInt128 x, int128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies USDInt128 and dimensionless to get USDInt128
function mulDecimal(USDInt128 x, int128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the USDInt128 type.
function div(USDInt128 x, int128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() / y);
}
