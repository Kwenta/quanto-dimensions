// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseQuantoPerUSDUint128,
    BaseUint128,
    QuantoUint128,
    USDPerBaseUint128,
    USDPerBaseInt128,
    USDPerBaseUint256,
    USDPerQuantoUint128,
    USDUint128,
    InteractionsUSDPerBaseUint128
} from "../../src/UnitTypes.sol";

contract USDPerBaseUint128Test is Test {
    using InteractionsUSDPerBaseUint128 for USDPerBaseUint128;

    function setUp() public {}

    function testUSDPerBaseUint128Add() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200);
        USDPerBaseUint128 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerBaseUint128AddFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := add(x, y)
        }
        USDPerBaseUint128 xW = USDPerBaseUint128.wrap(x);
        USDPerBaseUint128 yW = USDPerBaseUint128.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerBaseUint128 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerBaseUint128Sub() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(200);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerBaseUint128SubFuzz(uint128 x, uint128 y) public {
        if (x < y) {
            vm.expectRevert();
            USDPerBaseUint128.wrap(x) - USDPerBaseUint128.wrap(y);
        } else {
            USDPerBaseUint128 result =
                USDPerBaseUint128.wrap(x) - USDPerBaseUint128.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDPerBaseUint128And() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(10); // 1010 in binary
        uint128 y = 12; // 1100 in binary
        USDPerBaseUint128 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerBaseUint128AndFuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        USDPerBaseUint128 result = USDPerBaseUint128.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseUint128And2() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(10); // 1010 in binary
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(12); // 1100 in binary
        USDPerBaseUint128 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerBaseUint128And2Fuzz(uint128 x, uint128 y) public {
        uint128 z = x & y;
        USDPerBaseUint128 result =
            USDPerBaseUint128.wrap(x) & USDPerBaseUint128.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseUint128Eq() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerBaseUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseUint128EqFuzz(uint128 x, uint128 y) public {
        bool z = x == y;
        bool result = USDPerBaseUint128.wrap(x) == USDPerBaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint128Gt() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerBaseUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseUint128GtFuzz(uint128 x, uint128 y) public {
        bool z = x > y;
        bool result = USDPerBaseUint128.wrap(x) > USDPerBaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint128Gte() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerBaseUint128.wrap(101);
        assertFalse(result);
    }

    function testUSDPerBaseUint128GteFuzz(uint128 x, uint128 y) public {
        bool z = x >= y;
        bool result = USDPerBaseUint128.wrap(x) >= USDPerBaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint128Lt() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(50);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerBaseUint128.wrap(49);
        assertFalse(result);
    }

    function testUSDPerBaseUint128LtFuzz(uint128 x, uint128 y) public {
        bool z = x < y;
        bool result = USDPerBaseUint128.wrap(x) < USDPerBaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint128Lte() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerBaseUint128.wrap(99);
        assertFalse(result);
    }

    function testUSDPerBaseUint128LteFuzz(uint128 x, uint128 y) public {
        bool z = x <= y;
        bool result = USDPerBaseUint128.wrap(x) <= USDPerBaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint128Mod() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(30);
        USDPerBaseUint128 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerBaseUint128ModFuzz(uint128 x, uint128 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerBaseUint128.wrap(x) % USDPerBaseUint128.wrap(y);
        } else {
            uint128 z = x % y;
            USDPerBaseUint128 result =
                USDPerBaseUint128.wrap(x) % USDPerBaseUint128.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint128Neq() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerBaseUint128.wrap(101);
        assertTrue(result);
    }

    function testUSDPerBaseUint128NeqFuzz(uint128 x, uint128 y) public {
        bool z = x != y;
        bool result = USDPerBaseUint128.wrap(x) != USDPerBaseUint128.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerBaseUint128Not() public {
        uint128 hundred = 100;
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(hundred);
        USDPerBaseUint128 result = ~x;
        uint128 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerBaseUint128NotFuzz(uint128 x) public {
        USDPerBaseUint128 result = ~USDPerBaseUint128.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerBaseUint128Or() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200);
        USDPerBaseUint128 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerBaseUint128OrFuzz(uint128 x, uint128 y) public {
        USDPerBaseUint128 result =
            USDPerBaseUint128.wrap(x) | USDPerBaseUint128.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerBaseUint128Xor() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200);
        USDPerBaseUint128 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerBaseUint128XorFuzz(uint128 x, uint128 y) public {
        USDPerBaseUint128 result =
            USDPerBaseUint128.wrap(x) ^ USDPerBaseUint128.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerBaseUint128Increment() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerBaseUint128IncrementFuzz(uint128 x) public {
        uint128 z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerBaseUint128.wrap(x).increment();
        } else {
            USDPerBaseUint128 result = USDPerBaseUint128.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerBaseUint128Mul() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        uint128 y = 200;
        USDPerBaseUint128 result = x.mul(y);
        assertEq(result.unwrap(), 20_000);
    }

    function testUSDPerBaseUint128MulFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerBaseUint128.wrap(x).mul(y);
        } else {
            USDPerBaseUint128 result = USDPerBaseUint128.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint128MulDecimal() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100 ether);
        uint128 y = 200 ether;
        USDPerBaseUint128 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseUint128MulDecimalFuzz(uint128 x, uint128 y) public {
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
            USDPerBaseUint128.wrap(x).mulDecimal(y);
        } else {
            USDPerBaseUint128 result = USDPerBaseUint128.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint128MulDecimalToUSD() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100 ether);
        BaseUint128 y = BaseUint128.wrap(200 ether);
        USDUint128 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseUint128MulDecimalToUSDFuzz(uint128 x, uint128 y)
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
            USDPerBaseUint128.wrap(x).mulDecimalToUSD(BaseUint128.wrap(y));
        } else {
            USDUint128 result =
                USDPerBaseUint128.wrap(x).mulDecimalToUSD(BaseUint128.wrap(y));
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint128MulDecimalToQuanto() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100 ether);
        BaseQuantoPerUSDUint128 y = BaseQuantoPerUSDUint128.wrap(200 ether);
        QuantoUint128 result = x.mulDecimalToQuanto(y);
        assertEq(result.unwrap(), 20_000 ether);
    }

    function testUSDPerBaseUint128MulDecimalToQuantoFuzz(uint128 x, uint128 y)
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
            USDPerBaseUint128.wrap(x).mulDecimalToQuanto(
                BaseQuantoPerUSDUint128.wrap(y)
            );
        } else {
            QuantoUint128 result = USDPerBaseUint128.wrap(x).mulDecimalToQuanto(
                BaseQuantoPerUSDUint128.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint128Div() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(500);
        uint128 y = 2;
        USDPerBaseUint128 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerBaseUint128DivFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerBaseUint128.wrap(x).div(y);
        } else {
            USDPerBaseUint128 result = USDPerBaseUint128.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint128DivDecimal() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(500 ether);
        uint128 y = 2 ether;
        USDPerBaseUint256 result = x.divDecimal(y);
        assertEq(result.unwrap(), 250 ether);
    }

    function testUSDPerBaseUint128DivDecimalFuzz(uint128 x, uint128 y) public {
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
            USDPerBaseUint128.wrap(x).divDecimal(y);
        } else {
            USDPerBaseUint256 result = USDPerBaseUint128.wrap(x).divDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint128DivDecimalUint128() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(50 ether);
        uint128 y = 2 ether;
        USDPerBaseUint128 result = x.divDecimalUint128(y);
        assertEq(result.unwrap(), 25 ether);
    }

    function testUSDPerBaseUint128DivDecimalUint128Fuzz(uint128 x, uint128 y)
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
            USDPerBaseUint128.wrap(x).divDecimalUint128(y);
        } else {
            USDPerBaseUint128 result =
                USDPerBaseUint128.wrap(x).divDecimalUint128(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerBaseUint128ToInt() public {
        uint128 x = type(uint128).max;
        vm.expectRevert();
        USDPerBaseUint128.wrap(x).toInt();
        x = 1;
        USDPerBaseInt128 result = USDPerBaseUint128.wrap(x).toInt();
        assertEq(result.unwrap(), int128(x));
    }

    function testUSDPerBaseUint128ToIntFuzz(uint128 x) public {
        if (x > uint128(type(int128).max)) {
            vm.expectRevert();
            USDPerBaseUint128.wrap(x).toInt();
        } else {
            USDPerBaseInt128 result = USDPerBaseUint128.wrap(x).toInt();
            assertEq(result.unwrap(), int128(x));
        }
    }

    function testUSDPerBaseUint128ToBytes32() public {
        uint128 x = type(uint128).max;
        bytes32 result = USDPerBaseUint128.wrap(x).toBytes32();
        assertEq(result, bytes32(uint256(x)));
    }

    function testUSDPerBaseUint128ToBytes32Fuzz(uint128 x) public {
        bytes32 result = USDPerBaseUint128.wrap(x).toBytes32();
        assertEq(result, bytes32(uint256(x)));
    }

    function testUSDPerBaseUint128To256() public {
        uint128 x = type(uint128).min;
        USDPerBaseUint256 result = USDPerBaseUint128.wrap(x).to256();
        assertEq(result.unwrap(), uint256(x));
    }

    function testUSDPerBaseUint128To256Fuzz(uint128 x) public {
        USDPerBaseUint256 result = USDPerBaseUint128.wrap(x).to256();
        assertEq(result.unwrap(), uint256(x));
    }

    function testUSDPerBaseUint128Max128() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200);
        USDPerBaseUint128 result = x.max128(y);
        assertEq(result.unwrap(), y.unwrap());
    }

    function testUSDPerBaseUint128Max128Fuzz(uint128 x, uint128 y) public {
        uint128 z = x < y ? y : x;
        USDPerBaseUint128 result =
            USDPerBaseUint128.wrap(x).max128(USDPerBaseUint128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseUint128Min128() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200);
        USDPerBaseUint128 result = x.min128(y);
        assertEq(result.unwrap(), x.unwrap());
    }

    function testUSDPerBaseUint128Min128Fuzz(uint128 x, uint128 y) public {
        uint128 z = x < y ? x : y;
        USDPerBaseUint128 result =
            USDPerBaseUint128.wrap(x).min128(USDPerBaseUint128.wrap(y));
        assertEq(result.unwrap(), z);
    }

    function testUSDPerBaseUint128Max() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200);
        USDPerBaseUint256 result = x.max(y);
        assertEq(result.unwrap(), uint256(y.unwrap()));
    }

    function testUSDPerBaseUint128MaxFuzz(uint128 x, uint128 y) public {
        uint128 z = x < y ? y : x;
        USDPerBaseUint256 result =
            USDPerBaseUint128.wrap(x).max(USDPerBaseUint128.wrap(y));
        assertEq(result.unwrap(), uint256(z));
    }

    function testUSDPerBaseUint128Min() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(200);
        USDPerBaseUint256 result = x.min(y);
        assertEq(result.unwrap(), uint256(x.unwrap()));
    }

    function testUSDPerBaseUint128MinFuzz(uint128 x, uint128 y) public {
        uint128 z = x < y ? x : y;
        USDPerBaseUint256 result =
            USDPerBaseUint128.wrap(x).min(USDPerBaseUint128.wrap(y));
        assertEq(result.unwrap(), uint256(z));
    }

    function testUSDPerBaseUint128Zero() public {
        USDPerBaseUint128 x = InteractionsUSDPerBaseUint128.zero();
        assertEq(x.unwrap(), 0);
    }

    function testUSDPerBaseUint128isZero() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(0);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(100);
        bool result = x.isZero();
        assertTrue(result);
        result = y.isZero();
        assertFalse(result);
    }

    function testUSDPerBaseUint128isZeroFuzz(uint128 x) public {
        USDPerBaseUint128 result = USDPerBaseUint128.wrap(x);
        bool y = result.isZero();
        bool z = (x == 0);
        assertTrue((y && z) || !(y || z));
    }

    function testUSDPerBaseUint128DivToDimensionless() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(500);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(2);
        uint128 result = x.divToDimensionless(y);
        assertEq(result, 250);
    }

    function testUSDPerBaseUint128DivToDimensionlessFuzz(uint128 x, uint128 y)
        public
    {
        uint128 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerBaseUint128.wrap(x).divToDimensionless(
                USDPerBaseUint128.wrap(y)
            );
        } else {
            uint128 result = USDPerBaseUint128.wrap(x).divToDimensionless(
                USDPerBaseUint128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerBaseUint128DivDecimalToDimensionless() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(500 ether);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(2 ether);
        uint256 result = x.divDecimalToDimensionless(y);
        assertEq(result, 250 ether);
    }

    function testUSDPerBaseUint128DivDecimalToDimensionlessFuzz(
        uint128 x,
        uint128 y
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
            USDPerBaseUint128.wrap(x).divDecimalToDimensionless(
                USDPerBaseUint128.wrap(y)
            );
        } else {
            uint256 result = USDPerBaseUint128.wrap(x).divDecimalToDimensionless(
                USDPerBaseUint128.wrap(y)
            );
            assertEq(result, z);
        }
    }

    function testUSDPerBaseUint128CeilDivide() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(10);
        USDPerBaseUint128 y = USDPerBaseUint128.wrap(3);
        uint128 result = x.ceilDivide(y);
        assertEq(result, 4);
    }

    function testUSDPerBaseUint128CeilDivideFuzz(uint128 x, uint128 y) public {
        uint128 z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerBaseUint128.wrap(x).ceilDivide(USDPerBaseUint128.wrap(y));
        } else {
            if (!(x % y == 0)) {
                z = z + 1;
            }
            uint128 result =
                USDPerBaseUint128.wrap(x).ceilDivide(USDPerBaseUint128.wrap(y));
            assertEq(result, z);
        }
    }

    function testUSDPerBaseUint128GreaterThanZero() public {
        USDPerBaseUint128 x = USDPerBaseUint128.wrap(100);
        bool result = x.greaterThanZero();
        assertTrue(result);
        x = USDPerBaseUint128.wrap(0);
        result = x.greaterThanZero();
        assertFalse(result);
    }

    function testUSDPerBaseUint128GreaterThanZeroFuzz(uint128 x) public {
        bool z = x > 0;
        bool result = USDPerBaseUint128.wrap(x).greaterThanZero();
        assertEq(result, z);
    }
}
