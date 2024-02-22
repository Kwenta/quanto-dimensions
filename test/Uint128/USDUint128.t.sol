// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDUint128,
    BaseUint128,
    QuantoUint128,
    USDPerBaseUint128,
    USDPerQuantoUint128,
    USDUint128,
    USDUint256,
    USDInt128
} from "src/UnitTypes.sol";

contract USDUint128Test is Test {
    function setUp() public {}

    function testUSDUint128Add() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(200);
        USDUint128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDUint128AddFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := add(x, y)
        }
        USDUint128 xW = USDUint128.wrap(x);
        USDUint128 yW = USDUint128.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDUint128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDUint128Sub() public {
        USDUint128 x = USDUint128.wrap(200);
        USDUint128 y = USDUint128.wrap(100);
        USDUint128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDUint128SubFuzz(uint128 x, uint128 y) public {
        if (x < y) {
            vm.expectRevert();
            USDUint128.wrap(x) - USDUint128.wrap(y);
        } else {
            USDUint128 result = USDUint128.wrap(x) - USDUint128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDUint128And() public {
        USDUint128 x = USDUint128.wrap(10); // 1010 in binary
        uint128 y = 12; // 1100 in binary
        USDUint128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDUint128AndFuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        USDUint128 result = USDUint128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDUint128And2() public {
        USDUint128 x = USDUint128.wrap(10); // 1010 in binary
        USDUint128 y = USDUint128.wrap(12); // 1100 in binary
        USDUint128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDUint128And2Fuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        USDUint128 result = USDUint128.wrap(x) & USDUint128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDUint128Eq() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDUint128EqFuzz(uint128 x, uint128 y) public {
        bool z = x == y;
        bool result = USDUint128.wrap(x) == USDUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint128Gt() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDUint128GtFuzz(uint128 x, uint128 y) public {
        bool z = x > y;
        bool result = USDUint128.wrap(x) > USDUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint128Gte() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDUint128GteFuzz(uint128 x, uint128 y) public {
        bool z = x >= y;
        bool result = USDUint128.wrap(x) >= USDUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint128Lt() public {
        USDUint128 x = USDUint128.wrap(50);
        USDUint128 y = USDUint128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDUint128.wrap(49);
        assertFalse(result);
    }

    function testUSDUint128LtFuzz(uint128 x, uint128 y) public {
        bool z = x < y;
        bool result = USDUint128.wrap(x) < USDUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint128Lte() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDUint128.wrap(99);
        assertFalse(result);
    }

    function testUSDUint128LteFuzz(uint128 x, uint128 y) public {
        bool z = x <= y;
        bool result = USDUint128.wrap(x) <= USDUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint128Mod() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(30);
        USDUint128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDUint128ModFuzz(uint128 x, uint128 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDUint128.wrap(x) % USDUint128.wrap(y);
        } else {
            uint128 z = x % y;
            USDUint128 result = USDUint128.wrap(x) % USDUint128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDUint128Neq() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDUint128.wrap(101);
        assertTrue(result);
    }

    function testUSDUint128NeqFuzz(uint128 x, uint128 y) public {
        bool z = x != y;
        bool result = USDUint128.wrap(x) != USDUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDUint128Not() public {
        uint128 hundred = 100;
        USDUint128 x = USDUint128.wrap(hundred);
        USDUint128 result = ~x;
        uint128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDUint128NotFuzz(uint128 x) public {
        USDUint128 result = ~USDUint128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDUint128Or() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(200);
        USDUint128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDUint128OrFuzz(uint128 x, uint128 y) public {
        USDUint128 result = USDUint128.wrap(x) | USDUint128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDUint128Xor() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 y = USDUint128.wrap(200);
        USDUint128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDUint128XorFuzz(uint128 x, uint128 y) public {
        USDUint128 result = USDUint128.wrap(x) ^ USDUint128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDUint128Increment() public {
        USDUint128 x = USDUint128.wrap(100);
        USDUint128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDUint128IncrementFuzz(uint128 x) public {
        uint128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDUint128.wrap(x).increment();
        } else {
            USDUint128 result = USDUint128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDUint128Mul() public {
        USDUint128 x = USDUint128.wrap(100);
        uint128 y = 200;
        USDUint128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDUint128MulFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDUint128.wrap(x).mul(y);
        } else {
            USDUint128 result = USDUint128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDUint128MulDecimal() public {
        USDUint128 x = USDUint128.wrap(100 ether);
        uint128 y = 200 ether;
        USDUint128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDUint128MulDecimalFuzz(uint128 x, uint128 y) public {
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
            USDUint128.wrap(x).mulDecimal(y);
        } else {
            USDUint128 result = USDUint128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDUint128Div() public {
        USDUint128 x = USDUint128.wrap(500);
        uint128 y = 2;
        USDUint128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDUint128DivFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDUint128.wrap(x).div(y);
        } else {
            USDUint128 result = USDUint128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDUint128To256() public {
        uint128 x = type(uint128).max;
        USDUint256 result = USDUint128.wrap(x).to256();
        assertEq(result.unwrap(), uint256(x));
    }

    function testUSDUint128To256Fuzz(uint128 x) public {
        USDUint256 result = USDUint128.wrap(x).to256();
        assertEq(result.unwrap(), uint256(x));
    }

    function testUSDUint128ToInt() public {
        uint128 x = type(uint128).max;
        vm.expectRevert();
        USDUint128.wrap(x).toInt();
        x = 1;
        USDInt128 result = USDUint128.wrap(x).toInt();
        assertEq(result.unwrap(), int128(x));
    }

    function testUSDUint128ToIntFuzz(uint128 x) public {
        if (x > uint128(type(int128).max)) {
            vm.expectRevert();
            USDUint128.wrap(x).toInt();
        } else {
            USDInt128 result = USDUint128.wrap(x).toInt();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testUSDUint128ToBytes32() public {
        uint128 x = type(uint128).max;
        bytes32 result = USDUint128.wrap(x).toBytes32();
        assertEq(result, bytes32(uint256(x)));
    }

    function testUSDUint128ToBytes32Fuzz(uint128 x) public {
        bytes32 result = USDUint128.wrap(x).toBytes32();
        assertEq(result, bytes32(uint256(x)));
    }
}
