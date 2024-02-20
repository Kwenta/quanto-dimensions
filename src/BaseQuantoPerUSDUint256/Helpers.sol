// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { BaseQuantoPerUSDUint256 } from "./ValueType.sol";
import { USDPerBaseUint256 } from "../USDPerBaseUint256/ValueType.sol";
import { USDPerQuantoUint256 } from "../USDPerQuantoUint256/ValueType.sol";
import { BaseUint256 } from "../BaseUint256/ValueType.sol";
import { QuantoUint256 } from "../QuantoUint256/ValueType.sol";
import { USDUint256 } from "../USDUint256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the BaseQuantoPerUSDUint256 type.
function add(BaseQuantoPerUSDUint256 x, BaseQuantoPerUSDUint256 y) pure returns (BaseQuantoPerUSDUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the BaseQuantoPerUSDUint256 type.
function increment(BaseQuantoPerUSDUint256 x) pure returns (BaseQuantoPerUSDUint256 result) {
    result = x + wrap(1);
}

/// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
function mulDecimalToQuanto(BaseQuantoPerUSDUint256 x, USDPerBaseUint256 y) pure returns (QuantoUint256 result) {
    result = QuantoUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}

/// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
function mulDecimalToBase(BaseQuantoPerUSDUint256 x, USDPerQuantoUint256 y) pure returns (BaseUint256 result) {
    result = BaseUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}
