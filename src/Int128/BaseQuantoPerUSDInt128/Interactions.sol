// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseQuantoPerUSDInt128} from "./ValueType.sol";
import {BaseQuantoPerUSDUint128} from
    "src/Uint128/BaseQuantoPerUSDUint128/ValueType.sol";
import {USDPerBaseInt128} from "../USDPerBaseInt128/ValueType.sol";
import {USDPerQuantoInt128} from "../USDPerQuantoInt128/ValueType.sol";
import {BaseInt128} from "../BaseInt128/ValueType.sol";
import {QuantoInt128} from "../QuantoInt128/ValueType.sol";

import {SafeCastI128} from "src/utils/SafeCast.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for BaseQuantoPerUSDInt128.
library InteractionsBaseQuantoPerUSDInt128 {
    using SafeCastI128 for int128;
    using DecimalMath for int128;
    using SafeCastI256 for int256;

    /// @notice Converts a BaseQuantoPerUSDInt128 number into BaseQuantoPerUSDUint128.
    function toUint(BaseQuantoPerUSDInt128 x)
        internal pure
        returns (BaseQuantoPerUSDUint128 result)
    {
        result = BaseQuantoPerUSDUint128.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
    function mulDecimalToQuanto(BaseQuantoPerUSDInt128 x, USDPerBaseInt128 y)
        internal pure
        returns (QuantoInt128 result)
    {
        result = QuantoInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
    function mulDecimalToBase(BaseQuantoPerUSDInt128 x, USDPerQuantoInt128 y)
        internal pure
        returns (BaseInt128 result)
    {
        result = BaseInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }
}
