example

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

    constructor(ExampleHandler _exampleHandler) {
        exampleHandler = _exampleHandler;
    }

    function invariant_overflow() public view {
        bytes memory x;
        exampleHandler.ghost_overflow(x);
    }
}

contract ExampleInvariantUnderflow is Test {
    ExampleHandler public exampleHandler;

    constructor(ExampleHandler _exampleHandler) {
        exampleHandler = _exampleHandler;
    }

    function invariant_underflow() public view {
        bytes memory x;
        exampleHandler.ghost_underflow(x);
    }
}
```