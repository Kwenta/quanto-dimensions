// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDInt128} from "../../Int128/USDInt128/ValueType.sol";
import {USDUint256} from "../../Uint256/USDUint256/ValueType.sol";

import {SafeCastI256} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for USDInt256.
library InteractionsUSDInt256 {
    using SafeCastI256 for int256;

    /// @notice Converts a USDInt256 number into USDInt128.
    function to128(USDInt256 x) internal pure returns (USDInt128 result) {
        result = USDInt128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a USDInt256 number into USDUint256.
    function toUint(USDInt256 x) internal pure returns (USDUint256 result) {
        result = USDUint256.wrap(unwrap(x).toUint());
    }

    /// @notice Returns the absolute value in BaseUint256
    function abs(USDInt256 x) internal pure returns (USDUint256) {
        return x.unwrap() >= 0 ? toUint(x) : toUint((USDInt256.wrap(0) - x));
    }

    /// @notice Returns zero in the USDInt256 type.
    function zero() internal pure returns (USDInt256) {
        return USDInt256.wrap(0);
    }

    /// @notice Returns is same side reducing Boolean for the USDInt256 type.
    function isSameSideReducing(USDInt256 x, USDInt256 y)
        internal
        pure
        returns (bool)
    {
        return sameSide(x, y) && abs(y) < abs(x);
    }
}
