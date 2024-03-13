// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDPerBaseInt128} from "../../Int128/USDPerBaseInt128/ValueType.sol";
import {BaseQuantoPerUSDUint128} from "../BaseQuantoPerUSDUint128/ValueType.sol";
import {BaseUint128} from "../BaseUint128/ValueType.sol";
import {QuantoUint128} from "../QuantoUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";
import {USDPerBaseUint256} from "../../Uint256/USDPerBaseUint256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";
import {SafeCastU128} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for USDPerBaseUint128.
library InteractionsUSDPerBaseUint128 {
    using SafeCastU128 for uint128;
    using DecimalMath for uint128;
    using SafeCastU256 for uint256;

    /// @notice Converts a USDPerBaseUint128 number into USDPerBaseUint256.
    function to256(USDPerBaseUint128 x)
        internal
        pure
        returns (USDPerBaseUint256 result)
    {
        result = USDPerBaseUint256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a USDPerBaseUint128 number into USDPerBaseInt128.
    function toInt(USDPerBaseUint128 x)
        internal
        pure
        returns (USDPerBaseInt128 result)
    {
        result = USDPerBaseInt128.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a USDPerBaseUint128 number into bytes32.
    function toBytes32(USDPerBaseUint128 x)
        internal
        pure
        returns (bytes32 result)
    {
        result = bytes32(uint256(unwrap(x)));
    }

    /// @notice Multiplies usd/base and base to get usd
    function mulDecimalToUSD(USDPerBaseUint128 x, BaseUint128 y)
        internal
        pure
        returns (USDUint128 result)
    {
        result = USDUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Multiplies usd/base and (base*quanto)/usd to get quanto
    function mulDecimalToQuanto(USDPerBaseUint128 x, BaseQuantoPerUSDUint128 y)
        internal
        pure
        returns (QuantoUint128 result)
    {
        result = QuantoUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides usd/base and dimensionless to get usd/base
    function divDecimal(USDPerBaseUint128 x, uint128 y)
        internal
        pure
        returns (USDPerBaseUint256 result)
    {
        result = USDPerBaseUint256.wrap(x.unwrap().divDecimal(y));
    }

    /// @notice Returns the maximum in USDPerBaseUint256.
    function max(USDPerBaseUint128 x, USDPerBaseUint128 y)
        internal
        pure
        returns (USDPerBaseUint256)
    {
        return x < y ? to256(y) : to256(x);
    }

    /// @notice Returns the minimum in USDPerBaseUint256.
    function min(USDPerBaseUint128 x, USDPerBaseUint128 y)
        internal
        pure
        returns (USDPerBaseUint256)
    {
        return x < y ? to256(x) : to256(y);
    }
}
