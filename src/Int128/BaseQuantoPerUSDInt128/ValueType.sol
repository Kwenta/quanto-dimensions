// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

type BaseQuantoPerUSDInt128 is int128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int128 number into the BaseQuantoPerUSDInt128 value type.
function wrap(int128 x) pure returns (BaseQuantoPerUSDInt128 result) {
    result = BaseQuantoPerUSDInt128.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDInt128 number into int128.
function unwrap(BaseQuantoPerUSDInt128 x) pure returns (int128 result) {
    result = BaseQuantoPerUSDInt128.unwrap(x);
}

using {unwrap} for BaseQuantoPerUSDInt128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

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

/// @notice Implements the checked division operation (/) in the BaseQuantoPerUSDInt128 type.
function div(BaseQuantoPerUSDInt128 x, int128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides (base * quanto)/usd and dimensionless to get (base * quanto)/usd
function divDecimalInt128(BaseQuantoPerUSDInt128 x, int128 y)
    pure
    returns (BaseQuantoPerUSDInt128 result)
{
    result = wrap(x.unwrap().divDecimalInt128(y));
}

/// @notice Implements the maximum operation in the BaseQuantoPerUSDInt128 type.
function max128(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (BaseQuantoPerUSDInt128)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the BaseQuantoPerUSDInt128 type.
function min128(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (BaseQuantoPerUSDInt128)
{
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the BaseQuantoPerUSDInt128 type.
function sameSide(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (bool)
{
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

/// @notice Implements the isZero operation for the BaseQuantoPerUSDInt128 type.
function isZero(BaseQuantoPerUSDInt128 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of BaseQuantoPerUSDInt128 by BaseQuantoPerUSDInt128 to dimensionless.
function divToDimensionless(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (int128 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides BaseQuantoPerUSDInt128 and BaseQuantoPerUSDInt128 to dimensionless
function divDecimalToDimensionless(
    BaseQuantoPerUSDInt128 x,
    BaseQuantoPerUSDInt128 y
) pure returns (int256 result) {
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of BaseQuantoPerUSDInt128 by BaseQuantoPerUSDInt128 to dimensionless.
function ceilDivide(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
    pure
    returns (int128)
{
    return x.unwrap() / y.unwrap()
        + (
            (
                ((x.unwrap() < 0) != (y.unwrap() < 0))
                    || (x.unwrap() % y.unwrap()) == 0
            ) ? int128(0) : int128(1)
        );
}

/// @notice Checks the greater than zero operation (>0) in the BaseQuantoPerUSDInt128 type.
function greaterThanZero(BaseQuantoPerUSDInt128 x) pure returns (bool) {
    return x.unwrap() > 0;
}

/// @notice Checks the less than zero operation (<0) in the BaseQuantoPerUSDInt128 type.
function lessThanZero(BaseQuantoPerUSDInt128 x) pure returns (bool) {
    return x.unwrap() < 0;
}

/// @notice Checks the greater than or equal to zero operation (>=0) in the BaseQuantoPerUSDInt128 type.
function greaterThanOrEqualToZero(BaseQuantoPerUSDInt128 x)
    pure
    returns (bool)
{
    return x.unwrap() >= 0;
}

/// @notice Checks the less than or equal to zero operation (<=0) in the BaseQuantoPerUSDInt128 type.
function lessThanOrEqualToZero(BaseQuantoPerUSDInt128 x) pure returns (bool) {
    return x.unwrap() <= 0;
}

using {
    and,
    increment,
    mul,
    mulDecimal,
    div,
    divDecimalInt128,
    max128,
    min128,
    sameSide,
    isZero,
    divToDimensionless,
    divDecimalToDimensionless,
    ceilDivide,
    greaterThanZero,
    lessThanZero,
    greaterThanOrEqualToZero,
    lessThanOrEqualToZero
} for BaseQuantoPerUSDInt128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseQuantoPerUSDInt128 type.
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
} for BaseQuantoPerUSDInt128 global;
