// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseQuantoPerUSDInt128} from
    "src/Int128/BaseQuantoPerUSDInt128/ValueType.sol";
    import {USDPerBaseUint128} from "../USDPerBaseUint128/ValueType.sol";
import {USDPerQuantoUint128} from "../USDPerQuantoUint128/ValueType.sol";
import {BaseUint128} from "../BaseUint128/ValueType.sol";
import {QuantoUint128} from "../QuantoUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";
import {SafeCastU128} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for BaseQuantoPerUSDUint128.
library InteractionsBaseQuantoPerUSDUint128 {
    using SafeCastU128 for uint128;
    using DecimalMath for uint128;
    using SafeCastU256 for uint256;

/// @notice Converts a BaseQuantoPerUSDUint128 number into BaseQuantoPerUSDInt128.
    function toInt(BaseQuantoPerUSDUint128 x)
        internal pure
        returns (BaseQuantoPerUSDInt128 result)
    {
        result = BaseQuantoPerUSDInt128.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a BaseQuantoPerUSDUint128 number into bytes32.
    function toBytes32(BaseQuantoPerUSDUint128 x) internal pure returns (bytes32 result) {
        result = bytes32(uint256(unwrap(x)));
    }

    /// @notice Multiplies (base * quanto)/usd and usd/base to get quanto
    function mulDecimalToQuanto(BaseQuantoPerUSDUint128 x, USDPerBaseUint128 y)
        internal pure
        returns (QuantoUint128 result)
    {
        result = QuantoUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Multiplies (base * quanto)/usd and usd/quanto to get base
    function mulDecimalToBase(BaseQuantoPerUSDUint128 x, USDPerQuantoUint128 y)
        internal pure
        returns (BaseUint128 result)
    {
        result = BaseUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }
}