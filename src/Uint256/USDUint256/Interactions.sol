// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDUint128} from "../../Uint128/USDUint128/ValueType.sol";
import {USDInt256} from "../../Int256/USDInt256/ValueType.sol";

import {SafeCastU256} from "../../utils/SafeCast.sol";

/// @notice External Casting utilities for USDUint256.
library InteractionsUSDUint256 {
    using SafeCastU256 for uint256;

    /// @notice Converts a USDUint256 number into USDUint128.
    function to128(USDUint256 x) internal pure returns (USDUint128 result) {
        result = USDUint128.wrap(unwrap(x).to128());
    }

    /// @notice Converts a USDUint256 number into USDInt256.
    function toInt(USDUint256 x) internal pure returns (USDInt256 result) {
        result = USDInt256.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a USDUint256 number into bytes32.
    function toBytes32(USDUint256 x) internal pure returns (bytes32 result) {
        result = bytes32(unwrap(x));
    }
}
