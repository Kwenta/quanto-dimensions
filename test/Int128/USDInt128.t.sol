// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {BaseQuantoPerUSDInt128, BaseInt128, QuantoInt128, USDPerBaseInt128, USDPerQuantoInt128, USDInt128, USDInt256, USDUint128} from "src/UnitTypes.sol";

contract USDInt128Test is Test {
    function setUp() public {}

    function testUSDInt128Add() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(200);
        USDInt128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDInt128AddFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := add(x, y)
        }
        USDInt128 xW = USDInt128.wrap(x);
        USDInt128 yW = USDInt128.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDInt128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDInt128Sub() public {
        USDInt128 x = USDInt128.wrap(200);
        USDInt128 y = USDInt128.wrap(100);
        USDInt128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDInt128SubFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            USDInt128.wrap(x) - USDInt128.wrap(y);
        } else {
            USDInt128 result = USDInt128.wrap(x) - USDInt128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDInt128And() public {
        USDInt128 x = USDInt128.wrap(10); // 1010 in binary
        int128 y = 12; // 1100 in binary
        USDInt128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDInt128AndFuzz(int128 x, int128 y) public {
        int128 z = x & y;
        USDInt128 result = USDInt128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDInt128And2() public {
        USDInt128 x = USDInt128.wrap(10); // 1010 in binary
        USDInt128 y = USDInt128.wrap(12); // 1100 in binary
        USDInt128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDInt128And2Fuzz(int128 x, int128 y) public {
        int128 z = x & y;
        USDInt128 result = USDInt128.wrap(x) & USDInt128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDInt128Eq() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDInt128EqFuzz(int128 x, int128 y) public {
        bool z = x == y;
        bool result = USDInt128.wrap(x) == USDInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt128Gt() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDInt128GtFuzz(int128 x, int128 y) public {
        bool z = x > y;
        bool result = USDInt128.wrap(x) > USDInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt128Gte() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDInt128GteFuzz(int128 x, int128 y) public {
        bool z = x >= y;
        bool result = USDInt128.wrap(x) >= USDInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt128Lt() public {
        USDInt128 x = USDInt128.wrap(50);
        USDInt128 y = USDInt128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDInt128.wrap(49);
        assertFalse(result);
    }

    function testUSDInt128LtFuzz(int128 x, int128 y) public {
        bool z = x < y;
        bool result = USDInt128.wrap(x) < USDInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt128Lte() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDInt128.wrap(99);
        assertFalse(result);
    }

    function testUSDInt128LteFuzz(int128 x, int128 y) public {
        bool z = x <= y;
        bool result = USDInt128.wrap(x) <= USDInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt128Mod() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(30);
        USDInt128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDInt128ModFuzz(int128 x, int128 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDInt128.wrap(x) % USDInt128.wrap(y);
        } else {
            int128 z = x % y;
            USDInt128 result = USDInt128.wrap(x) % USDInt128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt128Neq() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDInt128.wrap(101);
        assertTrue(result);
    }

    function testUSDInt128NeqFuzz(int128 x, int128 y) public {
        bool z = x != y;
        bool result = USDInt128.wrap(x) != USDInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt128Not() public {
        int128 hundred = 100;
        USDInt128 x = USDInt128.wrap(hundred);
        USDInt128 result = ~x;
        int128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDInt128NotFuzz(int128 x) public {
        USDInt128 result = ~USDInt128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDInt128Or() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(200);
        USDInt128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDInt128OrFuzz(int128 x, int128 y) public {
        USDInt128 result = USDInt128.wrap(x) | USDInt128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDInt128Xor() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 y = USDInt128.wrap(200);
        USDInt128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDInt128XorFuzz(int128 x, int128 y) public {
        USDInt128 result = USDInt128.wrap(x) ^ USDInt128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDInt128Increment() public {
        USDInt128 x = USDInt128.wrap(100);
        USDInt128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDInt128IncrementFuzz(int128 x) public {
        int128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDInt128.wrap(x).increment();
        } else {
            USDInt128 result = USDInt128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDInt128Mul() public {
        USDInt128 x = USDInt128.wrap(100);
        int128 y = 200;
        USDInt128 result = x.mul(y);
        assertEq(result.unwrap(), 20000);
    }

    function testUSDInt128MulFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) ||
            (y > 0 && x > 0 && z < 0) ||
            (y < 0 && x > 0 && z > 0) ||
            (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDInt128.wrap(x).mul(y);
        } else {
            USDInt128 result = USDInt128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt128MulDecimal() public {
        USDInt128 x = USDInt128.wrap(100 ether);
        int128 y = 200 ether;
        USDInt128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testUSDInt128MulDecimalFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(
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
            USDInt128.wrap(x).mulDecimal(y);
        } else {
            USDInt128 result = USDInt128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt128Div() public {
        USDInt128 x = USDInt128.wrap(500);
        int128 y = 2;
        USDInt128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }
// args=[-57896044618658097711785492504343953926634992332820282019728792003956564819968 [-5.789e76], -1]]
    function testUSDInt128DivFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) ||
            (y > 0 && x > 0 && z < 0) ||
            (y < 0 && x > 0 && z > 0) ||
            (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDInt128.wrap(x).div(y);
        } else {
            USDInt128 result = USDInt128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt128To256() public {
        int128 x = type(int128).max;
        USDInt256 result = USDInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDInt128To256Fuzz(int128 x) public {
        USDInt256 result = USDInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDInt128ToUint() public {
        int128 x = type(int128).min;
        vm.expectRevert();
        USDInt128.wrap(x).toUint();
        x = 1;
        USDUint128 result = USDInt128.wrap(x).toUint();
        assertEq(result.unwrap(), uint128(x));
    }

    function testUSDInt128ToUintFuzz(int128 x) public {
        if (x < 0) {
            vm.expectRevert();
            USDInt128.wrap(x).toUint();
        } else {
            USDUint128 result = USDInt128.wrap(x).toUint();
            assertEq(result.unwrap(), uint128(x));
        }
    }
}
