// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type BaseInt256 is int256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int256 number into the BaseInt256 value type.
function wrap(int256 x) pure returns (BaseInt256 result) {
    result = BaseInt256.wrap(x);
}

/// @notice Unwraps a BaseInt256 number into int256.
function unwrap(BaseInt256 x) pure returns (int256 result) {
    result = BaseInt256.unwrap(x);
}

using {unwrap} for BaseInt256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the BaseInt256 type.
function add(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseInt256 type.
function sub(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt256 type.
function and(BaseInt256 x, int256 bits) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt256 type.
function and2(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseInt256 type.
function eq(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseInt256 type.
function gt(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseInt256 type.
function gte(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseInt256 type.
function lt(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseInt256 type.
function lte(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseInt256 type.
function mod(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseInt256 type.
function neq(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseInt256 type.
function not(BaseInt256 x) pure returns (BaseInt256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseInt256 type.
function or(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseInt256 type.
function xor(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseInt256 type.
function increment(BaseInt256 x) pure returns (BaseInt256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseInt256 type.
function mul(BaseInt256 x, int256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies base and dimensionless to get base
function mulDecimal(BaseInt256 x, int256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the BaseInt256 type.
function div(BaseInt256 x, int256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides base and dimensionless to get base
function divDecimal(BaseInt256 x, int256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the BaseInt256 type.
function max(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the BaseInt256 type.
function min(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256) {
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the BaseInt256 type.
function sameSide(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

/// @notice Implements the isZero operation for the BaseInt256 type.
function isZero(BaseInt256 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of BaseInt256 by BaseInt256 to dimensionless.
function divToDimensionless(BaseInt256 x, BaseInt256 y)
    pure
    returns (int256 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides BaseInt256 and BaseInt256 to dimensionless
function divDecimalToDimensionless(BaseInt256 x, BaseInt256 y)
    pure
    returns (int256 result)
{
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of BaseInt256 by BaseInt256 to dimensionless.
function ceilDivide(BaseInt256 x, BaseInt256 y) pure returns (int256) {
    return x.unwrap() / y.unwrap()
        + (
            (
                ((x.unwrap() < 0) != (y.unwrap() < 0))
                    || (x.unwrap() % y.unwrap()) == 0
            ) ? int256(0) : int256(1)
        );
}

/// @notice Checks the greater than zero operation (>0) in the BaseInt256 type.
function greaterThanZero(BaseInt256 x) pure returns (bool) {
    return x.unwrap() > 0;
}

/// @notice Checks the less than zero operation (<0) in the BaseInt256 type.
function lessThanZero(BaseInt256 x) pure returns (bool) {
    return x.unwrap() < 0;
}

/// @notice Checks the greater than or equal to zero operation (>=0) in the BaseInt256 type.
function greaterThanOrEqualToZero(BaseInt256 x) pure returns (bool) {
    return x.unwrap() >= 0;
}

/// @notice Checks the less than or equal to zero operation (<=0) in the BaseInt256 type.
function lessThanOrEqualToZero(BaseInt256 x) pure returns (bool) {
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
} for BaseInt256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseInt256 type.
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
} for BaseInt256 global;
