// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseQuantoPerUSDInt128} from "./ValueType.sol";
import {BaseQuantoPerUSDUint128} from
    "../../Uint128/BaseQuantoPerUSDUint128/ValueType.sol";
import {BaseQuantoPerUSDUint256} from
    "../../Uint256/BaseQuantoPerUSDUint256/ValueType.sol";
import {USDPerBaseInt128} from "../USDPerBaseInt128/ValueType.sol";
import {BaseQuantoPerUSDInt256} from
    "../../Int256/BaseQuantoPerUSDInt256/ValueType.sol";
import {InteractionsBaseQuantoPerUSDInt256} from
    "../../Int256/BaseQuantoPerUSDInt256/Interactions.sol";
import {USDPerQuantoInt128} from "../USDPerQuantoInt128/ValueType.sol";
import {BaseInt128} from "../BaseInt128/ValueType.sol";
import {QuantoInt128} from "../QuantoInt128/ValueType.sol";

import {SafeCastI128} from "../../utils/SafeCast.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for BaseQuantoPerUSDInt128.
library InteractionsBaseQuantoPerUSDInt128 {
    using SafeCastI128 for int128;
    using DecimalMath for int128;
    using SafeCastI256 for int256;
    using InteractionsBaseQuantoPerUSDInt256 for BaseQuantoPerUSDInt256;

    /// @notice Converts a BaseQuantoPerUSDInt128 number into BaseQuantoPerUSDInt256.
    function to256(BaseQuantoPerUSDInt128 x)
        internal
        pure
        returns (BaseQuantoPerUSDInt256 result)
    {
        result = BaseQuantoPerUSDInt256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a BaseQuantoPerUSDInt128 number into BaseQuantoPerUSDUint128.
    function toUint(BaseQuantoPerUSDInt128 x)
        internal
        pure
        returns (BaseQuantoPerUSDUint128 result)
    {
        result = BaseQuantoPerUSDUint128.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
    function mulDecimalToQuanto(BaseQuantoPerUSDInt128 x, USDPerBaseInt128 y)
        internal
        pure
        returns (QuantoInt128 result)
    {
        result = QuantoInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
    function mulDecimalToBase(BaseQuantoPerUSDInt128 x, USDPerQuantoInt128 y)
        internal
        pure
        returns (BaseInt128 result)
    {
        result = BaseInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides (base * quanto)/usd and dimensionless to get (base * quanto)/usd
    function divDecimal(BaseQuantoPerUSDInt128 x, int128 y)
        internal
        pure
        returns (BaseQuantoPerUSDInt256 result)
    {
        result = BaseQuantoPerUSDInt256.wrap(x.unwrap().divDecimal(y));
    }

    /// @notice Returns the absolute value in BaseQuantoPerUSDUint256.
    function abs(BaseQuantoPerUSDInt128 x)
        internal
        pure
        returns (BaseQuantoPerUSDUint256)
    {
        return x.unwrap() >= 0
            ? to256(x).toUint()
            : (BaseQuantoPerUSDInt256.wrap(0) - to256(x)).toUint();
    }

    /// @notice Returns the absolute value in BaseQuantoPerUSDUint128.
    function abs128(BaseQuantoPerUSDInt128 x)
        internal
        pure
        returns (BaseQuantoPerUSDUint128)
    {
        return x.unwrap() >= 0
            ? toUint(x)
            : toUint(BaseQuantoPerUSDInt128.wrap(0) - x);
    }

    /// @notice Returns the maximum in BaseQuantoPerUSDInt256.
    function max(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
        internal
        pure
        returns (BaseQuantoPerUSDInt256)
    {
        return x < y ? to256(y) : to256(x);
    }

    /// @notice Returns the minimum in BaseQuantoPerUSDInt256.
    function min(BaseQuantoPerUSDInt128 x, BaseQuantoPerUSDInt128 y)
        internal
        pure
        returns (BaseQuantoPerUSDInt256)
    {
        return x < y ? to256(x) : to256(y);
    }

    /// @notice Returns zero in the BaseQuantoPerUSDInt128 type.
    function zero() internal pure returns (BaseQuantoPerUSDInt128) {
        return BaseQuantoPerUSDInt128.wrap(0);
    }

    /// @notice Returns is same side reducing Boolean for the BaseQuantoPerUSDInt128 type.
    function isSameSideReducing(
        BaseQuantoPerUSDInt128 x,
        BaseQuantoPerUSDInt128 y
    ) internal pure returns (bool) {
        return sameSide(x, y) && abs128(y) < abs128(x);
    }
}
