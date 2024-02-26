// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {USDPerQuantoInt256} from "./ValueType.sol";
import {BaseQuantoPerUSDInt256} from "../BaseQuantoPerUSDInt256/ValueType.sol";
import {USDPerBaseInt256} from "../USDPerBaseInt256/ValueType.sol";
import {BaseInt256} from "../BaseInt256/ValueType.sol";
import {QuantoInt256} from "../QuantoInt256/ValueType.sol";
import {USDInt256} from "../USDInt256/ValueType.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoInt256 type.
function add(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerQuantoInt256 type.
function sub(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoInt256 type.
function and(USDPerQuantoInt256 x, int256 bits)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoInt256 type.
function and2(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerQuantoInt256 type.
function eq(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerQuantoInt256 type.
function gt(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerQuantoInt256 type.
function gte(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerQuantoInt256 type.
function lt(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerQuantoInt256 type.
function lte(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerQuantoInt256 type.
function mod(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerQuantoInt256 type.
function neq(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerQuantoInt256 type.
function not(USDPerQuantoInt256 x) pure returns (USDPerQuantoInt256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerQuantoInt256 type.
function or(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerQuantoInt256 type.
function xor(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoInt256 type.
function increment(USDPerQuantoInt256 x)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerQuantoInt256 type.
function mul(USDPerQuantoInt256 x, int256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/quanto and dimensionless to get usd/quanto
function mulDecimal(USDPerQuantoInt256 x, int256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies usd/quanto and quanto to get usd
function mulDecimalToUSD(USDPerQuantoInt256 x, QuantoInt256 y)
    pure
    returns (USDInt256 result)
{
    result = USDInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Multiplies usd/quanto and (base*quanto)/usd to get base
function mulDecimalToBase(USDPerQuantoInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseInt256 result)
{
    result = BaseInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the USDPerQuantoInt256 type.
function div(USDPerQuantoInt256 x, int256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() / y);
}
