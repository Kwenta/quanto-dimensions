// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

type USDPerBaseInt128 is int128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int128 number into the USDPerBaseInt128 value type.
function wrap(int128 x) pure returns (USDPerBaseInt128 result) {
    result = USDPerBaseInt128.wrap(x);
}

/// @notice Unwraps a USDPerBaseInt128 number into int128.
function unwrap(USDPerBaseInt128 x) pure returns (int128 result) {
    result = USDPerBaseInt128.unwrap(x);
}

using {unwrap} for USDPerBaseInt128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseInt128 type.
function add(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerBaseInt128 type.
function sub(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseInt128 type.
function and(USDPerBaseInt128 x, int128 bits)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseInt128 type.
function and2(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerBaseInt128 type.
function eq(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerBaseInt128 type.
function gt(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerBaseInt128 type.
function gte(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerBaseInt128 type.
function lt(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerBaseInt128 type.
function lte(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerBaseInt128 type.
function mod(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerBaseInt128 type.
function neq(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerBaseInt128 type.
function not(USDPerBaseInt128 x) pure returns (USDPerBaseInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerBaseInt128 type.
function or(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerBaseInt128 type.
function xor(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseInt128 type.
function increment(USDPerBaseInt128 x) pure returns (USDPerBaseInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerBaseInt128 type.
function mul(USDPerBaseInt128 x, int128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/base and dimensionless to get usd/base
function mulDecimal(USDPerBaseInt128 x, int128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the USDPerBaseInt128 type.
function div(USDPerBaseInt128 x, int128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides usd/base and dimensionless to get usd/base
function divDecimalInt128(USDPerBaseInt128 x, int128 y)
    pure
    returns (USDPerBaseInt128 result)
{
    result = wrap(x.unwrap().divDecimalInt128(y));
}

/// @notice Implements the maximum operation in the USDPerBaseInt128 type.
function max128(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDPerBaseInt128 type.
function min128(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDPerBaseInt128)
{
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the USDPerBaseInt128 type.
function sameSide(USDPerBaseInt128 x, USDPerBaseInt128 y) pure returns (bool) {
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

/// @notice Implements the isZero operation for the USDPerBaseInt128 type.
function isZero(USDPerBaseInt128 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of USDPerBaseInt128 by USDPerBaseInt128 to dimensionless.
function divToDimensionless(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (int128 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides USDPerBaseInt128 and USDPerBaseInt128 to dimensionless
function divDecimalToDimensionless(USDPerBaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (int256 result)
{
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of USDPerBaseInt128 by USDPerBaseInt128 to dimensionless.
function ceilDivide(USDPerBaseInt128 x, USDPerBaseInt128 y)
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

/// @notice Checks the greater than zero operation (>0) in the USDPerBaseInt128 type.
function greaterThanZero(USDPerBaseInt128 x) pure returns (bool) {
    return x.unwrap() > 0;
}

/// @notice Checks the less than zero operation (<0) in the USDPerBaseInt128 type.
function lessThanZero(USDPerBaseInt128 x) pure returns (bool) {
    return x.unwrap() < 0;
}

/// @notice Checks the greater than or equal to zero operation (>=0) in the USDPerBaseInt128 type.
function greaterThanOrEqualToZero(USDPerBaseInt128 x) pure returns (bool) {
    return x.unwrap() >= 0;
}

/// @notice Checks the less than or equal to zero operation (<=0) in the USDPerBaseInt128 type.
function lessThanOrEqualToZero(USDPerBaseInt128 x) pure returns (bool) {
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
} for USDPerBaseInt128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerBaseInt128 type.
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
} for USDPerBaseInt128 global;
