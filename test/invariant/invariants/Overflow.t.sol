pragma solidity >=0.8.19;

import {Test} from "forge-std/Test.sol";
import {Handler, BaseInt128Handler, BaseInt128} from "../handlers/Handler.sol";

contract OverflowInvariant is Test {
    BaseInt128Handler public baseInt128Handler;
    Handler public handler;

    function setUp() public {
        baseInt128Handler = new BaseInt128Handler();
        handler = new Handler({_baseInt128Handler: baseInt128Handler});

        bytes4[] memory selectors = new bytes4[](1);
        selectors[0] = Handler.ghost_add_BaseInt128.selector;
        //selectors[n] = Handler.forcePush.selector;

        targetSelector(
            FuzzSelector({addr: address(handler), selectors: selectors})
        );

        targetContract(address(handler));
    }

    function invariant_Int128_BaseInt128_Interactions() public {
        BaseInt128 result = baseInt128Handler.ghostAddResult();
        assertGe(result.unwrap(), 0);
    }

    function invariant_addition() public {
        assert(false);
    }

    function invariant_subtraction() public {
        assert(false);
    }

    function invariant_multiplication() public {
        assert(false);
    }

    function invariant_division() public {
        assert(false);
    }
}
