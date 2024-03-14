// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt256,
    BaseInt256,
    BaseInt128,
    BaseUint256,
    QuantoInt256,
    USDPerBaseInt256,
    USDPerQuantoInt256,
    USDInt256,
    InteractionsBaseInt256
} from "../../src/UnitTypes.sol";

contract BaseInt256Test is Test {
    using InteractionsBaseInt256 for BaseInt256;

    function setUp() public {}

    function testBaseInt256Add() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(200);
        BaseInt256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseInt256AddFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := add(x, y)
        }
        BaseInt256 xW = BaseInt256.wrap(x);
        BaseInt256 yW = BaseInt256.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseInt256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testBaseInt256Sub() public {
        BaseInt256 x = BaseInt256.wrap(200);
        BaseInt256 y = BaseInt256.wrap(100);
        BaseInt256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testBaseInt256SubFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            BaseInt256.wrap(x) - BaseInt256.wrap(y);
        } else {
            BaseInt256 result = BaseInt256.wrap(x) - BaseInt256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testBaseInt256And() public {
        BaseInt256 x = BaseInt256.wrap(10); // 1010 in binary
        int256 y = 12; // 1100 in binary
        BaseInt256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseInt256AndFuzz(int256 x, int256 y) public {
        int256 z = x & y;
        BaseInt256 result = BaseInt256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseInt256And2() public {
        BaseInt256 x = BaseInt256.wrap(10); // 1010 in binary
        BaseInt256 y = BaseInt256.wrap(12); // 1100 in binary
        BaseInt256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseInt256And2Fuzz(int256 x, int256 y) public {
        int256 z = x & y;
        BaseInt256 result = BaseInt256.wrap(x) & BaseInt256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseInt256Eq() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == BaseInt256.wrap(101);
        assertFalse(result);
    }

    function testBaseInt256EqFuzz(int256 x, int256 y) public {
        bool z = x == y;
        bool result = BaseInt256.wrap(x) == BaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt256Gt() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > BaseInt256.wrap(101);
        assertFalse(result);
    }

    function testBaseInt256GtFuzz(int256 x, int256 y) public {
        bool z = x > y;
        bool result = BaseInt256.wrap(x) > BaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt256Gte() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= BaseInt256.wrap(101);
        assertFalse(result);
    }

    function testBaseInt256GteFuzz(int256 x, int256 y) public {
        bool z = x >= y;
        bool result = BaseInt256.wrap(x) >= BaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt256Lt() public {
        BaseInt256 x = BaseInt256.wrap(50);
        BaseInt256 y = BaseInt256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < BaseInt256.wrap(49);
        assertFalse(result);
    }

    function testBaseInt256LtFuzz(int256 x, int256 y) public {
        bool z = x < y;
        bool result = BaseInt256.wrap(x) < BaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt256Lte() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= BaseInt256.wrap(99);
        assertFalse(result);
    }

    function testBaseInt256LteFuzz(int256 x, int256 y) public {
        bool z = x <= y;
        bool result = BaseInt256.wrap(x) <= BaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt256Mod() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(30);
        BaseInt256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testBaseInt256ModFuzz(int256 x, int256 y) public {
        if (y == 0) {
            vm.expectRevert();
            BaseInt256.wrap(x) % BaseInt256.wrap(y);
        } else {
            int256 z = x % y;
            BaseInt256 result = BaseInt256.wrap(x) % BaseInt256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt256Neq() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != BaseInt256.wrap(101);
        assertTrue(result);
    }

    function testBaseInt256NeqFuzz(int256 x, int256 y) public {
        bool z = x != y;
        bool result = BaseInt256.wrap(x) != BaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseInt256Not() public {
        int256 hundred = 100;
        BaseInt256 x = BaseInt256.wrap(hundred);
        BaseInt256 result = ~x;
        int256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testBaseInt256NotFuzz(int256 x) public {
        BaseInt256 result = ~BaseInt256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testBaseInt256Or() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(200);
        BaseInt256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testBaseInt256OrFuzz(int256 x, int256 y) public {
        BaseInt256 result = BaseInt256.wrap(x) | BaseInt256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testBaseInt256Xor() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 y = BaseInt256.wrap(200);
        BaseInt256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testBaseInt256XorFuzz(int256 x, int256 y) public {
        BaseInt256 result = BaseInt256.wrap(x) ^ BaseInt256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testBaseInt256Increment() public {
        BaseInt256 x = BaseInt256.wrap(100);
        BaseInt256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseInt256IncrementFuzz(int256 x) public {
        int256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseInt256.wrap(x).increment();
        } else {
            BaseInt256 result = BaseInt256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseInt256Mul() public {
        BaseInt256 x = BaseInt256.wrap(100);
        int256 y = 200;
        BaseInt256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testBaseInt256MulFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            BaseInt256.wrap(x).mul(y);
        } else {
            BaseInt256 result = BaseInt256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt256MulDecimal() public {
        BaseInt256 x = BaseInt256.wrap(100 ether);
        int256 y = 200 ether;
        BaseInt256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseInt256MulDecimalFuzz(int256 x, int256 y) public {
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
            BaseInt256.wrap(x).mulDecimal(y);
        } else {
            BaseInt256 result = BaseInt256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt256MulDecimalToUSD() public {
        BaseInt256 x = BaseInt256.wrap(100 ether);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(200 ether);
        USDInt256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseInt256MulDecimalToQuantoFuzz(int256 x, int256 y) public {
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
            BaseInt256.wrap(x).mulDecimalToUSD(USDPerBaseInt256.wrap(y));
        } else {
            USDInt256 result =
                BaseInt256.wrap(x).mulDecimalToUSD(USDPerBaseInt256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt256Div() public {
        BaseInt256 x = BaseInt256.wrap(500);
        int256 y = 2;
        BaseInt256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testBaseInt256DivFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            BaseInt256.wrap(x).div(y);
        } else {
            BaseInt256 result = BaseInt256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt256DivDecimal() public {
        BaseInt256 x = BaseInt256.wrap(500 ether);
        int256 y = 2 ether;
        BaseInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testBaseInt256DivDecimalFuzz(int256 x, int256 y) public {
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
            BaseInt256.wrap(x).divDecimal(y);
        } else {
            BaseInt256 result = BaseInt256.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseInt256To128() public {
        int256 x = type(int256).max;
        vm.expectRevert();
        BaseInt256.wrap(x).to128();
        x = 1;
        BaseInt128 result = BaseInt256.wrap(x).to128();
        assertEq(result.unwrap(), int256(x));
    }

    function testBaseInt256To128Fuzz(int256 x) public {
        if (x > int256(type(int128).max) || x < int256(type(int128).min)) {
            vm.expectRevert();
            BaseInt256.wrap(x).to128();
        } else {
            BaseInt128 result = BaseInt256.wrap(x).to128();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testBaseInt256ToUint() public {
        int256 x = type(int256).min;
        vm.expectRevert();
        BaseInt256.wrap(x).toUint();
        x = 1;
        BaseUint256 result = BaseInt256.wrap(x).toUint();
        assertEq(result.unwrap(), uint256(x));
    }

    function testBaseInt256ToUintFuzz(int256 x) public {
        if (x < 0) {
            vm.expectRevert();
            BaseInt256.wrap(x).toUint();
        } else {
            BaseUint256 result = BaseInt256.wrap(x).toUint();
            assertEq(result.unwrap(), uint256(x));
        }
    }

    function testBaseInt256Abs() public {
        BaseInt256 x = BaseInt256.wrap(-100);
        BaseUint256 result = x.abs();
        assertEq(result.unwrap(), uint256(100));
        result = BaseInt256.wrap(100).abs();
        assertEq(result.unwrap(), uint256(100));
    }

    function testBaseInt256AbsFuzz(int256 x) public {
        if (x == type(int256).min) {
            vm.expectRevert();
            BaseInt256.wrap(x).abs();
        } else {
            BaseUint256 result = BaseInt256.wrap(x).abs();
            assertEq(result.unwrap(), uint256(x < 0 ? -x : x));
        }
    }

    function testBaseInt256Max() public {
        BaseInt256 x = BaseInt256.wrap(-100);
        BaseInt256 y = BaseInt256.wrap(200);
        BaseInt256 result = x.max(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testBaseInt256MaxFuzz(int256 x, int256 y) public {
        int256 z = x < y ? y : x;
        BaseInt256 result = BaseInt256.wrap(x).max(BaseInt256.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testBaseInt256Min() public {
        BaseInt256 x = BaseInt256.wrap(-100);
        BaseInt256 y = BaseInt256.wrap(200);
        BaseInt256 result = x.min(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testBaseInt256MinFuzz(int256 x, int256 y) public {
        int256 z = x < y ? x : y;
        BaseInt256 result = BaseInt256.wrap(x).min(BaseInt256.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testBaseInt256SameSide() public {
        BaseInt256 x = BaseInt256.wrap(200);
        BaseInt256 y = BaseInt256.wrap(100);
        bool result = x.sameSide(y);
        assertTrue(result);
        result = x.sameSide(BaseInt256.wrap(-100));
        assertFalse(result);
    }

    function testBaseInt256SameSideFuzz(int256 x, int256 y) public {
        bool z = (x == 0) || (y == 0) || (x > 0) == (y > 0);
        bool result = BaseInt256.wrap(x).sameSide(BaseInt256.wrap(y));
        assertEq(result, z);
    }

    function testBaseInt256Zero() public {
        BaseInt256 x = InteractionsBaseInt256.zero();
        assertEq(x.unwrap(), 0);
    }

    function testBaseInt256isZero() public {
        BaseInt256 x = BaseInt256.wrap(0);
        BaseInt256 y = BaseInt256.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testBaseInt256isZeroFuzz(int256 x) public {
        BaseInt256 result = BaseInt256.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }
}
