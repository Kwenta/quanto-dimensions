// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {BaseQuantoPerUSDUint128, BaseUint128, QuantoUint128, USDPerBaseUint128, USDPerQuantoUint128, USDUint128} from "src/UnitTypes.sol";

contract USDPerQuantoUint128Test is Test {
    function setUp() public {}

    function testUSDPerQuantoUint128Add() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(200);
        USDPerQuantoUint128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerQuantoUint128AddFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := add(x, y)
        }
        USDPerQuantoUint128 xW = USDPerQuantoUint128.wrap(x);
        USDPerQuantoUint128 yW = USDPerQuantoUint128.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerQuantoUint128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerQuantoUint128Sub() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(200);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerQuantoUint128SubFuzz(uint128 x, uint128 y) public {
        if (x < y) {
            vm.expectRevert();
            USDPerQuantoUint128.wrap(x) - USDPerQuantoUint128.wrap(y);
        } else {
            USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x) -
                USDPerQuantoUint128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDPerQuantoUint128And() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(10); // 1010 in binary
        uint128 y = 12; // 1100 in binary
        USDPerQuantoUint128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoUint128AndFuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoUint128And2() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(10); // 1010 in binary
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(12); // 1100 in binary
        USDPerQuantoUint128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoUint128And2Fuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x) &
            USDPerQuantoUint128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoUint128Eq() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerQuantoUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint128EqFuzz(uint128 x, uint128 y) public {
        bool z = x == y;
        bool result = USDPerQuantoUint128.wrap(x) ==
            USDPerQuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint128Gt() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerQuantoUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint128GtFuzz(uint128 x, uint128 y) public {
        bool z = x > y;
        bool result = USDPerQuantoUint128.wrap(x) > USDPerQuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint128Gte() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerQuantoUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint128GteFuzz(uint128 x, uint128 y) public {
        bool z = x >= y;
        bool result = USDPerQuantoUint128.wrap(x) >=
            USDPerQuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint128Lt() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(50);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerQuantoUint128.wrap(49);
        assertFalse(result);
    }

    function testUSDPerQuantoUint128LtFuzz(uint128 x, uint128 y) public {
        bool z = x < y;
        bool result = USDPerQuantoUint128.wrap(x) < USDPerQuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint128Lte() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerQuantoUint128.wrap(99);
        assertFalse(result);
    }

    function testUSDPerQuantoUint128LteFuzz(uint128 x, uint128 y) public {
        bool z = x <= y;
        bool result = USDPerQuantoUint128.wrap(x) <=
            USDPerQuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint128Mod() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(30);
        USDPerQuantoUint128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerQuantoUint128ModFuzz(uint128 x, uint128 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoUint128.wrap(x) % USDPerQuantoUint128.wrap(y);
        } else {
            uint128 z = x % y;
            USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x) %
                USDPerQuantoUint128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint128Neq() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerQuantoUint128.wrap(101);
        assertTrue(result);
    }

    function testUSDPerQuantoUint128NeqFuzz(uint128 x, uint128 y) public {
        bool z = x != y;
        bool result = USDPerQuantoUint128.wrap(x) !=
            USDPerQuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint128Not() public {
        uint128 hundred = 100;
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(hundred);
        USDPerQuantoUint128 result = ~x;
        uint128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerQuantoUint128NotFuzz(uint128 x) public {
        USDPerQuantoUint128 result = ~USDPerQuantoUint128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerQuantoUint128Or() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(200);
        USDPerQuantoUint128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerQuantoUint128OrFuzz(uint128 x, uint128 y) public {
        USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x) |
            USDPerQuantoUint128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerQuantoUint128Xor() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(200);
        USDPerQuantoUint128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerQuantoUint128XorFuzz(uint128 x, uint128 y) public {
        USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x) ^
            USDPerQuantoUint128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerQuantoUint128Increment() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        USDPerQuantoUint128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerQuantoUint128IncrementFuzz(uint128 x) public {
        uint128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerQuantoUint128.wrap(x).increment();
        } else {
            USDPerQuantoUint128 result = USDPerQuantoUint128
                .wrap(x)
                .increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerQuantoUint128Mul() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100);
        uint128 y = 200;
        USDPerQuantoUint128 result = x.mul(y);
        assertEq(result.unwrap(), 20000);
    }

    function testUSDPerQuantoUint128MulFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerQuantoUint128.wrap(x).mul(y);
        } else {
            USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint128MulDecimal() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100 ether);
        uint128 y = 200 ether;
        USDPerQuantoUint128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testUSDPerQuantoUint128MulDecimalFuzz(
        uint128 x,
        uint128 y
    ) public {
        uint128 z;
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
            USDPerQuantoUint128.wrap(x).mulDecimal(y);
        } else {
            USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x).mulDecimal(
                y
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint128MulDecimalToUSD() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100 ether);
        BaseUint128 y = BaseUint128.wrap(200 ether);
        USDUint128 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testUSDPerQuantoUint128MulDecimalToUSDFuzz(
        uint128 x,
        uint128 y
    ) public {
        uint128 z;
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
            USDPerQuantoUint128.wrap(x).mulDecimalToUSD(BaseUint128.wrap(y));
        } else {
            USDUint128 result = USDPerQuantoUint128.wrap(x).mulDecimalToUSD(
                BaseUint128.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint128MulDecimalToBase() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(100 ether);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(200 ether);
        BaseUint128 result = x.mulDecimalToBase(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testUSDPerQuantoUint128MulDecimalToBaseFuzz(
        uint128 x,
        uint128 y
    ) public {
        uint128 z;
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
            USDPerQuantoUint128.wrap(x).mulDecimalToBase(
                BaseQuantoPerUSDUint128.wrap(y)
            );
        } else {
            BaseUint128 result = USDPerQuantoUint128.wrap(x).mulDecimalToBase(
                BaseQuantoPerUSDUint128.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint128Div() public {
        USDPerQuantoUint128 x = USDPerQuantoUint128.wrap(500);
        uint128 y = 2;
        USDPerQuantoUint128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerQuantoUint128DivFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoUint128.wrap(x).div(y);
        } else {
            USDPerQuantoUint128 result = USDPerQuantoUint128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }
}