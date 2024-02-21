// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { QuantoInt256 } from "./ValueType.sol";
import { BaseInt256 } from "../BaseInt256/ValueType.sol";
import { USDPerBaseInt256 } from "../USDPerBaseInt256/ValueType.sol";
import { USDPerQuantoInt256 } from "../USDPerQuantoInt256/ValueType.sol";
import { USDInt256 } from "../USDInt256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the QuantoInt256 type.
function add(QuantoInt256 x, QuantoInt256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the QuantoInt256 type.
function sub(QuantoInt256 x, QuantoInt256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the QuantoInt256 type.
function and(QuantoInt256 x, int256 bits) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the QuantoInt256 type.
function and2(QuantoInt256 x, QuantoInt256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the QuantoInt256 type.
function eq(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the QuantoInt256 type.
function gt(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the QuantoInt256 type.
function gte(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the QuantoInt256 type.
function lt(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the QuantoInt256 type.
function lte(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the QuantoInt256 type.
function mod(QuantoInt256 x, QuantoInt256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the QuantoInt256 type.
function neq(QuantoInt256 x, QuantoInt256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the QuantoInt256 type.
function not(QuantoInt256 x) pure returns (QuantoInt256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the QuantoInt256 type.
function or(QuantoInt256 x, QuantoInt256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the QuantoInt256 type.
function xor(QuantoInt256 x, QuantoInt256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the QuantoInt256 type.
function increment(QuantoInt256 x) pure returns (QuantoInt256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the QuantoInt256 type.
function mul(QuantoInt256 x, int256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies quanto and dimensionless to get quanto
function mulDecimal(QuantoInt256 x, int256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies quanto and usd/quanto to get usd
function mulDecimalToUSD(QuantoInt256 x, USDPerQuantoInt256 y) pure returns (USDInt256 result) {
    result = USDInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the QuantoInt256 type.
function div(QuantoInt256 x, int256 y) pure returns (QuantoInt256 result) {
    result = wrap(x.unwrap() / y);
}
