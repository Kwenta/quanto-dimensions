// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerBaseUint128} from "../../Uint128/USDPerBaseUint128/ValueType.sol";
import {USDPerBaseInt256} from "../../Int256/USDPerBaseInt256/ValueType.sol";
import {BaseQuantoPerUSDUint256} from "../BaseQuantoPerUSDUint256/ValueType.sol";
import {BaseUint256} from "../BaseUint256/ValueType.sol";
import {QuantoUint256} from "../QuantoUint256/ValueType.sol";
import {USDUint256} from "../USDUint256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerBaseUint256.
library InteractionsUSDPerBaseUint256 {
    using SafeCastU256 for uint256;
    using DecimalMath for uint256;

    /// @notice Converts a USDPerBaseUint256 number into USDPerBaseUint128.
    function to128(USDPerBaseUint256 x)
        internal
        pure
        returns (USDPerBaseUint128 result)
    {
        result = USDPerBaseUint128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a USDPerBaseUint256 number into USDPerBaseInt256.
    function toInt(USDPerBaseUint256 x)
        internal
        pure
        returns (USDPerBaseInt256 result)
    {
        result = USDPerBaseInt256.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a USDPerBaseUint256 number into bytes32.
    function toBytes32(USDPerBaseUint256 x)
        internal
        pure
        returns (bytes32 result)
    {
        result = bytes32(unwrap(x));
    }

    /// @notice Multiplies usd/base and base to get usd
    function mulDecimalToUSD(USDPerBaseUint256 x, BaseUint256 y)
        internal
        pure
        returns (USDUint256 result)
    {
        result = USDUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Multiplies usd/base and (base*quanto)/usd to get quanto
    function mulDecimalToQuanto(USDPerBaseUint256 x, BaseQuantoPerUSDUint256 y)
        internal
        pure
        returns (QuantoUint256 result)
    {
        result = QuantoUint256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }

    /// @notice Returns zero in the USDPerBaseUint256 type.
    function zero() internal pure returns (USDPerBaseUint256) {
        return USDPerBaseUint256.wrap(0);
    }
}
