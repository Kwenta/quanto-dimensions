// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

type QuantoInt128 is int128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int128 number into the QuantoInt128 value type.
function wrap(int128 x) pure returns (QuantoInt128 result) {
    result = QuantoInt128.wrap(x);
}

/// @notice Unwraps a QuantoInt128 number into int128.
function unwrap(QuantoInt128 x) pure returns (int128 result) {
    result = QuantoInt128.unwrap(x);
}

using {unwrap} for QuantoInt128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the QuantoInt128 type.
function add(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the QuantoInt128 type.
function sub(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the QuantoInt128 type.
function and(QuantoInt128 x, int128 bits) pure returns (QuantoInt128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the QuantoInt128 type.
function and2(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the QuantoInt128 type.
function eq(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the QuantoInt128 type.
function gt(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the QuantoInt128 type.
function gte(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the QuantoInt128 type.
function lt(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the QuantoInt128 type.
function lte(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the QuantoInt128 type.
function mod(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the QuantoInt128 type.
function neq(QuantoInt128 x, QuantoInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the QuantoInt128 type.
function not(QuantoInt128 x) pure returns (QuantoInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the QuantoInt128 type.
function or(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the QuantoInt128 type.
function xor(QuantoInt128 x, QuantoInt128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the QuantoInt128 type.
function increment(QuantoInt128 x) pure returns (QuantoInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the QuantoInt128 type.
function mul(QuantoInt128 x, int128 y) pure returns (QuantoInt128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies quanto and dimensionless to get quanto
function mulDecimal(QuantoInt128 x, int128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the QuantoInt128 type.
function div(QuantoInt128 x, int128 y) pure returns (QuantoInt128 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides quanto and dimensionless to get quanto
function divDecimalInt128(QuantoInt128 x, int128 y)
    pure
    returns (QuantoInt128 result)
{
    result = wrap(x.unwrap().divDecimalInt128(y));
}

/// @notice Implements the maximum operation in the QuantoInt128 type.
function max128(QuantoInt128 x, QuantoInt128 y) pure returns (QuantoInt128) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the QuantoInt128 type.
function min128(QuantoInt128 x, QuantoInt128 y) pure returns (QuantoInt128) {
    return x < y ? x : y;
}

/// @notice Returns same side Boolean for the QuantoInt128 type.
function sameSide(QuantoInt128 a, QuantoInt128 b) pure returns (bool) {
    return (a.unwrap() == 0) || (b.unwrap() == 0)
        || (a.unwrap() > 0) == (b.unwrap() > 0);
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
    sameSide
} for QuantoInt128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the QuantoInt128 type.
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
} for QuantoInt128 global;
