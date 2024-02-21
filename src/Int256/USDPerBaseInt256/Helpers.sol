// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { USDPerBaseInt256 } from "./ValueType.sol";
import { BaseQuantoPerUSDInt256 } from "../BaseQuantoPerUSDInt256/ValueType.sol";
import { BaseInt256 } from "../BaseInt256/ValueType.sol";
import { QuantoInt256 } from "../QuantoInt256/ValueType.sol";
import { USDInt256 } from "../USDInt256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for int256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseInt256 type.
function add(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (USDPerBaseInt256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerBaseInt256 type.
function sub(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (USDPerBaseInt256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseInt256 type.
function and(USDPerBaseInt256 x, int256 bits) pure returns (USDPerBaseInt256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseInt256 type.
function and2(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (USDPerBaseInt256 result) {
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
function mod(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (USDPerBaseInt256 result) {
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
function or(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (USDPerBaseInt256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerBaseInt256 type.
function xor(USDPerBaseInt256 x, USDPerBaseInt256 y) pure returns (USDPerBaseInt256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseInt256 type.
function increment(USDPerBaseInt256 x) pure returns (USDPerBaseInt256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerBaseInt256 type.
function mul(USDPerBaseInt256 x, int256 y) pure returns (USDPerBaseInt256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/base and dimensionless to get usd/base
function mulDecimal(USDPerBaseInt256 x, int256 y) pure returns (USDPerBaseInt256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies usd/base and base to get usd
function mulDecimalToUSD(USDPerBaseInt256 x, BaseInt256 y) pure returns (USDInt256 result) {
    result = USDInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Multiplies usd/base and (base*quanto)/usd to get quanto
function mulDecimalToQuanto(USDPerBaseInt256 x, BaseQuantoPerUSDInt256 y) pure returns (QuantoInt256 result) {
    result = QuantoInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the USDPerBaseInt256 type.
function div(USDPerBaseInt256 x, int256 y) pure returns (USDPerBaseInt256 result) {
    result = wrap(x.unwrap() / y);
}
