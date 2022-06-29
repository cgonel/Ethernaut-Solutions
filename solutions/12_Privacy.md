# In the Console

1. Get `data[2]`: `await web3.eth.getStorageAt(contract.address,5)`
2. Unlock the contract: `await contract.unlock("0xe39b42f8347d5139c7e9367d3d162f57")`

## Why?

Since all state variables are accessible, we locate the storage slot of `data[2]`. Each slot can take up 32 bytes. Since ID is 32 bytes, locked and ID each occupy a slot. Since the following uint are under 32 bytes, they are all packed into a single slot. Then, each data element takes up a slot since they're each 32 bytes. `Data[2]` is located at the fifth slot.

To make the key match the `require` check, we only use the first 16 bytes of `data[2]`.
