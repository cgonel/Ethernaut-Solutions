# In the Console

To steal tokens: `await contract.transfer(contract.address, 1000)`

## Why?

Since the contract has no underflow/overflow protection, a number that will cause the require check to underflow can be passed as a value. It makes it possible to gain tokens by tricking the smart contract in believing that you possess the balance needed for the transfer.
