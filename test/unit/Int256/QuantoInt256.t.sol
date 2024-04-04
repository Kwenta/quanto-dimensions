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
    USDInt256,
    InteractionsQuantoInt256
} from "../../../src/UnitTypes.sol";

contract QuantoInt256Test is Test {
    using InteractionsQuantoInt256 for QuantoInt256;

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

    function testQuantoInt256DivDecimal() public {
        QuantoInt256 x = QuantoInt256.wrap(500 ether);
        int256 y = 2 ether;
        QuantoInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testQuantoInt256DivDecimalFuzz(int256 x, int256 y) public {
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
            QuantoInt256.wrap(x).divDecimal(y);
        } else {
            QuantoInt256 result = QuantoInt256.wrap(x).divDecimal(y);
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

    function testQuantoInt256Abs() public {
        QuantoInt256 x = QuantoInt256.wrap(-100);
        QuantoUint256 result = x.abs();
        assertEq(result.unwrap(), uint256(100));
        result = QuantoInt256.wrap(100).abs();
        assertEq(result.unwrap(), uint256(100));
    }

    function testQuantoInt256AbsFuzz(int256 x) public {
        if (x == type(int256).min) {
            vm.expectRevert();
            QuantoInt256.wrap(x).abs();
        } else {
            QuantoUint256 result = QuantoInt256.wrap(x).abs();
            assertEq(result.unwrap(), uint256(x < 0 ? -x : x));
        }
    }

    function testQuantoInt256Max() public {
        QuantoInt256 x = QuantoInt256.wrap(-100);
        QuantoInt256 y = QuantoInt256.wrap(200);
        QuantoInt256 result = x.max(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testQuantoInt256MaxFuzz(int256 x, int256 y) public {
        int256 z = x < y ? y : x;
        QuantoInt256 result = QuantoInt256.wrap(x).max(QuantoInt256.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testQuantoInt256Min() public {
        QuantoInt256 x = QuantoInt256.wrap(-100);
        QuantoInt256 y = QuantoInt256.wrap(200);
        QuantoInt256 result = x.min(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testQuantoInt256MinFuzz(int256 x, int256 y) public {
        int256 z = x < y ? x : y;
        QuantoInt256 result = QuantoInt256.wrap(x).min(QuantoInt256.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testQuantoInt256SameSide() public {
        QuantoInt256 x = QuantoInt256.wrap(200);
        QuantoInt256 y = QuantoInt256.wrap(100);
        bool result = x.sameSide(y);
        assertTrue(result);
        result = x.sameSide(QuantoInt256.wrap(-100));
        assertFalse(result);
    }

    function testQuantoInt256SameSideFuzz(int256 x, int256 y) public {
        bool z = (x == 0) || (y == 0) || (x > 0) == (y > 0);
        bool result = QuantoInt256.wrap(x).sameSide(QuantoInt256.wrap(y));
        assertEq(result, z);
    }

    function testQuantoInt256Zero() public {
        QuantoInt256 x = InteractionsQuantoInt256.zero();
        assertEq(x.unwrap(), 0);
    }

    function testQuantoInt256isZero() public {
        QuantoInt256 x = QuantoInt256.wrap(0);
        QuantoInt256 y = QuantoInt256.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testQuantoInt256isZeroFuzz(int256 x) public {
        QuantoInt256 result = QuantoInt256.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }

    function testQuantoInt256DivToDimensionless() public {
        QuantoInt256 x = QuantoInt256.wrap(500);
        QuantoInt256 y = QuantoInt256.wrap(2);
        int256 result = x.divToDimensionless(y);
        assertEq(result, 250);
    }

    function testQuantoInt256DivToDimensionlessFuzz(int256 x, int256 y)
        public
    {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            QuantoInt256.wrap(x).divToDimensionless(QuantoInt256.wrap(y));
        } else {
            int256 result =
                QuantoInt256.wrap(x).divToDimensionless(QuantoInt256.wrap(y));
            assertEq(result, z);
        }
    }

    function testQuantoInt256DivDecimalToDimensionless() public {
        QuantoInt256 x = QuantoInt256.wrap(500 ether);
        QuantoInt256 y = QuantoInt256.wrap(2 ether);
        int256 result = x.divDecimalToDimensionless(y);
        assertEq(result, 250 ether);
    }

    function testQuantoInt256DivDecimalToDimensionlessFuzz(int256 x, int256 y)
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
            QuantoInt256.wrap(x).divDecimalToDimensionless(QuantoInt256.wrap(y));
        } else {
            int256 result = QuantoInt256.wrap(x).divDecimalToDimensionless(
                QuantoInt256.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testQuantoInt256CeilDivide() public {
        QuantoInt256 x = QuantoInt256.wrap(10);
        QuantoInt256 y = QuantoInt256.wrap(3);
        int256 result = x.ceilDivide(y);
        assertEq(result, 4);
        result = QuantoInt256.wrap(-10).ceilDivide(QuantoInt256.wrap(3));
        assertEq(result, -3);
    }

    function testQuantoInt256CeilDivideFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            QuantoInt256.wrap(x).ceilDivide(QuantoInt256.wrap(y));
        } else {
            if (!(((x < 0) != (y < 0)) || (x % y) == 0)) {
                z = z + 1;
            }
            int256 result =
                QuantoInt256.wrap(x).ceilDivide(QuantoInt256.wrap(y));
            assertEq(result, z);
        }
    }

    function testQuantoInt256GreaterThanZero() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        bool result = x.greaterThanZero();
        assertTrue(result);
        x = QuantoInt256.wrap(-100);
        result = x.greaterThanZero();
        assertFalse(result);
    }

    function testQuantoInt256GreaterThanZeroFuzz(int256 x) public {
        bool z = x > 0;
        bool result = QuantoInt256.wrap(x).greaterThanZero();
        assertEq(result, z);
    }

    function testQuantoInt256LessThanZero() public {
        QuantoInt256 x = QuantoInt256.wrap(100);
        bool result = x.lessThanZero();
        assertFalse(result);
        x = QuantoInt256.wrap(-100);
        result = x.lessThanZero();
        assertTrue(result);
    }

    function testQuantoInt256LessThanZeroFuzz(int256 x) public {
        bool z = x < 0;
        bool result = QuantoInt256.wrap(x).lessThanZero();
        assertEq(result, z);
    }

    function testQuantoInt256GreaterThanOrEqualToZero() public {
        QuantoInt256 x = QuantoInt256.wrap(0);
        bool result = x.greaterThanOrEqualToZero();
        assertTrue(result);
        x = QuantoInt256.wrap(-100);
        result = x.greaterThanOrEqualToZero();
        assertFalse(result);
    }

    function testQuantoInt256GreaterThanOrEqualToZeroFuzz(int256 x) public {
        bool z = x >= 0;
        bool result = QuantoInt256.wrap(x).greaterThanOrEqualToZero();
        assertEq(result, z);
    }

    function testQuantoInt256LessThanOrEqualToZero() public {
        QuantoInt256 x = QuantoInt256.wrap(0);
        bool result = x.lessThanOrEqualToZero();
        assertTrue(result);
        x = QuantoInt256.wrap(100);
        result = x.lessThanOrEqualToZero();
        assertFalse(result);
    }

    function testQuantoInt256LessThanOrEqualToZero(int256 x) public {
        bool z = x <= 0;
        bool result = QuantoInt256.wrap(x).lessThanOrEqualToZero();
        assertEq(result, z);
    }

    function testQuantoInt256IsSameSideReducing() public {
        QuantoInt256 x = QuantoInt256.wrap(200);
        QuantoInt256 y = QuantoInt256.wrap(100);
        bool result = x.isSameSideReducing(y);
        assertTrue(result);
        result = x.sameSide(QuantoInt256.wrap(-100));
        assertFalse(result);
    }

    function testQuantoInt256IsSameSideReducingFuzz(int256 x, int256 y)
        public
    {
        if (
            ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                && (x == type(int256).min || y == type(int256).min)
        ) {
            vm.expectRevert();
            QuantoInt256.wrap(x).isSameSideReducing(QuantoInt256.wrap(y));
        } else {
            bool z = (
                ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                    && uint256(y < 0 ? -y : y) < uint256(x < 0 ? -x : x)
            );
            bool result =
                QuantoInt256.wrap(x).isSameSideReducing(QuantoInt256.wrap(y));
            assertEq(result, z);
        }
    }
}
