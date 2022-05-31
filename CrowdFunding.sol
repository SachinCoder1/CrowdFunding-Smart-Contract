// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract CrowdFunding {
    address public owner; // owner of the contract
    uint256 public minimumContribution; // minimum contribution required for contributor to do crowd funding.
    uint256 public deadline; // Final Time to do crowdfunding.
    uint256 public target;
    uint256 public raisedAmount; // Keep track of the total raised amount.
    uint256 public totalContributors; // total contributors who have contributed to crowd funding.

    mapping(address => uint256) public contributors; // key value pair of contributors address and fund they have contributed.

    constructor(uint256 _target, uint256 _deadline) {
        owner = msg.sender;
        deadline = block.timestamp + _deadline;
        target = _target;
        minimumContribution = 100 wei;
    }

    // modifier for deadline;
    modifier isDeadlinePassed() {
        require(
            block.timestamp < deadline,
            "Crowd Funding deadline has passed. Please try again later."
        );
        _;
    }


    // get balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Contribute
    function contribute() public payable isDeadlinePassed {
        require(
            msg.value >= minimumContribution,
            "Minimum 100 wei is required to contribute."
        );

        if (contributors[msg.sender] == 0) {
            totalContributors++;
        }

        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    // Refund the money if the target is not fulfilled and deadline has passed.
    function refund() public isDeadlinePassed {
        require(raisedAmount < target, "You are not eligible for refund");
        require(contributors[msg.sender] > 0);

        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
    }
}
