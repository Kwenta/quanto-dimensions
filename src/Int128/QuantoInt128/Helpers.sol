// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {QuantoInt128} from "./ValueType.sol";
import {BaseInt128} from "../BaseInt128/ValueType.sol";
import {USDPerBaseInt128} from "../USDPerBaseInt128/ValueType.sol";
import {USDPerQuantoInt128} from "../USDPerQuantoInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the QuantoInt128 type.
function add(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the QuantoInt128 type.
function sub(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the QuantoInt128 type.
function and(QuantoInt128 x, int128 bits) pure returns (QuantoInt128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the QuantoInt128 type.
function and2(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the QuantoInt128 type.
function eq(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the QuantoInt128 type.
function gt(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the QuantoInt128 type.
function gte(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the QuantoInt128 type.
function lt(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the QuantoInt128 type.
function lte(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the QuantoInt128 type.
function mod(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the QuantoInt128 type.
function neq(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the QuantoInt128 type.
function not(QuantoInt128 x) pure returns (QuantoInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the QuantoInt128 type.
function or(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the QuantoInt128 type.
function xor(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the QuantoInt128 type.
function increment(QuantoInt128 x) pure returns (QuantoInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the QuantoInt128 type.
function mul(QuantoInt128 x, int128 y) pure returns (QuantoInt128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies quanto and dimensionless to get quanto
function mulDecimal(QuantoInt128 x, int128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies quanto and usd/quanto to get usd
function mulDecimalToUSD(QuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDInt128 result)
{
    result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the QuantoInt128 type.
function div(QuantoInt128 x, int128 y) pure returns (QuantoInt128 result) {
    result = wrap(x.unwrap() / y);
}
