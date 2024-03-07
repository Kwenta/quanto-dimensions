// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerBaseUint128} from "src/Uint128/USDPerBaseUint128/ValueType.sol";
import {BaseQuantoPerUSDInt128} from "../BaseQuantoPerUSDInt128/ValueType.sol";
import {USDPerBaseInt256} from "src/Int256/USDPerBaseInt256/ValueType.sol";
import {BaseInt128} from "../BaseInt128/ValueType.sol";
import {QuantoInt128} from "../QuantoInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";
import {SafeCastI128} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerBaseInt128.
library InteractionsUSDPerBaseInt128 {
    using SafeCastI128 for int128;
    using DecimalMath for int128;
    using SafeCastI256 for int256;

    /// @notice Converts a USDPerBaseInt128 number into USDPerBaseInt256.
    function to256(USDPerBaseInt128 x)
        internal
        pure
        returns (USDPerBaseInt256 result)
    {
        result = USDPerBaseInt256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a USDPerBaseInt128 number into USDPerBaseUint128.
    function toUint(USDPerBaseInt128 x)
        internal
        pure
        returns (USDPerBaseUint128 result)
    {
        result = USDPerBaseUint128.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies usd/base and base to get usd
    function mulDecimalToUSD(USDPerBaseInt128 x, BaseInt128 y)
        internal
        pure
        returns (USDInt128 result)
    {
        result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Multiplies usd/base and (base*quanto)/usd to get quanto
    function mulDecimalToQuanto(USDPerBaseInt128 x, BaseQuantoPerUSDInt128 y)
        internal
        pure
        returns (QuantoInt128 result)
    {
        result = QuantoInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides usd/base and dimensionless to get usd/base
    function divDecimal(USDPerBaseInt128 x, int128 y)
        internal
        pure
        returns (USDPerBaseInt256 result)
    {
        result = USDPerBaseInt256.wrap(x.unwrap().divDecimal(y));
    }
}
