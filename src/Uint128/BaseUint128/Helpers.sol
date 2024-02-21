// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { BaseUint128 } from "./ValueType.sol";
import { USDPerBaseUint128 } from "../USDPerBaseUint128/ValueType.sol";
import { USDUint128 } from "../USDUint128/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for uint128;

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
function mulDecimal(BaseUint128 x, uint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap().mulDecimalUint128(y));
}

/// @notice Multiplies base and usd/base to get usd
function mulDecimalToUSD(BaseUint128 x, USDPerBaseUint128 y) pure returns (USDUint128 result) {
    result = USDUint128.wrap(x.unwrap().mulDecimalUint128(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the BaseUint128 type.
function div(BaseUint128 x, uint128 y) pure returns (BaseUint128 result) {
    result = wrap(x.unwrap() / y);
}
