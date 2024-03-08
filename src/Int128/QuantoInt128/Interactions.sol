// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {QuantoUint128} from "../../Uint128/QuantoUint128/ValueType.sol";
import {USDPerQuantoInt128} from "../USDPerQuantoInt128/ValueType.sol";
import {QuantoInt256} from "../../Int256/QuantoInt256/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";
import {SafeCastI128} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for QuantoInt128.
library InteractionsQuantoInt128 {
    using SafeCastI128 for int128;
    using DecimalMath for int128;
    using SafeCastI256 for int256;

    /// @notice Converts a QuantoInt128 number into QuantoInt256.
    function to256(QuantoInt128 x)
        internal
        pure
        returns (QuantoInt256 result)
    {
        result = QuantoInt256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a QuantoInt128 number into QuantoUint128.
    function toUint(QuantoInt128 x)
        internal
        pure
        returns (QuantoUint128 result)
    {
        result = QuantoUint128.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies quanto and usd/quanto to get usd
    function mulDecimalToUSD(QuantoInt128 x, USDPerQuantoInt128 y)
        internal
        pure
        returns (USDInt128 result)
    {
        result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides quanto and dimensionless to get quanto
    function divDecimal(QuantoInt128 x, int128 y)
        internal
        pure
        returns (QuantoInt256 result)
    {
        result = QuantoInt256.wrap(x.unwrap().divDecimal(y));
    }
}
