// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

type USDPerQuantoUint128 is uint128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint128 number into the USDPerQuantoUint128 value type.
function wrap(uint128 x) pure returns (USDPerQuantoUint128 result) {
    result = USDPerQuantoUint128.wrap(x);
}

/// @notice Unwraps a USDPerQuantoUint128 number into uint128.
function unwrap(USDPerQuantoUint128 x) pure returns (uint128 result) {
    result = USDPerQuantoUint128.unwrap(x);
}

using {unwrap} for USDPerQuantoUint128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoUint128 type.
function add(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerQuantoUint128 type.
function sub(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoUint128 type.
function and(USDPerQuantoUint128 x, uint128 bits)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoUint128 type.
function and2(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerQuantoUint128 type.
function eq(USDPerQuantoUint128 x, USDPerQuantoUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerQuantoUint128 type.
function gt(USDPerQuantoUint128 x, USDPerQuantoUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerQuantoUint128 type.
function gte(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerQuantoUint128 type.
function lt(USDPerQuantoUint128 x, USDPerQuantoUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerQuantoUint128 type.
function lte(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerQuantoUint128 type.
function mod(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerQuantoUint128 type.
function neq(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (bool)
{
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerQuantoUint128 type.
function not(USDPerQuantoUint128 x) pure returns (USDPerQuantoUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerQuantoUint128 type.
function or(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerQuantoUint128 type.
function xor(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoUint128 type.
function increment(USDPerQuantoUint128 x)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerQuantoUint128 type.
function mul(USDPerQuantoUint128 x, uint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/quanto and dimensionless to get usd/quanto
function mulDecimal(USDPerQuantoUint128 x, uint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the USDPerQuantoUint128 type.
function div(USDPerQuantoUint128 x, uint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides usd/quanto and dimensionless to get usd/quanto
function divDecimalUint128(USDPerQuantoUint128 x, uint128 y)
    pure
    returns (USDPerQuantoUint128 result)
{
    result = wrap(x.unwrap().divDecimalUint128(y));
}

/// @notice Implements the maximum operation in the USDPerQuantoUint128 type.
function max128(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDPerQuantoUint128 type.
function min128(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (USDPerQuantoUint128)
{
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the USDPerQuantoUint128 type.
function isZero(USDPerQuantoUint128 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of USDPerQuantoUint128 by USDPerQuantoUint128 to dimensionless.
function divToDimensionless(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (uint128 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides USDPerQuantoUint128 and USDPerQuantoUint128 to dimensionless
function divDecimalToDimensionless(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (uint256 result)
{
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of USDPerQuantoUint128 by USDPerQuantoUint128 to dimensionless.
function ceilDivide(USDPerQuantoUint128 x, USDPerQuantoUint128 y)
    pure
    returns (uint128)
{
    return x.unwrap() / y.unwrap()
        + (x.unwrap() % y.unwrap() == 0 ? uint128(0) : uint128(1));
}

/// @notice Checks the greater than zero operation (>0) in the USDPerQuantoUint128 type.
function greaterThanZero(USDPerQuantoUint128 x) pure returns (bool) {
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
    divDecimalToDimensionless,
    ceilDivide,
    greaterThanZero
} for USDPerQuantoUint128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerQuantoUint128 type.
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
} for USDPerQuantoUint128 global;
