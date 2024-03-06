// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseInt128} from "src/Int128/BaseInt128/ValueType.sol";
import {USDPerBaseUint128} from "../USDPerBaseUint128/ValueType.sol";
import {USDUint128} from "../USDUint128/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastU256} from "src/utils/SafeCast.sol";
import {SafeCastU128} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for BaseUint128.
library InteractionsBaseUint128 {
    using SafeCastU128 for uint128;
    using DecimalMath for uint128;
    using SafeCastU256 for uint256;

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
        internal pure
        returns (USDUint128 result)
    {
        result = USDUint128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }
}
