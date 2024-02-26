// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt256,
    BaseInt256,
    QuantoInt256,
    QuantoInt128,
    QuantoUint256,
    USDPerBaseInt256,
    USDPerQuantoInt256,
    USDInt256
} from "../../src/UnitTypes.sol";

contract QuantoInt256Test is Test {
    function setUp() public {}

    function testQuantoInt256Add() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(200);
        QuantoInt256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testQuantoInt256AddFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := add(x, y)
        }
        QuantoInt256 xW = QuantoInt256.wrap(x);
        QuantoInt256 yW = QuantoInt256.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            QuantoInt256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testQuantoInt256Sub() public {
        QuantoInt256 x = QuantoInt256.wrap(200);
        QuantoInt256 y = QuantoInt256.wrap(100);
        QuantoInt256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testQuantoInt256SubFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            QuantoInt256.wrap(x) - QuantoInt256.wrap(y);
        } else {
            QuantoInt256 result = QuantoInt256.wrap(x) - QuantoInt256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testQuantoInt256And() public {
        QuantoInt256 x = QuantoInt256.wrap(10); // 1010 in binary
        int256 y = 12; // 1100 in binary
        QuantoInt256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testQuantoInt256AndFuzz(int256 x, int256 y) public {
        int256 z = x & y;
        QuantoInt256 result = QuantoInt256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testQuantoInt256And2() public {
        QuantoInt256 x = QuantoInt256.wrap(10); // 1010 in binary
        QuantoInt256 y = QuantoInt256.wrap(12); // 1100 in binary
        QuantoInt256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testQuantoInt256And2Fuzz(int256 x, int256 y) public {
        int256 z = x & y;
        QuantoInt256 result = QuantoInt256.wrap(x) & QuantoInt256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testQuantoInt256Eq() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == QuantoInt256.wrap(101);
        assertFalse(result);
    }

    function testQuantoInt256EqFuzz(int256 x, int256 y) public {
        bool z = x == y;
        bool result = QuantoInt256.wrap(x) == QuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt256Gt() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > QuantoInt256.wrap(101);
        assertFalse(result);
    }

    function testQuantoInt256GtFuzz(int256 x, int256 y) public {
        bool z = x > y;
        bool result = QuantoInt256.wrap(x) > QuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt256Gte() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= QuantoInt256.wrap(101);
        assertFalse(result);
    }

    function testQuantoInt256GteFuzz(int256 x, int256 y) public {
        bool z = x >= y;
        bool result = QuantoInt256.wrap(x) >= QuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt256Lt() public {
        QuantoInt256 x = QuantoInt256.wrap(50);
        QuantoInt256 y = QuantoInt256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < QuantoInt256.wrap(49);
        assertFalse(result);
    }

    function testQuantoInt256LtFuzz(int256 x, int256 y) public {
        bool z = x < y;
        bool result = QuantoInt256.wrap(x) < QuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt256Lte() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= QuantoInt256.wrap(99);
        assertFalse(result);
    }

    function testQuantoInt256LteFuzz(int256 x, int256 y) public {
        bool z = x <= y;
        bool result = QuantoInt256.wrap(x) <= QuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt256Mod() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(30);
        QuantoInt256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testQuantoInt256ModFuzz(int256 x, int256 y) public {
        if (y == 0) {
            vm.expectRevert();
            QuantoInt256.wrap(x) % QuantoInt256.wrap(y);
        } else {
            int256 z = x % y;
            QuantoInt256 result = QuantoInt256.wrap(x) % QuantoInt256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt256Neq() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != QuantoInt256.wrap(101);
        assertTrue(result);
    }

    function testQuantoInt256NeqFuzz(int256 x, int256 y) public {
        bool z = x != y;
        bool result = QuantoInt256.wrap(x) != QuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoInt256Not() public {
        int256 hundred = 100;
        QuantoInt256 x = QuantoInt256.wrap(hundred);
        QuantoInt256 result = ~x;
        int256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testQuantoInt256NotFuzz(int256 x) public {
        QuantoInt256 result = ~QuantoInt256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testQuantoInt256Or() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(200);
        QuantoInt256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testQuantoInt256OrFuzz(int256 x, int256 y) public {
        QuantoInt256 result = QuantoInt256.wrap(x) | QuantoInt256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testQuantoInt256Xor() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 y = QuantoInt256.wrap(200);
        QuantoInt256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testQuantoInt256XorFuzz(int256 x, int256 y) public {
        QuantoInt256 result = QuantoInt256.wrap(x) ^ QuantoInt256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testQuantoInt256Increment() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        QuantoInt256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testQuantoInt256IncrementFuzz(int256 x) public {
        int256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            QuantoInt256.wrap(x).increment();
        } else {
            QuantoInt256 result = QuantoInt256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testQuantoInt256Mul() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        int256 y = 200;
        QuantoInt256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testQuantoInt256MulFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            QuantoInt256.wrap(x).mul(y);
        } else {
            QuantoInt256 result = QuantoInt256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt256MulDecimal() public {
        QuantoInt256 x = QuantoInt256.wrap(100 ether);
        int256 y = 200 ether;
        QuantoInt256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testQuantoInt256MulDecimalFuzz(int256 x, int256 y) public {
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
            QuantoInt256.wrap(x).mulDecimal(y);
        } else {
            QuantoInt256 result = QuantoInt256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt256MulDecimalToUSD() public {
        QuantoInt256 x = QuantoInt256.wrap(100 ether);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(200 ether);
        USDInt256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testQuantoInt256MulDecimalToQuantoFuzz(int256 x, int256 y)
        public
    {
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
            QuantoInt256.wrap(x).mulDecimalToUSD(USDPerQuantoInt256.wrap(y));
        } else {
            USDInt256 result =
                QuantoInt256.wrap(x).mulDecimalToUSD(USDPerQuantoInt256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt256Div() public {
        QuantoInt256 x = QuantoInt256.wrap(500);
        int256 y = 2;
        QuantoInt256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testQuantoInt256DivFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            QuantoInt256.wrap(x).div(y);
        } else {
            QuantoInt256 result = QuantoInt256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoInt256To128() public {
        int256 x = type(int256).max;
        vm.expectRevert();
        QuantoInt256.wrap(x).to128();
        x = 1;
        QuantoInt128 result = QuantoInt256.wrap(x).to128();
        assertEq(result.unwrap(), int256(x));
    }

    function testQuantoInt256To128Fuzz(int256 x) public {
        if (x > int256(type(int128).max) || x < int256(type(int128).min)) {
            vm.expectRevert();
            QuantoInt256.wrap(x).to128();
        } else {
            QuantoInt128 result = QuantoInt256.wrap(x).to128();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testQuantoInt256ToUint() public {
        int256 x = type(int256).min;
        vm.expectRevert();
        QuantoInt256.wrap(x).toUint();
        x = 1;
        QuantoUint256 result = QuantoInt256.wrap(x).toUint();
        assertEq(result.unwrap(), uint256(x));
    }

    function testQuantoInt256ToUintFuzz(int256 x) public {
        if (x < 0) {
            vm.expectRevert();
            QuantoInt256.wrap(x).toUint();
        } else {
            QuantoUint256 result = QuantoInt256.wrap(x).toUint();
            assertEq(result.unwrap(), uint256(x));
        }
    }
}
