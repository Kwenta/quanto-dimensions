// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./ValueType.sol";
import {USDInt128} from "../../Int128/USDInt128/ValueType.sol";
import {USDUint256} from "../../Uint256/USDUint256/ValueType.sol";

import {SafeCastU128} from "../../utils/SafeCast.sol";
import {DecimalMath} from "../../utils/DecimalMath.sol";

/// @notice External Casting utilities for USDUint128.
library InteractionsUSDUint128 {
    using SafeCastU128 for uint128;
    using DecimalMath for uint128;

    /// @notice Converts a USDUint128 number into USDUint256.
    function to256(USDUint128 x) internal pure returns (USDUint256 result) {
        result = USDUint256.wrap(unwrap(x).to256());
    }

    /// @notice Converts a USDUint128 number into USDInt128.
    function toInt(USDUint128 x) internal pure returns (USDInt128 result) {
        result = USDInt128.wrap(unwrap(x).toInt());
    }

    /// @notice Converts a USDUint128 number into bytes32.
    function toBytes32(USDUint128 x) internal pure returns (bytes32 result) {
        result = bytes32(uint256(unwrap(x)));
    }

    /// @notice Divides USDUint128 and dimensionless to get USDUint128
    function divDecimal(USDUint128 x, uint128 y)
        internal
        pure
        returns (USDUint256 result)
    {
        result = USDUint256.wrap(x.unwrap().divDecimal(y));
    }
}
