// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type USDPerQuantoUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint256 number into the USDPerQuantoUint256 value type.
function wrap(uint256 x) pure returns (USDPerQuantoUint256 result) {
    result = USDPerQuantoUint256.wrap(x);
}

/// @notice Unwraps a USDPerQuantoUint256 number into uint256.
function unwrap(USDPerQuantoUint256 x) pure returns (uint256 result) {
    result = USDPerQuantoUint256.unwrap(x);
}

using {unwrap} for USDPerQuantoUint256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoUint256 type.
function add(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerQuantoUint256 type.
function sub(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoUint256 type.
function and(USDPerQuantoUint256 x, uint256 bits)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoUint256 type.
function and2(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerQuantoUint256 type.
function eq(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerQuantoUint256 type.
function gt(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerQuantoUint256 type.
function gte(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerQuantoUint256 type.
function lt(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerQuantoUint256 type.
function lte(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerQuantoUint256 type.
function mod(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerQuantoUint256 type.
function neq(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (bool)
{
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerQuantoUint256 type.
function not(USDPerQuantoUint256 x) pure returns (USDPerQuantoUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerQuantoUint256 type.
function or(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerQuantoUint256 type.
function xor(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoUint256 type.
function increment(USDPerQuantoUint256 x)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerQuantoUint256 type.
function mul(USDPerQuantoUint256 x, uint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/quanto and dimensionless to get usd/quanto
function mulDecimal(USDPerQuantoUint256 x, uint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the USDPerQuantoUint256 type.
function div(USDPerQuantoUint256 x, uint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides usd/quanto and dimensionless to get usd/quanto
function divDecimal(USDPerQuantoUint256 x, uint256 y)
    pure
    returns (USDPerQuantoUint256 result)
{
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the USDPerQuantoUint256 type.
function max(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDPerQuantoUint256 type.
function min(USDPerQuantoUint256 x, USDPerQuantoUint256 y)
    pure
    returns (USDPerQuantoUint256)
{
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the USDPerQuantoUint256 type.
function isZero(USDPerQuantoUint256 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of USDPerQuantoUint256 by USDPerQuantoUint256 to dimensionless.
function divToDimensionless(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (uint256 result) {
    result = x.unwrap() / y.unwrap();
}

/// @notice Implements the ceiling division of USDPerQuantoUint256 by USDPerQuantoUint256 to dimensionless.
function ceilDivide(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (uint256) {
    return x.unwrap() / y.unwrap() + (x.unwrap() % y.unwrap() == 0 ? uint256(0) : uint256(1));
}

/// @notice Checks the greater than zero operation (>0) in the USDPerQuantoUint256 type.
function greaterThanZero(USDPerQuantoUint256 x) pure returns (bool) {
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
} for USDPerQuantoUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerQuantoUint256 type.
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
} for USDPerQuantoUint256 global;
