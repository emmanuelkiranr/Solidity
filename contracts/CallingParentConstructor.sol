// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract S {
    string public text;
    constructor(string memory _text) {
        text = _text;
    }
}

contract T {
    string public name;
    constructor(string memory _name) {
        name = _name;
    }
}

// order of execution - 
// S
// T
// U

contract U is S("s"), T("t") {  // If we know the constructor input value - static input
    
}

contract V is S, T { 
    constructor(string memory _text, string memory _name) S(_text) T(_name) {// Dynamically passing input values

    }
}

contract W is S("s"), T {
    constructor(string memory _name) T(_name) { // combination of static and dynamic

    }
}