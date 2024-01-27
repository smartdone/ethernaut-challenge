// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Force.sol";
import "../src/ForceAttack.sol";

contract ForceTest is Test {
    function setUp() public {
    }

    function testForce() public {        
        Force f = new Force();
        console.log("balance before: %s", address(f).balance);
        new ForceAttack{value: 10000}(payable(address(f)));
        console.log("balance after: %s", address(f).balance);

    }
}