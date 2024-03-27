// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    USDInt128,
    USDUint128,
    USDInt256,
    USDUint256,
    InteractionsUSDInt128
} from "../../src/UnitTypes.sol";

contract USDInt128Test is Test {
    using InteractionsUSDInt128 for USDInt128;

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
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDInt128MulFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
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
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDInt128MulDecimalFuzz(int128 x, int128 y) public {
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
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDInt128.wrap(x).div(y);
        } else {
            USDInt128 result = USDInt128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt128DivDecimal() public {
        USDInt128 x = USDInt128.wrap(500 ether);
        int128 y = 2 ether;
        USDInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testUSDInt128DivDecimalFuzz(int128 x, int128 y) public {
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
            USDInt128.wrap(x).divDecimal(y);
        } else {
            USDInt256 result = USDInt128.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDInt128DivDecimalInt128() public {
        USDInt128 x = USDInt128.wrap(50 ether);
        int128 y = 2 ether;
        USDInt128 result = x.divDecimalInt128(y);
        assertEq(result.unwrap(), 25 ether);
    }

    function testUSDInt128DivDecimalInt128Fuzz(int128 x, int128 y) public {
        int128 z;
        int128 j;
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
            USDInt128.wrap(x).divDecimalInt128(y);
        } else {
            USDInt128 result = USDInt128.wrap(x).divDecimalInt128(y);
            assertEq(result.unwrap(), z);
        }
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

    function testUSDInt128To256() public {
        int128 x = type(int128).min;
        USDInt256 result = USDInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDInt128To256Fuzz(int128 x) public {
        USDInt256 result = USDInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDInt128Abs() public {
        USDInt128 x = USDInt128.wrap(-100);
        USDUint256 result = x.abs();
        assertEq(result.unwrap(), uint256(100));
        result = USDInt128.wrap(100).abs();
        assertEq(result.unwrap(), uint256(100));
    }

    function testUSDInt128AbsFuzz(int128 x) public {
        USDUint256 result = USDInt128.wrap(x).abs();
        int256 _x = x;
        assertEq(result.unwrap(), uint256(x < 0 ? -_x : _x));
    }

    function testUSDInt128Abs128() public {
        USDInt128 x = USDInt128.wrap(-100);
        USDUint128 result = x.abs128();
        assertEq(result.unwrap(), uint128(100));
        result = USDInt128.wrap(100).abs128();
        assertEq(result.unwrap(), uint128(100));
    }

    function testUSDInt128Abs128Fuzz(int128 x) public {
        if (x == type(int128).min) {
            vm.expectRevert();
            USDInt128.wrap(x).abs128();
        } else {
            USDUint128 result = USDInt128.wrap(x).abs128();
            assertEq(result.unwrap(), uint128(x < 0 ? -x : x));
        }
    }

    function testUSDInt128Max128() public {
        USDInt128 x = USDInt128.wrap(-100);
        USDInt128 y = USDInt128.wrap(200);
        USDInt128 result = x.max128(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testUSDInt128Max128Fuzz(int128 x, int128 y) public {
        int128 z = x < y ? y : x;
        USDInt128 result = USDInt128.wrap(x).max128(USDInt128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDInt128Min128() public {
        USDInt128 x = USDInt128.wrap(-100);
        USDInt128 y = USDInt128.wrap(200);
        USDInt128 result = x.min128(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testUSDInt128Min128Fuzz(int128 x, int128 y) public {
        int128 z = x < y ? x : y;
        USDInt128 result = USDInt128.wrap(x).min128(USDInt128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDInt128Max() public {
        USDInt128 x = USDInt128.wrap(-100);
        USDInt128 y = USDInt128.wrap(200);
        USDInt256 result = x.max(y);
        assertEq(result.unwrap(), int256(y.unwrap()));
    }

    function testUSDInt128MaxFuzz(int128 x, int128 y) public {
        int128 z = x < y ? y : x;
        USDInt256 result = USDInt128.wrap(x).max(USDInt128.wrap(y));
        assertEq(result.unwrap(), int256(z));
    }

    function testUSDInt128Min() public {
        USDInt128 x = USDInt128.wrap(-100);
        USDInt128 y = USDInt128.wrap(200);
        USDInt256 result = x.min(y);
        assertEq(result.unwrap(), int256(x.unwrap()));
    }

    function testUSDInt128MinFuzz(int128 x, int128 y) public {
        int128 z = x < y ? x : y;
        USDInt256 result = USDInt128.wrap(x).min(USDInt128.wrap(y));
        assertEq(result.unwrap(), int256(z));
    }

    function testUSDInt128SameSide() public {
        USDInt128 x = USDInt128.wrap(200);
        USDInt128 y = USDInt128.wrap(100);
        bool result = x.sameSide(y);
        assertTrue(result);
        result = x.sameSide(USDInt128.wrap(-100));
        assertFalse(result);
    }

    function testUSDInt128SameSideFuzz(int128 x, int128 y) public {
        bool z = (x == 0) || (y == 0) || (x > 0) == (y > 0);
        bool result = USDInt128.wrap(x).sameSide(USDInt128.wrap(y));
        assertEq(result, z);
    }

    function testUSDInt128Zero() public {
        USDInt128 x = InteractionsUSDInt128.zero();
        assertEq(x.unwrap(), 0);
    }

    function testUSDInt128isZero() public {
        USDInt128 x = USDInt128.wrap(0);
        USDInt128 y = USDInt128.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testUSDInt128isZeroFuzz(int128 x) public {
        USDInt128 result = USDInt128.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }

    function testUSDInt128DivToDimensionless() public {
        USDInt128 x = USDInt128.wrap(500);
        USDInt128 y = USDInt128.wrap(2);
        int128 result = x.divToDimensionless(y);
        assertEq(result, 250);
    }

    function testUSDInt128DivToDimensionlessFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDInt128.wrap(x).divToDimensionless(USDInt128.wrap(y));
        } else {
            int128 result =
                USDInt128.wrap(x).divToDimensionless(USDInt128.wrap(y));
            assertEq(result, z);
        }
    }

    function testUSDInt128DivDecimalToDimensionless() public {
        USDInt128 x = USDInt128.wrap(500 ether);
        USDInt128 y = USDInt128.wrap(2 ether);
        int256 result = x.divDecimalToDimensionless(y);
        assertEq(result, 250 ether);
    }

    function testUSDInt128DivDecimalToDimensionlessFuzz(int128 x, int128 y)
        public
    {
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
            USDInt128.wrap(x).divDecimalToDimensionless(USDInt128.wrap(y));
        } else {
            int256 result =
                USDInt128.wrap(x).divDecimalToDimensionless(USDInt128.wrap(y));
            assertEq(result, z);
        }
    }

    function testUSDInt128CeilDivide() public {
        USDInt128 x = USDInt128.wrap(10);
        USDInt128 y = USDInt128.wrap(3);
        int128 result = x.ceilDivide(y);
        assertEq(result, 4);
        result = USDInt128.wrap(-10).ceilDivide(USDInt128.wrap(3));
        assertEq(result, -3);
    }

    function testUSDInt128CeilDivideFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDInt128.wrap(x).ceilDivide(USDInt128.wrap(y));
        } else {
            if (!(((x < 0) != (y < 0)) || (x % y) == 0)) {
                z = z + 1;
            }
            int128 result = USDInt128.wrap(x).ceilDivide(USDInt128.wrap(y));
            assertEq(result, z);
        }
    }

    function testUSDInt128GreaterThanZero() public {
        USDInt128 x = USDInt128.wrap(100);
        bool result = x.greaterThanZero();
        assertTrue(result);
        x = USDInt128.wrap(-100);
        result = x.greaterThanZero();
        assertFalse(result);
    }

    function testUSDInt128GreaterThanZeroFuzz(int128 x) public {
        bool z = x > 0;
        bool result = USDInt128.wrap(x).greaterThanZero();
        assertEq(result, z);
    }

    function testUSDInt128LessThanZero() public {
        USDInt128 x = USDInt128.wrap(100);
        bool result = x.lessThanZero();
        assertFalse(result);
        x = USDInt128.wrap(-100);
        result = x.lessThanZero();
        assertTrue(result);
    }

    function testUSDInt128LessThanZeroFuzz(int128 x) public {
        bool z = x < 0;
        bool result = USDInt128.wrap(x).lessThanZero();
        assertEq(result, z);
    }

    function testUSDInt128GreaterThanOrEqualToZero() public {
        USDInt128 x = USDInt128.wrap(0);
        bool result = x.greaterThanOrEqualToZero();
        assertTrue(result);
        x = USDInt128.wrap(-100);
        result = x.greaterThanOrEqualToZero();
        assertFalse(result);
    }

    function testUSDInt128GreaterThanOrEqualToZeroFuzz(int128 x) public {
        bool z = x >= 0;
        bool result = USDInt128.wrap(x).greaterThanOrEqualToZero();
        assertEq(result, z);
    }

    function testUSDInt128LessThanOrEqualToZero() public {
        USDInt128 x = USDInt128.wrap(0);
        bool result = x.lessThanOrEqualToZero();
        assertTrue(result);
        x = USDInt128.wrap(100);
        result = x.lessThanOrEqualToZero();
        assertFalse(result);
    }

    function testUSDInt128LessThanOrEqualToZero(int128 x) public {
        bool z = x <= 0;
        bool result = USDInt128.wrap(x).lessThanOrEqualToZero();
        assertEq(result, z);
    }

    function testUSDInt128IsSameSideReducing() public {
        USDInt128 x = USDInt128.wrap(200);
        USDInt128 y = USDInt128.wrap(100);
        bool result = x.isSameSideReducing(y);
        assertTrue(result);
        result = x.sameSide(USDInt128.wrap(-100));
        assertFalse(result);
    }

    function testUSDInt128IsSameSideReducingFuzz(int128 x, int128 y) public {
        if (
            ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                && (x == type(int128).min || y == type(int128).min)
        ) {
            vm.expectRevert();
            USDInt128.wrap(x).isSameSideReducing(USDInt128.wrap(y));
        } else {
            bool z = (
                ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                    && uint128(y < 0 ? -y : y) < uint128(x < 0 ? -x : x)
            );
            bool result =
                USDInt128.wrap(x).isSameSideReducing(USDInt128.wrap(y));
            assertEq(result, z);
        }
    }
}
