// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "src/utils/DecimalMath.sol";

type USDPerBaseInt256 is int256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int256 number into the USDPerBaseInt256 value type.
function wrap(int256 x) pure returns (USDPerBaseInt256 result) {
    result = USDPerBaseInt256.wrap(x);
}

/// @notice Unwraps a USDPerBaseInt256 number into int256.
function unwrap(USDPerBaseInt256 x) pure returns (int256 result) {
    result = USDPerBaseInt256.unwrap(x);
}

using {unwrap} for USDPerBaseInt256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseInt256 type.
function add(USDPerBaseInt256 x, USDPerBaseInt256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerBaseInt256 type.
function sub(USDPerBaseInt256 x, USDPerBaseInt256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseInt256 type.
function and(USDPerBaseInt256 x, int256 bits)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseInt256 type.
function and2(USDPerBaseInt256 x, USDPerBaseInt256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerBaseInt256 type.
function eq(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerBaseInt256 type.
function gt(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerBaseInt256 type.
function gte(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerBaseInt256 type.
function lt(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerBaseInt256 type.
function lte(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerBaseInt256 type.
function mod(USDPerBaseInt256 x, USDPerBaseInt256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerBaseInt256 type.
function neq(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerBaseInt256 type.
function not(USDPerBaseInt256 x) pure returns (USDPerBaseInt256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerBaseInt256 type.
function or(USDPerBaseInt256 x, USDPerBaseInt256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerBaseInt256 type.
function xor(USDPerBaseInt256 x, USDPerBaseInt256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseInt256 type.
function increment(USDPerBaseInt256 x) pure returns (USDPerBaseInt256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerBaseInt256 type.
function mul(USDPerBaseInt256 x, int256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/base and dimensionless to get usd/base
function mulDecimal(USDPerBaseInt256 x, int256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the USDPerBaseInt256 type.
function div(USDPerBaseInt256 x, int256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides usd/base and dimensionless to get usd/base
function divDecimal(USDPerBaseInt256 x, int256 y)
    pure
    returns (USDPerBaseInt256 result)
{
    result = wrap(x.unwrap().divDecimal(y));
}

using {
    and,
    increment,
    mul,
    mulDecimal,
    div,
    divDecimal
} for USDPerBaseInt256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerBaseInt256 type.
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
} for USDPerBaseInt256 global;
