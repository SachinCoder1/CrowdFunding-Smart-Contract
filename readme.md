# Crowd Funding Smart Contract in Solidity


# Things used in the project :-

1. Solidity programming language.
2. Ethereum.
3. Remix IDE.


# Architecture of the project :-

**Global Variables** :- 
1. owner -> owner of the contract
2. minimumContribution -> minimum contribution required for contributor to do crowd funding.
3. deadline -> Final Time to do crowdfunding.
4. target -> crowd funding target (How much funds is targeted to be completed in the deadline);
5. raisedAmount -> Keep track of the total raised amount.
6. totalContributors -> total contributors who have contributed to crowd funding.
7. numRequests -> keep track of requets done by owner.
8. contributors -> key value pair of contributor to keep track of their address and funds they have contributed.
9. allRequests -> All requests done by owner for tranfering money to a perticular address for a perticular reason.


**Functions**  :- 
1. getBalance
2. contribute
3. refund
4. createRequest
5. voteRequest
6. Make payment



# How It works :-

1. Initially using constructor the owner addres, deadline, target, and minimum contribution to be done by contributor is saved in state variable.

2. The contributor contributes using contribute() function in crowd funding. If the deadline is not over and the funds are meeting the minimum requirements then the address and value is stored in state variable mapping.

3. If the target is not met and contributor wants the refund then he can refund the money by using refund() function.

4. The owner can request the all contributors to withdraw the funds by uing createRequest() function and tell the description, address to which the funds will be sent, and the total funds which to be sent.  

5. All the contributors vote using voteRequest() function and if the votes are more than the 50% of contributors then using the makePayment() function the money is sent to the perticular address which owner has provided. 