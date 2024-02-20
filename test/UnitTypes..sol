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

    function testBaseQuantoPerUSDUint256Increment() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseQuantoPerUSDUint256IncrementFuzz(uint256 x) public {
        uint z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseQuantoPerUSDUint256.wrap(x).increment();
        } else {
            BaseQuantoPerUSDUint256 result = BaseQuantoPerUSDUint256
                .wrap(x)
                .increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseQuantoPerUSDUint256MulDecimalToQuanto() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100 ether);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(200 ether);
        QuantoUint256 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testBaseQuantoPerUSDUint256MulDecimalToQuantoFuzz(
        uint256 x,
        uint256 y
    ) public {
        uint z;
        assembly {
            z := div(
                mul(x, y),
                // 1 ether
                0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
            )
        }
        if (
            (x != 0 && y != 0) &&
            (z / y != (x / 1 ether) || z / x != (y / 1 ether))
        ) {
            vm.expectRevert();
            BaseQuantoPerUSDUint256.wrap(x * 1 ether).mulDecimalToQuanto(
                USDPerBaseUint256.wrap(y * 1 ether)
            );
        } else {
            QuantoUint256 result = BaseQuantoPerUSDUint256
                .wrap(x)
                .mulDecimalToQuanto(USDPerBaseUint256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }
}
