// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type QuantoUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint256 number into the QuantoUint256 value type.
function wrap(uint256 x) pure returns (QuantoUint256 result) {
    result = QuantoUint256.wrap(x);
}

/// @notice Unwraps a QuantoUint256 number into uint256.
function unwrap(QuantoUint256 x) pure returns (uint256 result) {
    result = QuantoUint256.unwrap(x);
}

using {unwrap} for QuantoUint256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the QuantoUint256 type.
function add(QuantoUint256 x, QuantoUint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the QuantoUint256 type.
function sub(QuantoUint256 x, QuantoUint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the QuantoUint256 type.
function and(QuantoUint256 x, uint256 bits)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the QuantoUint256 type.
function and2(QuantoUint256 x, QuantoUint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the QuantoUint256 type.
function eq(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the QuantoUint256 type.
function gt(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the QuantoUint256 type.
function gte(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the QuantoUint256 type.
function lt(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the QuantoUint256 type.
function lte(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the QuantoUint256 type.
function mod(QuantoUint256 x, QuantoUint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the QuantoUint256 type.
function neq(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the QuantoUint256 type.
function not(QuantoUint256 x) pure returns (QuantoUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the QuantoUint256 type.
function or(QuantoUint256 x, QuantoUint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the QuantoUint256 type.
function xor(QuantoUint256 x, QuantoUint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the QuantoUint256 type.
function increment(QuantoUint256 x) pure returns (QuantoUint256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the QuantoUint256 type.
function mul(QuantoUint256 x, uint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies quanto and dimensionless to get quanto
function mulDecimal(QuantoUint256 x, uint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the QuantoUint256 type.
function div(QuantoUint256 x, uint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides quanto and dimensionless to get quanto
function divDecimal(QuantoUint256 x, uint256 y)
    pure
    returns (QuantoUint256 result)
{
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the QuantoUint256 type.
function max(QuantoUint256 x, QuantoUint256 y) pure returns (QuantoUint256) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the QuantoUint256 type.
function min(QuantoUint256 x, QuantoUint256 y) pure returns (QuantoUint256) {
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the QuantoUint256 type.
function isZero(QuantoUint256 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of QuantoUint256 by QuantoUint256 to dimensionless.
function divToDimensionless(QuantoUint256 x, QuantoUint256 y) pure returns (uint256 result) {
    result = x.unwrap() / y.unwrap();
}

/// @notice Implements the ceiling division of QuantoUint256 by QuantoUint256 to dimensionless.
function ceilDivide(QuantoUint256 x, QuantoUint256 y) pure returns (uint256) {
    return x.unwrap() / y.unwrap() + (x.unwrap() % y.unwrap() == 0 ? uint256(0) : uint256(1));
}

/// @notice Checks the greater than zero operation (>0) in the QuantoUint256 type.
function greaterThanZero(QuantoUint256 x) pure returns (bool) {
    return x.unwrap() > 0;
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
    isZero,
    divToDimensionless,
    ceilDivide,
    greaterThanZero
} for QuantoUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the QuantoUint256 type.
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
} for QuantoUint256 global;
