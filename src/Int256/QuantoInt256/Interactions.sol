// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {QuantoInt128} from "../../Int128/QuantoInt128/ValueType.sol";
import {QuantoUint256} from "../../Uint256/QuantoUint256/ValueType.sol";
import {USDPerQuantoInt256} from "../USDPerQuantoInt256/ValueType.sol";
import {USDInt256} from "../USDInt256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI256} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for QuantoInt256.
library InteractionsQuantoInt256 {
    using SafeCastI256 for int256;
    using DecimalMath for int256;

    /// @notice Converts a QuantoInt256 number into QuantoInt128.
    function to128(QuantoInt256 x)
        internal
        pure
        returns (QuantoInt128 result)
    {
        result = QuantoInt128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a QuantoInt256 number into QuantoUint256.
    function toUint(QuantoInt256 x)
        internal
        pure
        returns (QuantoUint256 result)
    {
        result = QuantoUint256.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies quanto and usd/quanto to get usd
    function mulDecimalToUSD(QuantoInt256 x, USDPerQuantoInt256 y)
        internal
        pure
        returns (USDInt256 result)
    {
        result = USDInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Returns the absolute value in BaseUint256
    function abs(QuantoInt256 x) internal pure returns (QuantoUint256) {
        return x.unwrap() >= 0 ? toUint(x) : toUint((QuantoInt256.wrap(0) - x));
    }

    /// @notice Returns zero in the QuantoInt256 type.
    function zero() internal pure returns (QuantoInt256) {
        return QuantoInt256.wrap(0);
    }

    /// @notice Returns is same side reducing Boolean for the QuantoInt256 type.
    function isSameSideReducing(QuantoInt256 x, QuantoInt256 y)
        internal
        pure
        returns (bool)
    {
        return sameSide(x, y) && abs(y) < abs(x);
    }
}
