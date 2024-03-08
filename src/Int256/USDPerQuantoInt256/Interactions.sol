// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerQuantoInt128} from "src/Int128/USDPerQuantoInt128/ValueType.sol";
import {USDPerQuantoUint256} from
    "src/Uint256/USDPerQuantoUint256/ValueType.sol";
import {BaseQuantoPerUSDInt256} from "../BaseQuantoPerUSDInt256/ValueType.sol";
import {USDPerBaseInt256} from "../USDPerBaseInt256/ValueType.sol";
import {BaseInt256} from "../BaseInt256/ValueType.sol";
import {QuantoInt256} from "../QuantoInt256/ValueType.sol";
import {USDInt256} from "../USDInt256/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerQuantoInt256.
library InteractionsUSDPerQuantoInt256 {
    using SafeCastI256 for int256;
    using DecimalMath for int256;

    /// @notice Converts a USDPerQuantoInt256 number into USDPerQuantoInt128.
    function to128(USDPerQuantoInt256 x)
        internal
        pure
        returns (USDPerQuantoInt128 result)
    {
        result = USDPerQuantoInt128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a USDPerQuantoInt256 number into USDPerQuantoUint256.
    function toUint(USDPerQuantoInt256 x)
        internal
        pure
        returns (USDPerQuantoUint256 result)
    {
        result = USDPerQuantoUint256.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies usd/quanto and quanto to get usd
    function mulDecimalToUSD(USDPerQuantoInt256 x, QuantoInt256 y)
        internal
        pure
        returns (USDInt256 result)
    {
        result = USDInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Multiplies usd/quanto and (base*quanto)/usd to get base
    function mulDecimalToBase(USDPerQuantoInt256 x, BaseQuantoPerUSDInt256 y)
        internal
        pure
        returns (BaseInt256 result)
    {
        result = BaseInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }
}
