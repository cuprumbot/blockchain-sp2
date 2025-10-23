// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LogStorage {
    int public numberData;

    // Events to log changes
    event NumberChanged(int oldValue, int newValue);
    event StringLogged(string logValue);

    // Function to update the integer
    function setNumber(int _number) public {
        int old = numberData;
        numberData = _number;
        emit NumberChanged(old, _number);
    }

    // Function to update the string
    function logString(string memory _string) public {
        emit StringLogged(_string);
    }
}
