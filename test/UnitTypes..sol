// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {BaseQuantoPerUSDUint256, BaseUint256, QuantoUint256, USDPerBaseUint256, USDPerQuantoUint256, USDUint256} from "../src/UnitTypes.sol";

contract UnitTypesTest is Test {
    function setUp() public {}

    function testBaseQuantoPerUSDUint256Add() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(200);
        BaseQuantoPerUSDUint256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseQuantoPerUSDUint256AddFuzz(uint256 x, uint256 y) public {
        vm.assume(x < y);
        uint z;
        assembly {
            z := add(x, y)
        }
        BaseQuantoPerUSDUint256 xW = BaseQuantoPerUSDUint256.wrap(x);
        BaseQuantoPerUSDUint256 yW = BaseQuantoPerUSDUint256.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseQuantoPerUSDUint256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    // function testBaseQuantoPerUSDUint256Increment() public {
    //     BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
    //     BaseQuantoPerUSDUint256 result = x.increment();
    //     assertEq(result.unwrap(), 101);
    // }

    // function testBaseQuantoPerUSDUint256IncrementFuzz(uint256 x) public {
    //     BaseQuantoPerUSDUint256 result = BaseQuantoPerUSDUint256.wrap(x).increment();
    //     assertEq(result.unwrap(), x + 1);
    // }
}
