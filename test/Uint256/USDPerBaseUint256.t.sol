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

contract USDPerBaseUint256Test is Test {
    function setUp() public {}

    function testUSDPerBaseUint256Add() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(200);
        USDPerBaseUint256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerBaseUint256AddFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := add(x, y)
        }
        USDPerBaseUint256 xW = USDPerBaseUint256.wrap(x);
        USDPerBaseUint256 yW = USDPerBaseUint256.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerBaseUint256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerBaseUint256Sub() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(200);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerBaseUint256SubFuzz(uint256 x, uint256 y) public {
        if (x < y) {
            vm.expectRevert();
            USDPerBaseUint256.wrap(x) - USDPerBaseUint256.wrap(y);
        } else {
            USDPerBaseUint256 result =
                USDPerBaseUint256.wrap(x) - USDPerBaseUint256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDPerBaseUint256And() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(10); // 1010 in binary
        uint256 y = 12; // 1100 in binary
        USDPerBaseUint256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerBaseUint256AndFuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        USDPerBaseUint256 result = USDPerBaseUint256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseUint256And2() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(10); // 1010 in binary
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(12); // 1100 in binary
        USDPerBaseUint256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerBaseUint256And2Fuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        USDPerBaseUint256 result =
            USDPerBaseUint256.wrap(x) & USDPerBaseUint256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseUint256Eq() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerBaseUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseUint256EqFuzz(uint256 x, uint256 y) public {
        bool z = x == y;
        bool result = USDPerBaseUint256.wrap(x) == USDPerBaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint256Gt() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerBaseUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseUint256GtFuzz(uint256 x, uint256 y) public {
        bool z = x > y;
        bool result = USDPerBaseUint256.wrap(x) > USDPerBaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint256Gte() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerBaseUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseUint256GteFuzz(uint256 x, uint256 y) public {
        bool z = x >= y;
        bool result = USDPerBaseUint256.wrap(x) >= USDPerBaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint256Lt() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(50);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerBaseUint256.wrap(49);
        assertFalse(result);
    }

    function testUSDPerBaseUint256LtFuzz(uint256 x, uint256 y) public {
        bool z = x < y;
        bool result = USDPerBaseUint256.wrap(x) < USDPerBaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint256Lte() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerBaseUint256.wrap(99);
        assertFalse(result);
    }

    function testUSDPerBaseUint256LteFuzz(uint256 x, uint256 y) public {
        bool z = x <= y;
        bool result = USDPerBaseUint256.wrap(x) <= USDPerBaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint256Mod() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(30);
        USDPerBaseUint256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerBaseUint256ModFuzz(uint256 x, uint256 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerBaseUint256.wrap(x) % USDPerBaseUint256.wrap(y);
        } else {
            uint256 z = x % y;
            USDPerBaseUint256 result =
                USDPerBaseUint256.wrap(x) % USDPerBaseUint256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint256Neq() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerBaseUint256.wrap(101);
        assertTrue(result);
    }

    function testUSDPerBaseUint256NeqFuzz(uint256 x, uint256 y) public {
        bool z = x != y;
        bool result = USDPerBaseUint256.wrap(x) != USDPerBaseUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint256Not() public {
        uint256 hundred = 100;
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(hundred);
        USDPerBaseUint256 result = ~x;
        uint256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerBaseUint256NotFuzz(uint256 x) public {
        USDPerBaseUint256 result = ~USDPerBaseUint256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerBaseUint256Or() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(200);
        USDPerBaseUint256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerBaseUint256OrFuzz(uint256 x, uint256 y) public {
        USDPerBaseUint256 result =
            USDPerBaseUint256.wrap(x) | USDPerBaseUint256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerBaseUint256Xor() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 y = USDPerBaseUint256.wrap(200);
        USDPerBaseUint256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerBaseUint256XorFuzz(uint256 x, uint256 y) public {
        USDPerBaseUint256 result =
            USDPerBaseUint256.wrap(x) ^ USDPerBaseUint256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerBaseUint256Increment() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        USDPerBaseUint256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerBaseUint256IncrementFuzz(uint256 x) public {
        uint256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerBaseUint256.wrap(x).increment();
        } else {
            USDPerBaseUint256 result = USDPerBaseUint256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerBaseUint256Mul() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100);
        uint256 y = 200;
        USDPerBaseUint256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDPerBaseUint256MulFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerBaseUint256.wrap(x).mul(y);
        } else {
            USDPerBaseUint256 result = USDPerBaseUint256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint256MulDecimal() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100 ether);
        uint256 y = 200 ether;
        USDPerBaseUint256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseUint256MulDecimalFuzz(uint256 x, uint256 y) public {
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
            USDPerBaseUint256.wrap(x).mulDecimal(y);
        } else {
            USDPerBaseUint256 result = USDPerBaseUint256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint256MulDecimalToUSD() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100 ether);
        BaseUint256 y = BaseUint256.wrap(200 ether);
        USDUint256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseUint256MulDecimalToUSDFuzz(uint256 x, uint256 y)
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
            USDPerBaseUint256.wrap(x).mulDecimalToUSD(BaseUint256.wrap(y));
        } else {
            USDUint256 result =
                USDPerBaseUint256.wrap(x).mulDecimalToUSD(BaseUint256.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint256MulDecimalToQuanto() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(100 ether);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(200 ether);
        QuantoUint256 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseUint256MulDecimalToQuantoFuzz(uint256 x, uint256 y)
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
            USDPerBaseUint256.wrap(x).mulDecimalToQuanto(
                BaseQuantoPerUSDUint256.wrap(y)
            );
        } else {
            QuantoUint256 result = USDPerBaseUint256.wrap(x).mulDecimalToQuanto(
                BaseQuantoPerUSDUint256.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint256Div() public {
        USDPerBaseUint256 x = USDPerBaseUint256.wrap(500);
        uint256 y = 2;
        USDPerBaseUint256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerBaseUint256DivFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerBaseUint256.wrap(x).div(y);
        } else {
            USDPerBaseUint256 result = USDPerBaseUint256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint256ToBytes32() public {
        uint256 x = type(uint256).max;
        bytes32 result = USDPerBaseUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }

    function testUSDPerBaseUint256ToBytes32Fuzz(uint256 x) public {
        bytes32 result = USDPerBaseUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }
}
