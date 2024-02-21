// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {BaseQuantoPerUSDUint128, BaseUint128, QuantoUint128, USDPerBaseUint128, USDPerQuantoUint128, USDUint128} from "src/UnitTypes.sol";

contract BaseUint128Test is Test {
    function setUp() public {}

    function testBaseUint128Add() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(200);
        BaseUint128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseUint128AddFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := add(x, y)
        }
        BaseUint128 xW = BaseUint128.wrap(x);
        BaseUint128 yW = BaseUint128.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseUint128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testBaseUint128Sub() public {
        BaseUint128 x = BaseUint128.wrap(200);
        BaseUint128 y = BaseUint128.wrap(100);
        BaseUint128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testBaseUint128SubFuzz(uint128 x, uint128 y) public {
        if (x < y) {
            vm.expectRevert();
            BaseUint128.wrap(x) - BaseUint128.wrap(y);
        } else {
            BaseUint128 result = BaseUint128.wrap(x) - BaseUint128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testBaseUint128And() public {
        BaseUint128 x = BaseUint128.wrap(10); // 1010 in binary
        uint128 y = 12; // 1100 in binary
        BaseUint128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseUint128AndFuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        BaseUint128 result = BaseUint128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseUint128And2() public {
        BaseUint128 x = BaseUint128.wrap(10); // 1010 in binary
        BaseUint128 y = BaseUint128.wrap(12); // 1100 in binary
        BaseUint128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseUint128And2Fuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        BaseUint128 result = BaseUint128.wrap(x) & BaseUint128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseUint128Eq() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == BaseUint128.wrap(101);
        assertFalse(result);
    }

    function testBaseUint128EqFuzz(uint128 x, uint128 y) public {
        bool z = x == y;
        bool result = BaseUint128.wrap(x) == BaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint128Gt() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > BaseUint128.wrap(101);
        assertFalse(result);
    }

    function testBaseUint128GtFuzz(uint128 x, uint128 y) public {
        bool z = x > y;
        bool result = BaseUint128.wrap(x) > BaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint128Gte() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= BaseUint128.wrap(101);
        assertFalse(result);
    }

    function testBaseUint128GteFuzz(uint128 x, uint128 y) public {
        bool z = x >= y;
        bool result = BaseUint128.wrap(x) >= BaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint128Lt() public {
        BaseUint128 x = BaseUint128.wrap(50);
        BaseUint128 y = BaseUint128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < BaseUint128.wrap(49);
        assertFalse(result);
    }

    function testBaseUint128LtFuzz(uint128 x, uint128 y) public {
        bool z = x < y;
        bool result = BaseUint128.wrap(x) < BaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint128Lte() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= BaseUint128.wrap(99);
        assertFalse(result);
    }

    function testBaseUint128LteFuzz(uint128 x, uint128 y) public {
        bool z = x <= y;
        bool result = BaseUint128.wrap(x) <= BaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint128Mod() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(30);
        BaseUint128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testBaseUint128ModFuzz(uint128 x, uint128 y) public {
        if (y == 0) {
            vm.expectRevert();
            BaseUint128.wrap(x) % BaseUint128.wrap(y);
        } else {
            uint128 z = x % y;
            BaseUint128 result = BaseUint128.wrap(x) % BaseUint128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint128Neq() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != BaseUint128.wrap(101);
        assertTrue(result);
    }

    function testBaseUint128NeqFuzz(uint128 x, uint128 y) public {
        bool z = x != y;
        bool result = BaseUint128.wrap(x) != BaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint128Not() public {
        uint128 hundred = 100;
        BaseUint128 x = BaseUint128.wrap(hundred);
        BaseUint128 result = ~x;
        uint128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testBaseUint128NotFuzz(uint128 x) public {
        BaseUint128 result = ~BaseUint128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testBaseUint128Or() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(200);
        BaseUint128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testBaseUint128OrFuzz(uint128 x, uint128 y) public {
        BaseUint128 result = BaseUint128.wrap(x) | BaseUint128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testBaseUint128Xor() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 y = BaseUint128.wrap(200);
        BaseUint128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testBaseUint128XorFuzz(uint128 x, uint128 y) public {
        BaseUint128 result = BaseUint128.wrap(x) ^ BaseUint128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testBaseUint128Increment() public {
        BaseUint128 x = BaseUint128.wrap(100);
        BaseUint128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseUint128IncrementFuzz(uint128 x) public {
        uint128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseUint128.wrap(x).increment();
        } else {
            BaseUint128 result = BaseUint128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseUint128Mul() public {
        BaseUint128 x = BaseUint128.wrap(100);
        uint128 y = 200;
        BaseUint128 result = x.mul(y);
        assertEq(result.unwrap(), 20000);
    }

    function testBaseUint128MulFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            BaseUint128.wrap(x).mul(y);
        } else {
            BaseUint128 result = BaseUint128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint128MulDecimal() public {
        BaseUint128 x = BaseUint128.wrap(100 ether);
        uint128 y = 200 ether;
        BaseUint128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testBaseUint128MulDecimalFuzz(uint128 x, uint128 y) public {
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
            BaseUint128.wrap(x).mulDecimal(y);
        } else {
            BaseUint128 result = BaseUint128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint128MulDecimalToUSD() public {
        BaseUint128 x = BaseUint128.wrap(100 ether);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200 ether);
        USDUint128 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testBaseUint128MulDecimalToQuantoFuzz(
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
            BaseUint128.wrap(x).mulDecimalToUSD(USDPerBaseUint128.wrap(y));
        } else {
            USDUint128 result = BaseUint128.wrap(x).mulDecimalToUSD(
                USDPerBaseUint128.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint128Div() public {
        BaseUint128 x = BaseUint128.wrap(500);
        uint128 y = 2;
        BaseUint128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testBaseUint128DivFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            BaseUint128.wrap(x).div(y);
        } else {
            BaseUint128 result = BaseUint128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }
}
