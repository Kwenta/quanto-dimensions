// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {BaseQuantoPerUSDUint128} from "./ValueType.sol";
import {USDPerBaseUint128} from "../USDPerBaseUint128/ValueType.sol";
import {USDPerQuantoUint128} from "../USDPerQuantoUint128/ValueType.sol";
import {BaseUint128} from "../BaseUint128/ValueType.sol";
import {QuantoUint128} from "../QuantoUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from
    "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the BaseQuantoPerUSDUint128 type.
function add(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseQuantoPerUSDUint128 type.
function sub(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseQuantoPerUSDUint128 type.
function and(BaseQuantoPerUSDUint128 x, uint128 bits)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseQuantoPerUSDUint128 type.
function and2(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseQuantoPerUSDUint128 type.
function eq(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseQuantoPerUSDUint128 type.
function gt(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseQuantoPerUSDUint128 type.
function gte(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseQuantoPerUSDUint128 type.
function lt(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseQuantoPerUSDUint128 type.
function lte(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseQuantoPerUSDUint128 type.
function mod(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseQuantoPerUSDUint128 type.
function neq(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseQuantoPerUSDUint128 type.
function not(BaseQuantoPerUSDUint128 x)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseQuantoPerUSDUint128 type.
function or(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseQuantoPerUSDUint128 type.
function xor(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseQuantoPerUSDUint128 type.
function increment(BaseQuantoPerUSDUint128 x)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseQuantoPerUSDUint128 type.
function mul(BaseQuantoPerUSDUint128 x, uint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies (base * quanto)/usd and dimensionless to get (base * quanto)/usd
function mulDecimal(BaseQuantoPerUSDUint128 x, uint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
function mulDecimalToQuanto(BaseQuantoPerUSDUint128 x, USDPerBaseUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = QuantoUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
function mulDecimalToBase(BaseQuantoPerUSDUint128 x, USDPerQuantoUint128 y)
    pure
    returns (BaseUint128 result)
{
    result = BaseUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the BaseQuantoPerUSDUint128 type.
function div(BaseQuantoPerUSDUint128 x, uint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() / y);
}
