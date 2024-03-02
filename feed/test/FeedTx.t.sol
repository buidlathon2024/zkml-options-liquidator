// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {FeedTx} from "../src/FeedTx.sol";

contract FeedTxTest is Test {
    FeedTx public feedTx;

    function setUp() public {
        feedTx = new FeedTx();
    }

    function test_FeedPrice() public {
    }
}
