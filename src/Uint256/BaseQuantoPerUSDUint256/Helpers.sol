// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import {BaseQuantoPerUSDUint256} from "./ValueType.sol";
import {USDPerBaseUint256} from "../USDPerBaseUint256/ValueType.sol";
import {USDPerQuantoUint256} from "../USDPerQuantoUint256/ValueType.sol";
import {BaseUint256} from "../BaseUint256/ValueType.sol";
import {QuantoUint256} from "../QuantoUint256/ValueType.sol";
import {USDUint256} from "../USDUint256/ValueType.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the BaseQuantoPerUSDUint256 type.
function add(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseQuantoPerUSDUint256 type.
function sub(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseQuantoPerUSDUint256 type.
function and(BaseQuantoPerUSDUint256 x, uint256 bits)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseQuantoPerUSDUint256 type.
function and2(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseQuantoPerUSDUint256 type.
function eq(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseQuantoPerUSDUint256 type.
function gt(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseQuantoPerUSDUint256 type.
function gte(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseQuantoPerUSDUint256 type.
function lt(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseQuantoPerUSDUint256 type.
function lte(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseQuantoPerUSDUint256 type.
function mod(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseQuantoPerUSDUint256 type.
function neq(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseQuantoPerUSDUint256 type.
function not(BaseQuantoPerUSDUint256 x)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseQuantoPerUSDUint256 type.
function or(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseQuantoPerUSDUint256 type.
function xor(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseQuantoPerUSDUint256 type.
function increment(BaseQuantoPerUSDUint256 x)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseQuantoPerUSDUint256 type.
function mul(BaseQuantoPerUSDUint256 x, uint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies (base * quanto)/usd and dimensionless to get (base * quanto)/usd
function mulDecimal(BaseQuantoPerUSDUint256 x, uint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
function mulDecimalToQuanto(BaseQuantoPerUSDUint256 x, USDPerBaseUint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = QuantoUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
function mulDecimalToBase(BaseQuantoPerUSDUint256 x, USDPerQuantoUint256 y)
    pure
    returns (BaseUint256 result)
{
    result = BaseUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the BaseQuantoPerUSDUint256 type.
function div(BaseQuantoPerUSDUint256 x, uint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() / y);
}
