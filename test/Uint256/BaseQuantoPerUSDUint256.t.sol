// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDUint256,
    BaseUint256,
    QuantoUint256,
    USDPerBaseUint256,
    USDPerQuantoUint256,
    USDUint256
} from "../../src/UnitTypes.sol";

contract BaseQuantoPerUSDUint256Test is Test {
    function setUp() public {}

    function testBaseQuantoPerUSDUint256Add() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(200);
        BaseQuantoPerUSDUint256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseQuantoPerUSDUint256AddFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := add(x, y)
        }
        BaseQuantoPerUSDUint256 xW = BaseQuantoPerUSDUint256.wrap(x);
        BaseQuantoPerUSDUint256 yW = BaseQuantoPerUSDUint256.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseQuantoPerUSDUint256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testBaseQuantoPerUSDUint256Sub() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(200);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testBaseQuantoPerUSDUint256SubFuzz(uint256 x, uint256 y) public {
        if (x < y) {
            vm.expectRevert();
            BaseQuantoPerUSDUint256.wrap(x) - BaseQuantoPerUSDUint256.wrap(y);
        } else {
            BaseQuantoPerUSDUint256 result = BaseQuantoPerUSDUint256.wrap(x)
                - BaseQuantoPerUSDUint256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testBaseQuantoPerUSDUint256And() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(10); // 1010 in binary
        uint256 y = 12; // 1100 in binary
        BaseQuantoPerUSDUint256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseQuantoPerUSDUint256AndFuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        BaseQuantoPerUSDUint256 result = BaseQuantoPerUSDUint256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDUint256And2() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(10); // 1010 in binary
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(12); // 1100 in binary
        BaseQuantoPerUSDUint256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseQuantoPerUSDUint256And2Fuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        BaseQuantoPerUSDUint256 result =
            BaseQuantoPerUSDUint256.wrap(x) & BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseQuantoPerUSDUint256Eq() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == BaseQuantoPerUSDUint256.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint256EqFuzz(uint256 x, uint256 y) public {
        bool z = x == y;
        bool result =
            BaseQuantoPerUSDUint256.wrap(x) == BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint256Gt() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > BaseQuantoPerUSDUint256.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint256GtFuzz(uint256 x, uint256 y) public {
        bool z = x > y;
        bool result =
            BaseQuantoPerUSDUint256.wrap(x) > BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint256Gte() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= BaseQuantoPerUSDUint256.wrap(101);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint256GteFuzz(uint256 x, uint256 y) public {
        bool z = x >= y;
        bool result =
            BaseQuantoPerUSDUint256.wrap(x) >= BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint256Lt() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(50);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < BaseQuantoPerUSDUint256.wrap(49);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint256LtFuzz(uint256 x, uint256 y) public {
        bool z = x < y;
        bool result =
            BaseQuantoPerUSDUint256.wrap(x) < BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint256Lte() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= BaseQuantoPerUSDUint256.wrap(99);
        assertFalse(result);
    }

    function testBaseQuantoPerUSDUint256LteFuzz(uint256 x, uint256 y) public {
        bool z = x <= y;
        bool result =
            BaseQuantoPerUSDUint256.wrap(x) <= BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint256Mod() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(30);
        BaseQuantoPerUSDUint256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testBaseQuantoPerUSDUint256ModFuzz(uint256 x, uint256 y) public {
        if (y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDUint256.wrap(x) % BaseQuantoPerUSDUint256.wrap(y);
        } else {
            uint256 z = x % y;
            BaseQuantoPerUSDUint256 result = BaseQuantoPerUSDUint256.wrap(x)
                % BaseQuantoPerUSDUint256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint256Neq() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != BaseQuantoPerUSDUint256.wrap(101);
        assertTrue(result);
    }

    function testBaseQuantoPerUSDUint256NeqFuzz(uint256 x, uint256 y) public {
        bool z = x != y;
        bool result =
            BaseQuantoPerUSDUint256.wrap(x) != BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseQuantoPerUSDUint256Not() public {
        uint256 hundred = 100;
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(hundred);
        BaseQuantoPerUSDUint256 result = ~x;
        uint256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testBaseQuantoPerUSDUint256NotFuzz(uint256 x) public {
        BaseQuantoPerUSDUint256 result = ~BaseQuantoPerUSDUint256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testBaseQuantoPerUSDUint256Or() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(200);
        BaseQuantoPerUSDUint256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testBaseQuantoPerUSDUint256OrFuzz(uint256 x, uint256 y) public {
        BaseQuantoPerUSDUint256 result =
            BaseQuantoPerUSDUint256.wrap(x) | BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testBaseQuantoPerUSDUint256Xor() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(200);
        BaseQuantoPerUSDUint256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testBaseQuantoPerUSDUint256XorFuzz(uint256 x, uint256 y) public {
        BaseQuantoPerUSDUint256 result =
            BaseQuantoPerUSDUint256.wrap(x) ^ BaseQuantoPerUSDUint256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testBaseQuantoPerUSDUint256Increment() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        BaseQuantoPerUSDUint256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseQuantoPerUSDUint256IncrementFuzz(uint256 x) public {
        uint256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseQuantoPerUSDUint256.wrap(x).increment();
        } else {
            BaseQuantoPerUSDUint256 result =
                BaseQuantoPerUSDUint256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseQuantoPerUSDUint256Mul() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100);
        uint256 y = 200;
        BaseQuantoPerUSDUint256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testBaseQuantoPerUSDUint256MulFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            BaseQuantoPerUSDUint256.wrap(x).mul(y);
        } else {
            BaseQuantoPerUSDUint256 result =
                BaseQuantoPerUSDUint256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint256MulDecimal() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100 ether);
        uint256 y = 200 ether;
        BaseQuantoPerUSDUint256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDUint256MulDecimalFuzz(uint256 x, uint256 y)
        public
    {
        uint256 z;
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
            BaseQuantoPerUSDUint256.wrap(x).mulDecimal(y);
        } else {
            BaseQuantoPerUSDUint256 result =
                BaseQuantoPerUSDUint256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint256MulDecimalToQuanto() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100 ether);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(200 ether);
        QuantoUint256 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDUint256MulDecimalToQuantoFuzz(
        uint256 x,
        uint256 y
    ) public {
        uint256 z;
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
            BaseQuantoPerUSDUint256.wrap(x).mulDecimalToQuanto(
                USDPerBaseUint256.wrap(y)
            );
        } else {
            QuantoUint256 result = BaseQuantoPerUSDUint256.wrap(x)
                .mulDecimalToQuanto(USDPerBaseUint256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint256MulDecimalToBase() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(100 ether);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200 ether);
        BaseUint256 result = x.mulDecimalToBase(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseQuantoPerUSDUint256MulDecimalToBaseFuzz(
        uint256 x,
        uint256 y
    ) public {
        uint256 z;
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
            BaseQuantoPerUSDUint256.wrap(x * 1 ether).mulDecimalToBase(
                USDPerQuantoUint256.wrap(y * 1 ether)
            );
        } else {
            BaseUint256 result = BaseQuantoPerUSDUint256.wrap(x)
                .mulDecimalToBase(USDPerQuantoUint256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint256Div() public {
        BaseQuantoPerUSDUint256 x = BaseQuantoPerUSDUint256.wrap(500);
        uint256 y = 2;
        BaseQuantoPerUSDUint256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testBaseQuantoPerUSDUint256DivFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            BaseQuantoPerUSDUint256.wrap(x).div(y);
        } else {
            BaseQuantoPerUSDUint256 result =
                BaseQuantoPerUSDUint256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseQuantoPerUSDUint256ToBytes32() public {
        uint256 x = type(uint256).max;
        bytes32 result = BaseQuantoPerUSDUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }

    function testBaseQuantoPerUSDUint256ToBytes32Fuzz(uint256 x) public {
        bytes32 result = BaseQuantoPerUSDUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }
}
