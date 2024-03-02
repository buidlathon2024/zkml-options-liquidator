// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MockProtocol} from "../src/MockProtocol.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        console.log("Creator (owner): ", msg.sender);
        MockProtocol mockProtocol = new MockProtocol();
        console.log("MockProtocol: ", address(mockProtocol));
    }
}
