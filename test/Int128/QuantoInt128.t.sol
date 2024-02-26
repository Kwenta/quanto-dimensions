// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    QuantoInt128,
    QuantoUint128,
    USDPerQuantoInt128,
    USDInt128
} from "src/UnitTypes.sol";

contract QuantoInt128Test is Test {
    function setUp() public {}

    function testQuantoInt128Add() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(200);
        QuantoInt128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testQuantoInt128AddFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := add(x, y)
        }
        QuantoInt128 xW = QuantoInt128.wrap(x);
        QuantoInt128 yW = QuantoInt128.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            QuantoInt128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testQuantoInt128Sub() public {
        QuantoInt128 x = QuantoInt128.wrap(200);
        QuantoInt128 y = QuantoInt128.wrap(100);
        QuantoInt128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testQuantoInt128SubFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            QuantoInt128.wrap(x) - QuantoInt128.wrap(y);
        } else {
            QuantoInt128 result = QuantoInt128.wrap(x) - QuantoInt128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testQuantoInt128And() public {
        QuantoInt128 x = QuantoInt128.wrap(10); // 1010 in binary
        int128 y = 12; // 1100 in binary
        QuantoInt128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testQuantoInt128AndFuzz(int128 x, int128 y) public {
        int128 z = x & y;
        QuantoInt128 result = QuantoInt128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testQuantoInt128And2() public {
        QuantoInt128 x = QuantoInt128.wrap(10); // 1010 in binary
        QuantoInt128 y = QuantoInt128.wrap(12); // 1100 in binary
        QuantoInt128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testQuantoInt128And2Fuzz(int128 x, int128 y) public {
        int128 z = x & y;
        QuantoInt128 result = QuantoInt128.wrap(x) & QuantoInt128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testQuantoInt128Eq() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == QuantoInt128.wrap(101);
        assertFalse(result);
    }

    function testQuantoInt128EqFuzz(int128 x, int128 y) public {
        bool z = x == y;
        bool result = QuantoInt128.wrap(x) == QuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt128Gt() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > QuantoInt128.wrap(101);
        assertFalse(result);
    }

    function testQuantoInt128GtFuzz(int128 x, int128 y) public {
        bool z = x > y;
        bool result = QuantoInt128.wrap(x) > QuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt128Gte() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= QuantoInt128.wrap(101);
        assertFalse(result);
    }

    function testQuantoInt128GteFuzz(int128 x, int128 y) public {
        bool z = x >= y;
        bool result = QuantoInt128.wrap(x) >= QuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt128Lt() public {
        QuantoInt128 x = QuantoInt128.wrap(50);
        QuantoInt128 y = QuantoInt128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < QuantoInt128.wrap(49);
        assertFalse(result);
    }

    function testQuantoInt128LtFuzz(int128 x, int128 y) public {
        bool z = x < y;
        bool result = QuantoInt128.wrap(x) < QuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt128Lte() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= QuantoInt128.wrap(99);
        assertFalse(result);
    }

    function testQuantoInt128LteFuzz(int128 x, int128 y) public {
        bool z = x <= y;
        bool result = QuantoInt128.wrap(x) <= QuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt128Mod() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(30);
        QuantoInt128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testQuantoInt128ModFuzz(int128 x, int128 y) public {
        if (y == 0) {
            vm.expectRevert();
            QuantoInt128.wrap(x) % QuantoInt128.wrap(y);
        } else {
            int128 z = x % y;
            QuantoInt128 result = QuantoInt128.wrap(x) % QuantoInt128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt128Neq() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != QuantoInt128.wrap(101);
        assertTrue(result);
    }

    function testQuantoInt128NeqFuzz(int128 x, int128 y) public {
        bool z = x != y;
        bool result = QuantoInt128.wrap(x) != QuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt128Not() public {
        int128 hundred = 100;
        QuantoInt128 x = QuantoInt128.wrap(hundred);
        QuantoInt128 result = ~x;
        int128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testQuantoInt128NotFuzz(int128 x) public {
        QuantoInt128 result = ~QuantoInt128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testQuantoInt128Or() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(200);
        QuantoInt128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testQuantoInt128OrFuzz(int128 x, int128 y) public {
        QuantoInt128 result = QuantoInt128.wrap(x) | QuantoInt128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testQuantoInt128Xor() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 y = QuantoInt128.wrap(200);
        QuantoInt128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testQuantoInt128XorFuzz(int128 x, int128 y) public {
        QuantoInt128 result = QuantoInt128.wrap(x) ^ QuantoInt128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testQuantoInt128Increment() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        QuantoInt128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testQuantoInt128IncrementFuzz(int128 x) public {
        int128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            QuantoInt128.wrap(x).increment();
        } else {
            QuantoInt128 result = QuantoInt128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testQuantoInt128Mul() public {
        QuantoInt128 x = QuantoInt128.wrap(100);
        int128 y = 200;
        QuantoInt128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testQuantoInt128MulFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            QuantoInt128.wrap(x).mul(y);
        } else {
            QuantoInt128 result = QuantoInt128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt128MulDecimal() public {
        QuantoInt128 x = QuantoInt128.wrap(100 ether);
        int128 y = 200 ether;
        QuantoInt128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testQuantoInt128MulDecimalFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z :=
                sdiv(
                    mul(x, y),
                    // 1 ether
                    0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
                )
        }
        if (
            (x != 0 && y != 0)
                && (z / y != (x / 1 ether) || z / x != (y / 1 ether))
        ) {
            vm.expectRevert();
            QuantoInt128.wrap(x).mulDecimal(y);
        } else {
            QuantoInt128 result = QuantoInt128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt128MulDecimalToUSD() public {
        QuantoInt128 x = QuantoInt128.wrap(100 ether);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200 ether);
        USDInt128 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testQuantoInt128MulDecimalToQuantoFuzz(int128 x, int128 y)
        public
    {
        int128 z;
        assembly {
            z :=
                sdiv(
                    mul(x, y),
                    // 1 ether
                    0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
                )
        }
        if (
            (x != 0 && y != 0)
                && (z / y != (x / 1 ether) || z / x != (y / 1 ether))
        ) {
            vm.expectRevert();
            QuantoInt128.wrap(x).mulDecimalToUSD(USDPerQuantoInt128.wrap(y));
        } else {
            USDInt128 result =
                QuantoInt128.wrap(x).mulDecimalToUSD(USDPerQuantoInt128.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt128Div() public {
        QuantoInt128 x = QuantoInt128.wrap(500);
        int128 y = 2;
        QuantoInt128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testQuantoInt128DivFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            QuantoInt128.wrap(x).div(y);
        } else {
            QuantoInt128 result = QuantoInt128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt128ToUint() public {
        int128 x = type(int128).min;
        vm.expectRevert();
        QuantoInt128.wrap(x).toUint();
        x = 1;
        QuantoUint128 result = QuantoInt128.wrap(x).toUint();
        assertEq(result.unwrap(), uint128(x));
    }

    function testQuantoInt128ToUintFuzz(int128 x) public {
        if (x < 0) {
            vm.expectRevert();
            QuantoInt128.wrap(x).toUint();
        } else {
            QuantoUint128 result = QuantoInt128.wrap(x).toUint();
            assertEq(result.unwrap(), uint128(x));
        }
    }
}
