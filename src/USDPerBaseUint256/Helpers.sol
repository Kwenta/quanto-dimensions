// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { USDPerBaseUint256 } from "./ValueType.sol";
import { BaseUint256 } from "../BaseUint256/ValueType.sol";
import { USDUint256 } from "../USDUint256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerBaseUint256 type.
function add(USDPerBaseUint256 x, USDPerBaseUint256 y) pure returns (USDPerBaseUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerBaseUint256 type.
function increment(USDPerBaseUint256 x) pure returns (USDPerBaseUint256 result) {
    result = x + wrap(1);
}

/// @notice Multiplies usd/base and base to get usd
function mulDecimal(USDPerBaseUint256 x, BaseUint256 y) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}
