// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type USDUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint256 number into the USDUint256 value type.
function wrap(uint256 x) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x);
}

/// @notice Unwraps a USDUint256 number into uint256.
function unwrap(USDUint256 x) pure returns (uint256 result) {
    result = USDUint256.unwrap(x);
}

using {unwrap} for USDUint256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the USDUint256 type.
function add(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDUint256 type.
function sub(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDUint256 type.
function and(USDUint256 x, uint256 bits) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDUint256 type.
function and2(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDUint256 type.
function eq(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDUint256 type.
function gt(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDUint256 type.
function gte(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDUint256 type.
function lt(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDUint256 type.
function lte(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDUint256 type.
function mod(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDUint256 type.
function neq(USDUint256 x, USDUint256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDUint256 type.
function not(USDUint256 x) pure returns (USDUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDUint256 type.
function or(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDUint256 type.
function xor(USDUint256 x, USDUint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDUint256 type.
function increment(USDUint256 x) pure returns (USDUint256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDUint256 type.
function mul(USDUint256 x, uint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies USDUint256 and dimensionless to get USDUint256
function mulDecimal(USDUint256 x, uint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the USDUint256 type.
function div(USDUint256 x, uint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides USDUint256 and dimensionless to get USDUint256
function divDecimal(USDUint256 x, uint256 y) pure returns (USDUint256 result) {
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the USDUint256 type.
function max(USDUint256 x, USDUint256 y) pure returns (USDUint256) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the USDUint256 type.
function min(USDUint256 x, USDUint256 y) pure returns (USDUint256) {
    return x < y ? x : y;
}

/// @notice Returns zero in the USDUint256 type.
function zero(USDUint256) pure returns (USDUint256) {
    return wrap(0);
}

/// @notice Implements the isZero operation for the USDUint256 type.
function isZero(USDUint256 x) pure returns (bool) {
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
    zero,
    isZero
} for USDUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDUint256 type.
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
} for USDUint256 global;
