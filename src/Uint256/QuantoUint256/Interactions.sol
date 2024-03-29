// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {QuantoUint128} from "../../Uint128/QuantoUint128/ValueType.sol";
import {QuantoInt256} from "../../Int256/QuantoInt256/ValueType.sol";
import {USDPerQuantoUint256} from "../USDPerQuantoUint256/ValueType.sol";
import {USDUint256} from "../USDUint256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for QuantoUint256.
library InteractionsQuantoUint256 {
    using SafeCastU256 for uint256;
    using DecimalMath for uint256;

    /// @notice Converts a QuantoUint256 number into QuantoUint128.
    function to128(QuantoUint256 x)
        internal
        pure
        returns (QuantoUint128 result)
    {
        result = QuantoUint128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a QuantoUint256 number into QuantoInt256.
    function toInt(QuantoUint256 x)
        internal
        pure
        returns (QuantoInt256 result)
    {
        result = QuantoInt256.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a QuantoUint256 number into bytes32.
    function toBytes32(QuantoUint256 x)
        internal
        pure
        returns (bytes32 result)
    {
        result = bytes32(unwrap(x));
    }

    /// @notice Multiplies quanto and usd/quanto to get usd
    function mulDecimalToUSD(QuantoUint256 x, USDPerQuantoUint256 y)
        internal
        pure
        returns (USDUint256 result)
    {
        result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Returns zero in the QuantoUint256 type.
    function zero() internal pure returns (QuantoUint256) {
        return QuantoUint256.wrap(0);
    }
}
