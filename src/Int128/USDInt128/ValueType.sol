// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

type USDInt128 is int128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int128 number into the USDInt128 value type.
function wrap(int128 x) pure returns (USDInt128 result) {
    result = USDInt128.wrap(x);
}

/// @notice Unwraps a USDInt128 number into int128.
function unwrap(USDInt128 x) pure returns (int128 result) {
    result = USDInt128.unwrap(x);
}

using {unwrap} for USDInt128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the USDInt128 type.
function add(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDInt128 type.
function sub(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDInt128 type.
function and(USDInt128 x, int128 bits) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDInt128 type.
function and2(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDInt128 type.
function eq(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDInt128 type.
function gt(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDInt128 type.
function gte(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDInt128 type.
function lt(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDInt128 type.
function lte(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDInt128 type.
function mod(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDInt128 type.
function neq(USDInt128 x, USDInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDInt128 type.
function not(USDInt128 x) pure returns (USDInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDInt128 type.
function or(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDInt128 type.
function xor(USDInt128 x, USDInt128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDInt128 type.
function increment(USDInt128 x) pure returns (USDInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDInt128 type.
function mul(USDInt128 x, int128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies USDInt128 and dimensionless to get USDInt128
function mulDecimal(USDInt128 x, int128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the USDInt128 type.
function div(USDInt128 x, int128 y) pure returns (USDInt128 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides USDInt128 and dimensionless to get USDInt128
function divDecimalInt128(USDInt128 x, int128 y)
    pure
    returns (USDInt128 result)
{
    result = wrap(x.unwrap().divDecimalInt128(y));
}

/// @notice Implements the maximum operation in the USDInt128 type.
function max128(USDInt128 x, USDInt128 y) pure returns (USDInt128) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDInt128 type.
function min128(USDInt128 x, USDInt128 y) pure returns (USDInt128) {
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the USDInt128 type.
function sameSide(USDInt128 x, USDInt128 y) pure returns (bool) {
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

/// @notice Implements the isZero operation for the USDInt128 type.
function isZero(USDInt128 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of USDInt128 by USDInt128 to dimensionless.
function divToDimensionless(USDInt128 x, USDInt128 y)
    pure
    returns (int128 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides USDInt128 and USDInt128 to dimensionless
function divDecimalToDimensionless(USDInt128 x, USDInt128 y)
    pure
    returns (int256 result)
{
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of USDInt128 by USDInt128 to dimensionless.
function ceilDivide(USDInt128 x, USDInt128 y) pure returns (int128) {
    return x.unwrap() / y.unwrap()
        + (
            (
                ((x.unwrap() < 0) != (y.unwrap() < 0))
                    || (x.unwrap() % y.unwrap()) == 0
            ) ? int128(0) : int128(1)
        );
}

/// @notice Checks the greater than zero operation (>0) in the USDInt128 type.
function greaterThanZero(USDInt128 x) pure returns (bool) {
    return x.unwrap() > 0;
}

/// @notice Checks the less than zero operation (<0) in the USDInt128 type.
function lessThanZero(USDInt128 x) pure returns (bool) {
    return x.unwrap() < 0;
}

/// @notice Checks the greater than or equal to zero operation (>=0) in the USDInt128 type.
function greaterThanOrEqualToZero(USDInt128 x) pure returns (bool) {
    return x.unwrap() >= 0;
}

/// @notice Checks the less than or equal to zero operation (<=0) in the USDInt128 type.
function lessThanOrEqualToZero(USDInt128 x) pure returns (bool) {
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
} for USDInt128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDInt128 type.
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
} for USDInt128 global;
