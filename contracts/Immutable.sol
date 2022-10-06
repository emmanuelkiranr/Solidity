// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Immutable {

    // immutable variables can be initialized only when the contract is deployed and cannot be changed later

    // address public owner = msg.sender; 32816
    address public immutable owner; // 30363

    constructor() {
        owner = msg.sender;
    }
    uint count = 1;

    function addd() public {
        require(msg.sender == owner);
        count++;
    }
}