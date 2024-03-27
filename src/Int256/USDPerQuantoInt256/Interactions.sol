// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerQuantoInt128} from "../../Int128/USDPerQuantoInt128/ValueType.sol";
import {USDPerQuantoUint256} from
    "../../Uint256/USDPerQuantoUint256/ValueType.sol";
import {BaseQuantoPerUSDInt256} from "../BaseQuantoPerUSDInt256/ValueType.sol";
import {BaseInt256} from "../BaseInt256/ValueType.sol";
import {QuantoInt256} from "../QuantoInt256/ValueType.sol";
import {USDInt256} from "../USDInt256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

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

    /// @notice Returns the absolute value in BaseUint256
    function abs(USDPerQuantoInt256 x)
        internal
        pure
        returns (USDPerQuantoUint256)
    {
        return x.unwrap() >= 0
            ? toUint(x)
            : toUint((USDPerQuantoInt256.wrap(0) - x));
    }

    /// @notice Returns zero in the USDPerQuantoInt256 type.
    function zero() internal pure returns (USDPerQuantoInt256) {
        return USDPerQuantoInt256.wrap(0);
    }

    /// @notice Returns is same side reducing Boolean for the USDPerQuantoInt256 type.
    function isSameSideReducing(USDPerQuantoInt256 x, USDPerQuantoInt256 y)
        internal
        pure
        returns (bool)
    {
        return sameSide(x, y) && abs(y) < abs(x);
    }
}
