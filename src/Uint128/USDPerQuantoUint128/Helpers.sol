// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {USDPerQuantoUint128} from "./ValueType.sol";
import {BaseQuantoPerUSDUint128} from "../BaseQuantoPerUSDUint128/ValueType.sol";
import {USDPerBaseUint128} from "../USDPerBaseUint128/ValueType.sol";
import {BaseUint128} from "../BaseUint128/ValueType.sol";
import {QuantoUint128} from "../QuantoUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoUint128 type.
function add(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerQuantoUint128 type.
function sub(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoUint128 type.
function and(USDPerQuantoUint128 x, uint128 bits)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoUint128 type.
function and2(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerQuantoUint128 type.
function eq(USDPerQuantoUint128 x, USDPerQuantoUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerQuantoUint128 type.
function gt(USDPerQuantoUint128 x, USDPerQuantoUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerQuantoUint128 type.
function gte(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerQuantoUint128 type.
function lt(USDPerQuantoUint128 x, USDPerQuantoUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerQuantoUint128 type.
function lte(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerQuantoUint128 type.
function mod(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerQuantoUint128 type.
function neq(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerQuantoUint128 type.
function not(USDPerQuantoUint128 x) pure returns (USDPerQuantoUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerQuantoUint128 type.
function or(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerQuantoUint128 type.
function xor(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoUint128 type.
function increment(USDPerQuantoUint128 x)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerQuantoUint128 type.
function mul(USDPerQuantoUint128 x, uint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/quanto and dimensionless to get usd/quanto
function mulDecimal(USDPerQuantoUint128 x, uint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies usd/quanto and quanto to get usd
function mulDecimalToUSD(USDPerQuantoUint128 x, QuantoUint128 y)
    pure
    returns (USDUint128 result)
{
    result = USDUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Multiplies usd/quanto and (base*quanto)/usd to get base
function mulDecimalToBase(USDPerQuantoUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseUint128 result)
{
    result = BaseUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the USDPerQuantoUint128 type.
function div(USDPerQuantoUint128 x, uint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() / y);
}
