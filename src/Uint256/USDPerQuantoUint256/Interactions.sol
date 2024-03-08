// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerQuantoUint128} from
    "src/Uint128/USDPerQuantoUint128/ValueType.sol";
import {USDPerQuantoInt256} from "src/Int256/USDPerQuantoInt256/ValueType.sol";
import {BaseQuantoPerUSDUint256} from "../BaseQuantoPerUSDUint256/ValueType.sol";
import {USDPerBaseUint256} from "../USDPerBaseUint256/ValueType.sol";
import {BaseUint256} from "../BaseUint256/ValueType.sol";
import {QuantoUint256} from "../QuantoUint256/ValueType.sol";
import {USDUint256} from "../USDUint256/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerQuantoUint256.
library InteractionsUSDPerQuantoUint256 {
    using SafeCastU256 for uint256;
    using DecimalMath for uint256;

    /// @notice Converts a USDPerQuantoUint256 number into USDPerQuantoUint128.
    function to128(USDPerQuantoUint256 x)
        internal
        pure
        returns (USDPerQuantoUint128 result)
    {
        result = USDPerQuantoUint128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a USDPerQuantoUint256 number into USDPerQuantoInt256.
    function toInt(USDPerQuantoUint256 x)
        internal
        pure
        returns (USDPerQuantoInt256 result)
    {
        result = USDPerQuantoInt256.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a USDPerQuantoUint256 number into bytes32.
    function toBytes32(USDPerQuantoUint256 x)
        internal
        pure
        returns (bytes32 result)
    {
        result = bytes32(unwrap(x));
    }

    /// @notice Multiplies usd/quanto and quanto to get usd
    function mulDecimalToUSD(USDPerQuantoUint256 x, QuantoUint256 y)
        internal
        pure
        returns (USDUint256 result)
    {
        result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Multiplies usd/quanto and (base*quanto)/usd to get base
    function mulDecimalToBase(USDPerQuantoUint256 x, BaseQuantoPerUSDUint256 y)
        internal
        pure
        returns (BaseUint256 result)
    {
        result = BaseUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }
}
