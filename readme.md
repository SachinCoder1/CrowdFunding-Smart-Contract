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



