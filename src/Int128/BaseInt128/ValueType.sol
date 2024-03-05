// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerBaseInt128} from "../USDPerBaseInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";
import {BaseInt128} from "./ValueType.sol";
import {BaseInt256} from "../../Int256/BaseInt256/ValueType.sol";
import {BaseUint128} from "../../Uint128/BaseUint128/ValueType.sol";
import {SafeCastI128} from "../../utils/SafeCast.sol";

type BaseInt128 is int128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

using SafeCastI128 for int128;

/// @notice Wraps a int128 number into the BaseInt128 value type.
function wrap(int128 x) pure returns (BaseInt128 result) {
    result = BaseInt128.wrap(x);
}

/// @notice Unwraps a BaseInt128 number into int128.
function unwrap(BaseInt128 x) pure returns (int128 result) {
    result = BaseInt128.unwrap(x);
}

/// @notice Converts a BaseInt128 number into BaseInt256.
function to256(BaseInt128 x) pure returns (BaseInt256 result) {
    result = BaseInt256.wrap(BaseInt128.unwrap(x).to256());
}

/// @notice Converts a BaseInt128 number into BaseUint128.
function toUint(BaseInt128 x) pure returns (BaseUint128 result) {
    result = BaseUint128.wrap(BaseInt128.unwrap(x).toUint());
}

using {unwrap, to256, toUint} for BaseInt128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the BaseInt128 type.
function add(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseInt128 type.
function sub(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt128 type.
function and(BaseInt128 x, int128 bits) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt128 type.
function and2(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseInt128 type.
function eq(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseInt128 type.
function gt(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseInt128 type.
function gte(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseInt128 type.
function lt(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseInt128 type.
function lte(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseInt128 type.
function mod(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseInt128 type.
function neq(BaseInt128 x, BaseInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseInt128 type.
function not(BaseInt128 x) pure returns (BaseInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseInt128 type.
function or(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseInt128 type.
function xor(BaseInt128 x, BaseInt128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseInt128 type.
function increment(BaseInt128 x) pure returns (BaseInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseInt128 type.
function mul(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies base and dimensionless to get base
function mulDecimal(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies base and usd/base to get usd
function mulDecimalToUSD(BaseInt128 x, USDPerBaseInt128 y)
    pure
    returns (USDInt128 result)
{
    result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the BaseInt128 type.
function div(BaseInt128 x, int128 y) pure returns (BaseInt128 result) {
    result = wrap(x.unwrap() / y);
}

using {
    and,
    increment,
    mul,
    mulDecimal,
    mulDecimalToUSD,
    div
} for BaseInt128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseInt128 type.
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
} for BaseInt128 global;
