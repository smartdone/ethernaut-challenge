// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Reentrance.sol";
import "../src/ReentranceAttack.sol";


contract ReentranceTest is Test{
    function testReentrance() public {
        Reentrance r = new Reentrance();
        ReentranceAttack ra = new ReentranceAttack(address(r));

        payable(address(r)).transfer(10 ether);

        console.log(address(r).balance);
        ra.attack{value: 1 ether}(address(ra));

        console.log(address(r).balance);
    }
}