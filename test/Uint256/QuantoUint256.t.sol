// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {BaseQuantoPerUSDUint256, BaseUint256, QuantoUint256, QuantoInt256, QuantoUint128, USDPerBaseUint256, USDPerQuantoUint256, USDUint256} from "src/UnitTypes.sol";

contract QuantoUint256Test is Test {
    function setUp() public {}

    function testQuantoUint256Add() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(200);
        QuantoUint256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testQuantoUint256AddFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := add(x, y)
        }
        QuantoUint256 xW = QuantoUint256.wrap(x);
        QuantoUint256 yW = QuantoUint256.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            QuantoUint256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testQuantoUint256Sub() public {
        QuantoUint256 x = QuantoUint256.wrap(200);
        QuantoUint256 y = QuantoUint256.wrap(100);
        QuantoUint256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testQuantoUint256SubFuzz(uint256 x, uint256 y) public {
        if (x < y) {
            vm.expectRevert();
            QuantoUint256.wrap(x) - QuantoUint256.wrap(y);
        } else {
            QuantoUint256 result = QuantoUint256.wrap(x) -
                QuantoUint256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testQuantoUint256And() public {
        QuantoUint256 x = QuantoUint256.wrap(10); // 1010 in binary
        uint256 y = 12; // 1100 in binary
        QuantoUint256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testQuantoUint256AndFuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        QuantoUint256 result = QuantoUint256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testQuantoUint256And2() public {
        QuantoUint256 x = QuantoUint256.wrap(10); // 1010 in binary
        QuantoUint256 y = QuantoUint256.wrap(12); // 1100 in binary
        QuantoUint256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testQuantoUint256And2Fuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        QuantoUint256 result = QuantoUint256.wrap(x) & QuantoUint256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testQuantoUint256Eq() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == QuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testQuantoUint256EqFuzz(uint256 x, uint256 y) public {
        bool z = x == y;
        bool result = QuantoUint256.wrap(x) == QuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint256Gt() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > QuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testQuantoUint256GtFuzz(uint256 x, uint256 y) public {
        bool z = x > y;
        bool result = QuantoUint256.wrap(x) > QuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint256Gte() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= QuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testQuantoUint256GteFuzz(uint256 x, uint256 y) public {
        bool z = x >= y;
        bool result = QuantoUint256.wrap(x) >= QuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint256Lt() public {
        QuantoUint256 x = QuantoUint256.wrap(50);
        QuantoUint256 y = QuantoUint256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < QuantoUint256.wrap(49);
        assertFalse(result);
    }

    function testQuantoUint256LtFuzz(uint256 x, uint256 y) public {
        bool z = x < y;
        bool result = QuantoUint256.wrap(x) < QuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint256Lte() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= QuantoUint256.wrap(99);
        assertFalse(result);
    }

    function testQuantoUint256LteFuzz(uint256 x, uint256 y) public {
        bool z = x <= y;
        bool result = QuantoUint256.wrap(x) <= QuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint256Mod() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(30);
        QuantoUint256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testQuantoUint256ModFuzz(uint256 x, uint256 y) public {
        if (y == 0) {
            vm.expectRevert();
            QuantoUint256.wrap(x) % QuantoUint256.wrap(y);
        } else {
            uint256 z = x % y;
            QuantoUint256 result = QuantoUint256.wrap(x) %
                QuantoUint256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint256Neq() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != QuantoUint256.wrap(101);
        assertTrue(result);
    }

    function testQuantoUint256NeqFuzz(uint256 x, uint256 y) public {
        bool z = x != y;
        bool result = QuantoUint256.wrap(x) != QuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testQuantoUint256Not() public {
        uint256 hundred = 100;
        QuantoUint256 x = QuantoUint256.wrap(hundred);
        QuantoUint256 result = ~x;
        uint256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testQuantoUint256NotFuzz(uint256 x) public {
        QuantoUint256 result = ~QuantoUint256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testQuantoUint256Or() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(200);
        QuantoUint256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testQuantoUint256OrFuzz(uint256 x, uint256 y) public {
        QuantoUint256 result = QuantoUint256.wrap(x) | QuantoUint256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testQuantoUint256Xor() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 y = QuantoUint256.wrap(200);
        QuantoUint256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testQuantoUint256XorFuzz(uint256 x, uint256 y) public {
        QuantoUint256 result = QuantoUint256.wrap(x) ^ QuantoUint256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testQuantoUint256Increment() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        QuantoUint256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testQuantoUint256IncrementFuzz(uint256 x) public {
        uint256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            QuantoUint256.wrap(x).increment();
        } else {
            QuantoUint256 result = QuantoUint256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testQuantoUint256Mul() public {
        QuantoUint256 x = QuantoUint256.wrap(100);
        uint256 y = 200;
        QuantoUint256 result = x.mul(y);
        assertEq(result.unwrap(), 20000);
    }

    function testQuantoUint256MulFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            QuantoUint256.wrap(x).mul(y);
        } else {
            QuantoUint256 result = QuantoUint256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint256MulDecimal() public {
        QuantoUint256 x = QuantoUint256.wrap(100 ether);
        uint256 y = 200 ether;
        QuantoUint256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testQuantoUint256MulDecimalFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := div(
                mul(x, y),
                // 1 ether
                0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
            )
        }
        if (
            (x != 0 && y != 0) &&
            (z / y != (x / 1 ether) || z / x != (y / 1 ether))
        ) {
            vm.expectRevert();
            QuantoUint256.wrap(x).mulDecimal(y);
        } else {
            QuantoUint256 result = QuantoUint256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint256MulDecimalToUSD() public {
        QuantoUint256 x = QuantoUint256.wrap(100 ether);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200 ether);
        USDUint256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testQuantoUint256MulDecimalToQuantoFuzz(
        uint256 x,
        uint256 y
    ) public {
        uint256 z;
        assembly {
            z := div(
                mul(x, y),
                // 1 ether
                0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
            )
        }
        if (
            (x != 0 && y != 0) &&
            (z / y != (x / 1 ether) || z / x != (y / 1 ether))
        ) {
            vm.expectRevert();
            QuantoUint256.wrap(x).mulDecimalToUSD(USDPerQuantoUint256.wrap(y));
        } else {
            USDUint256 result = QuantoUint256.wrap(x).mulDecimalToUSD(
                USDPerQuantoUint256.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint256Div() public {
        QuantoUint256 x = QuantoUint256.wrap(500);
        uint256 y = 2;
        QuantoUint256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testQuantoUint256DivFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            QuantoUint256.wrap(x).div(y);
        } else {
            QuantoUint256 result = QuantoUint256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testQuantoUint256To128() public {
        uint256 x = type(uint256).max;
        vm.expectRevert();
        QuantoUint256.wrap(x).to128();
        x = 1;
        QuantoUint128 result = QuantoUint256.wrap(x).to128();
        assertEq(result.unwrap(), uint128(x));
    }

    function testQuantoUint256To128Fuzz(uint256 x) public {
        if (x > uint256(type(uint128).max)) {
            vm.expectRevert();
            QuantoUint256.wrap(x).to128();
        } else {
            QuantoUint128 result = QuantoUint256.wrap(x).to128();
            assertEq(result.unwrap(), uint128(x));
        }
    }

    function testQuantoUint256ToInt() public {
        uint256 x = type(uint256).max;
        vm.expectRevert();
        QuantoUint256.wrap(x).toInt();
        x = 1;
        QuantoInt256 result = QuantoUint256.wrap(x).toInt();
        assertEq(result.unwrap(), int256(x));
    }

    function testQuantoUint256ToIntFuzz(uint256 x) public {
        if (x > uint256(type(int256).max)) {
            vm.expectRevert();
            QuantoUint256.wrap(x).toInt();
        } else {
            QuantoInt256 result = QuantoUint256.wrap(x).toInt();
            assertEq(result.unwrap(), int256(x));
        }
    }

    function testQuantoUint256ToBytes32() public {
        uint256 x = type(uint256).max;
        bytes32 result = QuantoUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }

    function testQuantoUint256ToBytes32Fuzz(uint256 x) public {
        bytes32 result = QuantoUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }
}
