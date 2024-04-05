example of testing invariant(s) related to overflow and underflow

```solidity
// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";

contract ExampleTypeHandler is Test {
    function canResultInOverflow(bytes memory x) public pure {
        // logic that can result in overflow given x
    }

    function canResultInUnderflow(bytes memory x) public pure {
        // logic that can result in underflow given x
    }
}

contract ExampleHandler is Test {
    ExampleTypeHandler public exampleTypeHandler;

    constructor(ExampleTypeHandler _exampleTypeHandler) {
        exampleTypeHandler = _exampleTypeHandler;
    }

    function ghost_overflow(bytes memory x) public view {
        exampleTypeHandler.canResultInOverflow(x);
    }

    function ghost_underflow(bytes memory x) public view {
        exampleTypeHandler.canResultInUnderflow(x);
    }
}

contract ExampleInvariantOverflow is Test {
    ExampleHandler public exampleHandler;
    ExampleTypeHandler public exampleTypeHandler;

    function setUp() public {
        exampleTypeHandler = new ExampleTypeHandler();
        exampleHandler = new ExampleHandler(exampleTypeHandler);

        // only add selectors that can result in overflow
        bytes4[] memory selectors = new bytes4[](1);
        selectors[0] = ExampleHandler.ghost_overflow.selector;

        targetSelector(
            FuzzSelector({addr: address(handler), selectors: selectors})
        );

        targetContract(address(exampleHandler));
    }

    function invariant_overflow() public view {
        // invariant assertion happens here
    }
}

contract ExampleInvariantUnderflow is Test {
    ExampleHandler public exampleHandler;
    ExampleTypeHandler public exampleTypeHandler;

    function setUp() public {
        exampleTypeHandler = new ExampleTypeHandler();
        exampleHandler = new ExampleHandler(exampleTypeHandler);

        // only add selectors that can result in underflow
        bytes4[] memory selectors = new bytes4[](1);
        selectors[0] = ExampleHandler.ghost_underflow.selector;

        targetSelector(
            FuzzSelector({addr: address(handler), selectors: selectors})
        );

        targetContract(address(exampleHandler));
    }

    function invariant_underflow() public view {
        // invariant assertion happens here
    }
}
```