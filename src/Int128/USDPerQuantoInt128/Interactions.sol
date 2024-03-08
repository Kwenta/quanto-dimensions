// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerQuantoUint128} from
    "src/Uint128/USDPerQuantoUint128/ValueType.sol";
import {BaseQuantoPerUSDInt128} from "../BaseQuantoPerUSDInt128/ValueType.sol";
import {USDPerQuantoInt256} from "src/Int256/USDPerQuantoInt256/ValueType.sol";
import {USDPerBaseInt128} from "../USDPerBaseInt128/ValueType.sol";
import {BaseInt128} from "../BaseInt128/ValueType.sol";
import {QuantoInt128} from "../QuantoInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";

import {SafeCastI128} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerQuantoInt128.
library InteractionsUSDPerQuantoInt128 {
    using SafeCastI128 for int128;
    using DecimalMath for int128;
    using SafeCastI256 for int256;

    /// @notice Converts a USDPerQuantoInt128 number into USDPerQuantoInt256.
    function to256(USDPerQuantoInt128 x)
        internal
        pure
        returns (USDPerQuantoInt256 result)
    {
        result = USDPerQuantoInt256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a USDPerQuantoInt128 number into USDPerQuantoUint128.
    function toUint(USDPerQuantoInt128 x)
        internal
        pure
        returns (USDPerQuantoUint128 result)
    {
        result = USDPerQuantoUint128.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies usd/quanto and quanto to get usd
    function mulDecimalToUSD(USDPerQuantoInt128 x, QuantoInt128 y)
        internal
        pure
        returns (USDInt128 result)
    {
        result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Multiplies usd/quanto and (base*quanto)/usd to get base
    function mulDecimalToBase(USDPerQuantoInt128 x, BaseQuantoPerUSDInt128 y)
        internal
        pure
        returns (BaseInt128 result)
    {
        result = BaseInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides usd/quanto and dimensionless to get usd/quanto
    function divDecimal(USDPerQuantoInt128 x, int128 y)
        internal
        pure
        returns (USDPerQuantoInt256 result)
    {
        result = USDPerQuantoInt256.wrap(x.unwrap().divDecimal(y));
    }
}
