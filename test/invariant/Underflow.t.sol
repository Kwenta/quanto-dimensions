pragma solidity >=0.8.19;

import {Test} from "forge-std/Test.sol";
import {Handler, BaseInt128Handler, BaseInt128} from "./handlers/Handler.sol";

contract UnderflowInvariant is Test {
    BaseInt128Handler public baseInt128Handler;
    Handler public handler;

    function setUp() public {
        baseInt128Handler = new BaseInt128Handler();
        handler = new Handler({_baseInt128Handler: baseInt128Handler});

        bytes4[] memory selectors = new bytes4[](1);
        selectors[0] = Handler.ghost_add.selector;
        //selectors[n] = Handler.forcePush.selector;

        targetSelector(
            FuzzSelector({addr: address(handler), selectors: selectors})
        );

        targetContract(address(handler));
    }

    /// @custom:todo 
    /// if x is of type T and y is of type T
    /// then the invariant is violated 
    /// if y > 0 and x - y > x
    function invariant_subtraction() public pure {
        assert(false);
    }

    /// @custom:todo
    /// if x is of type T and y is of type T
    /// then the invariant is violated
    /// if x < 0 and y < 0 and x + y > x
    function invariant_addition() public pure {
        assert(false);
    }

    /// @custom:todo
    /// given two types T1 and T2
    /// and the type(T1).min < type(T2).min
    /// and x is of type T1
    /// then the invariant is violated
    /// if x < type(T2).min
    /// and x is casted to T2
    /// (ASSUMING SafeCast library is used)
    function invariant_type_downcasting() public pure {
        assert(false);
    }

    /// @custom:todo
    /// given two types T1 and T2
    /// and T1 and T2 are represented in the same number of bits
    /// and the type(T1).max > type(T2).max
    /// and x is of type T1
    /// then the invariant is violated
    /// if x > type(T2).max
    /// and x is casted to T2
    /// (ASSUMING SafeCast library is used)
    function invariant_type_conversion() public pure {
        assert(false);
    }
}
