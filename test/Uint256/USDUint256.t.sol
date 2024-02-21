// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {BaseQuantoPerUSDUint256, BaseUint256, QuantoUint256, USDPerBaseUint256, USDPerQuantoUint256, USDUint256} from "src/UnitTypes.sol";

contract USDUint256Test is Test {
    function setUp() public {}

    function testUSDUint256Add() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(200);
        USDUint256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDUint256AddFuzz(uint256 x, uint256 y) public {
        uint z;
        assembly {
            z := add(x, y)
        }
        USDUint256 xW = USDUint256.wrap(x);
        USDUint256 yW = USDUint256.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDUint256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDUint256Sub() public {
        USDUint256 x = USDUint256.wrap(200);
        USDUint256 y = USDUint256.wrap(100);
        USDUint256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDUint256SubFuzz(uint256 x, uint256 y) public {
        if (x < y) {
            vm.expectRevert();
            USDUint256.wrap(x) - USDUint256.wrap(y);
        } else {
            USDUint256 result = USDUint256.wrap(x) - USDUint256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDUint256And() public {
        USDUint256 x = USDUint256.wrap(10); // 1010 in binary
        uint256 y = 12; // 1100 in binary
        USDUint256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDUint256AndFuzz(uint256 x, uint256 y) public {
        uint z = x & y;
        USDUint256 result = USDUint256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDUint256And2() public {
        USDUint256 x = USDUint256.wrap(10); // 1010 in binary
        USDUint256 y = USDUint256.wrap(12); // 1100 in binary
        USDUint256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDUint256And2Fuzz(uint256 x, uint256 y) public {
        uint z = x & y;
        USDUint256 result = USDUint256.wrap(x) & USDUint256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDUint256Eq() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDUint256EqFuzz(uint256 x, uint256 y) public {
        bool z = x == y;
        bool result = USDUint256.wrap(x) == USDUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint256Gt() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDUint256GtFuzz(uint256 x, uint256 y) public {
        bool z = x > y;
        bool result = USDUint256.wrap(x) > USDUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint256Gte() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDUint256GteFuzz(uint256 x, uint256 y) public {
        bool z = x >= y;
        bool result = USDUint256.wrap(x) >= USDUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint256Lt() public {
        USDUint256 x = USDUint256.wrap(50);
        USDUint256 y = USDUint256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDUint256.wrap(49);
        assertFalse(result);
    }

    function testUSDUint256LtFuzz(uint256 x, uint256 y) public {
        bool z = x < y;
        bool result = USDUint256.wrap(x) < USDUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint256Lte() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDUint256.wrap(99);
        assertFalse(result);
    }

    function testUSDUint256LteFuzz(uint256 x, uint256 y) public {
        bool z = x <= y;
        bool result = USDUint256.wrap(x) <= USDUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint256Mod() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(30);
        USDUint256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDUint256ModFuzz(uint256 x, uint256 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDUint256.wrap(x) % USDUint256.wrap(y);
        } else {
            uint z = x % y;
            USDUint256 result = USDUint256.wrap(x) % USDUint256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDUint256Neq() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDUint256.wrap(101);
        assertTrue(result);
    }

    function testUSDUint256NeqFuzz(uint256 x, uint256 y) public {
        bool z = x != y;
        bool result = USDUint256.wrap(x) != USDUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint256Not() public {
        uint hundred = 100;
        USDUint256 x = USDUint256.wrap(hundred);
        USDUint256 result = ~x;
        uint256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDUint256NotFuzz(uint256 x) public {
        USDUint256 result = ~USDUint256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDUint256Or() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(200);
        USDUint256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDUint256OrFuzz(uint256 x, uint256 y) public {
        USDUint256 result = USDUint256.wrap(x) | USDUint256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDUint256Xor() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 y = USDUint256.wrap(200);
        USDUint256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDUint256XorFuzz(uint256 x, uint256 y) public {
        USDUint256 result = USDUint256.wrap(x) ^ USDUint256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDUint256Increment() public {
        USDUint256 x = USDUint256.wrap(100);
        USDUint256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDUint256IncrementFuzz(uint256 x) public {
        uint z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDUint256.wrap(x).increment();
        } else {
            USDUint256 result = USDUint256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDUint256Mul() public {
        USDUint256 x = USDUint256.wrap(100);
        uint256 y = 200;
        USDUint256 result = x.mul(y);
        assertEq(result.unwrap(), 20000);
    }

    function testUSDUint256MulFuzz(uint256 x, uint256 y) public {
        uint z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDUint256.wrap(x).mul(y);
        } else {
            USDUint256 result = USDUint256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDUint256MulDecimal() public {
        USDUint256 x = USDUint256.wrap(100 ether);
        uint256 y = 200 ether;
        USDUint256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testUSDUint256MulDecimalFuzz(uint256 x, uint256 y) public {
        uint z;
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
            USDUint256.wrap(x).mulDecimal(y);
        } else {
            USDUint256 result = USDUint256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDUint256Div() public {
        USDUint256 x = USDUint256.wrap(500);
        uint256 y = 2;
        USDUint256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDUint256DivFuzz(uint256 x, uint256 y) public {
        uint z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDUint256.wrap(x).div(y);
        } else {
            USDUint256 result = USDUint256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }
}
