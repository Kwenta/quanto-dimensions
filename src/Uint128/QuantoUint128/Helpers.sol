// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {QuantoUint128} from "./ValueType.sol";
import {BaseUint128} from "../BaseUint128/ValueType.sol";
import {USDPerBaseUint128} from "../USDPerBaseUint128/ValueType.sol";
import {USDPerQuantoUint128} from "../USDPerQuantoUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the QuantoUint128 type.
function add(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the QuantoUint128 type.
function sub(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the QuantoUint128 type.
function and(QuantoUint128 x, uint128 bits)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the QuantoUint128 type.
function and2(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the QuantoUint128 type.
function eq(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the QuantoUint128 type.
function gt(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the QuantoUint128 type.
function gte(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the QuantoUint128 type.
function lt(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the QuantoUint128 type.
function lte(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the QuantoUint128 type.
function mod(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the QuantoUint128 type.
function neq(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the QuantoUint128 type.
function not(QuantoUint128 x) pure returns (QuantoUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the QuantoUint128 type.
function or(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the QuantoUint128 type.
function xor(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the QuantoUint128 type.
function increment(QuantoUint128 x) pure returns (QuantoUint128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the QuantoUint128 type.
function mul(QuantoUint128 x, uint128 y) pure returns (QuantoUint128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies quanto and dimensionless to get quanto
function mulDecimal(QuantoUint128 x, uint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies quanto and usd/quanto to get usd
function mulDecimalToUSD(QuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDUint128 result)
{
    result = USDUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the QuantoUint128 type.
function div(QuantoUint128 x, uint128 y) pure returns (QuantoUint128 result) {
    result = wrap(x.unwrap() / y);
}
