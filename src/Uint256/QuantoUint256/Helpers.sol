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

/// @notice Implements the checked addition operation (+1) in the QuantoUint256 type.
function increment(QuantoUint256 x) pure returns (QuantoUint256 result) {
    result = x + wrap(1);
}

/// @notice Multiplies quanto and usd/quanto to get usd
function mulDecimal(QuantoUint256 x, USDPerQuantoUint256 y) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}
