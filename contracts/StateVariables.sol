// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* There are 3 types of variables in solidity
    Local, State and Global*/
contract StateVariables {
    /* State variables are variables that store data to blockchain
    these are declared inside a contract but outside a function*/
    uint256 public myUint = 123;

    // function foo() external {
    //     uint boo = 456;
    // }
    /* variables declared inside a fn are local variables and they exist 
    inside the fn, only while the fn is executing after that the variable is gone */
}
