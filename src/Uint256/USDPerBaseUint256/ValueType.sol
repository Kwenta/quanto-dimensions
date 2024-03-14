// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type USDPerBaseUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint256 number into the USDPerBaseUint256 value type.
function wrap(uint256 x) pure returns (USDPerBaseUint256 result) {
    result = USDPerBaseUint256.wrap(x);
}

/// @notice Unwraps a USDPerBaseUint256 number into uint256.
function unwrap(USDPerBaseUint256 x) pure returns (uint256 result) {
    result = USDPerBaseUint256.unwrap(x);
}

using {unwrap} for USDPerBaseUint256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseUint256 type.
function add(USDPerBaseUint256 x, USDPerBaseUint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerBaseUint256 type.
function sub(USDPerBaseUint256 x, USDPerBaseUint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseUint256 type.
function and(USDPerBaseUint256 x, uint256 bits)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseUint256 type.
function and2(USDPerBaseUint256 x, USDPerBaseUint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerBaseUint256 type.
function eq(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerBaseUint256 type.
function gt(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerBaseUint256 type.
function gte(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerBaseUint256 type.
function lt(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerBaseUint256 type.
function lte(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerBaseUint256 type.
function mod(USDPerBaseUint256 x, USDPerBaseUint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerBaseUint256 type.
function neq(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerBaseUint256 type.
function not(USDPerBaseUint256 x) pure returns (USDPerBaseUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerBaseUint256 type.
function or(USDPerBaseUint256 x, USDPerBaseUint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerBaseUint256 type.
function xor(USDPerBaseUint256 x, USDPerBaseUint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseUint256 type.
function increment(USDPerBaseUint256 x)
    pure
    returns (USDPerBaseUint256 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerBaseUint256 type.
function mul(USDPerBaseUint256 x, uint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/base and dimensionless to get usd/base
function mulDecimal(USDPerBaseUint256 x, uint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the USDPerBaseUint256 type.
function div(USDPerBaseUint256 x, uint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides usd/base and dimensionless to get usd/base
function divDecimal(USDPerBaseUint256 x, uint256 y)
    pure
    returns (USDPerBaseUint256 result)
{
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the USDPerBaseUint256 type.
function max(USDPerBaseUint256 x, USDPerBaseUint256 y)
    pure
    returns (USDPerBaseUint256)
{
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDPerBaseUint256 type.
function min(USDPerBaseUint256 x, USDPerBaseUint256 y)
    pure
    returns (USDPerBaseUint256)
{
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the USDPerBaseUint256 type.
function isZero(USDPerBaseUint256 x) pure returns (bool) {
    return (x.unwrap() == 0);
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
    isZero
} for USDPerBaseUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerBaseUint256 type.
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
} for USDPerBaseUint256 global;
