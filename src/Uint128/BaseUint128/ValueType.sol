// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";

type BaseUint128 is uint128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

/// @notice Wraps a uint128 number into the BaseUint128 value type.
function wrap(uint128 x) pure returns (BaseUint128 result) {
    result = BaseUint128.wrap(x);
}

/// @notice Unwraps a BaseUint128 number into uint128.
function unwrap(BaseUint128 x) pure returns (uint128 result) {
    result = BaseUint128.unwrap(x);
}

using {
    unwrap
} for BaseUint128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for uint128;
using SafeCastU256 for uint256;

/// @notice Implements the checked addition operation (+) in the BaseUint128 type.
function add(BaseUint128 x, BaseUint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseUint128 type.
function sub(BaseUint128 x, BaseUint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseUint128 type.
function and(BaseUint128 x, uint128 bits) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseUint128 type.
function and2(BaseUint128 x, BaseUint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseUint128 type.
function eq(BaseUint128 x, BaseUint128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseUint128 type.
function gt(BaseUint128 x, BaseUint128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseUint128 type.
function gte(BaseUint128 x, BaseUint128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseUint128 type.
function lt(BaseUint128 x, BaseUint128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseUint128 type.
function lte(BaseUint128 x, BaseUint128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseUint128 type.
function mod(BaseUint128 x, BaseUint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseUint128 type.
function neq(BaseUint128 x, BaseUint128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseUint128 type.
function not(BaseUint128 x) pure returns (BaseUint128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseUint128 type.
function or(BaseUint128 x, BaseUint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseUint128 type.
function xor(BaseUint128 x, BaseUint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseUint128 type.
function increment(BaseUint128 x) pure returns (BaseUint128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseUint128 type.
function mul(BaseUint128 x, uint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies base and dimensionless to get base
function mulDecimal(BaseUint128 x, uint128 y)
    pure
    returns (BaseUint128 result)
{
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Implements the checked division operation (/) in the BaseUint128 type.
function div(BaseUint128 x, uint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() / y);
}

using {
    and,
    increment,
    mul,
    mulDecimal,
    div
} for BaseUint128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseUint128 type.
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
} for BaseUint128 global;
