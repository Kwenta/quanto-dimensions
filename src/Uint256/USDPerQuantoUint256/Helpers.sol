// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {USDPerQuantoUint256} from "./ValueType.sol";
import {BaseQuantoPerUSDUint256} from "../BaseQuantoPerUSDUint256/ValueType.sol";
import {USDPerBaseUint256} from "../USDPerBaseUint256/ValueType.sol";
import {BaseUint256} from "../BaseUint256/ValueType.sol";
import {QuantoUint256} from "../QuantoUint256/ValueType.sol";
import {USDUint256} from "../USDUint256/ValueType.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoUint256 type.
function add(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerQuantoUint256 type.
function sub(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoUint256 type.
function and(USDPerQuantoUint256 x, uint256 bits)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoUint256 type.
function and2(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerQuantoUint256 type.
function eq(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerQuantoUint256 type.
function gt(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerQuantoUint256 type.
function gte(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerQuantoUint256 type.
function lt(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerQuantoUint256 type.
function lte(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerQuantoUint256 type.
function mod(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerQuantoUint256 type.
function neq(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerQuantoUint256 type.
function not(USDPerQuantoUint256 x) pure returns (USDPerQuantoUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerQuantoUint256 type.
function or(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerQuantoUint256 type.
function xor(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoUint256 type.
function increment(USDPerQuantoUint256 x)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerQuantoUint256 type.
function mul(USDPerQuantoUint256 x, uint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/quanto and dimensionless to get usd/quanto
function mulDecimal(USDPerQuantoUint256 x, uint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies usd/quanto and quanto to get usd
function mulDecimalToUSD(USDPerQuantoUint256 x, QuantoUint256 y)
    pure
    returns (USDUint256 result)
{
    result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Multiplies usd/quanto and (base*quanto)/usd to get base
function mulDecimalToBase(USDPerQuantoUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseUint256 result)
{
    result = BaseUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the USDPerQuantoUint256 type.
function div(USDPerQuantoUint256 x, uint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() / y);
}
