// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseInt128,
    BaseUint128,
    BaseInt256,
    USDPerBaseInt128,
    USDInt128,
    InteractionsBaseInt128
} from "src/UnitTypes.sol";

contract BaseInt128Test is Test {
    using InteractionsBaseInt128 for BaseInt128;
    
    function setUp() public {}

    function testBaseInt128Add() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(200);
        BaseInt128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseInt128AddFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := add(x, y)
        }
        BaseInt128 xW = BaseInt128.wrap(x);
        BaseInt128 yW = BaseInt128.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseInt128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testBaseInt128Sub() public {
        BaseInt128 x = BaseInt128.wrap(200);
        BaseInt128 y = BaseInt128.wrap(100);
        BaseInt128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testBaseInt128SubFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            BaseInt128.wrap(x) - BaseInt128.wrap(y);
        } else {
            BaseInt128 result = BaseInt128.wrap(x) - BaseInt128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testBaseInt128And() public {
        BaseInt128 x = BaseInt128.wrap(10); // 1010 in binary
        int128 y = 12; // 1100 in binary
        BaseInt128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseInt128AndFuzz(int128 x, int128 y) public {
        int128 z = x & y;
        BaseInt128 result = BaseInt128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseInt128And2() public {
        BaseInt128 x = BaseInt128.wrap(10); // 1010 in binary
        BaseInt128 y = BaseInt128.wrap(12); // 1100 in binary
        BaseInt128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseInt128And2Fuzz(int128 x, int128 y) public {
        int128 z = x & y;
        BaseInt128 result = BaseInt128.wrap(x) & BaseInt128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseInt128Eq() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == BaseInt128.wrap(101);
        assertFalse(result);
    }

    function testBaseInt128EqFuzz(int128 x, int128 y) public {
        bool z = x == y;
        bool result = BaseInt128.wrap(x) == BaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt128Gt() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > BaseInt128.wrap(101);
        assertFalse(result);
    }

    function testBaseInt128GtFuzz(int128 x, int128 y) public {
        bool z = x > y;
        bool result = BaseInt128.wrap(x) > BaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt128Gte() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= BaseInt128.wrap(101);
        assertFalse(result);
    }

    function testBaseInt128GteFuzz(int128 x, int128 y) public {
        bool z = x >= y;
        bool result = BaseInt128.wrap(x) >= BaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt128Lt() public {
        BaseInt128 x = BaseInt128.wrap(50);
        BaseInt128 y = BaseInt128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < BaseInt128.wrap(49);
        assertFalse(result);
    }

    function testBaseInt128LtFuzz(int128 x, int128 y) public {
        bool z = x < y;
        bool result = BaseInt128.wrap(x) < BaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt128Lte() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= BaseInt128.wrap(99);
        assertFalse(result);
    }

    function testBaseInt128LteFuzz(int128 x, int128 y) public {
        bool z = x <= y;
        bool result = BaseInt128.wrap(x) <= BaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt128Mod() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(30);
        BaseInt128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testBaseInt128ModFuzz(int128 x, int128 y) public {
        if (y == 0) {
            vm.expectRevert();
            BaseInt128.wrap(x) % BaseInt128.wrap(y);
        } else {
            int128 z = x % y;
            BaseInt128 result = BaseInt128.wrap(x) % BaseInt128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt128Neq() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != BaseInt128.wrap(101);
        assertTrue(result);
    }

    function testBaseInt128NeqFuzz(int128 x, int128 y) public {
        bool z = x != y;
        bool result = BaseInt128.wrap(x) != BaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt128Not() public {
        int128 hundred = 100;
        BaseInt128 x = BaseInt128.wrap(hundred);
        BaseInt128 result = ~x;
        int128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testBaseInt128NotFuzz(int128 x) public {
        BaseInt128 result = ~BaseInt128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testBaseInt128Or() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(200);
        BaseInt128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testBaseInt128OrFuzz(int128 x, int128 y) public {
        BaseInt128 result = BaseInt128.wrap(x) | BaseInt128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testBaseInt128Xor() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 y = BaseInt128.wrap(200);
        BaseInt128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testBaseInt128XorFuzz(int128 x, int128 y) public {
        BaseInt128 result = BaseInt128.wrap(x) ^ BaseInt128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testBaseInt128Increment() public {
        BaseInt128 x = BaseInt128.wrap(100);
        BaseInt128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseInt128IncrementFuzz(int128 x) public {
        int128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseInt128.wrap(x).increment();
        } else {
            BaseInt128 result = BaseInt128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseInt128Mul() public {
        BaseInt128 x = BaseInt128.wrap(100);
        int128 y = 200;
        BaseInt128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testBaseInt128MulFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            BaseInt128.wrap(x).mul(y);
        } else {
            BaseInt128 result = BaseInt128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt128MulDecimal() public {
        BaseInt128 x = BaseInt128.wrap(100 ether);
        int128 y = 200 ether;
        BaseInt128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseInt128MulDecimalFuzz(int128 x, int128 y) public {
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
            BaseInt128.wrap(x).mulDecimal(y);
        } else {
            BaseInt128 result = BaseInt128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt128MulDecimalToUSD() public {
        BaseInt128 x = BaseInt128.wrap(100 ether);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200 ether);
        USDInt128 result = InteractionsBaseInt128.mulDecimalToUSD(x, y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseInt128MulDecimalToQuantoFuzz(int128 x, int128 y) public {
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
            BaseInt128.wrap(x).mulDecimalToUSD(USDPerBaseInt128.wrap(y));
        } else {
            USDInt128 result =
                BaseInt128.wrap(x).mulDecimalToUSD(USDPerBaseInt128.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt128Div() public {
        BaseInt128 x = BaseInt128.wrap(500);
        int128 y = 2;
        BaseInt128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testBaseInt128DivFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            BaseInt128.wrap(x).div(y);
        } else {
            BaseInt128 result = BaseInt128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt128DivDecimal() public {
        BaseInt128 x = BaseInt128.wrap(500 ether);
        int128 y = 2 ether;
        BaseInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testBaseInt128DivDecimalFuzz(int128 x, int128 y) public {
        int256 z;
        int256 j;
        assembly {
            j := mul(x, 0x0000000000000000000000000000000000000000000000000de0b6b3a7640000)
            z := sdiv(j,y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        bool mulOverflow = (x != 0) && (j / 1 ether != x);
        if (wrongSign || mulOverflow || y == 0) {
            vm.expectRevert();
            BaseInt128.wrap(x).divDecimal(y);
        } else {
            BaseInt256 result = BaseInt128.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt128DivDecimalInt128() public {
        BaseInt128 x = BaseInt128.wrap(50 ether);
        int128 y = 2 ether;
        BaseInt128 result = x.divDecimalInt128(y);
        assertEq(result.unwrap(), 25 ether);
    }

    function testBaseInt128DivDecimalInt128Fuzz(int128 x, int128 y) public {
        int128 z;
        int128 j;
        assembly {
            j := mul(x, 0x0000000000000000000000000000000000000000000000000de0b6b3a7640000)
            z := sdiv(j,y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        bool mulOverflow = (x != 0) && (j / 1 ether != x);
        if (wrongSign || mulOverflow || y == 0) {
            vm.expectRevert();
            BaseInt128.wrap(x).divDecimalInt128(y);
        } else {
            BaseInt128 result = BaseInt128.wrap(x).divDecimalInt128(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt128ToUint() public {
        int128 x = type(int128).min;
        vm.expectRevert();
        BaseInt128.wrap(x).toUint();
        x = 1;
        BaseUint128 result = BaseInt128.wrap(x).toUint();
        assertEq(result.unwrap(), uint128(x));
    }

    function testBaseInt128ToUintFuzz(int128 x) public {
        if (x < 0) {
            vm.expectRevert();
            BaseInt128.wrap(x).toUint();
        } else {
            BaseUint128 result = BaseInt128.wrap(x).toUint();
            assertEq(result.unwrap(), uint128(x));
        }
    }
}
