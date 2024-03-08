// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseInt128} from "../../Int128/BaseInt128/ValueType.sol";
import {USDPerBaseUint128} from "../USDPerBaseUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";
import {BaseUint256} from "../../Uint256/BaseUint256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";
import {SafeCastU128} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for BaseUint128.
library InteractionsBaseUint128 {
    using SafeCastU128 for uint128;
    using DecimalMath for uint128;
    using SafeCastU256 for uint256;

    /// @notice Converts a BaseUint128 number into BaseUint256.
    function to256(BaseUint128 x) internal pure returns (BaseUint256 result) {
        result = BaseUint256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a BaseUint128 number into BaseInt128.
    function toInt(BaseUint128 x) internal pure returns (BaseInt128 result) {
        result = BaseInt128.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a BaseUint128 number into bytes32.
    function toBytes32(BaseUint128 x) internal pure returns (bytes32 result) {
        result = bytes32(uint256(unwrap(x)));
    }

    /// @notice Multiplies base and usd/base to get usd
    function mulDecimalToUSD(BaseUint128 x, USDPerBaseUint128 y)
        internal
        pure
        returns (USDUint128 result)
    {
        result = USDUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }

    /// @notice Divides base and dimensionless to get base
    function divDecimal(BaseUint128 x, uint128 y)
        internal
        pure
        returns (BaseUint256 result)
    {
        result = BaseUint256.wrap(x.unwrap().divDecimal(y));
    }
}
