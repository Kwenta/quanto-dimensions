// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {USDPerBaseUint128} from "./ValueType.sol";
import {BaseQuantoPerUSDUint128} from "../BaseQuantoPerUSDUint128/ValueType.sol";
import {BaseUint128} from "../BaseUint128/ValueType.sol";
import {QuantoUint128} from "../QuantoUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseUint128 type.
function add(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerBaseUint128 type.
function sub(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseUint128 type.
function and(USDPerBaseUint128 x, uint128 bits)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseUint128 type.
function and2(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerBaseUint128 type.
function eq(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerBaseUint128 type.
function gt(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerBaseUint128 type.
function gte(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerBaseUint128 type.
function lt(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerBaseUint128 type.
function lte(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerBaseUint128 type.
function mod(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerBaseUint128 type.
function neq(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerBaseUint128 type.
function not(USDPerBaseUint128 x) pure returns (USDPerBaseUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerBaseUint128 type.
function or(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerBaseUint128 type.
function xor(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseUint128 type.
function increment(USDPerBaseUint128 x)
    pure
    returns (USDPerBaseUint128 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerBaseUint128 type.
function mul(USDPerBaseUint128 x, uint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/base and dimensionless to get usd/base
function mulDecimal(USDPerBaseUint128 x, uint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies usd/base and base to get usd
function mulDecimalToUSD(USDPerBaseUint128 x, BaseUint128 y)
    pure
    returns (USDUint128 result)
{
    result = USDUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Multiplies usd/base and (base*quanto)/usd to get quanto
function mulDecimalToQuanto(USDPerBaseUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = QuantoUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the USDPerBaseUint128 type.
function div(USDPerBaseUint128 x, uint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() / y);
}
