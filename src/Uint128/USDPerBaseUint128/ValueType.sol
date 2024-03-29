// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

type USDPerBaseUint128 is uint128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint128 number into the USDPerBaseUint128 value type.
function wrap(uint128 x) pure returns (USDPerBaseUint128 result) {
    result = USDPerBaseUint128.wrap(x);
}

/// @notice Unwraps a USDPerBaseUint128 number into uint128.
function unwrap(USDPerBaseUint128 x) pure returns (uint128 result) {
    result = USDPerBaseUint128.unwrap(x);
}

using {unwrap} for USDPerBaseUint128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseUint128 type.
function add(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerBaseUint128 type.
function sub(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseUint128 type.
function and(USDPerBaseUint128 x, uint128 bits)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseUint128 type.
function and2(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerBaseUint128 type.
function eq(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerBaseUint128 type.
function gt(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerBaseUint128 type.
function gte(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerBaseUint128 type.
function lt(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerBaseUint128 type.
function lte(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerBaseUint128 type.
function mod(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerBaseUint128 type.
function neq(USDPerBaseUint128 x, USDPerBaseUint128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerBaseUint128 type.
function not(USDPerBaseUint128 x) pure returns (USDPerBaseUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerBaseUint128 type.
function or(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerBaseUint128 type.
function xor(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseUint128 type.
function increment(USDPerBaseUint128 x)
    pure
    returns (USDPerBaseUint128 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerBaseUint128 type.
function mul(USDPerBaseUint128 x, uint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/base and dimensionless to get usd/base
function mulDecimal(USDPerBaseUint128 x, uint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the USDPerBaseUint128 type.
function div(USDPerBaseUint128 x, uint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides usd/base and dimensionless to get usd/base
function divDecimalUint128(USDPerBaseUint128 x, uint128 y)
    pure
    returns (USDPerBaseUint128 result)
{
    result = wrap(x.unwrap().divDecimalUint128(y));
}

/// @notice Implements the maximum operation in the USDPerBaseUint128 type.
function max128(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDPerBaseUint128 type.
function min128(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (USDPerBaseUint128)
{
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the USDPerBaseUint128 type.
function isZero(USDPerBaseUint128 x) pure returns (bool) {
    return (x.unwrap() == 0);
}

/// @notice Implements the division of USDPerBaseUint128 by USDPerBaseUint128 to dimensionless.
function divToDimensionless(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (uint128 result)
{
    result = x.unwrap() / y.unwrap();
}

/// @notice Divides USDPerBaseUint128 and USDPerBaseUint128 to dimensionless
function divDecimalToDimensionless(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (uint256 result)
{
    result = x.unwrap().divDecimal(y.unwrap());
}

/// @notice Implements the ceiling division of USDPerBaseUint128 by USDPerBaseUint128 to dimensionless.
function ceilDivide(USDPerBaseUint128 x, USDPerBaseUint128 y)
    pure
    returns (uint128)
{
    return x.unwrap() / y.unwrap()
        + (x.unwrap() % y.unwrap() == 0 ? uint128(0) : uint128(1));
}

/// @notice Checks the greater than zero operation (>0) in the USDPerBaseUint128 type.
function greaterThanZero(USDPerBaseUint128 x) pure returns (bool) {
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
} for USDPerBaseUint128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerBaseUint128 type.
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
} for USDPerBaseUint128 global;
