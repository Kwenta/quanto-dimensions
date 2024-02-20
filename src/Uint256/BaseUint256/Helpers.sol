// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { BaseUint256 } from "./ValueType.sol";
import { USDPerBaseUint256 } from "../USDPerBaseUint256/ValueType.sol";
import { USDUint256 } from "../USDUint256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

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

/// @notice Multiplies base and usd/base to get usd
function mulDecimal(BaseUint256 x, uint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap().mulDecimal(y));
}

/// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
function mulDecimalToUSD(BaseUint256 x, USDPerBaseUint256 y) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Implements the checked division operation (/) in the BaseUint256 type.
function div(BaseUint256 x, uint256 y) pure returns (BaseUint256 result) {
    result = wrap(x.unwrap() / y);
}
