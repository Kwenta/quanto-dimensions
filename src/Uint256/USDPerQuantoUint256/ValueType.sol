// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol" as Casting;
import "./Helpers.sol" as Helpers;

type USDPerQuantoUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

using {
    Casting.unwrap
} for USDPerQuantoUint256 global;


/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using {
    Helpers.increment,
    Helpers.mulDecimal
} for USDPerQuantoUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerQuantoUint256 type.
using {
   Helpers.add as +
} for USDPerQuantoUint256 global;
