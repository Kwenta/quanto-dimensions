// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {BaseQuantoPerUSDInt256} from "./ValueType.sol";
import {USDPerBaseInt256} from "../USDPerBaseInt256/ValueType.sol";
import {USDPerQuantoInt256} from "../USDPerQuantoInt256/ValueType.sol";
import {BaseInt256} from "../BaseInt256/ValueType.sol";
import {QuantoInt256} from "../QuantoInt256/ValueType.sol";
import {USDInt256} from "../USDInt256/ValueType.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the BaseQuantoPerUSDInt256 type.
function add(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseQuantoPerUSDInt256 type.
function sub(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseQuantoPerUSDInt256 type.
function and(BaseQuantoPerUSDInt256 x, int256 bits)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseQuantoPerUSDInt256 type.
function and2(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseQuantoPerUSDInt256 type.
function eq(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (bool)
{
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseQuantoPerUSDInt256 type.
function gt(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (bool)
{
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseQuantoPerUSDInt256 type.
function gte(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (bool)
{
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseQuantoPerUSDInt256 type.
function lt(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (bool)
{
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseQuantoPerUSDInt256 type.
function lte(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (bool)
{
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseQuantoPerUSDInt256 type.
function mod(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseQuantoPerUSDInt256 type.
function neq(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (bool)
{
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseQuantoPerUSDInt256 type.
function not(BaseQuantoPerUSDInt256 x)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseQuantoPerUSDInt256 type.
function or(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseQuantoPerUSDInt256 type.
function xor(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseQuantoPerUSDInt256 type.
function increment(BaseQuantoPerUSDInt256 x)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseQuantoPerUSDInt256 type.
function mul(BaseQuantoPerUSDInt256 x, int256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies (base * quanto)/usd and dimensionless to get (base * quanto)/usd
function mulDecimal(BaseQuantoPerUSDInt256 x, int256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
function mulDecimalToQuanto(BaseQuantoPerUSDInt256 x, USDPerBaseInt256 y)
    pure
    returns (QuantoInt256 result)
{
    result = QuantoInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
function mulDecimalToBase(BaseQuantoPerUSDInt256 x, USDPerQuantoInt256 y)
    pure
    returns (BaseInt256 result)
{
    result = BaseInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the BaseQuantoPerUSDInt256 type.
function div(BaseQuantoPerUSDInt256 x, int256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() / y);
}
