// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "src/utils/DecimalMath.sol";

type USDPerQuantoInt256 is int256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a int256 number into the USDPerQuantoInt256 value type.
function wrap(int256 x) pure returns (USDPerQuantoInt256 result) {
    result = USDPerQuantoInt256.wrap(x);
}

/// @notice Unwraps a USDPerQuantoInt256 number into int256.
function unwrap(USDPerQuantoInt256 x) pure returns (int256 result) {
    result = USDPerQuantoInt256.unwrap(x);
}

using {
    unwrap
} for USDPerQuantoInt256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoInt256 type.
function add(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerQuantoInt256 type.
function sub(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoInt256 type.
function and(USDPerQuantoInt256 x, int256 bits)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoInt256 type.
function and2(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerQuantoInt256 type.
function eq(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerQuantoInt256 type.
function gt(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerQuantoInt256 type.
function gte(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerQuantoInt256 type.
function lt(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerQuantoInt256 type.
function lte(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerQuantoInt256 type.
function mod(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerQuantoInt256 type.
function neq(USDPerQuantoInt256 x, USDPerQuantoInt256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerQuantoInt256 type.
function not(USDPerQuantoInt256 x) pure returns (USDPerQuantoInt256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerQuantoInt256 type.
function or(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerQuantoInt256 type.
function xor(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoInt256 type.
function increment(USDPerQuantoInt256 x)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerQuantoInt256 type.
function mul(USDPerQuantoInt256 x, int256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/quanto and dimensionless to get usd/quanto
function mulDecimal(USDPerQuantoInt256 x, int256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the USDPerQuantoInt256 type.
function div(USDPerQuantoInt256 x, int256 y)
    pure
    returns (USDPerQuantoInt256 result)
{
    result = wrap(x.unwrap() / y);
}

/// @notice Divides usd/quanto and dimensionless to get usd/quanto
function divDecimal(USDPerQuantoInt256 x, int256 y)
    pure
    returns (USDPerQuantoInt256 result)
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
} for USDPerQuantoInt256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerQuantoInt256 type.
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
} for USDPerQuantoInt256 global;
