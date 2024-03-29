// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt256,
    BaseInt256,
    QuantoInt256,
    USDPerBaseInt256,
    USDPerQuantoInt256,
    USDPerQuantoInt128,
    USDPerQuantoUint256,
    USDInt256,
    InteractionsUSDPerQuantoInt256
} from "../../src/UnitTypes.sol";

contract USDPerQuantoInt256Test is Test {
    using InteractionsUSDPerQuantoInt256 for USDPerQuantoInt256;

    function setUp() public {}

    function testUSDPerQuantoInt256Add() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(200);
        USDPerQuantoInt256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerQuantoInt256AddFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := add(x, y)
        }
        USDPerQuantoInt256 xW = USDPerQuantoInt256.wrap(x);
        USDPerQuantoInt256 yW = USDPerQuantoInt256.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerQuantoInt256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerQuantoInt256Sub() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(200);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerQuantoInt256SubFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x) - USDPerQuantoInt256.wrap(y);
        } else {
            USDPerQuantoInt256 result =
                USDPerQuantoInt256.wrap(x) - USDPerQuantoInt256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt256And() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(10); // 1010 in binary
        int256 y = 12; // 1100 in binary
        USDPerQuantoInt256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoInt256AndFuzz(int256 x, int256 y) public {
        int256 z = x & y;
        USDPerQuantoInt256 result = USDPerQuantoInt256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoInt256And2() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(10); // 1010 in binary
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(12); // 1100 in binary
        USDPerQuantoInt256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoInt256And2Fuzz(int256 x, int256 y) public {
        int256 z = x & y;
        USDPerQuantoInt256 result =
            USDPerQuantoInt256.wrap(x) & USDPerQuantoInt256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoInt256Eq() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerQuantoInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoInt256EqFuzz(int256 x, int256 y) public {
        bool z = x == y;
        bool result = USDPerQuantoInt256.wrap(x) == USDPerQuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256Gt() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerQuantoInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoInt256GtFuzz(int256 x, int256 y) public {
        bool z = x > y;
        bool result = USDPerQuantoInt256.wrap(x) > USDPerQuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256Gte() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerQuantoInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoInt256GteFuzz(int256 x, int256 y) public {
        bool z = x >= y;
        bool result = USDPerQuantoInt256.wrap(x) >= USDPerQuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256Lt() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(50);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerQuantoInt256.wrap(49);
        assertFalse(result);
    }

    function testUSDPerQuantoInt256LtFuzz(int256 x, int256 y) public {
        bool z = x < y;
        bool result = USDPerQuantoInt256.wrap(x) < USDPerQuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256Lte() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerQuantoInt256.wrap(99);
        assertFalse(result);
    }

    function testUSDPerQuantoInt256LteFuzz(int256 x, int256 y) public {
        bool z = x <= y;
        bool result = USDPerQuantoInt256.wrap(x) <= USDPerQuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256Mod() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(30);
        USDPerQuantoInt256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerQuantoInt256ModFuzz(int256 x, int256 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x) % USDPerQuantoInt256.wrap(y);
        } else {
            int256 z = x % y;
            USDPerQuantoInt256 result =
                USDPerQuantoInt256.wrap(x) % USDPerQuantoInt256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt256Neq() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerQuantoInt256.wrap(101);
        assertTrue(result);
    }

    function testUSDPerQuantoInt256NeqFuzz(int256 x, int256 y) public {
        bool z = x != y;
        bool result = USDPerQuantoInt256.wrap(x) != USDPerQuantoInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256Not() public {
        int256 hundred = 100;
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(hundred);
        USDPerQuantoInt256 result = ~x;
        int256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerQuantoInt256NotFuzz(int256 x) public {
        USDPerQuantoInt256 result = ~USDPerQuantoInt256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerQuantoInt256Or() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(200);
        USDPerQuantoInt256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerQuantoInt256OrFuzz(int256 x, int256 y) public {
        USDPerQuantoInt256 result =
            USDPerQuantoInt256.wrap(x) | USDPerQuantoInt256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerQuantoInt256Xor() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(200);
        USDPerQuantoInt256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerQuantoInt256XorFuzz(int256 x, int256 y) public {
        USDPerQuantoInt256 result =
            USDPerQuantoInt256.wrap(x) ^ USDPerQuantoInt256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerQuantoInt256Increment() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        USDPerQuantoInt256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerQuantoInt256IncrementFuzz(int256 x) public {
        int256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x).increment();
        } else {
            USDPerQuantoInt256 result = USDPerQuantoInt256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerQuantoInt256Mul() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        int256 y = 200;
        USDPerQuantoInt256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDPerQuantoInt256MulFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x).mul(y);
        } else {
            USDPerQuantoInt256 result = USDPerQuantoInt256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt256MulDecimal() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100 ether);
        int256 y = 200 ether;
        USDPerQuantoInt256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoInt256MulDecimalFuzz(int256 x, int256 y) public {
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
            USDPerQuantoInt256.wrap(x).mulDecimal(y);
        } else {
            USDPerQuantoInt256 result = USDPerQuantoInt256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt256MulDecimalToUSD() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100 ether);
        QuantoInt256 y = QuantoInt256.wrap(200 ether);
        USDInt256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoInt256MulDecimalToUSDFuzz(int256 x, int256 y)
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
            USDPerQuantoInt256.wrap(x).mulDecimalToUSD(QuantoInt256.wrap(y));
        } else {
            USDInt256 result =
                USDPerQuantoInt256.wrap(x).mulDecimalToUSD(QuantoInt256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt256MulDecimalToBase() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100 ether);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(200 ether);
        BaseInt256 result = x.mulDecimalToBase(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoInt256MulDecimalToBaseFuzz(int256 x, int256 y)
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
            USDPerQuantoInt256.wrap(x).mulDecimalToBase(
                BaseQuantoPerUSDInt256.wrap(y)
            );
        } else {
            BaseInt256 result = USDPerQuantoInt256.wrap(x).mulDecimalToBase(
                BaseQuantoPerUSDInt256.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt256Div() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(500);
        int256 y = 2;
        USDPerQuantoInt256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerQuantoInt256DivFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x).div(y);
        } else {
            USDPerQuantoInt256 result = USDPerQuantoInt256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt256DivDecimal() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(500 ether);
        int256 y = 2 ether;
        USDPerQuantoInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testUSDPerQuantoInt256DivDecimalFuzz(int256 x, int256 y) public {
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
            USDPerQuantoInt256.wrap(x).divDecimal(y);
        } else {
            USDPerQuantoInt256 result = USDPerQuantoInt256.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt256To128() public {
        int256 x = type(int256).max;
        vm.expectRevert();
        USDPerQuantoInt256.wrap(x).to128();
        x = 1;
        USDPerQuantoInt128 result = USDPerQuantoInt256.wrap(x).to128();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDPerQuantoInt256To128Fuzz(int256 x) public {
        if (x > int256(type(int128).max) || x < int256(type(int128).min)) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x).to128();
        } else {
            USDPerQuantoInt128 result = USDPerQuantoInt256.wrap(x).to128();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testUSDPerQuantoInt256ToUint() public {
        int256 x = type(int256).min;
        vm.expectRevert();
        USDPerQuantoInt256.wrap(x).toUint();
        x = 1;
        USDPerQuantoUint256 result = USDPerQuantoInt256.wrap(x).toUint();
        assertEq(result.unwrap(), uint256(x));
    }

    function testUSDPerQuantoInt256ToUintFuzz(int256 x) public {
        if (x < 0) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x).toUint();
        } else {
            USDPerQuantoUint256 result = USDPerQuantoInt256.wrap(x).toUint();
            assertEq(result.unwrap(), uint256(x));
        }
    }

    function testUSDPerQuantoInt256Abs() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(-100);
        USDPerQuantoUint256 result = x.abs();
        assertEq(result.unwrap(), uint256(100));
        result = USDPerQuantoInt256.wrap(100).abs();
        assertEq(result.unwrap(), uint256(100));
    }

    function testUSDPerQuantoInt256AbsFuzz(int256 x) public {
        if (x == type(int256).min) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x).abs();
        } else {
            USDPerQuantoUint256 result = USDPerQuantoInt256.wrap(x).abs();
            assertEq(result.unwrap(), uint256(x < 0 ? -x : x));
        }
    }

    function testUSDPerQuantoInt256Max() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(-100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(200);
        USDPerQuantoInt256 result = x.max(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testUSDPerQuantoInt256MaxFuzz(int256 x, int256 y) public {
        int256 z = x < y ? y : x;
        USDPerQuantoInt256 result =
            USDPerQuantoInt256.wrap(x).max(USDPerQuantoInt256.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoInt256Min() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(-100);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(200);
        USDPerQuantoInt256 result = x.min(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testUSDPerQuantoInt256MinFuzz(int256 x, int256 y) public {
        int256 z = x < y ? x : y;
        USDPerQuantoInt256 result =
            USDPerQuantoInt256.wrap(x).min(USDPerQuantoInt256.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoInt256SameSide() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(200);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        bool result = x.sameSide(y);
        assertTrue(result);
        result = x.sameSide(USDPerQuantoInt256.wrap(-100));
        assertFalse(result);
    }

    function testUSDPerQuantoInt256SameSideFuzz(int256 x, int256 y) public {
        bool z = (x == 0) || (y == 0) || (x > 0) == (y > 0);
        bool result =
            USDPerQuantoInt256.wrap(x).sameSide(USDPerQuantoInt256.wrap(y));
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256Zero() public {
        USDPerQuantoInt256 x = InteractionsUSDPerQuantoInt256.zero();
        assertEq(x.unwrap(), 0);
    }

    function testUSDPerQuantoInt256isZero() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(0);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testUSDPerQuantoInt256isZeroFuzz(int256 x) public {
        USDPerQuantoInt256 result = USDPerQuantoInt256.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }

    function testUSDPerQuantoInt256DivToDimensionless() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(500);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(2);
        int256 result = x.divToDimensionless(y);
        assertEq(result, 250);
    }

    function testUSDPerQuantoInt256DivToDimensionlessFuzz(int256 x, int256 y)
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
            USDPerQuantoInt256.wrap(x).divToDimensionless(
                USDPerQuantoInt256.wrap(y)
            );
        } else {
            int256 result = USDPerQuantoInt256.wrap(x).divToDimensionless(
                USDPerQuantoInt256.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoInt256DivDecimalToDimensionless() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(500 ether);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(2 ether);
        int256 result = x.divDecimalToDimensionless(y);
        assertEq(result, 250 ether);
    }

    function testUSDPerQuantoInt256DivDecimalToDimensionlessFuzz(
        int256 x,
        int256 y
    ) public {
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
            USDPerQuantoInt256.wrap(x).divDecimalToDimensionless(
                USDPerQuantoInt256.wrap(y)
            );
        } else {
            int256 result = USDPerQuantoInt256.wrap(x).divDecimalToDimensionless(
                USDPerQuantoInt256.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoInt256CeilDivide() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(10);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(3);
        int256 result = x.ceilDivide(y);
        assertEq(result, 4);
        result =
            USDPerQuantoInt256.wrap(-10).ceilDivide(USDPerQuantoInt256.wrap(3));
        assertEq(result, -3);
    }

    function testUSDPerQuantoInt256CeilDivideFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x).ceilDivide(USDPerQuantoInt256.wrap(y));
        } else {
            if (!(((x < 0) != (y < 0)) || (x % y) == 0)) {
                z = z + 1;
            }
            int256 result = USDPerQuantoInt256.wrap(x).ceilDivide(
                USDPerQuantoInt256.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoInt256GreaterThanZero() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        bool result = x.greaterThanZero();
        assertTrue(result);
        x = USDPerQuantoInt256.wrap(-100);
        result = x.greaterThanZero();
        assertFalse(result);
    }

    function testUSDPerQuantoInt256GreaterThanZeroFuzz(int256 x) public {
        bool z = x > 0;
        bool result = USDPerQuantoInt256.wrap(x).greaterThanZero();
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256LessThanZero() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(100);
        bool result = x.lessThanZero();
        assertFalse(result);
        x = USDPerQuantoInt256.wrap(-100);
        result = x.lessThanZero();
        assertTrue(result);
    }

    function testUSDPerQuantoInt256LessThanZeroFuzz(int256 x) public {
        bool z = x < 0;
        bool result = USDPerQuantoInt256.wrap(x).lessThanZero();
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256GreaterThanOrEqualToZero() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(0);
        bool result = x.greaterThanOrEqualToZero();
        assertTrue(result);
        x = USDPerQuantoInt256.wrap(-100);
        result = x.greaterThanOrEqualToZero();
        assertFalse(result);
    }

    function testUSDPerQuantoInt256GreaterThanOrEqualToZeroFuzz(int256 x)
        public
    {
        bool z = x >= 0;
        bool result = USDPerQuantoInt256.wrap(x).greaterThanOrEqualToZero();
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256LessThanOrEqualToZero() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(0);
        bool result = x.lessThanOrEqualToZero();
        assertTrue(result);
        x = USDPerQuantoInt256.wrap(100);
        result = x.lessThanOrEqualToZero();
        assertFalse(result);
    }

    function testUSDPerQuantoInt256LessThanOrEqualToZero(int256 x) public {
        bool z = x <= 0;
        bool result = USDPerQuantoInt256.wrap(x).lessThanOrEqualToZero();
        assertEq(result, z);
    }

    function testUSDPerQuantoInt256IsSameSideReducing() public {
        USDPerQuantoInt256 x = USDPerQuantoInt256.wrap(200);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(100);
        bool result = x.isSameSideReducing(y);
        assertTrue(result);
        result = x.sameSide(USDPerQuantoInt256.wrap(-100));
        assertFalse(result);
    }

    function testUSDPerQuantoInt256IsSameSideReducingFuzz(int256 x, int256 y)
        public
    {
        if (
            ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                && (x == type(int256).min || y == type(int256).min)
        ) {
            vm.expectRevert();
            USDPerQuantoInt256.wrap(x).isSameSideReducing(
                USDPerQuantoInt256.wrap(y)
            );
        } else {
            bool z = (
                ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                    && uint256(y < 0 ? -y : y) < uint256(x < 0 ? -x : x)
            );
            bool result = USDPerQuantoInt256.wrap(x).isSameSideReducing(
                USDPerQuantoInt256.wrap(y)
            );
            assertEq(result, z);
        }
    }
}
