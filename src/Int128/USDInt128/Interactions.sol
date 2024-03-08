// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDUint128} from "../../Uint128/USDUint128/ValueType.sol";
import {USDInt256} from "../../Int256/USDInt256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI128} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for USDInt128.
library InteractionsUSDInt128 {
    using SafeCastI128 for int128;
    using DecimalMath for int128;

    /// @notice Converts a USDInt128 number into USDInt256.
    function to256(USDInt128 x) internal pure returns (USDInt256 result) {
        result = USDInt256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a USDInt128 number into USDUint128.
    function toUint(USDInt128 x) internal pure returns (USDUint128 result) {
        result = USDUint128.wrap(unwrap(x).toUint());
    }

    /// @notice Divides USDInt128 and dimensionless to get USDInt128
    function divDecimal(USDInt128 x, int128 y)
        internal
        pure
        returns (USDInt256 result)
    {
        result = USDInt256.wrap(x.unwrap().divDecimal(y));
    }
}
