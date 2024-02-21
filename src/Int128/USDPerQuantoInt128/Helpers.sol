// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { USDPerQuantoInt128 } from "./ValueType.sol";
import { BaseQuantoPerUSDInt128 } from "../BaseQuantoPerUSDInt128/ValueType.sol";
import { USDPerBaseInt128 } from "../USDPerBaseInt128/ValueType.sol";
import { BaseInt128 } from "../BaseInt128/ValueType.sol";
import { QuantoInt128 } from "../QuantoInt128/ValueType.sol";
import { USDInt128 } from "../USDInt128/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";
import { SafeCastI256 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using DecimalMath for int128;
using SafeCastI256 for int256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoInt128 type.
function add(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerQuantoInt128 type.
function sub(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoInt128 type.
function and(USDPerQuantoInt128 x, int128 bits) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerQuantoInt128 type.
function and2(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerQuantoInt128 type.
function eq(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerQuantoInt128 type.
function gt(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerQuantoInt128 type.
function gte(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerQuantoInt128 type.
function lt(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerQuantoInt128 type.
function lte(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerQuantoInt128 type.
function mod(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerQuantoInt128 type.
function neq(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerQuantoInt128 type.
function not(USDPerQuantoInt128 x) pure returns (USDPerQuantoInt128 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerQuantoInt128 type.
function or(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerQuantoInt128 type.
function xor(USDPerQuantoInt128 x, USDPerQuantoInt128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoInt128 type.
function increment(USDPerQuantoInt128 x) pure returns (USDPerQuantoInt128 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerQuantoInt128 type.
function mul(USDPerQuantoInt128 x, int128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/quanto and dimensionless to get usd/quanto
function mulDecimal(USDPerQuantoInt128 x, int128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap().mulDecimal(y).to128());
}

/// @notice Multiplies usd/quanto and quanto to get usd
function mulDecimalToUSD(USDPerQuantoInt128 x, BaseInt128 y) pure returns (USDInt128 result) {
    result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Multiplies usd/quanto and (base*quanto)/usd to get base
function mulDecimalToBase(USDPerQuantoInt128 x, BaseQuantoPerUSDInt128 y) pure returns (BaseInt128 result) {
    result = BaseInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
}

/// @notice Implements the checked division operation (/) in the USDPerQuantoInt128 type.
function div(USDPerQuantoInt128 x, int128 y) pure returns (USDPerQuantoInt128 result) {
    result = wrap(x.unwrap() / y);
}
