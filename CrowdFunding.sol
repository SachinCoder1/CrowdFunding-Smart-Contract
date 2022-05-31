// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract CrowdFunding {
    address public owner; // owner of the contract
    uint public minimumContribution; // minimum contribution required for contributor to do crowd funding.
    uint public deadline; // Final Time to do crowdfunding.
    uint public target;
    uint public raisedAmount; // Keep track of the total raised amount.
    uint public totalContributors; // total contributors who have contributed to crowd funding.
    
    mapping(address => uint) public contributors; // key value pair of contributors address and fund they have contributed.

    constructor(uint _target, uint _deadline){
        owner = msg.sender;
        deadline = block.timestamp + _deadline;
        target = _target;
        minimumContribution = 100 wei;
    }


    // get balance
    function getBalance() public view returns(uint) {
        return address(this).balance;   
    }

    // Contribute
    function contribute() public payable {
       require(block.timestamp < deadline, "Crowd Funding deadline has passed. Please try again later.");
       require(msg.value >= minimumContribution, "Minimum 100 wei is required to contribute.");

       if(contributors[msg.sender] == 0) {
          totalContributors++;
       }
         
       contributors[msg.sender] += msg.value;
       raisedAmount += msg.value;
       
    }

    



}