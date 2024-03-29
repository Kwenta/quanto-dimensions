// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

type BaseQuantoPerUSDUint128 is uint128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint128 number into the BaseQuantoPerUSDUint128 value type.
function wrap(uint128 x) pure returns (BaseQuantoPerUSDUint128 result) {
    result = BaseQuantoPerUSDUint128.wrap(x);
}

/// @notice Unwraps a BaseQuantoPerUSDUint128 number into uint128.
function unwrap(BaseQuantoPerUSDUint128 x) pure returns (uint128 result) {
    result = BaseQuantoPerUSDUint128.unwrap(x);
}

using {unwrap} for BaseQuantoPerUSDUint128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

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

/// @notice Implements the checked division operation (/) in the BaseQuantoPerUSDUint128 type.
function div(BaseQuantoPerUSDUint128 x, uint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides (base * quanto)/usd and dimensionless to get (base * quanto)/usd
function divDecimalUint128(BaseQuantoPerUSDUint128 x, uint128 y)
    pure
    returns (BaseQuantoPerUSDUint128 result)
{
    result = wrap(x.unwrap().divDecimalUint128(y));
}

/// @notice Implements the maximum operation in the BaseQuantoPerUSDUint128 type.
function max128(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseQuantoPerUSDUint128)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the BaseQuantoPerUSDUint128 type.
function min128(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (BaseQuantoPerUSDUint128)
{
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the BaseQuantoPerUSDUint128 type.
function isZero(BaseQuantoPerUSDUint128 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of BaseQuantoPerUSDUint128 by BaseQuantoPerUSDUint128 to dimensionless.
function divToDimensionless(
    BaseQuantoPerUSDUint128 x,
    BaseQuantoPerUSDUint128 y
) pure returns (uint128 result) {
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides BaseQuantoPerUSDUint128 and BaseQuantoPerUSDUint128 to dimensionless
function divDecimalToDimensionless(
    BaseQuantoPerUSDUint128 x,
    BaseQuantoPerUSDUint128 y
) pure returns (uint256 result) {
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of BaseQuantoPerUSDUint128 by BaseQuantoPerUSDUint128 to dimensionless.
function ceilDivide(BaseQuantoPerUSDUint128 x, BaseQuantoPerUSDUint128 y)
    pure
    returns (uint128)
{
    return x.unwrap() / y.unwrap()
        + (x.unwrap() % y.unwrap() == 0 ? uint128(0) : uint128(1));
}

/// @notice Checks the greater than zero operation (>0) in the BaseQuantoPerUSDUint128 type.
function greaterThanZero(BaseQuantoPerUSDUint128 x) pure returns (bool) {
    return x.unwrap() > 0;
}

using {
    and,
    increment,
    mul,
    mulDecimal,
    div,
    divDecimalUint128,
    max128,
    min128,
    isZero,
    divToDimensionless,
    divDecimalToDimensionless,
    ceilDivide,
    greaterThanZero
} for BaseQuantoPerUSDUint128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseQuantoPerUSDUint128 type.
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
} for BaseQuantoPerUSDUint128 global;
