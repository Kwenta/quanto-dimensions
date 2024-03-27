// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseQuantoPerUSDInt128} from
    "../../Int128/BaseQuantoPerUSDInt128/ValueType.sol";
import {BaseQuantoPerUSDUint256} from
    "../../Uint256/BaseQuantoPerUSDUint256/ValueType.sol";
import {USDPerBaseInt256} from "../USDPerBaseInt256/ValueType.sol";
import {USDPerQuantoInt256} from "../USDPerQuantoInt256/ValueType.sol";
import {BaseInt256} from "../BaseInt256/ValueType.sol";
import {QuantoInt256} from "../QuantoInt256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for BaseQuantoPerUSDInt256.
library InteractionsBaseQuantoPerUSDInt256 {
    using SafeCastI256 for int256;
    using DecimalMath for int256;

    /// @notice Converts a BaseQuantoPerUSDInt256 number into BaseQuantoPerUSDInt128.
    function to128(BaseQuantoPerUSDInt256 x)
        internal
        pure
        returns (BaseQuantoPerUSDInt128 result)
    {
        result = BaseQuantoPerUSDInt128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a BaseQuantoPerUSDInt256 number into BaseQuantoPerUSDUint256.
    function toUint(BaseQuantoPerUSDInt256 x)
        internal
        pure
        returns (BaseQuantoPerUSDUint256 result)
    {
        result = BaseQuantoPerUSDUint256.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
    function mulDecimalToQuanto(BaseQuantoPerUSDInt256 x, USDPerBaseInt256 y)
        internal
        pure
        returns (QuantoInt256 result)
    {
        result = QuantoInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
    function mulDecimalToBase(BaseQuantoPerUSDInt256 x, USDPerQuantoInt256 y)
        internal
        pure
        returns (BaseInt256 result)
    {
        result = BaseInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Returns the absolute value in BaseQuantoPerUSDInt256
    function abs(BaseQuantoPerUSDInt256 x)
        internal
        pure
        returns (BaseQuantoPerUSDUint256)
    {
        return x.unwrap() >= 0
            ? toUint(x)
            : toUint((BaseQuantoPerUSDInt256.wrap(0) - x));
    }

    /// @notice Returns zero in the BaseQuantoPerUSDInt256 type.
    function zero() internal pure returns (BaseQuantoPerUSDInt256) {
        return BaseQuantoPerUSDInt256.wrap(0);
    }

    /// @notice Returns is same side reducing Boolean for the BaseQuantoPerUSDInt256 type.
    function isSameSideReducing(
        BaseQuantoPerUSDInt256 x,
        BaseQuantoPerUSDInt256 y
    ) internal pure returns (bool) {
        return sameSide(x, y) && abs(y) < abs(x);
    }
}
