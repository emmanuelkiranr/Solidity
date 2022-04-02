// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constants {
    /*If a State variables value never change then its better to declare it as a constant.
    By declaring a state variable as constant, we can save gas when a function is called that uses
    that state variable*/
    address public constant MY_ADDRESS = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // 21442 gas 
    // constant state variable. Variable name in all caps as its a coding convention
    uint public constant MY_UINT = 123;
    // 21371 gas
}

contract Var {
    address public MY_ADDRESS = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 
    //23575 gas
    uint public MY_UINT = 123;
    // 23471 gas
}