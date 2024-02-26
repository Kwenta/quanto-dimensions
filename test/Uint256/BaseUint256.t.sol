// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDUint256,
    BaseUint256,
    BaseInt256,
    BaseUint128,
    QuantoUint256,
    USDPerBaseUint256,
    USDPerQuantoUint256,
    USDUint256
} from "../../src/UnitTypes.sol";

contract BaseUint256Test is Test {
    function setUp() public {}

    function testBaseUint256Add() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(200);
        BaseUint256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testBaseUint256AddFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := add(x, y)
        }
        BaseUint256 xW = BaseUint256.wrap(x);
        BaseUint256 yW = BaseUint256.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            BaseUint256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testBaseUint256Sub() public {
        BaseUint256 x = BaseUint256.wrap(200);
        BaseUint256 y = BaseUint256.wrap(100);
        BaseUint256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testBaseUint256SubFuzz(uint256 x, uint256 y) public {
        if (x < y) {
            vm.expectRevert();
            BaseUint256.wrap(x) - BaseUint256.wrap(y);
        } else {
            BaseUint256 result = BaseUint256.wrap(x) - BaseUint256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testBaseUint256And() public {
        BaseUint256 x = BaseUint256.wrap(10); // 1010 in binary
        uint256 y = 12; // 1100 in binary
        BaseUint256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseUint256AndFuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        BaseUint256 result = BaseUint256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseUint256And2() public {
        BaseUint256 x = BaseUint256.wrap(10); // 1010 in binary
        BaseUint256 y = BaseUint256.wrap(12); // 1100 in binary
        BaseUint256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testBaseUint256And2Fuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        BaseUint256 result = BaseUint256.wrap(x) & BaseUint256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testBaseUint256Eq() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == BaseUint256.wrap(101);
        assertFalse(result);
    }

    function testBaseUint256EqFuzz(uint256 x, uint256 y) public {
        bool z = x == y;
        bool result = BaseUint256.wrap(x) == BaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint256Gt() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > BaseUint256.wrap(101);
        assertFalse(result);
    }

    function testBaseUint256GtFuzz(uint256 x, uint256 y) public {
        bool z = x > y;
        bool result = BaseUint256.wrap(x) > BaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint256Gte() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= BaseUint256.wrap(101);
        assertFalse(result);
    }

    function testBaseUint256GteFuzz(uint256 x, uint256 y) public {
        bool z = x >= y;
        bool result = BaseUint256.wrap(x) >= BaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint256Lt() public {
        BaseUint256 x = BaseUint256.wrap(50);
        BaseUint256 y = BaseUint256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < BaseUint256.wrap(49);
        assertFalse(result);
    }

    function testBaseUint256LtFuzz(uint256 x, uint256 y) public {
        bool z = x < y;
        bool result = BaseUint256.wrap(x) < BaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint256Lte() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= BaseUint256.wrap(99);
        assertFalse(result);
    }

    function testBaseUint256LteFuzz(uint256 x, uint256 y) public {
        bool z = x <= y;
        bool result = BaseUint256.wrap(x) <= BaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint256Mod() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(30);
        BaseUint256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testBaseUint256ModFuzz(uint256 x, uint256 y) public {
        if (y == 0) {
            vm.expectRevert();
            BaseUint256.wrap(x) % BaseUint256.wrap(y);
        } else {
            uint256 z = x % y;
            BaseUint256 result = BaseUint256.wrap(x) % BaseUint256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint256Neq() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != BaseUint256.wrap(101);
        assertTrue(result);
    }

    function testBaseUint256NeqFuzz(uint256 x, uint256 y) public {
        bool z = x != y;
        bool result = BaseUint256.wrap(x) != BaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testBaseUint256Not() public {
        uint256 hundred = 100;
        BaseUint256 x = BaseUint256.wrap(hundred);
        BaseUint256 result = ~x;
        uint256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testBaseUint256NotFuzz(uint256 x) public {
        BaseUint256 result = ~BaseUint256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testBaseUint256Or() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(200);
        BaseUint256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testBaseUint256OrFuzz(uint256 x, uint256 y) public {
        BaseUint256 result = BaseUint256.wrap(x) | BaseUint256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testBaseUint256Xor() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 y = BaseUint256.wrap(200);
        BaseUint256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testBaseUint256XorFuzz(uint256 x, uint256 y) public {
        BaseUint256 result = BaseUint256.wrap(x) ^ BaseUint256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testBaseUint256Increment() public {
        BaseUint256 x = BaseUint256.wrap(100);
        BaseUint256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testBaseUint256IncrementFuzz(uint256 x) public {
        uint256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            BaseUint256.wrap(x).increment();
        } else {
            BaseUint256 result = BaseUint256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testBaseUint256Mul() public {
        BaseUint256 x = BaseUint256.wrap(100);
        uint256 y = 200;
        BaseUint256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testBaseUint256MulFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            BaseUint256.wrap(x).mul(y);
        } else {
            BaseUint256 result = BaseUint256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint256MulDecimal() public {
        BaseUint256 x = BaseUint256.wrap(100 ether);
        uint256 y = 200 ether;
        BaseUint256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseUint256MulDecimalFuzz(uint256 x, uint256 y) public {
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
            BaseUint256.wrap(x).mulDecimal(y);
        } else {
            BaseUint256 result = BaseUint256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint256MulDecimalToUSD() public {
        BaseUint256 x = BaseUint256.wrap(100 ether);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(200 ether);
        USDUint256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testBaseUint256MulDecimalToQuantoFuzz(uint256 x, uint256 y)
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
            BaseUint256.wrap(x).mulDecimalToUSD(USDPerBaseUint256.wrap(y));
        } else {
            USDUint256 result =
                BaseUint256.wrap(x).mulDecimalToUSD(USDPerBaseUint256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint256Div() public {
        BaseUint256 x = BaseUint256.wrap(500);
        uint256 y = 2;
        BaseUint256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testBaseUint256DivFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            BaseUint256.wrap(x).div(y);
        } else {
            BaseUint256 result = BaseUint256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testBaseUint256To128() public {
        uint256 x = type(uint256).max;
        vm.expectRevert();
        BaseUint256.wrap(x).to128();
        x = 1;
        BaseUint128 result = BaseUint256.wrap(x).to128();
        assertEq(result.unwrap(), uint128(x));
    }

    function testBaseUint256To128Fuzz(uint256 x) public {
        if (x > uint256(type(uint128).max)) {
            vm.expectRevert();
            BaseUint256.wrap(x).to128();
        } else {
            BaseUint128 result = BaseUint256.wrap(x).to128();
            assertEq(result.unwrap(), uint128(x));
        }
    }

    function testBaseUint256ToInt() public {
        uint256 x = type(uint256).max;
        vm.expectRevert();
        BaseUint256.wrap(x).toInt();
        x = 1;
        BaseInt256 result = BaseUint256.wrap(x).toInt();
        assertEq(result.unwrap(), int256(x));
    }

    function testBaseUint256ToIntFuzz(uint256 x) public {
        if (x > uint256(type(int256).max)) {
            vm.expectRevert();
            BaseUint256.wrap(x).toInt();
        } else {
            BaseInt256 result = BaseUint256.wrap(x).toInt();
            assertEq(result.unwrap(), int256(x));
        }
    }

    function testBaseUint256ToBytes32() public {
        uint256 x = type(uint256).max;
        bytes32 result = BaseUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }

    function testBaseUint256ToBytes32Fuzz(uint256 x) public {
        bytes32 result = BaseUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }
}
