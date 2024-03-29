// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

type USDPerQuantoInt128 is int128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int128 number into the USDPerQuantoInt128 value type.
function wrap(int128 x) pure returns (USDPerQuantoInt128 result) {
    result = USDPerQuantoInt128.wrap(x);
}

/// @notice Unwraps a USDPerQuantoInt128 number into int128.
function unwrap(USDPerQuantoInt128 x) pure returns (int128 result) {
    result = USDPerQuantoInt128.unwrap(x);
}

using {unwrap} for USDPerQuantoInt128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoInt128 type.
function add(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerQuantoInt128 type.
function sub(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoInt128 type.
function and(USDPerQuantoInt128 x, int128 bits)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoInt128 type.
function and2(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerQuantoInt128 type.
function eq(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerQuantoInt128 type.
function gt(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerQuantoInt128 type.
function gte(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerQuantoInt128 type.
function lt(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerQuantoInt128 type.
function lte(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerQuantoInt128 type.
function mod(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerQuantoInt128 type.
function neq(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerQuantoInt128 type.
function not(USDPerQuantoInt128 x) pure returns (USDPerQuantoInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerQuantoInt128 type.
function or(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerQuantoInt128 type.
function xor(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoInt128 type.
function increment(USDPerQuantoInt128 x)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerQuantoInt128 type.
function mul(USDPerQuantoInt128 x, int128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/quanto and dimensionless to get usd/quanto
function mulDecimal(USDPerQuantoInt128 x, int128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the USDPerQuantoInt128 type.
function div(USDPerQuantoInt128 x, int128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides usd/quanto and dimensionless to get usd/quanto
function divDecimalInt128(USDPerQuantoInt128 x, int128 y)
    pure
    returns (USDPerQuantoInt128 result)
{
    result = wrap(x.unwrap().divDecimalInt128(y));
}

/// @notice Implements the maximum operation in the USDPerQuantoInt128 type.
function max128(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDPerQuantoInt128)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDPerQuantoInt128 type.
function min128(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (USDPerQuantoInt128)
{
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the USDPerQuantoInt128 type.
function sameSide(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (bool)
{
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

/// @notice Implements the isZero operation for the USDPerQuantoInt128 type.
function isZero(USDPerQuantoInt128 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of USDPerQuantoInt128 by USDPerQuantoInt128 to dimensionless.
function divToDimensionless(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (int128 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides USDPerQuantoInt128 and USDPerQuantoInt128 to dimensionless
function divDecimalToDimensionless(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
    pure
    returns (int256 result)
{
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of USDPerQuantoInt128 by USDPerQuantoInt128 to dimensionless.
function ceilDivide(USDPerQuantoInt128 x, USDPerQuantoInt128 y)
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

/// @notice Checks the greater than zero operation (>0) in the USDPerQuantoInt128 type.
function greaterThanZero(USDPerQuantoInt128 x) pure returns (bool) {
    return x.unwrap() > 0;
}

/// @notice Checks the less than zero operation (<0) in the USDPerQuantoInt128 type.
function lessThanZero(USDPerQuantoInt128 x) pure returns (bool) {
    return x.unwrap() < 0;
}

/// @notice Checks the greater than or equal to zero operation (>=0) in the USDPerQuantoInt128 type.
function greaterThanOrEqualToZero(USDPerQuantoInt128 x) pure returns (bool) {
    return x.unwrap() >= 0;
}

/// @notice Checks the less than or equal to zero operation (<=0) in the USDPerQuantoInt128 type.
function lessThanOrEqualToZero(USDPerQuantoInt128 x) pure returns (bool) {
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
} for USDPerQuantoInt128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerQuantoInt128 type.
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
} for USDPerQuantoInt128 global;
