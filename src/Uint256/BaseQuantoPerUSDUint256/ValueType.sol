// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type BaseQuantoPerUSDUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint256 number into the BaseQuantoPerUSDUint256 value type.
function wrap(uint256 x) pure returns (BaseQuantoPerUSDUint256 result) {
    result = BaseQuantoPerUSDUint256.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDUint256 number into uint256.
function unwrap(BaseQuantoPerUSDUint256 x) pure returns (uint256 result) {
    result = BaseQuantoPerUSDUint256.unwrap(x);
}

using {unwrap} for BaseQuantoPerUSDUint256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

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

/// @notice Implements the checked division operation (/) in the BaseQuantoPerUSDUint256 type.
function div(BaseQuantoPerUSDUint256 x, uint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides (base * quanto)/usd and dimensionless to get (base * quanto)/usd
function divDecimal(BaseQuantoPerUSDUint256 x, uint256 y)
    pure
    returns (BaseQuantoPerUSDUint256 result)
{
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the BaseQuantoPerUSDUint256 type.
function max(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseQuantoPerUSDUint256)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the BaseQuantoPerUSDUint256 type.
function min(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (BaseQuantoPerUSDUint256)
{
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the BaseQuantoPerUSDUint256 type.
function isZero(BaseQuantoPerUSDUint256 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of BaseQuantoPerUSDUint256 by BaseQuantoPerUSDUint256 to dimensionless.
function divToDimensionless(
    BaseQuantoPerUSDUint256 x,
    BaseQuantoPerUSDUint256 y
) pure returns (uint256 result) {
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides BaseQuantoPerUSDUint256 and BaseQuantoPerUSDUint256 to dimensionless
function divDecimalToDimensionless(
    BaseQuantoPerUSDUint256 x,
    BaseQuantoPerUSDUint256 y
) pure returns (uint256 result) {
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of BaseQuantoPerUSDUint256 by BaseQuantoPerUSDUint256 to dimensionless.
function ceilDivide(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y)
    pure
    returns (uint256)
{
    return x.unwrap() / y.unwrap()
        + (x.unwrap() % y.unwrap() == 0 ? uint256(0) : uint256(1));
}

/// @notice Checks the greater than zero operation (>0) in the BaseQuantoPerUSDUint256 type.
function greaterThanZero(BaseQuantoPerUSDUint256 x) pure returns (bool) {
    return x.unwrap() > 0;
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
    isZero,
    divToDimensionless,
    divDecimalToDimensionless,
    ceilDivide,
    greaterThanZero
} for BaseQuantoPerUSDUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseQuantoPerUSDUint256 type.
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
} for BaseQuantoPerUSDUint256 global;
