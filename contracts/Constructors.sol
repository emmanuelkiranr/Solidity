// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constructor {
    /* Constructors are special fns that can be called only once when the contract is deployed whereas
    normal fns can be called multiple times, constructors are mainly used to initialize state variables.
    Parameters are passed during deployment [In remix parameters to constructors are passed via with 
    deploy option]*/
    address public owner;
    uint256 public x;

    constructor(uint256 _x) {
        // write code like regular fn
        x = _x;
        owner = msg.sender; // initializing the state variable owner to the account that deployed this contract
    } // msg.sender will be the address that deployed this contract
}
