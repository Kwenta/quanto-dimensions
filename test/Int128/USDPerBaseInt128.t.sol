// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt128,
    BaseInt128,
    QuantoInt128,
    USDPerBaseInt128,
    USDPerBaseUint128,
    USDPerBaseUint256,
    USDPerBaseInt256,
    USDInt128,
    InteractionsUSDPerBaseInt128
} from "../../src/UnitTypes.sol";

contract USDPerBaseInt128Test is Test {
    using InteractionsUSDPerBaseInt128 for USDPerBaseInt128;

    function setUp() public {}

    function testUSDPerBaseInt128Add() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200);
        USDPerBaseInt128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerBaseInt128AddFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := add(x, y)
        }
        USDPerBaseInt128 xW = USDPerBaseInt128.wrap(x);
        USDPerBaseInt128 yW = USDPerBaseInt128.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerBaseInt128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerBaseInt128Sub() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(200);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerBaseInt128SubFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x) - USDPerBaseInt128.wrap(y);
        } else {
            USDPerBaseInt128 result =
                USDPerBaseInt128.wrap(x) - USDPerBaseInt128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDPerBaseInt128And() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(10); // 1010 in binary
        int128 y = 12; // 1100 in binary
        USDPerBaseInt128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerBaseInt128AndFuzz(int128 x, int128 y) public {
        int128 z = x & y;
        USDPerBaseInt128 result = USDPerBaseInt128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseInt128And2() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(10); // 1010 in binary
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(12); // 1100 in binary
        USDPerBaseInt128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerBaseInt128And2Fuzz(int128 x, int128 y) public {
        int128 z = x & y;
        USDPerBaseInt128 result =
            USDPerBaseInt128.wrap(x) & USDPerBaseInt128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseInt128Eq() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerBaseInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseInt128EqFuzz(int128 x, int128 y) public {
        bool z = x == y;
        bool result = USDPerBaseInt128.wrap(x) == USDPerBaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt128Gt() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerBaseInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseInt128GtFuzz(int128 x, int128 y) public {
        bool z = x > y;
        bool result = USDPerBaseInt128.wrap(x) > USDPerBaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt128Gte() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerBaseInt128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseInt128GteFuzz(int128 x, int128 y) public {
        bool z = x >= y;
        bool result = USDPerBaseInt128.wrap(x) >= USDPerBaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt128Lt() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(50);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerBaseInt128.wrap(49);
        assertFalse(result);
    }

    function testUSDPerBaseInt128LtFuzz(int128 x, int128 y) public {
        bool z = x < y;
        bool result = USDPerBaseInt128.wrap(x) < USDPerBaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt128Lte() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerBaseInt128.wrap(99);
        assertFalse(result);
    }

    function testUSDPerBaseInt128LteFuzz(int128 x, int128 y) public {
        bool z = x <= y;
        bool result = USDPerBaseInt128.wrap(x) <= USDPerBaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt128Mod() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(30);
        USDPerBaseInt128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerBaseInt128ModFuzz(int128 x, int128 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x) % USDPerBaseInt128.wrap(y);
        } else {
            int128 z = x % y;
            USDPerBaseInt128 result =
                USDPerBaseInt128.wrap(x) % USDPerBaseInt128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt128Neq() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerBaseInt128.wrap(101);
        assertTrue(result);
    }

    function testUSDPerBaseInt128NeqFuzz(int128 x, int128 y) public {
        bool z = x != y;
        bool result = USDPerBaseInt128.wrap(x) != USDPerBaseInt128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt128Not() public {
        int128 hundred = 100;
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(hundred);
        USDPerBaseInt128 result = ~x;
        int128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerBaseInt128NotFuzz(int128 x) public {
        USDPerBaseInt128 result = ~USDPerBaseInt128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerBaseInt128Or() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200);
        USDPerBaseInt128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerBaseInt128OrFuzz(int128 x, int128 y) public {
        USDPerBaseInt128 result =
            USDPerBaseInt128.wrap(x) | USDPerBaseInt128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerBaseInt128Xor() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200);
        USDPerBaseInt128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerBaseInt128XorFuzz(int128 x, int128 y) public {
        USDPerBaseInt128 result =
            USDPerBaseInt128.wrap(x) ^ USDPerBaseInt128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerBaseInt128Increment() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        USDPerBaseInt128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerBaseInt128IncrementFuzz(int128 x) public {
        int128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x).increment();
        } else {
            USDPerBaseInt128 result = USDPerBaseInt128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerBaseInt128Mul() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        int128 y = 200;
        USDPerBaseInt128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDPerBaseInt128MulFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x).mul(y);
        } else {
            USDPerBaseInt128 result = USDPerBaseInt128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt128MulDecimal() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100 ether);
        int128 y = 200 ether;
        USDPerBaseInt128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseInt128MulDecimalFuzz(int128 x, int128 y) public {
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
            USDPerBaseInt128.wrap(x).mulDecimal(y);
        } else {
            USDPerBaseInt128 result = USDPerBaseInt128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt128MulDecimalToUSD() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100 ether);
        BaseInt128 y = BaseInt128.wrap(200 ether);
        USDInt128 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseInt128MulDecimalToUSDFuzz(int128 x, int128 y)
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
            USDPerBaseInt128.wrap(x).mulDecimalToUSD(BaseInt128.wrap(y));
        } else {
            USDInt128 result =
                USDPerBaseInt128.wrap(x).mulDecimalToUSD(BaseInt128.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt128MulDecimalToQuanto() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100 ether);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200 ether);
        QuantoInt128 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseInt128MulDecimalToQuantoFuzz(int128 x, int128 y)
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
            USDPerBaseInt128.wrap(x).mulDecimalToQuanto(
                BaseQuantoPerUSDInt128.wrap(y)
            );
        } else {
            QuantoInt128 result = USDPerBaseInt128.wrap(x).mulDecimalToQuanto(
                BaseQuantoPerUSDInt128.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt128Div() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(500);
        int128 y = 2;
        USDPerBaseInt128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerBaseInt128DivFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x).div(y);
        } else {
            USDPerBaseInt128 result = USDPerBaseInt128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt128DivDecimal() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(500 ether);
        int128 y = 2 ether;
        USDPerBaseInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testUSDPerBaseInt128DivDecimalFuzz(int128 x, int128 y) public {
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
            USDPerBaseInt128.wrap(x).divDecimal(y);
        } else {
            USDPerBaseInt256 result = USDPerBaseInt128.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt128DivDecimalInt128() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(50 ether);
        int128 y = 2 ether;
        USDPerBaseInt128 result = x.divDecimalInt128(y);
        assertEq(result.unwrap(), 25 ether);
    }

    function testUSDPerBaseInt128DivDecimalInt128Fuzz(int128 x, int128 y)
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
            USDPerBaseInt128.wrap(x).divDecimalInt128(y);
        } else {
            USDPerBaseInt128 result =
                USDPerBaseInt128.wrap(x).divDecimalInt128(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt128ToUint() public {
        int128 x = type(int128).min;
        vm.expectRevert();
        USDPerBaseInt128.wrap(x).toUint();
        x = 1;
        USDPerBaseUint128 result = USDPerBaseInt128.wrap(x).toUint();
        assertEq(result.unwrap(), uint128(x));
    }

    function testUSDPerBaseInt128ToUintFuzz(int128 x) public {
        if (x < 0) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x).toUint();
        } else {
            USDPerBaseUint128 result = USDPerBaseInt128.wrap(x).toUint();
            assertEq(result.unwrap(), uint128(x));
        }
    }

    function testUSDPerBaseInt128To256() public {
        int128 x = type(int128).min;
        USDPerBaseInt256 result = USDPerBaseInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDPerBaseInt128To256Fuzz(int128 x) public {
        USDPerBaseInt256 result = USDPerBaseInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDPerBaseInt128Abs() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(-100);
        USDPerBaseUint256 result = x.abs();
        assertEq(result.unwrap(), uint256(100));
        result = USDPerBaseInt128.wrap(100).abs();
        assertEq(result.unwrap(), uint256(100));
    }

    function testUSDPerBaseInt128AbsFuzz(int128 x) public {
        USDPerBaseUint256 result = USDPerBaseInt128.wrap(x).abs();
        int256 _x = x;
        assertEq(result.unwrap(), uint256(x < 0 ? -_x : _x));
    }

    function testUSDPerBaseInt128Abs128() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(-100);
        USDPerBaseUint128 result = x.abs128();
        assertEq(result.unwrap(), uint128(100));
        result = USDPerBaseInt128.wrap(100).abs128();
        assertEq(result.unwrap(), uint128(100));
    }

    function testUSDPerBaseInt128Abs128Fuzz(int128 x) public {
        if (x == type(int128).min) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x).abs128();
        } else {
            USDPerBaseUint128 result = USDPerBaseInt128.wrap(x).abs128();
            assertEq(result.unwrap(), uint128(x < 0 ? -x : x));
        }
    }

    function testUSDPerBaseInt128Max128() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(-100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200);
        USDPerBaseInt128 result = x.max128(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testUSDPerBaseInt128Max128Fuzz(int128 x, int128 y) public {
        int128 z = x < y ? y : x;
        USDPerBaseInt128 result =
            USDPerBaseInt128.wrap(x).max128(USDPerBaseInt128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseInt128Min128() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(-100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200);
        USDPerBaseInt128 result = x.min128(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testUSDPerBaseInt128Min128Fuzz(int128 x, int128 y) public {
        int128 z = x < y ? x : y;
        USDPerBaseInt128 result =
            USDPerBaseInt128.wrap(x).min128(USDPerBaseInt128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseInt128Max() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(-100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200);
        USDPerBaseInt256 result = x.max(y);
        assertEq(result.unwrap(), int256(y.unwrap()));
    }

    function testUSDPerBaseInt128MaxFuzz(int128 x, int128 y) public {
        int128 z = x < y ? y : x;
        USDPerBaseInt256 result =
            USDPerBaseInt128.wrap(x).max(USDPerBaseInt128.wrap(y));
        assertEq(result.unwrap(), int256(z));
    }

    function testUSDPerBaseInt128Min() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(-100);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200);
        USDPerBaseInt256 result = x.min(y);
        assertEq(result.unwrap(), int256(x.unwrap()));
    }

    function testUSDPerBaseInt128MinFuzz(int128 x, int128 y) public {
        int128 z = x < y ? x : y;
        USDPerBaseInt256 result =
            USDPerBaseInt128.wrap(x).min(USDPerBaseInt128.wrap(y));
        assertEq(result.unwrap(), int256(z));
    }

    function testUSDPerBaseInt128SameSide() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(200);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        bool result = x.sameSide(y);
        assertTrue(result);
        result = x.sameSide(USDPerBaseInt128.wrap(-100));
        assertFalse(result);
    }

    function testUSDPerBaseInt128SameSideFuzz(int128 x, int128 y) public {
        bool z = (x == 0) || (y == 0) || (x > 0) == (y > 0);
        bool result =
            USDPerBaseInt128.wrap(x).sameSide(USDPerBaseInt128.wrap(y));
        assertEq(result, z);
    }

    function testUSDPerBaseInt128Zero() public {
        USDPerBaseInt128 x = InteractionsUSDPerBaseInt128.zero();
        assertEq(x.unwrap(), 0);
    }

    function testUSDPerBaseInt128isZero() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(0);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testUSDPerBaseInt128isZeroFuzz(int128 x) public {
        USDPerBaseInt128 result = USDPerBaseInt128.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }

    function testUSDPerBaseInt128DivToDimensionless() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(500);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(2);
        int128 result = x.divToDimensionless(y);
        assertEq(result, 250);
    }

    function testUSDPerBaseInt128DivToDimensionlessFuzz(int128 x, int128 y)
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
            USDPerBaseInt128.wrap(x).divToDimensionless(
                USDPerBaseInt128.wrap(y)
            );
        } else {
            int128 result = USDPerBaseInt128.wrap(x).divToDimensionless(
                USDPerBaseInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerBaseInt128DivDecimalToDimensionless() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(500 ether);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(2 ether);
        int256 result = x.divDecimalToDimensionless(y);
        assertEq(result, 250 ether);
    }

    function testUSDPerBaseInt128DivDecimalToDimensionlessFuzz(
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
            USDPerBaseInt128.wrap(x).divDecimalToDimensionless(
                USDPerBaseInt128.wrap(y)
            );
        } else {
            int256 result = USDPerBaseInt128.wrap(x).divDecimalToDimensionless(
                USDPerBaseInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerBaseInt128CeilDivide() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(10);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(3);
        int128 result = x.ceilDivide(y);
        assertEq(result, 4);
        result = USDPerBaseInt128.wrap(-10).ceilDivide(USDPerBaseInt128.wrap(3));
        assertEq(result, -3);
    }

    function testUSDPerBaseInt128CeilDivideFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x).ceilDivide(USDPerBaseInt128.wrap(y));
        } else {
            if (!(((x < 0) != (y < 0)) || (x % y) == 0)) {
                z = z + 1;
            }
            int128 result =
                USDPerBaseInt128.wrap(x).ceilDivide(USDPerBaseInt128.wrap(y));
            assertEq(result, z);
        }
    }

    function testUSDPerBaseInt128GreaterThanZero() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        bool result = x.greaterThanZero();
        assertTrue(result);
        x = USDPerBaseInt128.wrap(-100);
        result = x.greaterThanZero();
        assertFalse(result);
    }

    function testUSDPerBaseInt128GreaterThanZeroFuzz(int128 x) public {
        bool z = x > 0;
        bool result = USDPerBaseInt128.wrap(x).greaterThanZero();
        assertEq(result, z);
    }

    function testUSDPerBaseInt128LessThanZero() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(100);
        bool result = x.lessThanZero();
        assertFalse(result);
        x = USDPerBaseInt128.wrap(-100);
        result = x.lessThanZero();
        assertTrue(result);
    }

    function testUSDPerBaseInt128LessThanZeroFuzz(int128 x) public {
        bool z = x < 0;
        bool result = USDPerBaseInt128.wrap(x).lessThanZero();
        assertEq(result, z);
    }

    function testUSDPerBaseInt128GreaterThanOrEqualToZero() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(0);
        bool result = x.greaterThanOrEqualToZero();
        assertTrue(result);
        x = USDPerBaseInt128.wrap(-100);
        result = x.greaterThanOrEqualToZero();
        assertFalse(result);
    }

    function testUSDPerBaseInt128GreaterThanOrEqualToZeroFuzz(int128 x)
        public
    {
        bool z = x >= 0;
        bool result = USDPerBaseInt128.wrap(x).greaterThanOrEqualToZero();
        assertEq(result, z);
    }

    function testUSDPerBaseInt128LessThanOrEqualToZero() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(0);
        bool result = x.lessThanOrEqualToZero();
        assertTrue(result);
        x = USDPerBaseInt128.wrap(100);
        result = x.lessThanOrEqualToZero();
        assertFalse(result);
    }

    function testUSDPerBaseInt128LessThanOrEqualToZero(int128 x) public {
        bool z = x <= 0;
        bool result = USDPerBaseInt128.wrap(x).lessThanOrEqualToZero();
        assertEq(result, z);
    }

    function testUSDPerBaseInt128IsSameSideReducing() public {
        USDPerBaseInt128 x = USDPerBaseInt128.wrap(200);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(100);
        bool result = x.isSameSideReducing(y);
        assertTrue(result);
        result = x.sameSide(USDPerBaseInt128.wrap(-100));
        assertFalse(result);
    }

    function testUSDPerBaseInt128IsSameSideReducingFuzz(int128 x, int128 y)
        public
    {
        if (
            ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                && (x == type(int128).min || y == type(int128).min)
        ) {
            vm.expectRevert();
            USDPerBaseInt128.wrap(x).isSameSideReducing(
                USDPerBaseInt128.wrap(y)
            );
        } else {
            bool z = (
                ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                    && uint128(y < 0 ? -y : y) < uint128(x < 0 ? -x : x)
            );
            bool result = USDPerBaseInt128.wrap(x).isSameSideReducing(
                USDPerBaseInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }
}
