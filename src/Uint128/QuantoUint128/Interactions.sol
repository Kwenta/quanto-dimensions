// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {QuantoInt128} from "../../Int128/QuantoInt128/ValueType.sol";
import {USDPerQuantoUint128} from "../USDPerQuantoUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";
import {QuantoUint256} from "../../Uint256/QuantoUint256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";
import {SafeCastU128} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for QuantoUint128.
library InteractionsQuantoUint128 {
    using SafeCastU128 for uint128;
    using DecimalMath for uint128;
    using SafeCastU256 for uint256;

    /// @notice Converts a QuantoUint128 number into QuantoUint256.
    function to256(QuantoUint128 x)
        internal
        pure
        returns (QuantoUint256 result)
    {
        result = QuantoUint256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a QuantoUint128 number into QuantoInt128.
    function toInt(QuantoUint128 x)
        internal
        pure
        returns (QuantoInt128 result)
    {
        result = QuantoInt128.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a QuantoUint128 number into bytes32.
    function toBytes32(QuantoUint128 x)
        internal
        pure
        returns (bytes32 result)
    {
        result = bytes32(uint256(unwrap(x)));
    }

    /// @notice Multiplies quanto and usd/quanto to get usd
    function mulDecimalToUSD(QuantoUint128 x, USDPerQuantoUint128 y)
        internal
        pure
        returns (USDUint128 result)
    {
        result = USDUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides quanto and dimensionless to get quanto
    function divDecimal(QuantoUint128 x, uint128 y)
        internal
        pure
        returns (QuantoUint256 result)
    {
        result = QuantoUint256.wrap(x.unwrap().divDecimal(y));
    }

    /// @notice Returns the maximum in QuantoUint256.
    function max(QuantoUint128 x, QuantoUint128 y)
        internal
        pure
        returns (QuantoUint256)
    {
        return x < y ? to256(y) : to256(x);
    }

    /// @notice Returns the minimum in QuantoUint256.
    function min(QuantoUint128 x, QuantoUint128 y)
        internal
        pure
        returns (QuantoUint256)
    {
        return x < y ? to256(x) : to256(y);
    }

    /// @notice Returns zero in the QuantoUint128 type.
    function zero() internal pure returns (QuantoUint128) {
        return QuantoUint128.wrap(0);
    }
}
