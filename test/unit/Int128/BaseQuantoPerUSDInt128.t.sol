// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt128,
    BaseQuantoPerUSDUint128,
    BaseQuantoPerUSDUint256,
    BaseQuantoPerUSDInt256,
    BaseInt128,
    QuantoInt128,
    USDPerBaseInt128,
    USDPerQuantoInt128,
    InteractionsBaseQuantoPerUSDInt128
} from "../../../src/UnitTypes.sol";

contract BaseQuantoPerUSDInt128Test is Test {
    using InteractionsBaseQuantoPerUSDInt128 for BaseQuantoPerUSDInt128;

    function setUp() public {}

    function testBaseQuantoPerUSDInt128Add() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseQuantoPerUSDInt128AddFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := add(x, y)
        }
        BaseQuantoPerUSDInt128 xW = BaseQuantoPerUSDInt128.wrap(x);
        BaseQuantoPerUSDInt128 yW = BaseQuantoPerUSDInt128.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseQuantoPerUSDInt128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testBaseQuantoPerUSDInt128Sub() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testBaseQuantoPerUSDInt128SubFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x) - BaseQuantoPerUSDInt128.wrap(y);
        } else {
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDInt128.wrap(x) - BaseQuantoPerUSDInt128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testBaseQuantoPerUSDInt128And() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(10); // 1010 in binary
        int128 y = 12; // 1100 in binary
        BaseQuantoPerUSDInt128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseQuantoPerUSDInt128AndFuzz(int128 x, int128 y) public {
        int128 z = x & y;
        BaseQuantoPerUSDInt128 result = BaseQuantoPerUSDInt128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDInt128And2() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(10); // 1010 in binary
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(12); // 1100 in binary
        BaseQuantoPerUSDInt128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseQuantoPerUSDInt128And2Fuzz(int128 x, int128 y) public {
        int128 z = x & y;
        BaseQuantoPerUSDInt128 result =
            BaseQuantoPerUSDInt128.wrap(x) & BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDInt128Eq() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == BaseQuantoPerUSDInt128.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128EqFuzz(int128 x, int128 y) public {
        bool z = x == y;
        bool result =
            BaseQuantoPerUSDInt128.wrap(x) == BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128Gt() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > BaseQuantoPerUSDInt128.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128GtFuzz(int128 x, int128 y) public {
        bool z = x > y;
        bool result =
            BaseQuantoPerUSDInt128.wrap(x) > BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128Gte() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= BaseQuantoPerUSDInt128.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128GteFuzz(int128 x, int128 y) public {
        bool z = x >= y;
        bool result =
            BaseQuantoPerUSDInt128.wrap(x) >= BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128Lt() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(50);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < BaseQuantoPerUSDInt128.wrap(49);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128LtFuzz(int128 x, int128 y) public {
        bool z = x < y;
        bool result =
            BaseQuantoPerUSDInt128.wrap(x) < BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128Lte() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= BaseQuantoPerUSDInt128.wrap(99);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128LteFuzz(int128 x, int128 y) public {
        bool z = x <= y;
        bool result =
            BaseQuantoPerUSDInt128.wrap(x) <= BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128Mod() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(30);
        BaseQuantoPerUSDInt128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testBaseQuantoPerUSDInt128ModFuzz(int128 x, int128 y) public {
        if (y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x) % BaseQuantoPerUSDInt128.wrap(y);
        } else {
            int128 z = x % y;
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDInt128.wrap(x) % BaseQuantoPerUSDInt128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt128Neq() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != BaseQuantoPerUSDInt128.wrap(101);
        assertTrue(result);
    }

    function testBaseQuantoPerUSDInt128NeqFuzz(int128 x, int128 y) public {
        bool z = x != y;
        bool result =
            BaseQuantoPerUSDInt128.wrap(x) != BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128Not() public {
        int128 hundred = 100;
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(hundred);
        BaseQuantoPerUSDInt128 result = ~x;
        int128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testBaseQuantoPerUSDInt128NotFuzz(int128 x) public {
        BaseQuantoPerUSDInt128 result = ~BaseQuantoPerUSDInt128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testBaseQuantoPerUSDInt128Or() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testBaseQuantoPerUSDInt128OrFuzz(int128 x, int128 y) public {
        BaseQuantoPerUSDInt128 result =
            BaseQuantoPerUSDInt128.wrap(x) | BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testBaseQuantoPerUSDInt128Xor() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testBaseQuantoPerUSDInt128XorFuzz(int128 x, int128 y) public {
        BaseQuantoPerUSDInt128 result =
            BaseQuantoPerUSDInt128.wrap(x) ^ BaseQuantoPerUSDInt128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testBaseQuantoPerUSDInt128Increment() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        BaseQuantoPerUSDInt128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseQuantoPerUSDInt128IncrementFuzz(int128 x) public {
        int128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x).increment();
        } else {
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDInt128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseQuantoPerUSDInt128Mul() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        int128 y = 200;
        BaseQuantoPerUSDInt128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testBaseQuantoPerUSDInt128MulFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x).mul(y);
        } else {
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDInt128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt128MulDecimal() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100 ether);
        int128 y = 200 ether;
        BaseQuantoPerUSDInt128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDInt128MulDecimalFuzz(int128 x, int128 y)
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
            BaseQuantoPerUSDInt128.wrap(x).mulDecimal(y);
        } else {
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDInt128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt128MulDecimalToQuanto() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100 ether);
        USDPerBaseInt128 y = USDPerBaseInt128.wrap(200 ether);
        QuantoInt128 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDInt128MulDecimalToQuantoFuzz(
        int128 x,
        int128 y
    ) public {
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
            BaseQuantoPerUSDInt128.wrap(x).mulDecimalToQuanto(
                USDPerBaseInt128.wrap(y)
            );
        } else {
            QuantoInt128 result = BaseQuantoPerUSDInt128.wrap(x)
                .mulDecimalToQuanto(USDPerBaseInt128.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt128MulDecimalToBase() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100 ether);
        USDPerQuantoInt128 y = USDPerQuantoInt128.wrap(200 ether);
        BaseInt128 result = x.mulDecimalToBase(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDInt128MulDecimalToBaseFuzz(int128 x, int128 y)
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
            BaseQuantoPerUSDInt128.wrap(x * 1 ether).mulDecimalToBase(
                USDPerQuantoInt128.wrap(y * 1 ether)
            );
        } else {
            BaseInt128 result = BaseQuantoPerUSDInt128.wrap(x).mulDecimalToBase(
                USDPerQuantoInt128.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt128Div() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(500);
        int128 y = 2;
        BaseQuantoPerUSDInt128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testBaseQuantoPerUSDInt128DivFuzz(int128 x, int128 y) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x).div(y);
        } else {
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDInt128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt128DivDecimal() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(500 ether);
        int128 y = 2 ether;
        BaseQuantoPerUSDInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testBaseQuantoPerUSDInt128DivDecimalFuzz(int128 x, int128 y)
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
            BaseQuantoPerUSDInt128.wrap(x).divDecimal(y);
        } else {
            BaseQuantoPerUSDInt256 result =
                BaseQuantoPerUSDInt128.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt128DivDecimalInt128() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(50 ether);
        int128 y = 2 ether;
        BaseQuantoPerUSDInt128 result = x.divDecimalInt128(y);
        assertEq(result.unwrap(), 25 ether);
    }

    function testBaseQuantoPerUSDInt128DivDecimalInt128Fuzz(int128 x, int128 y)
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
            BaseQuantoPerUSDInt128.wrap(x).divDecimalInt128(y);
        } else {
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDInt128.wrap(x).divDecimalInt128(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt128ToUint() public {
        int128 x = type(int128).min;
        vm.expectRevert();
        BaseQuantoPerUSDInt128.wrap(x).toUint();
        x = 1;
        BaseQuantoPerUSDUint128 result = BaseQuantoPerUSDInt128.wrap(x).toUint();
        assertEq(result.unwrap(), uint128(x));
    }

    function testBaseQuantoPerUSDInt128ToUintFuzz(int128 x) public {
        if (x < 0) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x).toUint();
        } else {
            BaseQuantoPerUSDUint128 result =
                BaseQuantoPerUSDInt128.wrap(x).toUint();
            assertEq(result.unwrap(), uint128(x));
        }
    }

    function testBaseQuantoPerUSDInt128To256() public {
        int128 x = type(int128).min;
        BaseQuantoPerUSDInt256 result = BaseQuantoPerUSDInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testBaseQuantoPerUSDInt128To256Fuzz(int128 x) public {
        BaseQuantoPerUSDInt256 result = BaseQuantoPerUSDInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testBaseQuantoPerUSDInt128Abs() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(-100);
        BaseQuantoPerUSDUint256 result = x.abs();
        assertEq(result.unwrap(), uint256(100));
        result = BaseQuantoPerUSDInt128.wrap(100).abs();
        assertEq(result.unwrap(), uint256(100));
    }

    function testBaseQuantoPerUSDInt128AbsFuzz(int128 x) public {
        BaseQuantoPerUSDUint256 result = BaseQuantoPerUSDInt128.wrap(x).abs();
        int256 _x = x;
        assertEq(result.unwrap(), uint256(x < 0 ? -_x : _x));
    }

    function testBaseQuantoPerUSDInt128Abs128() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(-100);
        BaseQuantoPerUSDUint128 result = x.abs128();
        assertEq(result.unwrap(), uint128(100));
        result = BaseQuantoPerUSDInt128.wrap(100).abs128();
        assertEq(result.unwrap(), uint128(100));
    }

    function testBaseQuantoPerUSDInt128Abs128Fuzz(int128 x) public {
        if (x == type(int128).min) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x).abs128();
        } else {
            BaseQuantoPerUSDUint128 result =
                BaseQuantoPerUSDInt128.wrap(x).abs128();
            assertEq(result.unwrap(), uint128(x < 0 ? -x : x));
        }
    }

    function testBaseQuantoPerUSDInt128Max128() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(-100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt128 result = x.max128(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testBaseQuantoPerUSDInt128Max128Fuzz(int128 x, int128 y) public {
        int128 z = x < y ? y : x;
        BaseQuantoPerUSDInt128 result = BaseQuantoPerUSDInt128.wrap(x).max128(
            BaseQuantoPerUSDInt128.wrap(y)
        );
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDInt128Min128() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(-100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt128 result = x.min128(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testBaseQuantoPerUSDInt128Min128Fuzz(int128 x, int128 y) public {
        int128 z = x < y ? x : y;
        BaseQuantoPerUSDInt128 result = BaseQuantoPerUSDInt128.wrap(x).min128(
            BaseQuantoPerUSDInt128.wrap(y)
        );
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDInt128Max() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(-100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt256 result = x.max(y);
        assertEq(result.unwrap(), int256(y.unwrap()));
    }

    function testBaseQuantoPerUSDInt128MaxFuzz(int128 x, int128 y) public {
        int128 z = x < y ? y : x;
        BaseQuantoPerUSDInt256 result =
            BaseQuantoPerUSDInt128.wrap(x).max(BaseQuantoPerUSDInt128.wrap(y));
        assertEq(result.unwrap(), int256(z));
    }

    function testBaseQuantoPerUSDInt128Min() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(-100);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt256 result = x.min(y);
        assertEq(result.unwrap(), int256(x.unwrap()));
    }

    function testBaseQuantoPerUSDInt128MinFuzz(int128 x, int128 y) public {
        int128 z = x < y ? x : y;
        BaseQuantoPerUSDInt256 result =
            BaseQuantoPerUSDInt128.wrap(x).min(BaseQuantoPerUSDInt128.wrap(y));
        assertEq(result.unwrap(), int256(z));
    }

    function testBaseQuantoPerUSDInt128SameSide() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x.sameSide(y);
        assertTrue(result);
        result = x.sameSide(BaseQuantoPerUSDInt128.wrap(-100));
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128SameSideFuzz(int128 x, int128 y)
        public
    {
        bool z = (x == 0) || (y == 0) || (x > 0) == (y > 0);
        bool result = BaseQuantoPerUSDInt128.wrap(x).sameSide(
            BaseQuantoPerUSDInt128.wrap(y)
        );
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128Zero() public {
        BaseQuantoPerUSDInt128 x = InteractionsBaseQuantoPerUSDInt128.zero();
        assertEq(x.unwrap(), 0);
    }

    function testBaseQuantoPerUSDInt128isZero() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(0);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128isZeroFuzz(int128 x) public {
        BaseQuantoPerUSDInt128 result = BaseQuantoPerUSDInt128.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }

    function testBaseQuantoPerUSDInt128DivToDimensionless() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(500);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(2);
        int128 result = x.divToDimensionless(y);
        assertEq(result, 250);
    }

    function testBaseQuantoPerUSDInt128DivToDimensionlessFuzz(
        int128 x,
        int128 y
    ) public {
        int128 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x).divToDimensionless(
                BaseQuantoPerUSDInt128.wrap(y)
            );
        } else {
            int128 result = BaseQuantoPerUSDInt128.wrap(x).divToDimensionless(
                BaseQuantoPerUSDInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testBaseQuantoPerUSDInt128DivDecimalToDimensionless() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(500 ether);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(2 ether);
        int256 result = x.divDecimalToDimensionless(y);
        assertEq(result, 250 ether);
    }

    function testBaseQuantoPerUSDInt128DivDecimalToDimensionlessFuzz(
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
            BaseQuantoPerUSDInt128.wrap(x).divDecimalToDimensionless(
                BaseQuantoPerUSDInt128.wrap(y)
            );
        } else {
            int256 result = BaseQuantoPerUSDInt128.wrap(x)
                .divDecimalToDimensionless(BaseQuantoPerUSDInt128.wrap(y));
            assertEq(result, z);
        }
    }

    function testBaseQuantoPerUSDInt128CeilDivide() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(10);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(3);
        int128 result = x.ceilDivide(y);
        assertEq(result, 4);
        result = BaseQuantoPerUSDInt128.wrap(-10).ceilDivide(
            BaseQuantoPerUSDInt128.wrap(3)
        );
        assertEq(result, -3);
    }

    function testBaseQuantoPerUSDInt128CeilDivideFuzz(int128 x, int128 y)
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
            BaseQuantoPerUSDInt128.wrap(x).ceilDivide(
                BaseQuantoPerUSDInt128.wrap(y)
            );
        } else {
            if (!(((x < 0) != (y < 0)) || (x % y) == 0)) {
                z = z + 1;
            }
            int128 result = BaseQuantoPerUSDInt128.wrap(x).ceilDivide(
                BaseQuantoPerUSDInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testBaseQuantoPerUSDInt128GreaterThanZero() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x.greaterThanZero();
        assertTrue(result);
        x = BaseQuantoPerUSDInt128.wrap(-100);
        result = x.greaterThanZero();
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128GreaterThanZeroFuzz(int128 x) public {
        bool z = x > 0;
        bool result = BaseQuantoPerUSDInt128.wrap(x).greaterThanZero();
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128LessThanZero() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x.lessThanZero();
        assertFalse(result);
        x = BaseQuantoPerUSDInt128.wrap(-100);
        result = x.lessThanZero();
        assertTrue(result);
    }

    function testBaseQuantoPerUSDInt128LessThanZeroFuzz(int128 x) public {
        bool z = x < 0;
        bool result = BaseQuantoPerUSDInt128.wrap(x).lessThanZero();
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128GreaterThanOrEqualToZero() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(0);
        bool result = x.greaterThanOrEqualToZero();
        assertTrue(result);
        x = BaseQuantoPerUSDInt128.wrap(-100);
        result = x.greaterThanOrEqualToZero();
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128GreaterThanOrEqualToZeroFuzz(int128 x)
        public
    {
        bool z = x >= 0;
        bool result = BaseQuantoPerUSDInt128.wrap(x).greaterThanOrEqualToZero();
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128LessThanOrEqualToZero() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(0);
        bool result = x.lessThanOrEqualToZero();
        assertTrue(result);
        x = BaseQuantoPerUSDInt128.wrap(100);
        result = x.lessThanOrEqualToZero();
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128LessThanOrEqualToZero(int128 x) public {
        bool z = x <= 0;
        bool result = BaseQuantoPerUSDInt128.wrap(x).lessThanOrEqualToZero();
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt128IsSameSideReducing() public {
        BaseQuantoPerUSDInt128 x = BaseQuantoPerUSDInt128.wrap(200);
        BaseQuantoPerUSDInt128 y = BaseQuantoPerUSDInt128.wrap(100);
        bool result = x.isSameSideReducing(y);
        assertTrue(result);
        result = x.sameSide(BaseQuantoPerUSDInt128.wrap(-100));
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt128IsSameSideReducingFuzz(
        int128 x,
        int128 y
    ) public {
        if (
            ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                && (x == type(int128).min || y == type(int128).min)
        ) {
            vm.expectRevert();
            BaseQuantoPerUSDInt128.wrap(x).isSameSideReducing(
                BaseQuantoPerUSDInt128.wrap(y)
            );
        } else {
            bool z = (
                ((x == 0) || (y == 0) || (x > 0) == (y > 0))
                    && uint128(y < 0 ? -y : y) < uint128(x < 0 ? -x : x)
            );
            bool result = BaseQuantoPerUSDInt128.wrap(x).isSameSideReducing(
                BaseQuantoPerUSDInt128.wrap(y)
            );
            assertEq(result, z);
        }
    }
}
