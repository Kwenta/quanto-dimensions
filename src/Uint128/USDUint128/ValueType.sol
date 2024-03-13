// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

type USDUint128 is uint128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint128 number into the USDUint128 value type.
function wrap(uint128 x) pure returns (USDUint128 result) {
    result = USDUint128.wrap(x);
}

/// @notice Unwraps a USDUint128 number into uint128.
function unwrap(USDUint128 x) pure returns (uint128 result) {
    result = USDUint128.unwrap(x);
}

using {unwrap} for USDUint128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the USDUint128 type.
function add(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDUint128 type.
function sub(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDUint128 type.
function and(USDUint128 x, uint128 bits) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDUint128 type.
function and2(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDUint128 type.
function eq(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDUint128 type.
function gt(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDUint128 type.
function gte(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDUint128 type.
function lt(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDUint128 type.
function lte(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDUint128 type.
function mod(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDUint128 type.
function neq(USDUint128 x, USDUint128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDUint128 type.
function not(USDUint128 x) pure returns (USDUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDUint128 type.
function or(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDUint128 type.
function xor(USDUint128 x, USDUint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDUint128 type.
function increment(USDUint128 x) pure returns (USDUint128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDUint128 type.
function mul(USDUint128 x, uint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies USDUint128 and dimensionless to get USDUint128
function mulDecimal(USDUint128 x, uint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the USDUint128 type.
function div(USDUint128 x, uint128 y) pure returns (USDUint128 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides USDUint128 and dimensionless to get USDUint128
function divDecimalUint128(USDUint128 x, uint128 y)
    pure
    returns (USDUint128 result)
{
    result = wrap(x.unwrap().divDecimalUint128(y));
}

/// @notice Implements the maximum operation in the USDUint128 type.
function max128(USDUint128 x, USDUint128 y) pure returns (USDUint128) {
    return x.unwrap() < y.unwrap() ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDUint128 type.
function min128(USDUint128 x, USDUint128 y) pure returns (USDUint128) {
    return x < y ? x : y;
}

using {
    and,
    increment,
    mul,
    mulDecimal,
    div,
    divDecimalUint128,
    max128,
    min128
} for USDUint128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDUint128 type.
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
} for USDUint128 global;
