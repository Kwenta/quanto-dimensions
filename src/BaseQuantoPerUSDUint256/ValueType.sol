// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol" as Casting;
import "./Helpers.sol" as Helpers;

type BaseQuantoPerUSDUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

using {
    Casting.unwrap
} for BaseQuantoPerUSDUint256 global;


/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using {
    Helpers.increment,
    Helpers.mulDecimalToQuanto,
    Helpers.mulDecimalToBase,
    Helpers.mul
} for BaseQuantoPerUSDUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the BaseQuantoPerUSDUint256 type.
using {
   Helpers.add as +
} for BaseQuantoPerUSDUint256 global;
