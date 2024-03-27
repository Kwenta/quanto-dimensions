// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type QuantoInt256 is int256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int256 number into the QuantoInt256 value type.
function wrap(int256 x) pure returns (QuantoInt256 result) {
    result = QuantoInt256.wrap(x);
}

/// @notice Unwraps a QuantoInt256 number into int256.
function unwrap(QuantoInt256 x) pure returns (int256 result) {
    result = QuantoInt256.unwrap(x);
}

using {unwrap} for QuantoInt256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the QuantoInt256 type.
function add(QuantoInt256 x, QuantoInt256 y)
    pure
    returns (QuantoInt256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the QuantoInt256 type.
function sub(QuantoInt256 x, QuantoInt256 y)
    pure
    returns (QuantoInt256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the QuantoInt256 type.
function and(QuantoInt256 x, int256 bits) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the QuantoInt256 type.
function and2(QuantoInt256 x, QuantoInt256 y)
    pure
    returns (QuantoInt256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the QuantoInt256 type.
function eq(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the QuantoInt256 type.
function gt(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the QuantoInt256 type.
function gte(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the QuantoInt256 type.
function lt(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the QuantoInt256 type.
function lte(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the QuantoInt256 type.
function mod(QuantoInt256 x, QuantoInt256 y)
    pure
    returns (QuantoInt256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the QuantoInt256 type.
function neq(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the QuantoInt256 type.
function not(QuantoInt256 x) pure returns (QuantoInt256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the QuantoInt256 type.
function or(QuantoInt256 x, QuantoInt256 y)
    pure
    returns (QuantoInt256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the QuantoInt256 type.
function xor(QuantoInt256 x, QuantoInt256 y)
    pure
    returns (QuantoInt256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the QuantoInt256 type.
function increment(QuantoInt256 x) pure returns (QuantoInt256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the QuantoInt256 type.
function mul(QuantoInt256 x, int256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies quanto and dimensionless to get quanto
function mulDecimal(QuantoInt256 x, int256 y)
    pure
    returns (QuantoInt256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the QuantoInt256 type.
function div(QuantoInt256 x, int256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides quanto and dimensionless to get quanto
function divDecimal(QuantoInt256 x, int256 y)
    pure
    returns (QuantoInt256 result)
{
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the QuantoInt256 type.
function max(QuantoInt256 x, QuantoInt256 y) pure returns (QuantoInt256) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the QuantoInt256 type.
function min(QuantoInt256 x, QuantoInt256 y) pure returns (QuantoInt256) {
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the QuantoInt256 type.
function sameSide(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

/// @notice Implements the isZero operation for the QuantoInt256 type.
function isZero(QuantoInt256 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of QuantoInt256 by QuantoInt256 to dimensionless.
function divToDimensionless(QuantoInt256 x, QuantoInt256 y)
    pure
    returns (int256 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides QuantoInt256 and QuantoInt256 to dimensionless
function divDecimalToDimensionless(QuantoInt256 x, QuantoInt256 y)
    pure
    returns (int256 result)
{
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of QuantoInt256 by QuantoInt256 to dimensionless.
function ceilDivide(QuantoInt256 x, QuantoInt256 y) pure returns (int256) {
    return x.unwrap() / y.unwrap()
        + (
            (
                ((x.unwrap() < 0) != (y.unwrap() < 0))
                    || (x.unwrap() % y.unwrap()) == 0
            ) ? int256(0) : int256(1)
        );
}

/// @notice Checks the greater than zero operation (>0) in the QuantoInt256 type.
function greaterThanZero(QuantoInt256 x) pure returns (bool) {
    return x.unwrap() > 0;
}

/// @notice Checks the less than zero operation (<0) in the QuantoInt256 type.
function lessThanZero(QuantoInt256 x) pure returns (bool) {
    return x.unwrap() < 0;
}

/// @notice Checks the greater than or equal to zero operation (>=0) in the QuantoInt256 type.
function greaterThanOrEqualToZero(QuantoInt256 x) pure returns (bool) {
    return x.unwrap() >= 0;
}

/// @notice Checks the less than or equal to zero operation (<=0) in the QuantoInt256 type.
function lessThanOrEqualToZero(QuantoInt256 x) pure returns (bool) {
    return x.unwrap() <= 0;
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
    sameSide,
    isZero,
    divToDimensionless,
    divDecimalToDimensionless,
    ceilDivide,
    greaterThanZero,
    lessThanZero,
    greaterThanOrEqualToZero,
    lessThanOrEqualToZero
} for QuantoInt256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the QuantoInt256 type.
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
} for QuantoInt256 global;
