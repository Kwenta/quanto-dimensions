// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDUint128} from "src/Uint128/USDUint128/ValueType.sol";

import {SafeCastI128} from "src/utils/SafeCast.sol";

/// @notice External Casting utilities for USDInt128.
library InteractionsUSDInt128 {
    using SafeCastI128 for int128;

    /// @notice Converts a USDInt128 number into USDUint128.
    function toUint(USDInt128 x) internal pure returns (USDUint128 result) {
        result = USDUint128.wrap(unwrap(x).toUint());
    }
}
