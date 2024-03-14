// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "../../utils/DecimalMath.sol";

type BaseUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint256 number into the BaseUint256 value type.
function wrap(uint256 x) pure returns (BaseUint256 result) {
    result = BaseUint256.wrap(x);
}

/// @notice Unwraps a BaseUint256 number into uint256.
function unwrap(BaseUint256 x) pure returns (uint256 result) {
    result = BaseUint256.unwrap(x);
}

using {unwrap} for BaseUint256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the BaseUint256 type.
function add(BaseUint256 x, BaseUint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseUint256 type.
function sub(BaseUint256 x, BaseUint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseUint256 type.
function and(BaseUint256 x, uint256 bits) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseUint256 type.
function and2(BaseUint256 x, BaseUint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseUint256 type.
function eq(BaseUint256 x, BaseUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseUint256 type.
function gt(BaseUint256 x, BaseUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseUint256 type.
function gte(BaseUint256 x, BaseUint256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseUint256 type.
function lt(BaseUint256 x, BaseUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseUint256 type.
function lte(BaseUint256 x, BaseUint256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseUint256 type.
function mod(BaseUint256 x, BaseUint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseUint256 type.
function neq(BaseUint256 x, BaseUint256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseUint256 type.
function not(BaseUint256 x) pure returns (BaseUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseUint256 type.
function or(BaseUint256 x, BaseUint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseUint256 type.
function xor(BaseUint256 x, BaseUint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseUint256 type.
function increment(BaseUint256 x) pure returns (BaseUint256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseUint256 type.
function mul(BaseUint256 x, uint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies base and dimensionless to get base
function mulDecimal(BaseUint256 x, uint256 y)
    pure
    returns (BaseUint256 result)
{
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Implements the checked division operation (/) in the BaseUint256 type.
function div(BaseUint256 x, uint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() / y);
}

/// @notice Divides base and dimensionless to get base
function divDecimal(BaseUint256 x, uint256 y)
    pure
    returns (BaseUint256 result)
{
    result = wrap(x.unwrap().divDecimal(y));
}

/// @notice Implements the maximum operation in the BaseUint256 type.
function max(BaseUint256 x, BaseUint256 y) pure returns (BaseUint256) {
    return x < y ? y : x;
}

/// @notice Implements the minimum operation (/) in the BaseUint256 type.
function min(BaseUint256 x, BaseUint256 y) pure returns (BaseUint256) {
    return x < y ? x : y;
}

/// @notice Implements the isZero operation for the BaseUint256 type.
function isZero(BaseUint256 x) pure returns (bool) {
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
} for BaseUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseUint256 type.
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
} for BaseUint256 global;
