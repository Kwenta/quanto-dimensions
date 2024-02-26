// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt256,
    BaseQuantoPerUSDInt128,
    BaseInt256,
    QuantoInt256,
    USDPerBaseInt256,
    USDPerQuantoInt256,
    USDInt256
} from "../../src/UnitTypes.sol";

contract BaseQuantoPerUSDInt256Test is Test {
    function setUp() public {}

    function testBaseQuantoPerUSDInt256Add() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(200);
        BaseQuantoPerUSDInt256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseQuantoPerUSDInt256AddFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := add(x, y)
        }
        BaseQuantoPerUSDInt256 xW = BaseQuantoPerUSDInt256.wrap(x);
        BaseQuantoPerUSDInt256 yW = BaseQuantoPerUSDInt256.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseQuantoPerUSDInt256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testBaseQuantoPerUSDInt256Sub() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(200);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testBaseQuantoPerUSDInt256SubFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            BaseQuantoPerUSDInt256.wrap(x) - BaseQuantoPerUSDInt256.wrap(y);
        } else {
            BaseQuantoPerUSDInt256 result =
                BaseQuantoPerUSDInt256.wrap(x) - BaseQuantoPerUSDInt256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testBaseQuantoPerUSDInt256And() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(10); // 1010 in binary
        int256 y = 12; // 1100 in binary
        BaseQuantoPerUSDInt256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseQuantoPerUSDInt256AndFuzz(int256 x, int256 y) public {
        int256 z = x & y;
        BaseQuantoPerUSDInt256 result = BaseQuantoPerUSDInt256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDInt256And2() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(10); // 1010 in binary
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(12); // 1100 in binary
        BaseQuantoPerUSDInt256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseQuantoPerUSDInt256And2Fuzz(int256 x, int256 y) public {
        int256 z = x & y;
        BaseQuantoPerUSDInt256 result =
            BaseQuantoPerUSDInt256.wrap(x) & BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDInt256Eq() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == BaseQuantoPerUSDInt256.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt256EqFuzz(int256 x, int256 y) public {
        bool z = x == y;
        bool result =
            BaseQuantoPerUSDInt256.wrap(x) == BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt256Gt() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > BaseQuantoPerUSDInt256.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt256GtFuzz(int256 x, int256 y) public {
        bool z = x > y;
        bool result =
            BaseQuantoPerUSDInt256.wrap(x) > BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt256Gte() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= BaseQuantoPerUSDInt256.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt256GteFuzz(int256 x, int256 y) public {
        bool z = x >= y;
        bool result =
            BaseQuantoPerUSDInt256.wrap(x) >= BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt256Lt() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(50);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < BaseQuantoPerUSDInt256.wrap(49);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt256LtFuzz(int256 x, int256 y) public {
        bool z = x < y;
        bool result =
            BaseQuantoPerUSDInt256.wrap(x) < BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt256Lte() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= BaseQuantoPerUSDInt256.wrap(99);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDInt256LteFuzz(int256 x, int256 y) public {
        bool z = x <= y;
        bool result =
            BaseQuantoPerUSDInt256.wrap(x) <= BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt256Mod() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(30);
        BaseQuantoPerUSDInt256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testBaseQuantoPerUSDInt256ModFuzz(int256 x, int256 y) public {
        if (y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDInt256.wrap(x) % BaseQuantoPerUSDInt256.wrap(y);
        } else {
            int256 z = x % y;
            BaseQuantoPerUSDInt256 result =
                BaseQuantoPerUSDInt256.wrap(x) % BaseQuantoPerUSDInt256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt256Neq() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != BaseQuantoPerUSDInt256.wrap(101);
        assertTrue(result);
    }

    function testBaseQuantoPerUSDInt256NeqFuzz(int256 x, int256 y) public {
        bool z = x != y;
        bool result =
            BaseQuantoPerUSDInt256.wrap(x) != BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDInt256Not() public {
        int256 hundred = 100;
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(hundred);
        BaseQuantoPerUSDInt256 result = ~x;
        int256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testBaseQuantoPerUSDInt256NotFuzz(int256 x) public {
        BaseQuantoPerUSDInt256 result = ~BaseQuantoPerUSDInt256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testBaseQuantoPerUSDInt256Or() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(200);
        BaseQuantoPerUSDInt256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testBaseQuantoPerUSDInt256OrFuzz(int256 x, int256 y) public {
        BaseQuantoPerUSDInt256 result =
            BaseQuantoPerUSDInt256.wrap(x) | BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testBaseQuantoPerUSDInt256Xor() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(200);
        BaseQuantoPerUSDInt256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testBaseQuantoPerUSDInt256XorFuzz(int256 x, int256 y) public {
        BaseQuantoPerUSDInt256 result =
            BaseQuantoPerUSDInt256.wrap(x) ^ BaseQuantoPerUSDInt256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testBaseQuantoPerUSDInt256Increment() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        BaseQuantoPerUSDInt256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseQuantoPerUSDInt256IncrementFuzz(int256 x) public {
        int256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseQuantoPerUSDInt256.wrap(x).increment();
        } else {
            BaseQuantoPerUSDInt256 result =
                BaseQuantoPerUSDInt256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseQuantoPerUSDInt256Mul() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100);
        int256 y = 200;
        BaseQuantoPerUSDInt256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testBaseQuantoPerUSDInt256MulFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            BaseQuantoPerUSDInt256.wrap(x).mul(y);
        } else {
            BaseQuantoPerUSDInt256 result =
                BaseQuantoPerUSDInt256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt256MulDecimal() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100 ether);
        int256 y = 200 ether;
        BaseQuantoPerUSDInt256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDInt256MulDecimalFuzz(int256 x, int256 y)
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
            BaseQuantoPerUSDInt256.wrap(x).mulDecimal(y);
        } else {
            BaseQuantoPerUSDInt256 result =
                BaseQuantoPerUSDInt256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt256MulDecimalToQuanto() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100 ether);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(200 ether);
        QuantoInt256 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDInt256MulDecimalToQuantoFuzz(
        int256 x,
        int256 y
    ) public {
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
            BaseQuantoPerUSDInt256.wrap(x).mulDecimalToQuanto(
                USDPerBaseInt256.wrap(y)
            );
        } else {
            QuantoInt256 result = BaseQuantoPerUSDInt256.wrap(x)
                .mulDecimalToQuanto(USDPerBaseInt256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt256MulDecimalToBase() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(100 ether);
        USDPerQuantoInt256 y = USDPerQuantoInt256.wrap(200 ether);
        BaseInt256 result = x.mulDecimalToBase(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDInt256MulDecimalToBaseFuzz(int256 x, int256 y)
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
            BaseQuantoPerUSDInt256.wrap(x * 1 ether).mulDecimalToBase(
                USDPerQuantoInt256.wrap(y * 1 ether)
            );
        } else {
            BaseInt256 result = BaseQuantoPerUSDInt256.wrap(x).mulDecimalToBase(
                USDPerQuantoInt256.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt256Div() public {
        BaseQuantoPerUSDInt256 x = BaseQuantoPerUSDInt256.wrap(500);
        int256 y = 2;
        BaseQuantoPerUSDInt256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testBaseQuantoPerUSDInt256DivFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDInt256.wrap(x).div(y);
        } else {
            BaseQuantoPerUSDInt256 result =
                BaseQuantoPerUSDInt256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDInt256To128() public {
        int256 x = type(int256).max;
        vm.expectRevert();
        BaseQuantoPerUSDInt256.wrap(x).to128();
        x = 1;
        BaseQuantoPerUSDInt128 result = BaseQuantoPerUSDInt256.wrap(x).to128();
        assertEq(result.unwrap(), int256(x));
    }

    function testBaseQuantoPerUSDInt256To128Fuzz(int256 x) public {
        if (x > int256(type(int128).max) || x < int256(type(int128).min)) {
            vm.expectRevert();
            BaseQuantoPerUSDInt256.wrap(x).to128();
        } else {
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDInt256.wrap(x).to128();
            assertEq(result.unwrap(), int128(x));
        }
    }
}
