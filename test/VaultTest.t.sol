// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Vault.sol";

contract VaultTest is Test {
    function setUp() public {
    }

    function testVault() public {        
        bytes32 initPassword = 0x1234567890123456789012345678901234567890123456789012345678901234;
        Vault v = new Vault(initPassword);

        // read storage
        bytes32 storagePosition = bytes32(uint256(0x1));
        bytes32 value = vm.load(address(v), storagePosition);
        emit log_bytes32(value);

        v.unlock(value);

        require(v.locked() == false, "Vault should be unlocked");

    }
}