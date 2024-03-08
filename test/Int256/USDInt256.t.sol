// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt256,
    BaseInt256,
    QuantoInt256,
    USDPerBaseInt256,
    USDPerQuantoInt256,
    USDInt256,
    USDInt128,
    USDUint256,
    InteractionsUSDInt256
} from "../../src/UnitTypes.sol";

contract USDInt256Test is Test {
    using InteractionsUSDInt256 for USDInt256;

    function setUp() public {}

    function testUSDInt256Add() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(200);
        USDInt256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDInt256AddFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := add(x, y)
        }
        USDInt256 xW = USDInt256.wrap(x);
        USDInt256 yW = USDInt256.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDInt256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDInt256Sub() public {
        USDInt256 x = USDInt256.wrap(200);
        USDInt256 y = USDInt256.wrap(100);
        USDInt256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDInt256SubFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            USDInt256.wrap(x) - USDInt256.wrap(y);
        } else {
            USDInt256 result = USDInt256.wrap(x) - USDInt256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDInt256And() public {
        USDInt256 x = USDInt256.wrap(10); // 1010 in binary
        int256 y = 12; // 1100 in binary
        USDInt256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDInt256AndFuzz(int256 x, int256 y) public {
        int256 z = x & y;
        USDInt256 result = USDInt256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDInt256And2() public {
        USDInt256 x = USDInt256.wrap(10); // 1010 in binary
        USDInt256 y = USDInt256.wrap(12); // 1100 in binary
        USDInt256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDInt256And2Fuzz(int256 x, int256 y) public {
        int256 z = x & y;
        USDInt256 result = USDInt256.wrap(x) & USDInt256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDInt256Eq() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDInt256EqFuzz(int256 x, int256 y) public {
        bool z = x == y;
        bool result = USDInt256.wrap(x) == USDInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt256Gt() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDInt256GtFuzz(int256 x, int256 y) public {
        bool z = x > y;
        bool result = USDInt256.wrap(x) > USDInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt256Gte() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDInt256GteFuzz(int256 x, int256 y) public {
        bool z = x >= y;
        bool result = USDInt256.wrap(x) >= USDInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt256Lt() public {
        USDInt256 x = USDInt256.wrap(50);
        USDInt256 y = USDInt256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDInt256.wrap(49);
        assertFalse(result);
    }

    function testUSDInt256LtFuzz(int256 x, int256 y) public {
        bool z = x < y;
        bool result = USDInt256.wrap(x) < USDInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt256Lte() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDInt256.wrap(99);
        assertFalse(result);
    }

    function testUSDInt256LteFuzz(int256 x, int256 y) public {
        bool z = x <= y;
        bool result = USDInt256.wrap(x) <= USDInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt256Mod() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(30);
        USDInt256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDInt256ModFuzz(int256 x, int256 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDInt256.wrap(x) % USDInt256.wrap(y);
        } else {
            int256 z = x % y;
            USDInt256 result = USDInt256.wrap(x) % USDInt256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt256Neq() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDInt256.wrap(101);
        assertTrue(result);
    }

    function testUSDInt256NeqFuzz(int256 x, int256 y) public {
        bool z = x != y;
        bool result = USDInt256.wrap(x) != USDInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDInt256Not() public {
        int256 hundred = 100;
        USDInt256 x = USDInt256.wrap(hundred);
        USDInt256 result = ~x;
        int256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDInt256NotFuzz(int256 x) public {
        USDInt256 result = ~USDInt256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDInt256Or() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(200);
        USDInt256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDInt256OrFuzz(int256 x, int256 y) public {
        USDInt256 result = USDInt256.wrap(x) | USDInt256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDInt256Xor() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 y = USDInt256.wrap(200);
        USDInt256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDInt256XorFuzz(int256 x, int256 y) public {
        USDInt256 result = USDInt256.wrap(x) ^ USDInt256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDInt256Increment() public {
        USDInt256 x = USDInt256.wrap(100);
        USDInt256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDInt256IncrementFuzz(int256 x) public {
        int256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDInt256.wrap(x).increment();
        } else {
            USDInt256 result = USDInt256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDInt256Mul() public {
        USDInt256 x = USDInt256.wrap(100);
        int256 y = 200;
        USDInt256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDInt256MulFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDInt256.wrap(x).mul(y);
        } else {
            USDInt256 result = USDInt256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt256MulDecimal() public {
        USDInt256 x = USDInt256.wrap(100 ether);
        int256 y = 200 ether;
        USDInt256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDInt256MulDecimalFuzz(int256 x, int256 y) public {
        int256 z;
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
            USDInt256.wrap(x).mulDecimal(y);
        } else {
            USDInt256 result = USDInt256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt256Div() public {
        USDInt256 x = USDInt256.wrap(500);
        int256 y = 2;
        USDInt256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }
    // args=[-57896044618658097711785492504343953926634992332820282019728792003956564819968 [-5.789e76], -1]]

    function testUSDInt256DivFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDInt256.wrap(x).div(y);
        } else {
            USDInt256 result = USDInt256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt256DivDecimal() public {
        USDInt256 x = USDInt256.wrap(500 ether);
        int256 y = 2 ether;
        USDInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testUSDInt256DivDecimalFuzz(int256 x, int256 y) public {
        int256 z;
        int256 j;
        assembly {
            j :=
                mul(
                    x,
                    0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
                )
            z := sdiv(j, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        bool mulOverflow = (x != 0) && (j / 1 ether != x);
        if (wrongSign || mulOverflow || y == 0) {
            vm.expectRevert();
            USDInt256.wrap(x).divDecimal(y);
        } else {
            USDInt256 result = USDInt256.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt256To128() public {
        int256 x = type(int256).max;
        vm.expectRevert();
        USDInt256.wrap(x).to128();
        x = 1;
        USDInt128 result = USDInt256.wrap(x).to128();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDInt256To128Fuzz(int256 x) public {
        if (x > int256(type(int128).max) || x < int256(type(int128).min)) {
            vm.expectRevert();
            USDInt256.wrap(x).to128();
        } else {
            USDInt128 result = USDInt256.wrap(x).to128();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testUSDInt256ToUint() public {
        int256 x = type(int256).min;
        vm.expectRevert();
        USDInt256.wrap(x).toUint();
        x = 1;
        USDUint256 result = USDInt256.wrap(x).toUint();
        assertEq(result.unwrap(), uint256(x));
    }

    function testUSDInt256ToUintFuzz(int256 x) public {
        if (x < 0) {
            vm.expectRevert();
            USDInt256.wrap(x).toUint();
        } else {
            USDUint256 result = USDInt256.wrap(x).toUint();
            assertEq(result.unwrap(), uint256(x));
        }
    }
}
