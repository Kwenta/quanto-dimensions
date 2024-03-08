// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerBaseInt128} from "src/Int128/USDPerBaseInt128/ValueType.sol";
import {USDPerBaseUint256} from "src/Uint256/USDPerBaseUint256/ValueType.sol";
import {BaseQuantoPerUSDInt256} from "../BaseQuantoPerUSDInt256/ValueType.sol";
import {BaseInt256} from "../BaseInt256/ValueType.sol";
import {QuantoInt256} from "../QuantoInt256/ValueType.sol";
import {USDInt256} from "../USDInt256/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerBaseInt256.
library InteractionsUSDPerBaseInt256 {
    using SafeCastI256 for int256;
    using DecimalMath for int256;

    /// @notice Converts a USDPerBaseInt256 number into USDPerBaseInt128.
    function to128(USDPerBaseInt256 x)
        internal
        pure
        returns (USDPerBaseInt128 result)
    {
        result = USDPerBaseInt128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a USDPerBaseInt256 number into USDPerBaseUint256.
    function toUint(USDPerBaseInt256 x)
        internal
        pure
        returns (USDPerBaseUint256 result)
    {
        result = USDPerBaseUint256.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies usd/base and base to get usd
    function mulDecimalToUSD(USDPerBaseInt256 x, BaseInt256 y)
        internal
        pure
        returns (USDInt256 result)
    {
        result = USDInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Multiplies usd/base and (base*quanto)/usd to get quanto
    function mulDecimalToQuanto(USDPerBaseInt256 x, BaseQuantoPerUSDInt256 y)
        internal
        pure
        returns (QuantoInt256 result)
    {
        result = QuantoInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }
}
