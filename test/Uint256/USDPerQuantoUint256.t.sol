// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDUint256,
    BaseUint256,
    QuantoUint256,
    USDPerBaseUint256,
    USDPerQuantoUint256,
    USDPerQuantoInt256,
    USDPerQuantoUint128,
    USDUint256,
    InteractionsUSDPerQuantoUint256
} from "../../src/UnitTypes.sol";

contract USDPerQuantoUint256Test is Test {
    using InteractionsUSDPerQuantoUint256 for USDPerQuantoUint256;

    function setUp() public {}

    function testUSDPerQuantoUint256Add() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerQuantoUint256AddFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := add(x, y)
        }
        USDPerQuantoUint256 xW = USDPerQuantoUint256.wrap(x);
        USDPerQuantoUint256 yW = USDPerQuantoUint256.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerQuantoUint256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerQuantoUint256Sub() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerQuantoUint256SubFuzz(uint256 x, uint256 y) public {
        if (x < y) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x) - USDPerQuantoUint256.wrap(y);
        } else {
            USDPerQuantoUint256 result =
                USDPerQuantoUint256.wrap(x) - USDPerQuantoUint256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDPerQuantoUint256And() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(10); // 1010 in binary
        uint256 y = 12; // 1100 in binary
        USDPerQuantoUint256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoUint256AndFuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoUint256And2() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(10); // 1010 in binary
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(12); // 1100 in binary
        USDPerQuantoUint256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoUint256And2Fuzz(uint256 x, uint256 y) public {
        uint256 z = x & y;
        USDPerQuantoUint256 result =
            USDPerQuantoUint256.wrap(x) & USDPerQuantoUint256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoUint256Eq() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerQuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256EqFuzz(uint256 x, uint256 y) public {
        bool z = x == y;
        bool result = USDPerQuantoUint256.wrap(x) == USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Gt() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerQuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256GtFuzz(uint256 x, uint256 y) public {
        bool z = x > y;
        bool result = USDPerQuantoUint256.wrap(x) > USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Gte() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerQuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256GteFuzz(uint256 x, uint256 y) public {
        bool z = x >= y;
        bool result = USDPerQuantoUint256.wrap(x) >= USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Lt() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(50);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerQuantoUint256.wrap(49);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256LtFuzz(uint256 x, uint256 y) public {
        bool z = x < y;
        bool result = USDPerQuantoUint256.wrap(x) < USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Lte() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerQuantoUint256.wrap(99);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256LteFuzz(uint256 x, uint256 y) public {
        bool z = x <= y;
        bool result = USDPerQuantoUint256.wrap(x) <= USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Mod() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(30);
        USDPerQuantoUint256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerQuantoUint256ModFuzz(uint256 x, uint256 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x) % USDPerQuantoUint256.wrap(y);
        } else {
            uint256 z = x % y;
            USDPerQuantoUint256 result =
                USDPerQuantoUint256.wrap(x) % USDPerQuantoUint256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256Neq() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerQuantoUint256.wrap(101);
        assertTrue(result);
    }

    function testUSDPerQuantoUint256NeqFuzz(uint256 x, uint256 y) public {
        bool z = x != y;
        bool result = USDPerQuantoUint256.wrap(x) != USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Not() public {
        uint256 hundred = 100;
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(hundred);
        USDPerQuantoUint256 result = ~x;
        uint256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerQuantoUint256NotFuzz(uint256 x) public {
        USDPerQuantoUint256 result = ~USDPerQuantoUint256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerQuantoUint256Or() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerQuantoUint256OrFuzz(uint256 x, uint256 y) public {
        USDPerQuantoUint256 result =
            USDPerQuantoUint256.wrap(x) | USDPerQuantoUint256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerQuantoUint256Xor() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerQuantoUint256XorFuzz(uint256 x, uint256 y) public {
        USDPerQuantoUint256 result =
            USDPerQuantoUint256.wrap(x) ^ USDPerQuantoUint256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerQuantoUint256Increment() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerQuantoUint256IncrementFuzz(uint256 x) public {
        uint256 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).increment();
        } else {
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerQuantoUint256Mul() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        uint256 y = 200;
        USDPerQuantoUint256 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDPerQuantoUint256MulFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).mul(y);
        } else {
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256MulDecimal() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100 ether);
        uint256 y = 200 ether;
        USDPerQuantoUint256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoUint256MulDecimalFuzz(uint256 x, uint256 y)
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
            USDPerQuantoUint256.wrap(x).mulDecimal(y);
        } else {
            USDPerQuantoUint256 result =
                USDPerQuantoUint256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256MulDecimalToUSD() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100 ether);
        QuantoUint256 y = QuantoUint256.wrap(200 ether);
        USDUint256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoUint256MulDecimalToUSDFuzz(uint256 x, uint256 y)
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
            USDPerQuantoUint256.wrap(x).mulDecimalToUSD(QuantoUint256.wrap(y));
        } else {
            USDUint256 result = USDPerQuantoUint256.wrap(x).mulDecimalToUSD(
                QuantoUint256.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256MulDecimalToBase() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100 ether);
        BaseQuantoPerUSDUint256 y = BaseQuantoPerUSDUint256.wrap(200 ether);
        BaseUint256 result = x.mulDecimalToBase(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerQuantoUint256MulDecimalToBaseFuzz(uint256 x, uint256 y)
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
            USDPerQuantoUint256.wrap(x).mulDecimalToBase(
                BaseQuantoPerUSDUint256.wrap(y)
            );
        } else {
            BaseUint256 result = USDPerQuantoUint256.wrap(x).mulDecimalToBase(
                BaseQuantoPerUSDUint256.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256Div() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(500);
        uint256 y = 2;
        USDPerQuantoUint256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerQuantoUint256DivFuzz(uint256 x, uint256 y) public {
        uint256 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).div(y);
        } else {
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256DivDecimal() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(500 ether);
        uint256 y = 2 ether;
        USDPerQuantoUint256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testUSDPerQuantoUint256DivDecimalFuzz(uint256 x, uint256 y)
        public
    {
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
            USDPerQuantoUint256.wrap(x).divDecimal(y);
        } else {
            USDPerQuantoUint256 result =
                USDPerQuantoUint256.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256To128() public {
        uint256 x = type(uint256).max;
        vm.expectRevert();
        USDPerQuantoUint256.wrap(x).to128();
        x = 1;
        USDPerQuantoUint128 result = USDPerQuantoUint256.wrap(x).to128();
        assertEq(result.unwrap(), uint128(x));
    }

    function testUSDPerQuantoUint256To128Fuzz(uint256 x) public {
        if (x > uint256(type(uint128).max)) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).to128();
        } else {
            USDPerQuantoUint128 result = USDPerQuantoUint256.wrap(x).to128();
            assertEq(result.unwrap(), uint128(x));
        }
    }

    function testUSDPerQuantoUint256ToInt() public {
        uint256 x = type(uint256).max;
        vm.expectRevert();
        USDPerQuantoUint256.wrap(x).toInt();
        x = 1;
        USDPerQuantoInt256 result = USDPerQuantoUint256.wrap(x).toInt();
        assertEq(result.unwrap(), int256(x));
    }

    function testUSDPerQuantoUint256ToIntFuzz(uint256 x) public {
        if (x > uint256(type(int256).max)) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).toInt();
        } else {
            USDPerQuantoInt256 result = USDPerQuantoUint256.wrap(x).toInt();
            assertEq(result.unwrap(), int256(x));
        }
    }

    function testUSDPerQuantoUint256ToBytes32() public {
        uint256 x = type(uint256).max;
        bytes32 result = USDPerQuantoUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }

    function testUSDPerQuantoUint256ToBytes32Fuzz(uint256 x) public {
        bytes32 result = USDPerQuantoUint256.wrap(x).toBytes32();
        assertEq(result, bytes32(x));
    }

    function testUSDPerQuantoUint256Max() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 result = x.max(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testUSDPerQuantoUint256MaxFuzz(uint256 x, uint256 y) public {
        uint256 z = x < y ? y : x;
        USDPerQuantoUint256 result =
            USDPerQuantoUint256.wrap(x).max(USDPerQuantoUint256.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoUint256Min() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 result = x.min(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testUSDPerQuantoUint256MinFuzz(uint256 x, uint256 y) public {
        uint256 z = x < y ? x : y;
        USDPerQuantoUint256 result =
            USDPerQuantoUint256.wrap(x).min(USDPerQuantoUint256.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoUint256Zero() public {
        USDPerQuantoUint256 x = InteractionsUSDPerQuantoUint256.zero();
        assertEq(x.unwrap(), 0);
    }

    function testUSDPerQuantoUint256isZero() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(0);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testUSDPerQuantoUint256isZeroFuzz(uint256 x) public {
        USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }

    function testUSDPerQuantoUint256DivToDimensionless() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(500);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(2);
        uint256 result = x.divToDimensionless(y);
        assertEq(result, 250);
    }

    function testUSDPerQuantoUint256DivToDimensionlessFuzz(uint256 x, uint256 y)
        public
    {
        uint256 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).divToDimensionless(
                USDPerQuantoUint256.wrap(y)
            );
        } else {
            uint256 result = USDPerQuantoUint256.wrap(x).divToDimensionless(
                USDPerQuantoUint256.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoUint256DivDecimalToDimensionless() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(500 ether);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(2 ether);
        uint256 result = x.divDecimalToDimensionless(y);
        assertEq(result, 250 ether);
    }

    function testUSDPerQuantoUint256DivDecimalToDimensionlessFuzz(
        uint256 x,
        uint256 y
    ) public {
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
            USDPerQuantoUint256.wrap(x).divDecimalToDimensionless(
                USDPerQuantoUint256.wrap(y)
            );
        } else {
            uint256 result = USDPerQuantoUint256.wrap(x)
                .divDecimalToDimensionless(USDPerQuantoUint256.wrap(y));
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoUint256CeilDivide() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(10);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(3);
        uint256 result = x.ceilDivide(y);
        assertEq(result, 4);
    }

    function testUSDPerQuantoUint256CeilDivideFuzz(uint256 x, uint256 y)
        public
    {
        uint256 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).ceilDivide(USDPerQuantoUint256.wrap(y));
        } else {
            if (!(x % y == 0)) {
                z = z + 1;
            }
            uint256 result = USDPerQuantoUint256.wrap(x).ceilDivide(
                USDPerQuantoUint256.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerQuantoUint256GreaterThanZero() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        bool result = x.greaterThanZero();
        assertTrue(result);
        x = USDPerQuantoUint256.wrap(0);
        result = x.greaterThanZero();
        assertFalse(result);
    }

    function testUSDPerQuantoUint256GreaterThanZeroFuzz(uint256 x) public {
        bool z = x > 0;
        bool result = USDPerQuantoUint256.wrap(x).greaterThanZero();
        assertEq(result, z);
    }
}
