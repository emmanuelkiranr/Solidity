// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract LocalVariable {
    uint256 public i;
    bool public b;
    address public myAddress;

    function foo() external {
        // These variables will be gone after fn finishes excecution
        uint256 x = 123;
        bool f = false;
        x += 456;
        f = true;

        // These variables value will be updated when the function is called
        i = 123;
        b = true;
        myAddress = address(1);
    }
}
