// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Telephone.sol";
import "../src/TelephoneAttack.sol";

contract TelephoneTest is Test{
    function setUp() public {

    }

    function testAttack() public {
        Telephone t = new Telephone();
        TelephoneAttack ta = new TelephoneAttack();
        address attacker = address(0x123);
        require(t.owner() != attacker);
        ta.changeOwner(address(t), attacker);
        require(t.owner() == attacker);
    }
}