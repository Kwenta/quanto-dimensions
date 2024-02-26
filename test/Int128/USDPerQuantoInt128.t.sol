// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt128,
    QuantoInt128,
    BaseInt128,
    USDPerQuantoInt128,
    USDInt128
} from "../../src/UnitTypes.sol";

contract USDPerQuantoInt128Test is Test {
    function setUp() public {}

    function testUSDPerQuantoInt128Add() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerQuantoInt128AddFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := add(x, y)
        }
        USDPerQuantoInt128 xW = USDPerQuantoInt128.wrap(x);
        USDPerQuantoInt128 yW = USDPerQuantoInt128.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerQuantoInt128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerQuantoInt128Sub() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerQuantoInt128SubFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x) - USDPerQuantoInt128.wrap(y);
        } else {
            USDPerQuantoInt128 result =
                USDPerQuantoInt128.wrap(x) - USDPerQuantoInt128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt128And() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(10); // 1010 in binary
        int128 y = 12; // 1100 in binary
        USDPerQuantoInt128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoInt128AndFuzz(int128 x, int128 y) public {
        int128 z = x & y;
        USDPerQuantoInt128 result = USDPerQuantoInt128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoInt128And2() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(10); // 1010 in binary
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(12); // 1100 in binary
        USDPerQuantoInt128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoInt128And2Fuzz(int128 x, int128 y) public {
        int128 z = x & y;
        USDPerQuantoInt128 result =
            USDPerQuantoInt128.wrap(x) & USDPerQuantoInt128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoInt128Eq() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerQuantoInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoInt128EqFuzz(int128 x, int128 y) public {
        bool z = x == y;
        bool result = USDPerQuantoInt128.wrap(x) == USDPerQuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128Gt() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerQuantoInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoInt128GtFuzz(int128 x, int128 y) public {
        bool z = x > y;
        bool result = USDPerQuantoInt128.wrap(x) > USDPerQuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128Gte() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerQuantoInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoInt128GteFuzz(int128 x, int128 y) public {
        bool z = x >= y;
        bool result = USDPerQuantoInt128.wrap(x) >= USDPerQuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128Lt() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(50);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerQuantoInt128.wrap(49);
        assertFalse(result);
    }

    function testUSDPerQuantoInt128LtFuzz(int128 x, int128 y) public {
        bool z = x < y;
        bool result = USDPerQuantoInt128.wrap(x) < USDPerQuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128Lte() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerQuantoInt128.wrap(99);
        assertFalse(result);
    }

    function testUSDPerQuantoInt128LteFuzz(int128 x, int128 y) public {
        bool z = x <= y;
        bool result = USDPerQuantoInt128.wrap(x) <= USDPerQuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128Mod() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(30);
        USDPerQuantoInt128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerQuantoInt128ModFuzz(int128 x, int128 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x) % USDPerQuantoInt128.wrap(y);
        } else {
            int128 z = x % y;
            USDPerQuantoInt128 result =
                USDPerQuantoInt128.wrap(x) % USDPerQuantoInt128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt128Neq() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerQuantoInt128.wrap(101);
        assertTrue(result);
    }

    function testUSDPerQuantoInt128NeqFuzz(int128 x, int128 y) public {
        bool z = x != y;
        bool result = USDPerQuantoInt128.wrap(x) != USDPerQuantoInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128Not() public {
        int128 hundred = 100;
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(hundred);
        USDPerQuantoInt128 result = ~x;
        int128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerQuantoInt128NotFuzz(int128 x) public {
        USDPerQuantoInt128 result = ~USDPerQuantoInt128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerQuantoInt128Or() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerQuantoInt128OrFuzz(int128 x, int128 y) public {
        USDPerQuantoInt128 result =
            USDPerQuantoInt128.wrap(x) | USDPerQuantoInt128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerQuantoInt128Xor() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerQuantoInt128XorFuzz(int128 x, int128 y) public {
        USDPerQuantoInt128 result =
            USDPerQuantoInt128.wrap(x) ^ USDPerQuantoInt128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerQuantoInt128Increment() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        USDPerQuantoInt128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerQuantoInt128IncrementFuzz(int128 x) public {
        int128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x).increment();
        } else {
            USDPerQuantoInt128 result = USDPerQuantoInt128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerQuantoInt128Mul() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        int128 y = 200;
        USDPerQuantoInt128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDPerQuantoInt128MulFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x).mul(y);
        } else {
            USDPerQuantoInt128 result = USDPerQuantoInt128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt128MulDecimal() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100 ether);
        int128 y = 200 ether;
        USDPerQuantoInt128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoInt128MulDecimalFuzz(int128 x, int128 y) public {
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
            USDPerQuantoInt128.wrap(x).mulDecimal(y);
        } else {
            USDPerQuantoInt128 result = USDPerQuantoInt128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt128MulDecimalToUSD() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100 ether);
        QuantoInt128 y = QuantoInt128.wrap(200 ether);
        USDInt128 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoInt128MulDecimalToUSDFuzz(int128 x, int128 y)
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
            USDPerQuantoInt128.wrap(x).mulDecimalToUSD(QuantoInt128.wrap(y));
        } else {
            USDInt128 result =
                USDPerQuantoInt128.wrap(x).mulDecimalToUSD(QuantoInt128.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt128MulDecimalToBase() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100 ether);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200 ether);
        BaseInt128 result = x.mulDecimalToBase(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoInt128MulDecimalToBaseFuzz(int128 x, int128 y)
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
            USDPerQuantoInt128.wrap(x).mulDecimalToBase(
                BaseQuantoPerUSDInt128.wrap(y)
            );
        } else {
            BaseInt128 result = USDPerQuantoInt128.wrap(x).mulDecimalToBase(
                BaseQuantoPerUSDInt128.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt128Div() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(500);
        int128 y = 2;
        USDPerQuantoInt128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerQuantoInt128DivFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x).div(y);
        } else {
            USDPerQuantoInt128 result = USDPerQuantoInt128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }
}
