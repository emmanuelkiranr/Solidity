// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Counter {
    int public count = 0; /*since uint doesn't support negative 
    values, so if we try decrement first once contract is deployed 
    it gives error. so make count as int */
    function increment() external {
        count += 1;
    }
    function decrement() external {
        count -= 1;
    }  
}