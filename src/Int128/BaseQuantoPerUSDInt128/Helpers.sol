// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {BaseQuantoPerUSDInt128} from "./ValueType.sol";
import {USDPerBaseInt128} from "../USDPerBaseInt128/ValueType.sol";
import {USDPerQuantoInt128} from "../USDPerQuantoInt128/ValueType.sol";
import {BaseInt128} from "../BaseInt128/ValueType.sol";
import {QuantoInt128} from "../QuantoInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";
import {DecimalMath} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";
import {SafeCastI256} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the BaseQuantoPerUSDInt128 type.
function add(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseQuantoPerUSDInt128 type.
function sub(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseQuantoPerUSDInt128 type.
function and(BaseQuantoPerUSDInt128 x, int128 bits)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseQuantoPerUSDInt128 type.
function and2(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseQuantoPerUSDInt128 type.
function eq(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (bool)
{
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseQuantoPerUSDInt128 type.
function gt(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (bool)
{
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseQuantoPerUSDInt128 type.
function gte(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (bool)
{
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseQuantoPerUSDInt128 type.
function lt(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (bool)
{
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseQuantoPerUSDInt128 type.
function lte(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (bool)
{
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseQuantoPerUSDInt128 type.
function mod(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseQuantoPerUSDInt128 type.
function neq(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (bool)
{
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseQuantoPerUSDInt128 type.
function not(BaseQuantoPerUSDInt128 x)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseQuantoPerUSDInt128 type.
function or(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseQuantoPerUSDInt128 type.
function xor(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseQuantoPerUSDInt128 type.
function increment(BaseQuantoPerUSDInt128 x)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseQuantoPerUSDInt128 type.
function mul(BaseQuantoPerUSDInt128 x, int128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies (base * quanto)/usd and dimensionless to get (base * quanto)/usd
function mulDecimal(BaseQuantoPerUSDInt128 x, int128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
function mulDecimalToQuanto(BaseQuantoPerUSDInt128 x, USDPerBaseInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = QuantoInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
function mulDecimalToBase(BaseQuantoPerUSDInt128 x, USDPerQuantoInt128 y)
    pure
    returns (BaseInt128 result)
{
    result = BaseInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the BaseQuantoPerUSDInt128 type.
function div(BaseQuantoPerUSDInt128 x, int128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() / y);
}
