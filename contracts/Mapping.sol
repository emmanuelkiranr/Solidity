// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Mapping - like a dictionary in python - it allows for efficient lookup
// How to declare a mapping (simple and nested)
// Set, get, delete elt from mapping
contract Mapping {
    /* To find David is present in an array 
        ["alice", "bob", "charlie"] to find David is included in the array
        normally - iterate each element and see if its equal to David
        mapping - ["alice: true", "bob: true", "charlie: true"] we can find with just one lookup
        In this mapping we know alice is present, bob is present, charlie is present, but David is not
        */
    // simple mapping - mapping(key_type => value_type) visiblity_modifier mapping_name;
    mapping(address => uint256) public balances; // this mapping represent balance of each address. If we have a address we can easily lookup the balance of the address

    // Nested mapping
    mapping(address => mapping(address => bool)) public isFriend; // This mapping represent whether an address is a friend with another address

    // Mapping from an address to another mapping of address and finally to boolean

    // Set
    // set a key to a certain value in a mapping using balances
    function examples() external {
        balances[msg.sender] = 123; // say balances of msg.sender
        // Syntax to get value stored in a mapping is similar to how we access an array

        // to get balance of msg.sender stored in balances
        // uint256 bal = balances[msg.sender];

        // We can also get balances of mapping that we havent set yet.
        // uint256 bal2 = balances[address(1)]; // 0 default value of uint. we are able to access the value stored in balalnces of address(1)

        // Update a mapping
        balances[msg.sender] = 456;
        balances[msg.sender] += 456; // 123 + 456 = 579

        // Delete - clear value stored in mapping
        delete balances[msg.sender]; // delete <place you want to delete>  - value will be reset
        // 0 default value of uint

        // set msg.sender is a friend of this contract
        isFriend[msg.sender][address(this)] = true;
    }
}
