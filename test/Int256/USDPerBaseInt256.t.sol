// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDInt256,
    BaseInt256,
    QuantoInt256,
    USDPerBaseInt256,
    USDPerBaseInt128,
    USDPerBaseUint256,
    USDPerQuantoInt256,
    USDInt256,
    InteractionsUSDPerBaseInt256
} from "src/UnitTypes.sol";

contract USDPerBaseInt256Test is Test {
    using InteractionsUSDPerBaseInt256 for USDPerBaseInt256;

    function setUp() public {}

    function testUSDPerBaseInt256Add() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(200);
        USDPerBaseInt256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerBaseInt256AddFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := add(x, y)
        }
        USDPerBaseInt256 xW = USDPerBaseInt256.wrap(x);
        USDPerBaseInt256 yW = USDPerBaseInt256.wrap(y);
        if ((x < 0 && y < 0 && z > x) || (x > 0 && y > 0 && z < x)) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerBaseInt256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerBaseInt256Sub() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(200);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerBaseInt256SubFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sub(x, y)
        }
        if ((y > 0 && z > x) || (y < 0 && z < x)) {
            vm.expectRevert();
            USDPerBaseInt256.wrap(x) - USDPerBaseInt256.wrap(y);
        } else {
            USDPerBaseInt256 result =
                USDPerBaseInt256.wrap(x) - USDPerBaseInt256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDPerBaseInt256And() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(10); // 1010 in binary
        int256 y = 12; // 1100 in binary
        USDPerBaseInt256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerBaseInt256AndFuzz(int256 x, int256 y) public {
        int256 z = x & y;
        USDPerBaseInt256 result = USDPerBaseInt256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseInt256And2() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(10); // 1010 in binary
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(12); // 1100 in binary
        USDPerBaseInt256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerBaseInt256And2Fuzz(int256 x, int256 y) public {
        int256 z = x & y;
        USDPerBaseInt256 result =
            USDPerBaseInt256.wrap(x) & USDPerBaseInt256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseInt256Eq() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerBaseInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseInt256EqFuzz(int256 x, int256 y) public {
        bool z = x == y;
        bool result = USDPerBaseInt256.wrap(x) == USDPerBaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt256Gt() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerBaseInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseInt256GtFuzz(int256 x, int256 y) public {
        bool z = x > y;
        bool result = USDPerBaseInt256.wrap(x) > USDPerBaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt256Gte() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerBaseInt256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseInt256GteFuzz(int256 x, int256 y) public {
        bool z = x >= y;
        bool result = USDPerBaseInt256.wrap(x) >= USDPerBaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt256Lt() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(50);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerBaseInt256.wrap(49);
        assertFalse(result);
    }

    function testUSDPerBaseInt256LtFuzz(int256 x, int256 y) public {
        bool z = x < y;
        bool result = USDPerBaseInt256.wrap(x) < USDPerBaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt256Lte() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerBaseInt256.wrap(99);
        assertFalse(result);
    }

    function testUSDPerBaseInt256LteFuzz(int256 x, int256 y) public {
        bool z = x <= y;
        bool result = USDPerBaseInt256.wrap(x) <= USDPerBaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt256Mod() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(30);
        USDPerBaseInt256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerBaseInt256ModFuzz(int256 x, int256 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerBaseInt256.wrap(x) % USDPerBaseInt256.wrap(y);
        } else {
            int256 z = x % y;
            USDPerBaseInt256 result =
                USDPerBaseInt256.wrap(x) % USDPerBaseInt256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt256Neq() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerBaseInt256.wrap(101);
        assertTrue(result);
    }

    function testUSDPerBaseInt256NeqFuzz(int256 x, int256 y) public {
        bool z = x != y;
        bool result = USDPerBaseInt256.wrap(x) != USDPerBaseInt256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseInt256Not() public {
        int256 hundred = 100;
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(hundred);
        USDPerBaseInt256 result = ~x;
        int256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerBaseInt256NotFuzz(int256 x) public {
        USDPerBaseInt256 result = ~USDPerBaseInt256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerBaseInt256Or() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(200);
        USDPerBaseInt256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerBaseInt256OrFuzz(int256 x, int256 y) public {
        USDPerBaseInt256 result =
            USDPerBaseInt256.wrap(x) | USDPerBaseInt256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerBaseInt256Xor() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 y = USDPerBaseInt256.wrap(200);
        USDPerBaseInt256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerBaseInt256XorFuzz(int256 x, int256 y) public {
        USDPerBaseInt256 result =
            USDPerBaseInt256.wrap(x) ^ USDPerBaseInt256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerBaseInt256Increment() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        USDPerBaseInt256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerBaseInt256IncrementFuzz(int256 x) public {
        int256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerBaseInt256.wrap(x).increment();
        } else {
            USDPerBaseInt256 result = USDPerBaseInt256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerBaseInt256Mul() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100);
        int256 y = 200;
        USDPerBaseInt256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDPerBaseInt256MulFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := mul(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);
        if (wrongSign || (x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerBaseInt256.wrap(x).mul(y);
        } else {
            USDPerBaseInt256 result = USDPerBaseInt256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt256MulDecimal() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100 ether);
        int256 y = 200 ether;
        USDPerBaseInt256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseInt256MulDecimalFuzz(int256 x, int256 y) public {
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
            USDPerBaseInt256.wrap(x).mulDecimal(y);
        } else {
            USDPerBaseInt256 result = USDPerBaseInt256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt256MulDecimalToUSD() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100 ether);
        BaseInt256 y = BaseInt256.wrap(200 ether);
        USDInt256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseInt256MulDecimalToUSDFuzz(int256 x, int256 y)
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
            USDPerBaseInt256.wrap(x).mulDecimalToUSD(BaseInt256.wrap(y));
        } else {
            USDInt256 result =
                USDPerBaseInt256.wrap(x).mulDecimalToUSD(BaseInt256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt256MulDecimalToQuanto() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(100 ether);
        BaseQuantoPerUSDInt256 y = BaseQuantoPerUSDInt256.wrap(200 ether);
        QuantoInt256 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseInt256MulDecimalToQuantoFuzz(int256 x, int256 y)
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
            USDPerBaseInt256.wrap(x).mulDecimalToQuanto(
                BaseQuantoPerUSDInt256.wrap(y)
            );
        } else {
            QuantoInt256 result = USDPerBaseInt256.wrap(x).mulDecimalToQuanto(
                BaseQuantoPerUSDInt256.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt256Div() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(500);
        int256 y = 2;
        USDPerBaseInt256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerBaseInt256DivFuzz(int256 x, int256 y) public {
        int256 z;
        assembly {
            z := sdiv(x, y)
        }
        bool wrongSign = (y < 0 && x < 0 && z < 0) || (y > 0 && x > 0 && z < 0)
            || (y < 0 && x > 0 && z > 0) || (y > 0 && x < 0 && z > 0);

        if (wrongSign || y == 0) {
            vm.expectRevert();
            USDPerBaseInt256.wrap(x).div(y);
        } else {
            USDPerBaseInt256 result = USDPerBaseInt256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt256DivDecimal() public {
        USDPerBaseInt256 x = USDPerBaseInt256.wrap(500 ether);
        int256 y = 2 ether;
        USDPerBaseInt256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testUSDPerBaseInt256DivDecimalFuzz(int256 x, int256 y) public {
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
            USDPerBaseInt256.wrap(x).divDecimal(y);
        } else {
            USDPerBaseInt256 result = USDPerBaseInt256.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseInt256To128() public {
        int256 x = type(int256).max;
        vm.expectRevert();
        USDPerBaseInt256.wrap(x).to128();
        x = 1;
        USDPerBaseInt128 result = USDPerBaseInt256.wrap(x).to128();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDPerBaseInt256To128Fuzz(int256 x) public {
        if (x > int256(type(int128).max) || x < int256(type(int128).min)) {
            vm.expectRevert();
            USDPerBaseInt256.wrap(x).to128();
        } else {
            USDPerBaseInt128 result = USDPerBaseInt256.wrap(x).to128();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testUSDPerBaseInt256ToUint() public {
        int256 x = type(int256).min;
        vm.expectRevert();
        USDPerBaseInt256.wrap(x).toUint();
        x = 1;
        USDPerBaseUint256 result = USDPerBaseInt256.wrap(x).toUint();
        assertEq(result.unwrap(), uint256(x));
    }

    function testUSDPerBaseInt256ToUintFuzz(int256 x) public {
        if (x < 0) {
            vm.expectRevert();
            USDPerBaseInt256.wrap(x).toUint();
        } else {
            USDPerBaseUint256 result = USDPerBaseInt256.wrap(x).toUint();
            assertEq(result.unwrap(), uint256(x));
        }
    }
}
