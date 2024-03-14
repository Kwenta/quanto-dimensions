// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDUint128} from "../../Uint128/USDUint128/ValueType.sol";
import {USDInt256} from "../../Int256/USDInt256/ValueType.sol";
import {InteractionsUSDInt256} from "../../Int256/USDInt256/Interactions.sol";
import {USDUint256} from "../../Uint256/USDUint256/ValueType.sol";

import {DecimalMath} from "../../utils/DecimalMath.sol";
import {SafeCastI128} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for USDInt128.
library InteractionsUSDInt128 {
    using SafeCastI128 for int128;
    using DecimalMath for int128;
    using InteractionsUSDInt256 for USDInt256;

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

    /// @notice Returns the absolute value in USDUint256.
    function abs(USDInt128 x) internal pure returns (USDUint256) {
        return x.unwrap() >= 0
            ? to256(x).toUint()
            : (USDInt256.wrap(0) - to256(x)).toUint();
    }

    /// @notice Returns the absolute value in USDUint128.
    function abs128(USDInt128 x) internal pure returns (USDUint128) {
        return x.unwrap() >= 0 ? toUint(x) : toUint(USDInt128.wrap(0) - x);
    }

    /// @notice Returns the maximum in USDInt256.
    function max(USDInt128 x, USDInt128 y) internal pure returns (USDInt256) {
        return x < y ? to256(y) : to256(x);
    }

    /// @notice Returns the minimum in USDInt256.
    function min(USDInt128 x, USDInt128 y) internal pure returns (USDInt256) {
        return x < y ? to256(x) : to256(y);
    }
}
