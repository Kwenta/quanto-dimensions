// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt128,
    BaseQuantoPerUSDInt256,
    BaseQuantoPerUSDUint128,
    BaseInt128,
    QuantoInt128,
    USDPerBaseInt128,
    USDPerQuantoInt128,
    USDInt128
} from "src/UnitTypes.sol";

contract BaseQuantoPerUSDInt128Test is Test {
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

    function testBaseQuantoPerUSDInt128To256() public {
        int128 x = type(int128).max;
        BaseQuantoPerUSDInt256 result = BaseQuantoPerUSDInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
    }

    function testBaseQuantoPerUSDInt128To256Fuzz(int128 x) public {
        BaseQuantoPerUSDInt256 result = BaseQuantoPerUSDInt128.wrap(x).to256();
        assertEq(result.unwrap(), int256(x));
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
}
