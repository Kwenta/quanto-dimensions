// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

type BaseInt128 is int128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int128 number into the BaseInt128 value type.
function wrap(int128 x) pure returns (BaseInt128 result) {
    result = BaseInt128.wrap(x);
}

/// @notice Unwraps a BaseInt128 number into int128.
function unwrap(BaseInt128 x) pure returns (int128 result) {
    result = BaseInt128.unwrap(x);
}

using {unwrap} for BaseInt128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the BaseInt128 type.
function add(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseInt128 type.
function sub(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt128 type.
function and(BaseInt128 x, int128 bits) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt128 type.
function and2(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseInt128 type.
function eq(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseInt128 type.
function gt(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseInt128 type.
function gte(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseInt128 type.
function lt(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseInt128 type.
function lte(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseInt128 type.
function mod(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseInt128 type.
function neq(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseInt128 type.
function not(BaseInt128 x) pure returns (BaseInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseInt128 type.
function or(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseInt128 type.
function xor(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseInt128 type.
function increment(BaseInt128 x) pure returns (BaseInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseInt128 type.
function mul(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies base and dimensionless to get base
function mulDecimal(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the BaseInt128 type.
function div(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides base and dimensionless to get base
function divDecimalInt128(BaseInt128 x, int128 y)
    pure
    returns (BaseInt128 result)
{
    result = wrap(x.unwrap().divDecimalInt128(y));
}

/// @notice Implements the maximum operation in the BaseInt128 type.
function max128(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the BaseInt128 type.
function min128(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128) {
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the BaseInt128 type.
function sameSide(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return (x.unwrap() == 0) || (y.unwrap() == 0)
        || (x.unwrap() > 0) == (y.unwrap() > 0);
}

/// @notice Returns zero in the BaseInt128 type.
function zero(BaseInt128) pure returns (BaseInt128) {
    return wrap(0);
}

/// @notice Implements the isZero operation for the BaseInt128 type.
function isZero(BaseInt128 x) pure returns (bool) {
    return (x.unwrap() == 0);
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
    zero,
    isZero
} for BaseInt128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseInt128 type.
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
} for BaseInt128 global;
