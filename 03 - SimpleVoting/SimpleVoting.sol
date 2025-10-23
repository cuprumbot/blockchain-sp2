// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {
    mapping(string => uint) public votes;
    mapping(address => bool) public hasVoted;

    event Voted(address voter, string option);

    function vote(string memory option) public {
        require(!hasVoted[msg.sender], "You have already voted");
        
        votes[option]++;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, option);
    }

    function getVotes(string memory option) public view returns (uint) {
        return votes[option];
    }
}
