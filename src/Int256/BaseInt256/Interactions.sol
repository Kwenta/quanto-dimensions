// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {BaseInt128} from "src/Int128/BaseInt128/ValueType.sol";
import {BaseUint256} from "src/Uint256/BaseUint256/ValueType.sol";
import {USDPerBaseInt256} from "../USDPerBaseInt256/ValueType.sol";
import {USDInt256} from "../USDInt256/ValueType.sol";

import {DecimalMath} from "src/utils/DecimalMath.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for BaseInt256.
library InteractionsBaseInt256 {
    using SafeCastI256 for int256;
    using DecimalMath for int256;

    /// @notice Converts a BaseInt256 number into BaseInt128.
    function to128(BaseInt256 x) internal pure returns (BaseInt128 result) {
        result = BaseInt128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a BaseInt256 number into BaseUint256.
    function toUint(BaseInt256 x) internal pure returns (BaseUint256 result) {
        result = BaseUint256.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies base and usd/base to get usd
    function mulDecimalToUSD(BaseInt256 x, USDPerBaseInt256 y)
        internal pure
        returns (USDInt256 result)
    {
        result = USDInt256.wrap(x.unwrap().mulDecimal(y.unwrap()));
    }
}
