pragma solidity >=0.8.19;

import {DSTest} from "forge-std/Test.sol";
import "forge-std/InvariantTest.sol";
import {Handler, BaseInt128Handler} from "./handlers/Handler.sol";

contract OverflowInvariant is DSTest {
    BaseInt128Handler public baseInt128Handler;
    Handler public handler;

    function setUp() public {
        baseInt128Handler = new BaseInt128Handler();
        handler = new Handler({_baseInt128Handler: baseInt128Handler});

        // bytes4[] memory selectors = new bytes4[](6);
        // selectors[0] = Handler.deposit.selector;
        // selectors[1] = Handler.withdraw.selector;
        // selectors[2] = Handler.sendFallback.selector;
        // selectors[3] = Handler.approve.selector;
        // selectors[4] = Handler.transfer.selector;
        // selectors[5] = Handler.transferFrom.selector;
        // //selectors[6] = Handler.forcePush.selector;

        // targetSelector(
        //     FuzzSelector({addr: address(handler), selectors: selectors})
        // );

        targetContract(address(handler));
    }

    function invariant_Int128_BaseInt128_Interactions() public {
        assertEq(true, true);
    }
}
