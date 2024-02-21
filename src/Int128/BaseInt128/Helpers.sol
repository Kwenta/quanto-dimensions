// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { BaseInt128 } from "./ValueType.sol";
import { USDPerBaseInt128 } from "../USDPerBaseInt128/ValueType.sol";
import { USDInt128 } from "../USDInt128/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";
import { SafeCastI256 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the BaseInt128 type.
function add(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseInt128 type.
function sub(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt128 type.
function and(BaseInt128 x, int128 bits) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt128 type.
function and2(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseInt128 type.
function eq(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseInt128 type.
function gt(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseInt128 type.
function gte(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseInt128 type.
function lt(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseInt128 type.
function lte(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseInt128 type.
function mod(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseInt128 type.
function neq(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseInt128 type.
function not(BaseInt128 x) pure returns (BaseInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseInt128 type.
function or(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseInt128 type.
function xor(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseInt128 type.
function increment(BaseInt128 x) pure returns (BaseInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseInt128 type.
function mul(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies base and dimensionless to get base
function mulDecimal(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies base and usd/base to get usd
function mulDecimalToUSD(BaseInt128 x, USDPerBaseInt128 y) pure returns (USDInt128 result) {
    result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the BaseInt128 type.
function div(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() / y);
}