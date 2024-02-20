// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { QuantoUint256 } from "./ValueType.sol";
import { BaseUint256 } from "../BaseUint256/ValueType.sol";
import { USDPerBaseUint256 } from "../USDPerBaseUint256/ValueType.sol";
import { USDPerQuantoUint256 } from "../USDPerQuantoUint256/ValueType.sol";
import { USDUint256 } from "../USDUint256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the QuantoUint256 type.
function add(QuantoUint256 x, QuantoUint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked subtraction operation (-) in the QuantoUint256 type.
function sub(QuantoUint256 x, QuantoUint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() - y.unwrap());
}

/// @notice Implements the AND (&) bitwise operation in the QuantoUint256 type.
function and(QuantoUint256 x, uint256 bits) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() & bits);
}

/// @notice Implements the AND (&) bitwise operation in the QuantoUint256 type.
function and2(QuantoUint256 x, QuantoUint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() & y.unwrap());
}

/// @notice Implements the equality operation (==) in the QuantoUint256 type.
function eq(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() == y.unwrap();
}

/// @notice Implements the greater than operation (>) in the QuantoUint256 type.
function gt(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() > y.unwrap();
}

/// @notice Implements the greater than or equal to operation (>=) in the QuantoUint256 type.
function gte(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() >= y.unwrap();
}

/// @notice Implements the less than operation (<) in the QuantoUint256 type.
function lt(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() < y.unwrap();
}

/// @notice Implements the less than or equal to operation (<=) in the QuantoUint256 type.
function lte(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() <= y.unwrap();
}

/// @notice Implements the modulus operation (%) in the QuantoUint256 type.
function mod(QuantoUint256 x, QuantoUint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() % y.unwrap());
}

/// @notice Implements the not equal operation (!=) in the QuantoUint256 type.
function neq(QuantoUint256 x, QuantoUint256 y) pure returns (bool) {
    return x.unwrap() != y.unwrap();
}

/// @notice Implements the NOT (~) bitwise operation in the QuantoUint256 type.
function not(QuantoUint256 x) pure returns (QuantoUint256 result) {
    result = wrap(~x.unwrap());
}

/// @notice Implements the OR (|) bitwise operation in the QuantoUint256 type.
function or(QuantoUint256 x, QuantoUint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() | y.unwrap());
}

/// @notice Implements the XOR (^) bitwise operation in the QuantoUint256 type.
function xor(QuantoUint256 x, QuantoUint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() ^ y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the QuantoUint256 type.
function increment(QuantoUint256 x) pure returns (QuantoUint256 result) {
    result = x + wrap(1);
}

/// @notice Implements the checked multiplication operation (*) in the QuantoUint256 type.
function mul(QuantoUint256 x, uint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() * y);
}

/// @notice Multiplies quanto and dimensionless to get quanto
function mulDecimal(QuantoUint256 x, uint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies quanto/usd and usd/quanto to get usd
function mulDecimalToUSD(QuantoUint256 x, USDPerQuantoUint256 y) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the QuantoUint256 type.
function div(QuantoUint256 x, uint256 y) pure returns (QuantoUint256 result) {
    result = wrap(x.unwrap() / y);
}
