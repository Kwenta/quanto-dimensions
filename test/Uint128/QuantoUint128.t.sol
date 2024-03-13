// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDUint128,
    BaseUint128,
    QuantoUint128,
    QuantoInt128,
    QuantoUint256,
    USDPerBaseUint128,
    USDPerQuantoUint128,
    USDUint128,
    InteractionsQuantoUint128
} from "../../src/UnitTypes.sol";

contract QuantoUint128Test is Test {
    using InteractionsQuantoUint128 for QuantoUint128;

    function setUp() public {}

    function testQuantoUint128Add() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(200);
        QuantoUint128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testQuantoUint128AddFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := add(x, y)
        }
        QuantoUint128 xW = QuantoUint128.wrap(x);
        QuantoUint128 yW = QuantoUint128.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            QuantoUint128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testQuantoUint128Sub() public {
        QuantoUint128 x = QuantoUint128.wrap(200);
        QuantoUint128 y = QuantoUint128.wrap(100);
        QuantoUint128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testQuantoUint128SubFuzz(uint128 x, uint128 y) public {
        if (x < y) {
            vm.expectRevert();
            QuantoUint128.wrap(x) - QuantoUint128.wrap(y);
        } else {
            QuantoUint128 result = QuantoUint128.wrap(x) - QuantoUint128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testQuantoUint128And() public {
        QuantoUint128 x = QuantoUint128.wrap(10); // 1010 in binary
        uint128 y = 12; // 1100 in binary
        QuantoUint128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testQuantoUint128AndFuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        QuantoUint128 result = QuantoUint128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testQuantoUint128And2() public {
        QuantoUint128 x = QuantoUint128.wrap(10); // 1010 in binary
        QuantoUint128 y = QuantoUint128.wrap(12); // 1100 in binary
        QuantoUint128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testQuantoUint128And2Fuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        QuantoUint128 result = QuantoUint128.wrap(x) & QuantoUint128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testQuantoUint128Eq() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == QuantoUint128.wrap(101);
        assertFalse(result);
    }

    function testQuantoUint128EqFuzz(uint128 x, uint128 y) public {
        bool z = x == y;
        bool result = QuantoUint128.wrap(x) == QuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint128Gt() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > QuantoUint128.wrap(101);
        assertFalse(result);
    }

    function testQuantoUint128GtFuzz(uint128 x, uint128 y) public {
        bool z = x > y;
        bool result = QuantoUint128.wrap(x) > QuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint128Gte() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= QuantoUint128.wrap(101);
        assertFalse(result);
    }

    function testQuantoUint128GteFuzz(uint128 x, uint128 y) public {
        bool z = x >= y;
        bool result = QuantoUint128.wrap(x) >= QuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint128Lt() public {
        QuantoUint128 x = QuantoUint128.wrap(50);
        QuantoUint128 y = QuantoUint128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < QuantoUint128.wrap(49);
        assertFalse(result);
    }

    function testQuantoUint128LtFuzz(uint128 x, uint128 y) public {
        bool z = x < y;
        bool result = QuantoUint128.wrap(x) < QuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint128Lte() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= QuantoUint128.wrap(99);
        assertFalse(result);
    }

    function testQuantoUint128LteFuzz(uint128 x, uint128 y) public {
        bool z = x <= y;
        bool result = QuantoUint128.wrap(x) <= QuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint128Mod() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(30);
        QuantoUint128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testQuantoUint128ModFuzz(uint128 x, uint128 y) public {
        if (y == 0) {
            vm.expectRevert();
            QuantoUint128.wrap(x) % QuantoUint128.wrap(y);
        } else {
            uint128 z = x % y;
            QuantoUint128 result = QuantoUint128.wrap(x) % QuantoUint128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint128Neq() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != QuantoUint128.wrap(101);
        assertTrue(result);
    }

    function testQuantoUint128NeqFuzz(uint128 x, uint128 y) public {
        bool z = x != y;
        bool result = QuantoUint128.wrap(x) != QuantoUint128.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint128Not() public {
        uint128 hundred = 100;
        QuantoUint128 x = QuantoUint128.wrap(hundred);
        QuantoUint128 result = ~x;
        uint128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testQuantoUint128NotFuzz(uint128 x) public {
        QuantoUint128 result = ~QuantoUint128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testQuantoUint128Or() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(200);
        QuantoUint128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testQuantoUint128OrFuzz(uint128 x, uint128 y) public {
        QuantoUint128 result = QuantoUint128.wrap(x) | QuantoUint128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testQuantoUint128Xor() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(200);
        QuantoUint128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testQuantoUint128XorFuzz(uint128 x, uint128 y) public {
        QuantoUint128 result = QuantoUint128.wrap(x) ^ QuantoUint128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testQuantoUint128Increment() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testQuantoUint128IncrementFuzz(uint128 x) public {
        uint128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            QuantoUint128.wrap(x).increment();
        } else {
            QuantoUint128 result = QuantoUint128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testQuantoUint128Mul() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        uint128 y = 200;
        QuantoUint128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testQuantoUint128MulFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            QuantoUint128.wrap(x).mul(y);
        } else {
            QuantoUint128 result = QuantoUint128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint128MulDecimal() public {
        QuantoUint128 x = QuantoUint128.wrap(100 ether);
        uint128 y = 200 ether;
        QuantoUint128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testQuantoUint128MulDecimalFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z :=
                div(
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
            QuantoUint128.wrap(x).mulDecimal(y);
        } else {
            QuantoUint128 result = QuantoUint128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint128MulDecimalToUSD() public {
        QuantoUint128 x = QuantoUint128.wrap(100 ether);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(200 ether);
        USDUint128 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testQuantoUint128MulDecimalToQuantoFuzz(uint128 x, uint128 y)
        public
    {
        uint128 z;
        assembly {
            z :=
                div(
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
            QuantoUint128.wrap(x).mulDecimalToUSD(USDPerQuantoUint128.wrap(y));
        } else {
            USDUint128 result = QuantoUint128.wrap(x).mulDecimalToUSD(
                USDPerQuantoUint128.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint128Div() public {
        QuantoUint128 x = QuantoUint128.wrap(500);
        uint128 y = 2;
        QuantoUint128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testQuantoUint128DivFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            QuantoUint128.wrap(x).div(y);
        } else {
            QuantoUint128 result = QuantoUint128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint128DivDecimal() public {
        QuantoUint128 x = QuantoUint128.wrap(500 ether);
        uint128 y = 2 ether;
        QuantoUint256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testQuantoUint128DivDecimalFuzz(uint128 x, uint128 y) public {
        uint256 z;
        uint256 j;
        assembly {
            j :=
                mul(
                    x,
                    0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
                )
            z := div(j, y)
        }
        bool mulOverflow = (x != 0) && (j / 1 ether != x);
        if (mulOverflow || y == 0) {
            vm.expectRevert();
            QuantoUint128.wrap(x).divDecimal(y);
        } else {
            QuantoUint256 result = QuantoUint128.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint128DivDecimalUint128() public {
        QuantoUint128 x = QuantoUint128.wrap(50 ether);
        uint128 y = 2 ether;
        QuantoUint128 result = x.divDecimalUint128(y);
        assertEq(result.unwrap(), 25 ether);
    }

    function testQuantoUint128DivDecimalUint128Fuzz(uint128 x, uint128 y)
        public
    {
        uint128 z;
        uint128 j;
        assembly {
            j :=
                mul(
                    x,
                    0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
                )
            z := div(j, y)
        }
        bool mulOverflow = (x != 0) && (j / 1 ether != x);
        if (mulOverflow || y == 0) {
            vm.expectRevert();
            QuantoUint128.wrap(x).divDecimalUint128(y);
        } else {
            QuantoUint128 result = QuantoUint128.wrap(x).divDecimalUint128(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint128ToInt() public {
        uint128 x = type(uint128).max;
        vm.expectRevert();
        QuantoUint128.wrap(x).toInt();
        x = 1;
        QuantoInt128 result = QuantoUint128.wrap(x).toInt();
        assertEq(result.unwrap(), int128(x));
    }

    function testQuantoUint128ToIntFuzz(uint128 x) public {
        if (x > uint128(type(int128).max)) {
            vm.expectRevert();
            QuantoUint128.wrap(x).toInt();
        } else {
            QuantoInt128 result = QuantoUint128.wrap(x).toInt();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testQuantoUint128ToBytes32() public {
        uint128 x = type(uint128).max;
        bytes32 result = QuantoUint128.wrap(x).toBytes32();
        assertEq(result, bytes32(uint256(x)));
    }

    function testQuantoUint128ToBytes32Fuzz(uint128 x) public {
        bytes32 result = QuantoUint128.wrap(x).toBytes32();
        assertEq(result, bytes32(uint256(x)));
    }

    function testQuantoUint128To256() public {
        uint128 x = type(uint128).min;
        QuantoUint256 result = QuantoUint128.wrap(x).to256();
        assertEq(result.unwrap(), uint256(x));
    }

    function testQuantoUint128To256Fuzz(uint128 x) public {
        QuantoUint256 result = QuantoUint128.wrap(x).to256();
        assertEq(result.unwrap(), uint256(x));
    }

    function testQuantoUint128Max128() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(200);
        QuantoUint128 result = x.max128(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testQuantoUint128Max128Fuzz(uint128 x, uint128 y) public {
        uint128 z = x < y ? y : x;
        QuantoUint128 result =
            QuantoUint128.wrap(x).max128(QuantoUint128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testQuantoUint128Min128() public {
        QuantoUint128 x = QuantoUint128.wrap(100);
        QuantoUint128 y = QuantoUint128.wrap(200);
        QuantoUint128 result = x.min128(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testQuantoUint128Min128Fuzz(uint128 x, uint128 y) public {
        uint128 z = x < y ? x : y;
        QuantoUint128 result =
            QuantoUint128.wrap(x).min128(QuantoUint128.wrap(y));
        assertEq(result.unwrap(), z);
    }
}
