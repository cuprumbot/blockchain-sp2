// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    int public numberData;
    string public stringData;

    // Events to log changes
    event NumberChanged(int oldValue, int newValue);
    event StringChanged(string oldValue, string newValue);

    // Function to update the integer
    function setNumber(int _number) public {
        int old = numberData;
        numberData = _number;
        emit NumberChanged(old, _number);
    }

    // Function to update the string
    function setString(string memory _string) public {
        string memory old = stringData;
        stringData = _string;
        emit StringChanged(old, _string);
    }
}
