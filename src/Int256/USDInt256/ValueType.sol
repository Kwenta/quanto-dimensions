// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type USDInt256 is int256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int256 number into the USDInt256 value type.
function wrap(int256 x) pure returns (USDInt256 result) {
    result = USDInt256.wrap(x);
}

/// @notice Unwraps a USDInt256 number into int256.
function unwrap(USDInt256 x) pure returns (int256 result) {
    result = USDInt256.unwrap(x);
}

using {unwrap} for USDInt256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the USDInt256 type.
function add(USDInt256 x, USDInt256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDInt256 type.
function sub(USDInt256 x, USDInt256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDInt256 type.
function and(USDInt256 x, int256 bits) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDInt256 type.
function and2(USDInt256 x, USDInt256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDInt256 type.
function eq(USDInt256 x, USDInt256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDInt256 type.
function gt(USDInt256 x, USDInt256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDInt256 type.
function gte(USDInt256 x, USDInt256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDInt256 type.
function lt(USDInt256 x, USDInt256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDInt256 type.
function lte(USDInt256 x, USDInt256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDInt256 type.
function mod(USDInt256 x, USDInt256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDInt256 type.
function neq(USDInt256 x, USDInt256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDInt256 type.
function not(USDInt256 x) pure returns (USDInt256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDInt256 type.
function or(USDInt256 x, USDInt256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDInt256 type.
function xor(USDInt256 x, USDInt256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDInt256 type.
function increment(USDInt256 x) pure returns (USDInt256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDInt256 type.
function mul(USDInt256 x, int256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies USDInt256 and dimensionless to get USDInt256
function mulDecimal(USDInt256 x, int256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the USDInt256 type.
function div(USDInt256 x, int256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides USDInt256 and dimensionless to get USDInt256
function divDecimal(USDInt256 x, int256 y) pure returns (USDInt256 result) {
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the USDInt256 type.
function max(USDInt256 x, USDInt256 y) pure returns (USDInt256) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDInt256 type.
function min(USDInt256 x, USDInt256 y) pure returns (USDInt256) {
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the USDInt256 type.
function sameSide(USDInt256 x, USDInt256 y) pure returns (bool) {
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

/// @notice Implements the isZero operation for the USDInt256 type.
function isZero(USDInt256 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of USDInt256 by USDInt256 to dimensionless.
function divToDimensionless(USDInt256 x, USDInt256 y)
    pure
    returns (int256 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides USDInt256 and USDInt256 to dimensionless
function divDecimalToDimensionless(USDInt256 x, USDInt256 y)
    pure
    returns (int256 result)
{
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of USDInt256 by USDInt256 to dimensionless.
function ceilDivide(USDInt256 x, USDInt256 y) pure returns (int256) {
    return x.unwrap() / y.unwrap()
        + (
            (
                ((x.unwrap() < 0) != (y.unwrap() < 0))
                    || (x.unwrap() % y.unwrap()) == 0
            ) ? int256(0) : int256(1)
        );
}

/// @notice Checks the greater than zero operation (>0) in the USDInt256 type.
function greaterThanZero(USDInt256 x) pure returns (bool) {
    return x.unwrap() > 0;
}

/// @notice Checks the less than zero operation (<0) in the USDInt256 type.
function lessThanZero(USDInt256 x) pure returns (bool) {
    return x.unwrap() < 0;
}

/// @notice Checks the greater than or equal to zero operation (>=0) in the USDInt256 type.
function greaterThanOrEqualToZero(USDInt256 x) pure returns (bool) {
    return x.unwrap() >= 0;
}

/// @notice Checks the less than or equal to zero operation (<=0) in the USDInt256 type.
function lessThanOrEqualToZero(USDInt256 x) pure returns (bool) {
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
} for USDInt256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDInt256 type.
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
} for USDInt256 global;
