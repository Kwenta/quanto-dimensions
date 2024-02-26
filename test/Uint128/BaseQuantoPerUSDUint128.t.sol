// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDUint128,
    BaseQuantoPerUSDInt128,
    BaseUint128,
    QuantoUint128,
    USDPerBaseUint128,
    USDPerQuantoUint128,
    USDUint128
} from "src/UnitTypes.sol";

contract BaseQuantoPerUSDUint128Test is Test {
    function setUp() public {}

    function testBaseQuantoPerUSDUint128Add() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(200);
        BaseQuantoPerUSDUint128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseQuantoPerUSDUint128AddFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := add(x, y)
        }
        BaseQuantoPerUSDUint128 xW = BaseQuantoPerUSDUint128.wrap(x);
        BaseQuantoPerUSDUint128 yW = BaseQuantoPerUSDUint128.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseQuantoPerUSDUint128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testBaseQuantoPerUSDUint128Sub() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(200);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testBaseQuantoPerUSDUint128SubFuzz(uint128 x, uint128 y) public {
        if (x < y) {
            vm.expectRevert();
            BaseQuantoPerUSDUint128.wrap(x) - BaseQuantoPerUSDUint128.wrap(y);
        } else {
            BaseQuantoPerUSDUint128 result = BaseQuantoPerUSDUint128.wrap(x)
                - BaseQuantoPerUSDUint128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testBaseQuantoPerUSDUint128And() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(10); // 1010 in binary
        uint128 y = 12; // 1100 in binary
        BaseQuantoPerUSDUint128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseQuantoPerUSDUint128AndFuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        BaseQuantoPerUSDUint128 result = BaseQuantoPerUSDUint128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDUint128And2() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(10); // 1010 in binary
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(12); // 1100 in binary
        BaseQuantoPerUSDUint128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseQuantoPerUSDUint128And2Fuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        BaseQuantoPerUSDUint128 result =
            BaseQuantoPerUSDUint128.wrap(x) & BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDUint128Eq() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == BaseQuantoPerUSDUint128.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint128EqFuzz(uint128 x, uint128 y) public {
        bool z = x == y;
        bool result =
            BaseQuantoPerUSDUint128.wrap(x) == BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint128Gt() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > BaseQuantoPerUSDUint128.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint128GtFuzz(uint128 x, uint128 y) public {
        bool z = x > y;
        bool result =
            BaseQuantoPerUSDUint128.wrap(x) > BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint128Gte() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= BaseQuantoPerUSDUint128.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint128GteFuzz(uint128 x, uint128 y) public {
        bool z = x >= y;
        bool result =
            BaseQuantoPerUSDUint128.wrap(x) >= BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint128Lt() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(50);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < BaseQuantoPerUSDUint128.wrap(49);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint128LtFuzz(uint128 x, uint128 y) public {
        bool z = x < y;
        bool result =
            BaseQuantoPerUSDUint128.wrap(x) < BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint128Lte() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= BaseQuantoPerUSDUint128.wrap(99);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint128LteFuzz(uint128 x, uint128 y) public {
        bool z = x <= y;
        bool result =
            BaseQuantoPerUSDUint128.wrap(x) <= BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint128Mod() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(30);
        BaseQuantoPerUSDUint128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testBaseQuantoPerUSDUint128ModFuzz(uint128 x, uint128 y) public {
        if (y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDUint128.wrap(x) % BaseQuantoPerUSDUint128.wrap(y);
        } else {
            uint128 z = x % y;
            BaseQuantoPerUSDUint128 result = BaseQuantoPerUSDUint128.wrap(x)
                % BaseQuantoPerUSDUint128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint128Neq() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != BaseQuantoPerUSDUint128.wrap(101);
        assertTrue(result);
    }

    function testBaseQuantoPerUSDUint128NeqFuzz(uint128 x, uint128 y) public {
        bool z = x != y;
        bool result =
            BaseQuantoPerUSDUint128.wrap(x) != BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint128Not() public {
        uint128 hundred = 100;
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(hundred);
        BaseQuantoPerUSDUint128 result = ~x;
        uint128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testBaseQuantoPerUSDUint128NotFuzz(uint128 x) public {
        BaseQuantoPerUSDUint128 result = ~BaseQuantoPerUSDUint128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testBaseQuantoPerUSDUint128Or() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(200);
        BaseQuantoPerUSDUint128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testBaseQuantoPerUSDUint128OrFuzz(uint128 x, uint128 y) public {
        BaseQuantoPerUSDUint128 result =
            BaseQuantoPerUSDUint128.wrap(x) | BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testBaseQuantoPerUSDUint128Xor() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(200);
        BaseQuantoPerUSDUint128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testBaseQuantoPerUSDUint128XorFuzz(uint128 x, uint128 y) public {
        BaseQuantoPerUSDUint128 result =
            BaseQuantoPerUSDUint128.wrap(x) ^ BaseQuantoPerUSDUint128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testBaseQuantoPerUSDUint128Increment() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        BaseQuantoPerUSDUint128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseQuantoPerUSDUint128IncrementFuzz(uint128 x) public {
        uint128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseQuantoPerUSDUint128.wrap(x).increment();
        } else {
            BaseQuantoPerUSDUint128 result =
                BaseQuantoPerUSDUint128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseQuantoPerUSDUint128Mul() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100);
        uint128 y = 200;
        BaseQuantoPerUSDUint128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testBaseQuantoPerUSDUint128MulFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            BaseQuantoPerUSDUint128.wrap(x).mul(y);
        } else {
            BaseQuantoPerUSDUint128 result =
                BaseQuantoPerUSDUint128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint128MulDecimal() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100 ether);
        uint128 y = 200 ether;
        BaseQuantoPerUSDUint128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDUint128MulDecimalFuzz(uint128 x, uint128 y)
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
            BaseQuantoPerUSDUint128.wrap(x).mulDecimal(y);
        } else {
            BaseQuantoPerUSDUint128 result =
                BaseQuantoPerUSDUint128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint128MulDecimalToQuanto() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100 ether);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200 ether);
        QuantoUint128 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDUint128MulDecimalToQuantoFuzz(
        uint128 x,
        uint128 y
    ) public {
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
            BaseQuantoPerUSDUint128.wrap(x).mulDecimalToQuanto(
                USDPerBaseUint128.wrap(y)
            );
        } else {
            QuantoUint128 result = BaseQuantoPerUSDUint128.wrap(x)
                .mulDecimalToQuanto(USDPerBaseUint128.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint128MulDecimalToBase() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(100 ether);
        USDPerQuantoUint128 y = USDPerQuantoUint128.wrap(200 ether);
        BaseUint128 result = x.mulDecimalToBase(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDUint128MulDecimalToBaseFuzz(
        uint128 x,
        uint128 y
    ) public {
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
            BaseQuantoPerUSDUint128.wrap(x * 1 ether).mulDecimalToBase(
                USDPerQuantoUint128.wrap(y * 1 ether)
            );
        } else {
            BaseUint128 result = BaseQuantoPerUSDUint128.wrap(x)
                .mulDecimalToBase(USDPerQuantoUint128.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint128Div() public {
        BaseQuantoPerUSDUint128 x = BaseQuantoPerUSDUint128.wrap(500);
        uint128 y = 2;
        BaseQuantoPerUSDUint128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testBaseQuantoPerUSDUint128DivFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDUint128.wrap(x).div(y);
        } else {
            BaseQuantoPerUSDUint128 result =
                BaseQuantoPerUSDUint128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint128ToInt() public {
        uint128 x = type(uint128).max;
        vm.expectRevert();
        BaseQuantoPerUSDUint128.wrap(x).toInt();
        x = 1;
        BaseQuantoPerUSDInt128 result = BaseQuantoPerUSDUint128.wrap(x).toInt();
        assertEq(result.unwrap(), int128(x));
    }

    function testBaseQuantoPerUSDUint128ToIntFuzz(uint128 x) public {
        if (x > uint128(type(int128).max)) {
            vm.expectRevert();
            BaseQuantoPerUSDUint128.wrap(x).toInt();
        } else {
            BaseQuantoPerUSDInt128 result =
                BaseQuantoPerUSDUint128.wrap(x).toInt();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testBaseQuantoPerUSDUint128ToBytes32() public {
        uint128 x = type(uint128).max;
        bytes32 result = BaseQuantoPerUSDUint128.wrap(x).toBytes32();
        assertEq(result, bytes32(uint256(x)));
    }

    function testBaseQuantoPerUSDUint128ToBytes32Fuzz(uint128 x) public {
        bytes32 result = BaseQuantoPerUSDUint128.wrap(x).toBytes32();
        assertEq(result, bytes32(uint256(x)));
    }
}
