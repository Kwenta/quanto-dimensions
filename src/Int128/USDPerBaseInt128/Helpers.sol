// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {USDPerBaseInt128} from "./ValueType.sol";
import {BaseQuantoPerUSDInt128} from "../BaseQuantoPerUSDInt128/ValueType.sol";
import {BaseInt128} from "../BaseInt128/ValueType.sol";
import {QuantoInt128} from "../QuantoInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastI256} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseInt128 type.
function add(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerBaseInt128 type.
function sub(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseInt128 type.
function and(USDPerBaseInt128 x, int128 bits)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseInt128 type.
function and2(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerBaseInt128 type.
function eq(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerBaseInt128 type.
function gt(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerBaseInt128 type.
function gte(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerBaseInt128 type.
function lt(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerBaseInt128 type.
function lte(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerBaseInt128 type.
function mod(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerBaseInt128 type.
function neq(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerBaseInt128 type.
function not(USDPerBaseInt128 x) pure returns (USDPerBaseInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerBaseInt128 type.
function or(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerBaseInt128 type.
function xor(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseInt128 type.
function increment(USDPerBaseInt128 x) pure returns (USDPerBaseInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerBaseInt128 type.
function mul(USDPerBaseInt128 x, int128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/base and dimensionless to get usd/base
function mulDecimal(USDPerBaseInt128 x, int128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies usd/base and base to get usd
function mulDecimalToUSD(USDPerBaseInt128 x, BaseInt128 y)
    pure
    returns (USDInt128 result)
{
    result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Multiplies usd/base and (base*quanto)/usd to get quanto
function mulDecimalToQuanto(USDPerBaseInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = QuantoInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the USDPerBaseInt128 type.
function div(USDPerBaseInt128 x, int128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() / y);
}
