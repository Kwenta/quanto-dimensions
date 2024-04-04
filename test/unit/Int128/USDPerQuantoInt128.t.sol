// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt128,
    QuantoInt128,
    BaseInt128,
    USDPerQuantoInt128,
    USDPerQuantoUint128,
    USDPerQuantoUint256,
    USDPerQuantoInt256,
    USDInt128,
    InteractionsUSDPerQuantoInt128
} from "../../../src/UnitTypes.sol";

contract USDPerQuantoInt128Test is Test {
    using InteractionsUSDPerQuantoInt128 for USDPerQuantoInt128;

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

    function testUSDPerQuantoInt128DivDecimal() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(500 ether);
        int128 y = 2 ether;
        USDPerQuantoInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testUSDPerQuantoInt128DivDecimalFuzz(int128 x, int128 y) public {
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
            USDPerQuantoInt128.wrap(x).divDecimal(y);
        } else {
            USDPerQuantoInt256 result = USDPerQuantoInt128.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt128DivDecimalInt128() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(50 ether);
        int128 y = 2 ether;
        USDPerQuantoInt128 result = x.divDecimalInt128(y);
        assertEq(result.unwrap(), 25 ether);
    }

    function testUSDPerQuantoInt128DivDecimalInt128Fuzz(int128 x, int128 y)
        public
    {
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
            USDPerQuantoInt128.wrap(x).divDecimalInt128(y);
        } else {
            USDPerQuantoInt128 result =
                USDPerQuantoInt128.wrap(x).divDecimalInt128(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoInt128ToUint() public {
        int128 x = type(int128).min;
        vm.expectRevert();
        USDPerQuantoInt128.wrap(x).toUint();
        x = 1;
        USDPerQuantoUint128 result = USDPerQuantoInt128.wrap(x).toUint();
        assertEq(result.unwrap(), uint128(x));
    }

    function testUSDPerQuantoInt128ToUintFuzz(int128 x) public {
        if (x < 0) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x).toUint();
        } else {
            USDPerQuantoUint128 result = USDPerQuantoInt128.wrap(x).toUint();
            assertEq(result.unwrap(), uint128(x));
        }
    }

    function testUSDPerQuantoInt128To256() public {
        int128 x = type(int128).min;
        USDPerQuantoInt256 result = USDPerQuantoInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDPerQuantoInt128To256Fuzz(int128 x) public {
        USDPerQuantoInt256 result = USDPerQuantoInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDPerQuantoInt128Abs() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(-100);
        USDPerQuantoUint256 result = x.abs();
        assertEq(result.unwrap(), uint256(100));
        result = USDPerQuantoInt128.wrap(100).abs();
        assertEq(result.unwrap(), uint256(100));
    }

    function testUSDPerQuantoInt128AbsFuzz(int128 x) public {
        USDPerQuantoUint256 result = USDPerQuantoInt128.wrap(x).abs();
        int256 _x = x;
        assertEq(result.unwrap(), uint256(x < 0 ? -_x : _x));
    }

    function testUSDPerQuantoInt128Abs128() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(-100);
        USDPerQuantoUint128 result = x.abs128();
        assertEq(result.unwrap(), uint128(100));
        result = USDPerQuantoInt128.wrap(100).abs128();
        assertEq(result.unwrap(), uint128(100));
    }

    function testUSDPerQuantoInt128Abs128Fuzz(int128 x) public {
        if (x == type(int128).min) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x).abs128();
        } else {
            USDPerQuantoUint128 result = USDPerQuantoInt128.wrap(x).abs128();
            assertEq(result.unwrap(), uint128(x < 0 ? -x : x));
        }
    }

    function testUSDPerQuantoInt128Max128() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(-100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt128 result = x.max128(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testUSDPerQuantoInt128Max128Fuzz(int128 x, int128 y) public {
        int128 z = x < y ? y : x;
        USDPerQuantoInt128 result =
            USDPerQuantoInt128.wrap(x).max128(USDPerQuantoInt128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoInt128Min128() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(-100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt128 result = x.min128(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testUSDPerQuantoInt128Min128Fuzz(int128 x, int128 y) public {
        int128 z = x < y ? x : y;
        USDPerQuantoInt128 result =
            USDPerQuantoInt128.wrap(x).min128(USDPerQuantoInt128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoInt128Max() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(-100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt256 result = x.max(y);
        assertEq(result.unwrap(), int256(y.unwrap()));
    }

    function testUSDPerQuantoInt128MaxFuzz(int128 x, int128 y) public {
        int128 z = x < y ? y : x;
        USDPerQuantoInt256 result =
            USDPerQuantoInt128.wrap(x).max(USDPerQuantoInt128.wrap(y));
        assertEq(result.unwrap(), int256(z));
    }

    function testUSDPerQuantoInt128Min() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(-100);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt256 result = x.min(y);
        assertEq(result.unwrap(), int256(x.unwrap()));
    }

    function testUSDPerQuantoInt128MinFuzz(int128 x, int128 y) public {
        int128 z = x < y ? x : y;
        USDPerQuantoInt256 result =
            USDPerQuantoInt128.wrap(x).min(USDPerQuantoInt128.wrap(y));
        assertEq(result.unwrap(), int256(z));
    }

    function testUSDPerQuantoInt128SameSide() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        bool result = x.sameSide(y);
        assertTrue(result);
        result = x.sameSide(USDPerQuantoInt128.wrap(-100));
        assertFalse(result);
    }

    function testUSDPerQuantoInt128SameSideFuzz(int128 x, int128 y) public {
        bool z = (x == 0) || (y == 0) || (x > 0) == (y > 0);
        bool result =
            USDPerQuantoInt128.wrap(x).sameSide(USDPerQuantoInt128.wrap(y));
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128Zero() public {
        USDPerQuantoInt128 x = InteractionsUSDPerQuantoInt128.zero();
        assertEq(x.unwrap(), 0);
    }

    function testUSDPerQuantoInt128isZero() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(0);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testUSDPerQuantoInt128isZeroFuzz(int128 x) public {
        USDPerQuantoInt128 result = USDPerQuantoInt128.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }

    function testUSDPerQuantoInt128DivToDimensionless() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(500);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(2);
        int128 result = x.divToDimensionless(y);
        assertEq(result, 250);
    }

    function testUSDPerQuantoInt128DivToDimensionlessFuzz(int128 x, int128 y)
        public
    {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x).divToDimensionless(
                USDPerQuantoInt128.wrap(y)
            );
        } else {
            int128 result = USDPerQuantoInt128.wrap(x).divToDimensionless(
                USDPerQuantoInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoInt128DivDecimalToDimensionless() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(500 ether);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(2 ether);
        int256 result = x.divDecimalToDimensionless(y);
        assertEq(result, 250 ether);
    }

    function testUSDPerQuantoInt128DivDecimalToDimensionlessFuzz(
        int128 x,
        int128 y
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
            USDPerQuantoInt128.wrap(x).divDecimalToDimensionless(
                USDPerQuantoInt128.wrap(y)
            );
        } else {
            int256 result = USDPerQuantoInt128.wrap(x).divDecimalToDimensionless(
                USDPerQuantoInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoInt128CeilDivide() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(10);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(3);
        int128 result = x.ceilDivide(y);
        assertEq(result, 4);
        result =
            USDPerQuantoInt128.wrap(-10).ceilDivide(USDPerQuantoInt128.wrap(3));
        assertEq(result, -3);
    }

    function testUSDPerQuantoInt128CeilDivideFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x).ceilDivide(USDPerQuantoInt128.wrap(y));
        } else {
            if (!(((x < 0) != (y < 0)) || (x % y) == 0)) {
                z = z + 1;
            }
            int128 result = USDPerQuantoInt128.wrap(x).ceilDivide(
                USDPerQuantoInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoInt128GreaterThanZero() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        bool result = x.greaterThanZero();
        assertTrue(result);
        x = USDPerQuantoInt128.wrap(-100);
        result = x.greaterThanZero();
        assertFalse(result);
    }

    function testUSDPerQuantoInt128GreaterThanZeroFuzz(int128 x) public {
        bool z = x > 0;
        bool result = USDPerQuantoInt128.wrap(x).greaterThanZero();
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128LessThanZero() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(100);
        bool result = x.lessThanZero();
        assertFalse(result);
        x = USDPerQuantoInt128.wrap(-100);
        result = x.lessThanZero();
        assertTrue(result);
    }

    function testUSDPerQuantoInt128LessThanZeroFuzz(int128 x) public {
        bool z = x < 0;
        bool result = USDPerQuantoInt128.wrap(x).lessThanZero();
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128GreaterThanOrEqualToZero() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(0);
        bool result = x.greaterThanOrEqualToZero();
        assertTrue(result);
        x = USDPerQuantoInt128.wrap(-100);
        result = x.greaterThanOrEqualToZero();
        assertFalse(result);
    }

    function testUSDPerQuantoInt128GreaterThanOrEqualToZeroFuzz(int128 x)
        public
    {
        bool z = x >= 0;
        bool result = USDPerQuantoInt128.wrap(x).greaterThanOrEqualToZero();
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128LessThanOrEqualToZero() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(0);
        bool result = x.lessThanOrEqualToZero();
        assertTrue(result);
        x = USDPerQuantoInt128.wrap(100);
        result = x.lessThanOrEqualToZero();
        assertFalse(result);
    }

    function testUSDPerQuantoInt128LessThanOrEqualToZero(int128 x) public {
        bool z = x <= 0;
        bool result = USDPerQuantoInt128.wrap(x).lessThanOrEqualToZero();
        assertEq(result, z);
    }

    function testUSDPerQuantoInt128IsSameSideReducing() public {
        USDPerQuantoInt128 x = USDPerQuantoInt128.wrap(200);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(100);
        bool result = x.isSameSideReducing(y);
        assertTrue(result);
        result = x.sameSide(USDPerQuantoInt128.wrap(-100));
        assertFalse(result);
    }

    function testUSDPerQuantoInt128IsSameSideReducingFuzz(int128 x, int128 y)
        public
    {
        if (
            ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                && (x == type(int128).min || y == type(int128).min)
        ) {
            vm.expectRevert();
            USDPerQuantoInt128.wrap(x).isSameSideReducing(
                USDPerQuantoInt128.wrap(y)
            );
        } else {
            bool z = (
                ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                    && uint128(y < 0 ? -y : y) < uint128(x < 0 ? -x : x)
            );
            bool result = USDPerQuantoInt128.wrap(x).isSameSideReducing(
                USDPerQuantoInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }
}
