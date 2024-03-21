// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

type QuantoUint128 is uint128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint128 number into the QuantoUint128 value type.
function wrap(uint128 x) pure returns (QuantoUint128 result) {
    result = QuantoUint128.wrap(x);
}

/// @notice Unwraps a QuantoUint128 number into uint128.
function unwrap(QuantoUint128 x) pure returns (uint128 result) {
    result = QuantoUint128.unwrap(x);
}

using {unwrap} for QuantoUint128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the QuantoUint128 type.
function add(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the QuantoUint128 type.
function sub(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the QuantoUint128 type.
function and(QuantoUint128 x, uint128 bits)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the QuantoUint128 type.
function and2(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the QuantoUint128 type.
function eq(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the QuantoUint128 type.
function gt(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the QuantoUint128 type.
function gte(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the QuantoUint128 type.
function lt(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the QuantoUint128 type.
function lte(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the QuantoUint128 type.
function mod(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the QuantoUint128 type.
function neq(QuantoUint128 x, QuantoUint128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the QuantoUint128 type.
function not(QuantoUint128 x) pure returns (QuantoUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the QuantoUint128 type.
function or(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the QuantoUint128 type.
function xor(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the QuantoUint128 type.
function increment(QuantoUint128 x) pure returns (QuantoUint128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the QuantoUint128 type.
function mul(QuantoUint128 x, uint128 y) pure returns (QuantoUint128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies quanto and dimensionless to get quanto
function mulDecimal(QuantoUint128 x, uint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the QuantoUint128 type.
function div(QuantoUint128 x, uint128 y) pure returns (QuantoUint128 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides quanto and dimensionless to get quanto
function divDecimalUint128(QuantoUint128 x, uint128 y)
    pure
    returns (QuantoUint128 result)
{
    result = wrap(x.unwrap().divDecimalUint128(y));
}

/// @notice Implements the maximum operation in the QuantoUint128 type.
function max128(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the QuantoUint128 type.
function min128(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (QuantoUint128)
{
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the QuantoUint128 type.
function isZero(QuantoUint128 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of QuantoUint128 by QuantoUint128 to dimensionless.
function divToDimensionless(QuantoUint128 x, QuantoUint128 y)
    pure
    returns (uint128 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Implements the ceiling division of QuantoUint128 by QuantoUint128 to dimensionless.
function ceilDivide(QuantoUint128 x, QuantoUint128 y) pure returns (uint128) {
    return x.unwrap() / y.unwrap()
        + (x.unwrap() % y.unwrap() == 0 ? uint128(0) : uint128(1));
}

/// @notice Checks the greater than zero operation (>0) in the QuantoUint128 type.
function greaterThanZero(QuantoUint128 x) pure returns (bool) {
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
    ceilDivide,
    greaterThanZero
} for QuantoUint128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the QuantoUint128 type.
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
} for QuantoUint128 global;
