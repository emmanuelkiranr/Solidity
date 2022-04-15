// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// State variables
// Global variables
// fn modifiers
// Fns
// Error handling

// Application to claim ownership of the contract
/**This contract will have a owner[who deploys this contract, only the owner
will be able to set a new owner and there are fns only the owner can call] */
contract Ownable {
    // Declaring global variable owner
    address public owner;

    // Initializing the owner to the caller who deployed this contract
    constructor() {
        owner = msg.sender;
    }

    // Creating a Fn modifier for a fn to set a new owner, that can be called only by the owner

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Invalid address [0x0000...]");
        owner = _newOwner;
    }

    function onlyOwnerCanCall() external onlyOwner {
        // code
    }

    function anyOneCanCall() external {
        // code
    }
}
