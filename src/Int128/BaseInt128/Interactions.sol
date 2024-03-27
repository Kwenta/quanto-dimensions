// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseInt128} from "./ValueType.sol";
import {BaseInt256} from "../../Int256/BaseInt256/ValueType.sol";
import {BaseUint128} from "../../Uint128/BaseUint128/ValueType.sol";
import {BaseUint256} from "../../Uint256/BaseUint256/ValueType.sol";
import {InteractionsBaseInt256} from "../../Int256/BaseInt256/Interactions.sol";
import {USDPerBaseInt128} from "../USDPerBaseInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";

import {SafeCastI128} from "../../utils/SafeCast.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";

/// @notice External Casting utilities for BaseInt128.
library InteractionsBaseInt128 {
    using DecimalMath for int128;
    using SafeCastI128 for int128;
    using SafeCastI256 for int256;
    using InteractionsBaseInt256 for BaseInt256;

    /// @notice Converts a BaseInt128 number into BaseInt256.
    function to256(BaseInt128 x) internal pure returns (BaseInt256 result) {
        result = BaseInt256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a BaseInt128 number into BaseUint128.
    function toUint(BaseInt128 x) internal pure returns (BaseUint128 result) {
        result = BaseUint128.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies base and usd/base to get usd
    function mulDecimalToUSD(BaseInt128 x, USDPerBaseInt128 y)
        internal
        pure
        returns (USDInt128 result)
    {
        result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides base and dimensionless to get base
    function divDecimal(BaseInt128 x, int128 y)
        internal
        pure
        returns (BaseInt256 result)
    {
        result = BaseInt256.wrap(x.unwrap().divDecimal(y));
    }

    /// @notice Returns the absolute value in BaseUint256.
    function abs(BaseInt128 x) internal pure returns (BaseUint256) {
        return x.unwrap() >= 0
            ? to256(x).toUint()
            : (BaseInt256.wrap(0) - to256(x)).toUint();
    }

    /// @notice Returns the absolute value in BaseUint128.
    function abs128(BaseInt128 x) internal pure returns (BaseUint128) {
        return x.unwrap() >= 0 ? toUint(x) : toUint(BaseInt128.wrap(0) - x);
    }

    /// @notice Returns the maximum in BaseInt256.
    function max(BaseInt128 x, BaseInt128 y)
        internal
        pure
        returns (BaseInt256)
    {
        return x < y ? to256(y) : to256(x);
    }

    /// @notice Returns the minimum in BaseInt256.
    function min(BaseInt128 x, BaseInt128 y)
        internal
        pure
        returns (BaseInt256)
    {
        return x < y ? to256(x) : to256(y);
    }

    /// @notice Returns zero in the BaseInt128 type.
    function zero() internal pure returns (BaseInt128) {
        return BaseInt128.wrap(0);
    }

    /// @notice Returns is same side reducing Boolean for the BaseInt128 type.
    function isSameSideReducing(BaseInt128 x, BaseInt128 y)
        internal
        pure
        returns (bool)
    {
        return sameSide(x, y) && abs128(x) < abs128(y);
    }
}
