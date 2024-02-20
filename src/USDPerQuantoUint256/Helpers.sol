// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import { USDPerQuantoUint256 } from "./ValueType.sol";
import { USDPerBaseUint256 } from "../USDPerBaseUint256/ValueType.sol";
import { BaseUint256 } from "../BaseUint256/ValueType.sol";
import { QuantoUint256 } from "../QuantoUint256/ValueType.sol";
import { USDUint256 } from "../USDUint256/ValueType.sol";
import { DecimalMath } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/DecimalMath.sol";

using DecimalMath for uint256;

/// @notice Implements the checked addition operation (+) in the USDPerQuantoUint256 type.
function add(USDPerQuantoUint256 x, USDPerQuantoUint256 y) pure returns (USDPerQuantoUint256 result) {
    result = wrap(x.unwrap() + y.unwrap());
}

/// @notice Implements the checked addition operation (+1) in the USDPerQuantoUint256 type.
function increment(USDPerQuantoUint256 x) pure returns (USDPerQuantoUint256 result) {
    result = x + wrap(1);
}

/// @notice Multiplies usd/quanto and quanto to get usd
function mulDecimal(USDPerQuantoUint256 x, QuantoUint256 y) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}
