// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { BaseInt256 } from "./ValueType.sol";
import { USDPerBaseInt256 } from "../USDPerBaseInt256/ValueType.sol";
import { USDInt256 } from "../USDInt256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the BaseInt256 type.
function add(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the BaseInt256 type.
function sub(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt256 type.
function and(BaseInt256 x, int256 bits) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the BaseInt256 type.
function and2(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the BaseInt256 type.
function eq(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the BaseInt256 type.
function gt(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the BaseInt256 type.
function gte(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the BaseInt256 type.
function lt(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the BaseInt256 type.
function lte(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the BaseInt256 type.
function mod(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the BaseInt256 type.
function neq(BaseInt256 x, BaseInt256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the BaseInt256 type.
function not(BaseInt256 x) pure returns (BaseInt256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the BaseInt256 type.
function or(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the BaseInt256 type.
function xor(BaseInt256 x, BaseInt256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseInt256 type.
function increment(BaseInt256 x) pure returns (BaseInt256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the BaseInt256 type.
function mul(BaseInt256 x, int256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies base and dimensionless to get base
function mulDecimal(BaseInt256 x, int256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies base and usd/base to get usd
function mulDecimalToUSD(BaseInt256 x, USDPerBaseInt256 y) pure returns (USDInt256 result) {
    result = USDInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the BaseInt256 type.
function div(BaseInt256 x, int256 y) pure returns (BaseInt256 result) {
    result = wrap(x.unwrap() / y);
}
