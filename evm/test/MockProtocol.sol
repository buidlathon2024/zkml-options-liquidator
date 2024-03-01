// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MockProtocol} from "../src/MockProtocol.sol";

contract LiquidationTest is Test {
    MockProtocol public mockProtocol;

    function setUp() public {
        mockProtocol = new MockProtocol();
    }

    function test_Liquidate() public {
        mockProtocol.liquidate();
        // assertEq(counter.number(), 1);
    }
}
