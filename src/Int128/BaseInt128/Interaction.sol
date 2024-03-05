// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol";
import "./ValueType.sol";
import {BaseInt128} from "./ValueType.sol";
import {BaseInt256} from "src/Int256/BaseInt256/ValueType.sol";
import {BaseUint128} from "src/Uint128/BaseUint128/ValueType.sol";
import {USDPerBaseInt128} from "../USDPerBaseInt128/ValueType.sol";
import {USDInt128} from "../USDInt128/ValueType.sol";

import {SafeCastI128} from "src/utils/SafeCast.sol";
import {SafeCastI256} from "src/utils/SafeCast.sol";
import {DecimalMath} from "src/utils/DecimalMath.sol";

/// @notice External Casting utilities for BaseInt128.
library ExternalInteractionsBaseInt128 {
    using DecimalMath for int128;
    using SafeCastI128 for int128;
    using SafeCastI256 for int256;

    /// @notice Converts a BaseInt128 number into BaseInt256.
    function to256(BaseInt128 x) internal pure returns (BaseInt256 result) {
        result = BaseInt256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a BaseInt128 number into BaseUint128.
    function toUint(BaseInt128 x) internal pure returns (BaseUint128 result) {
        result = BaseUint128.wrap(unwrap(x).toUint());
    }

    /// @notice Multiplies base and usd/base to get usd
    function mulDecimalToUSD(BaseInt128 x, USDPerBaseInt128 y)
        public pure
        returns (USDInt128 result)
    {
        result = USDInt128.wrap(x.unwrap().mulDecimal(y.unwrap()).to128());
    }
}
