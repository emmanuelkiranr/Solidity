// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Its best to use specific compiler version while deploying to main net

contract HelloWorld {
    string public myString = "Hello World!";

    // [type] [visibility modifier] [identifier]

    /* for public state variable the contract will automatically 
    create a getter fn with same name as variable name.
    since public variable we'll have read access to myString once deployed*/
}
