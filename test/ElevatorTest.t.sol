// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Elevator.sol";

contract ElevatorTest is Test {
    bool public isLast = true;

    function setUp() public {
    }

    function testAttack() public {
        Elevator elevator = new Elevator();
        elevator.goTo(10);
        console.log("top: %s", elevator.top());
    }

    function isLastFloor(uint256) external returns (bool) {
        isLast = !isLast;
        return isLast;
    }
}