// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type BaseQuantoPerUSDInt256 is int256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int256 number into the BaseQuantoPerUSDInt256 value type.
function wrap(int256 x) pure returns (BaseQuantoPerUSDInt256 result) {
    result = BaseQuantoPerUSDInt256.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDInt256 number into int256.
function unwrap(BaseQuantoPerUSDInt256 x) pure returns (int256 result) {
    result = BaseQuantoPerUSDInt256.unwrap(x);
}

using {unwrap} for BaseQuantoPerUSDInt256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

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

/// @notice Implements the checked division operation (/) in the BaseQuantoPerUSDInt256 type.
function div(BaseQuantoPerUSDInt256 x, int256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides (base * quanto)/usd and dimensionless to get (base * quanto)/usd
function divDecimal(BaseQuantoPerUSDInt256 x, int256 y)
    pure
    returns (BaseQuantoPerUSDInt256 result)
{
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the BaseQuantoPerUSDInt256 type.
function max(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseQuantoPerUSDInt256)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the BaseQuantoPerUSDInt256 type.
function min(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (BaseQuantoPerUSDInt256)
{
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the BaseQuantoPerUSDInt256 type.
function sameSide(BaseQuantoPerUSDInt256 x, BaseQuantoPerUSDInt256 y)
    pure
    returns (bool)
{
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

using {
    and,
    increment,
    mul,
    mulDecimal,
    div,
    divDecimal,
    max,
    min,
    sameSide
} for BaseQuantoPerUSDInt256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseQuantoPerUSDInt256 type.
using {
    add as +,
    and2 as &,
    sub as -,
    eq as ==,
    gt as >,
    gte as >=,
    lt as <,
    lte as <=,
    mod as %,
    neq as !=,
    or as |,
    not as ~,
    xor as ^
} for BaseQuantoPerUSDInt256 global;
