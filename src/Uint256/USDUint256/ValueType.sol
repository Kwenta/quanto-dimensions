// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol" as Casting;
import "./Helpers.sol" as Helpers;

type USDUint256 is uint256;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

using {
    Casting.unwrap,
    Casting.toBytes32
} for USDUint256 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using {
    Helpers.and,
    Helpers.increment,
    Helpers.mul,
    Helpers.mulDecimal,
    Helpers.div
} for USDUint256 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDUint256 type.
using {
    Helpers.add as +,
    Helpers.and2 as &,
    Helpers.sub as -,
    Helpers.eq as ==,
    Helpers.gt as >,
    Helpers.gte as >=,
    Helpers.lt as <,
    Helpers.lte as <=,
    Helpers.mod as %,
    Helpers.neq as !=,
    Helpers.or as |,
    Helpers.not as ~,
    Helpers.xor as ^
} for USDUint256 global;
