// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseUint128} from "src/Uint128/BaseUint128/ValueType.sol";
import {BaseInt256} from "src/Int256/BaseInt256/ValueType.sol";
import {USDPerBaseUint256} from "../USDPerBaseUint256/ValueType.sol";
import {USDUint256} from "../USDUint256/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for BaseUint256.
library InteractionsBaseUint256 {
    using SafeCastU256 for uint256;
    using DecimalMath for uint256;

    /// @notice Converts a BaseUint256 number into BaseUint128.
    function to128(BaseUint256 x) internal pure returns (BaseUint128 result) {
        result = BaseUint128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a BaseUint256 number into BaseInt256.
    function toInt(BaseUint256 x) internal pure returns (BaseInt256 result) {
        result = BaseInt256.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a BaseUint256 number into bytes32.
    function toBytes32(BaseUint256 x) internal pure returns (bytes32 result) {
        result = bytes32(unwrap(x));
    }

    /// @notice Multiplies base and usd/base to get usd
    function mulDecimalToUSD(BaseUint256 x, USDPerBaseUint256 y)
        internal pure
        returns (USDUint256 result)
    {
        result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }
}
