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
        payable(deployer).transfer(50000);
        
        King k = new King{value: 10000}();
        KingAttack ka  = new KingAttack();
        ka.getKing{value: 20000}(address(k));
        console.log("king: %s", k._king());
    }

    receive() external payable {
    }
}