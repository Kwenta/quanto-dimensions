// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerQuantoInt128} from "src/Int128/USDPerQuantoInt128/ValueType.sol";
import {BaseQuantoPerUSDUint128} from "../BaseQuantoPerUSDUint128/ValueType.sol";
import {USDPerBaseUint128} from "../USDPerBaseUint128/ValueType.sol";
import {BaseUint128} from "../BaseUint128/ValueType.sol";
import {QuantoUint128} from "../QuantoUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";
import {USDPerQuantoUint256} from "src/Uint256/USDPerQuantoUint256/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";
import {SafeCastU128} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerQuantoUint128.
library InteractionsUSDPerQuantoUint128 {
    using SafeCastU128 for uint128;
    using DecimalMath for uint128;
    using SafeCastU256 for uint256;

    /// @notice Converts a USDPerQuantoUint128 number into USDPerQuantoUint256.
    function to256(USDPerQuantoUint128 x) internal pure returns (USDPerQuantoUint256 result) {
        result = USDPerQuantoUint256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a USDPerQuantoUint128 number into USDPerQuantoInt128.
    function toInt(USDPerQuantoUint128 x)
        internal pure
        returns (USDPerQuantoInt128 result)
    {
        result = USDPerQuantoInt128.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a USDPerQuantoUint128 number into bytes32.
    function toBytes32(USDPerQuantoUint128 x) internal pure returns (bytes32 result) {
        result = bytes32(uint256(unwrap(x)));
    }

    /// @notice Multiplies usd/quanto and quanto to get usd
    function mulDecimalToUSD(USDPerQuantoUint128 x, QuantoUint128 y)
        internal pure
        returns (USDUint128 result)
    {
        result = USDUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Multiplies usd/quanto and (base*quanto)/usd to get base
    function mulDecimalToBase(USDPerQuantoUint128 x, BaseQuantoPerUSDUint128 y)
        internal pure
        returns (BaseUint128 result)
    {
        result = BaseUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides usd/quanto and dimensionless to get usd/quanto
    function divDecimal(USDPerQuantoUint128 x, uint128 y)
        internal pure
        returns (USDPerQuantoUint256 result)
    {
        result = USDPerQuantoUint256.wrap(x.unwrap().divDecimal(y));
    }
}
