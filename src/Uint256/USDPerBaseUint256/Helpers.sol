// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { USDPerBaseUint256 } from "./ValueType.sol";
import { BaseQuantoPerUSDUint256 } from "../BaseQuantoPerUSDUint256/ValueType.sol";
import { BaseUint256 } from "../BaseUint256/ValueType.sol";
import { QuantoUint256 } from "../QuantoUint256/ValueType.sol";
import { USDUint256 } from "../USDUint256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseUint256 type.
function add(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the USDPerBaseUint256 type.
function sub(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseUint256 type.
function and(USDPerBaseUint256 x, uint256 bits) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the USDPerBaseUint256 type.
function and2(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the USDPerBaseUint256 type.
function eq(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the USDPerBaseUint256 type.
function gt(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the USDPerBaseUint256 type.
function gte(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the USDPerBaseUint256 type.
function lt(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the USDPerBaseUint256 type.
function lte(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the USDPerBaseUint256 type.
function mod(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the USDPerBaseUint256 type.
function neq(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the USDPerBaseUint256 type.
function not(USDPerBaseUint256 x) pure returns (USDPerBaseUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the USDPerBaseUint256 type.
function or(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the USDPerBaseUint256 type.
function xor(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseUint256 type.
function increment(USDPerBaseUint256 x) pure returns (USDPerBaseUint256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the USDPerBaseUint256 type.
function mul(USDPerBaseUint256 x, uint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies usd/base and dimensionless to get usd/base
function mulDecimal(USDPerBaseUint256 x, uint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies usd/base and base to get usd
function mulDecimalToUSD(USDPerBaseUint256 x, BaseUint256 y) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Multiplies usd/base and (base*quanto)/usd to get quanto
function mulDecimalToQuanto(USDPerBaseUint256 x, BaseQuantoPerUSDUint256 y) pure returns (QuantoUint256 result) {
    result = QuantoUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the USDPerBaseUint256 type.
function div(USDPerBaseUint256 x, uint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() / y);
}
