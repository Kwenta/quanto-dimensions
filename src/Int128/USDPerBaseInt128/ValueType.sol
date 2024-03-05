// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "./Casting.sol" as Casting;
import "./Helpers.sol" as Helpers;

type USDPerBaseInt128 is int128;

/*//////////////////////////////////////////////////////////////
                            CASTING
//////////////////////////////////////////////////////////////*/

using {Casting.unwrap, Casting.to256, Casting.toUint} for USDPerBaseInt128 global;

/*//////////////////////////////////////////////////////////////
                            HELPERS
//////////////////////////////////////////////////////////////*/

using {
    Helpers.and,
    Helpers.increment,
    Helpers.mul,
    Helpers.mulDecimal,
    Helpers.mulDecimalToUSD,
    Helpers.mulDecimalToQuanto,
    Helpers.div
} for USDPerBaseInt128 global;

/*//////////////////////////////////////////////////////////////////////////
                                    OPERATORS
//////////////////////////////////////////////////////////////////////////*/

// The global "using for" directive makes it possible to use these operators on the USDPerBaseInt128 type.
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
} for USDPerBaseInt128 global;
