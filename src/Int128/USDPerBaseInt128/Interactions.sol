// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerBaseUint128} from "../../Uint128/USDPerBaseUint128/ValueType.sol";
import {BaseQuantoPerUSDInt128} from "../BaseQuantoPerUSDInt128/ValueType.sol";
import {USDPerBaseInt256} from "../../Int256/USDPerBaseInt256/ValueType.sol";
import {InteractionsUSDPerBaseInt256} from
    "../../Int256/USDPerBaseInt256/Interactions.sol";
import {USDPerBaseUint256} from "../../Uint256/USDPerBaseUint256/ValueType.sol";
import {BaseInt128} from "../BaseInt128/ValueType.sol";
import {QuantoInt128} from "../QuantoInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";
import {SafeCastI128} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerBaseInt128.
library InteractionsUSDPerBaseInt128 {
    using SafeCastI128 for int128;
    using DecimalMath for int128;
    using SafeCastI256 for int256;
    using InteractionsUSDPerBaseInt256 for USDPerBaseInt256;

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

    /// @notice Returns the absolute value in USDPerBaseUint256.
    function abs(USDPerBaseInt128 x)
        internal
        pure
        returns (USDPerBaseUint256)
    {
        return x.unwrap() >= 0
            ? to256(x).toUint()
            : (USDPerBaseInt256.wrap(0) - to256(x)).toUint();
    }

    /// @notice Returns the absolute value in USDPerBaseUint128.
    function abs128(USDPerBaseInt128 x)
        internal
        pure
        returns (USDPerBaseUint128)
    {
        return
            x.unwrap() >= 0 ? toUint(x) : toUint(USDPerBaseInt128.wrap(0) - x);
    }
}
