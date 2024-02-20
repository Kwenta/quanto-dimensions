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

/// @notice Implements the checked addition operation (+1) in the BaseUint256 type.
function increment(BaseUint256 x) pure returns (BaseUint256 result) {
    result = x + wrap(1);
}

/// @notice Multiplies base and usd/base to get usd
function mulDecimal(BaseUint256 x, USDPerBaseUint256 y) pure returns (USDUint256 result) {
    result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
}
