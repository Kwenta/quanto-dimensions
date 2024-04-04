// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {
    BaseInt128,
    BaseInt256,
    BaseUint128,
    BaseUint256,
    InteractionsBaseInt128,
    USDInt128,
    USDPerBaseInt128
} from "../../../src/UnitTypes.sol";

contract BaseInt128Handler is Test {
    using InteractionsBaseInt128 for BaseInt128;

    function add(BaseInt128 x, BaseInt128 y) public view returns (BaseInt128) {
        return x + y;
    }

    function to256(BaseInt128 value) public view returns (BaseInt256) {
        return value.to256();
    }

    function toUint(BaseInt128 value) public view returns (BaseUint128) {
        return value.toUint();
    }

    function mulDecimalToUSD(BaseInt128 value, USDPerBaseInt128 y)
        public
        view
        returns (USDInt128)
    {
        return value.mulDecimalToUSD(y);
    }

    function divDecimal(BaseInt128 value, int128 y)
        public
        view
        returns (BaseInt256)
    {
        return value.divDecimal(y);
    }

    function abs(BaseInt128 value) public view returns (BaseUint256) {
        return value.abs();
    }

    function abs128(BaseInt128 value) public view returns (BaseUint128) {
        return value.abs128();
    }
}

contract Handler is Test {
    // @custom:todo can be private?
    BaseInt128Handler public baseInt128Handler;

    mapping(bytes32 => uint256) public calls;

    modifier countCall(bytes32 key) {
        calls[key]++;
        _;
    }

    // @custom:todo look deeper into this
    constructor(BaseInt128Handler _baseInt128Handler) {
        baseInt128Handler = _baseInt128Handler;
    }

    function add(uint256 actorSeed, int128 x, int128 y)
        public
        countCall("add")
    {
        baseInt128Handler.add(BaseInt128.wrap(x), BaseInt128.wrap(y));
    }

    function callSummary() external view {
        console.log("Call summary:");
        console.log("-------------------");
        console.log("deposit", calls["deposit"]);
        console.log("withdraw", calls["withdraw"]);
        console.log("sendFallback", calls["sendFallback"]);
        console.log("approve", calls["approve"]);
        console.log("transfer", calls["transfer"]);
        console.log("transferFrom", calls["transferFrom"]);
        console.log("forcePush", calls["forcePush"]);
        console.log("-------------------");

        console.log("Zero withdrawals:", 0);
        console.log("Zero transferFroms:", 0);
        console.log("Zero transfers:", 0);
    }
}
