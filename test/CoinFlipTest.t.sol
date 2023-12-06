// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/CoinFlip.sol";
import "../src/CoinFlipAttack.sol";


contract CoinFlipTest is Test{
    function setUp() public {
    }

    function testCoinFlip() public {
        CoinFlip coinFlip = new CoinFlip();
        CoinFlipAttack coinFlipAttack = new CoinFlipAttack();
        
        uint256 number = block.number - 20;
        uint i = 0;
        for(i = 0; i < 10; i++) {
            vm.roll(number + i);
            bool guess = coinFlipAttack.calc();
            console.log("guess: %s", guess);
            bool result = coinFlip.flip(guess);
            require(result == true, "flip failed");
        }

        require(coinFlip.consecutiveWins() == 10, "consecutiveWins failed");
    }
}