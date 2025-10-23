// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OptionsVoting {
    struct Option {
        string name;
        uint voteCount;
    }

    Option[] public options;
    mapping(address => bool) public hasVoted;
    address public owner;

    event Voted(address voter, string option);

    // Set the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Add a new voting option (only owner)
    function addOption(string memory _name) public {
        require(msg.sender == owner, "Only the owner can add options");
        options.push(Option(_name, 0));
    }

    // Vote for an option by its index
    function vote(uint _index) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(_index < options.length, "Invalid option index");

        options[_index].voteCount++;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, options[_index].name);
    }

    // Get total number of options
    function getOptionCount() public view returns (uint) {
        return options.length;
    }

    // Get an option's details by index
    function getOption(uint _index) public view returns (string memory, uint) {
        require(_index < options.length, "Invalid option index");
        Option memory o = options[_index];
        return (o.name, o.voteCount);
    }
}
