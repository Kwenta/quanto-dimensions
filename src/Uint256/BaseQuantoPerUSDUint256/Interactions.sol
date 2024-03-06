// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseQuantoPerUSDUint128} from
    "src/Uint128/BaseQuantoPerUSDUint128/ValueType.sol";
import {BaseQuantoPerUSDInt256} from
    "src/Int256/BaseQuantoPerUSDInt256/ValueType.sol";
import {USDPerBaseUint256} from "../USDPerBaseUint256/ValueType.sol";
import {USDPerQuantoUint256} from "../USDPerQuantoUint256/ValueType.sol";
import {BaseUint256} from "../BaseUint256/ValueType.sol";
import {QuantoUint256} from "../QuantoUint256/ValueType.sol";
import {USDUint256} from "../USDUint256/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for BaseQuantoPerUSDUint256.
library InteractionsBaseQuantoPerUSDUint256 {
    using SafeCastU256 for uint256;
    using DecimalMath for uint256;

    /// @notice Converts a BaseQuantoPerUSDUint256 number into BaseQuantoPerUSDUint128.
    function to128(BaseQuantoPerUSDUint256 x)
        internal pure
        returns (BaseQuantoPerUSDUint128 result)
    {
        result = BaseQuantoPerUSDUint128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a BaseQuantoPerUSDUint256 number into BaseQuantoPerUSDInt256.
    function toInt(BaseQuantoPerUSDUint256 x)
        internal pure
        returns (BaseQuantoPerUSDInt256 result)
    {
        result = BaseQuantoPerUSDInt256.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a BaseQuantoPerUSDUint256 number into bytes32.
    function toBytes32(BaseQuantoPerUSDUint256 x) internal pure returns (bytes32 result) {
        result = bytes32(unwrap(x));
    }

    /// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
    function mulDecimalToQuanto(BaseQuantoPerUSDUint256 x, USDPerBaseUint256 y)
        internal pure
        returns (QuantoUint256 result)
    {
        result = QuantoUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
    function mulDecimalToBase(BaseQuantoPerUSDUint256 x, USDPerQuantoUint256 y)
        internal pure
        returns (BaseUint256 result)
    {
        result = BaseUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }
}
