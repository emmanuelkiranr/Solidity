// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Fallback {

    event Log(string fun, address adr, uint value, bytes data);
    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
        // now we/other contract can send this contract eth directly cause we declared a fallback with payable
    }
    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
        // only executed if msg.data is empty
    }
}

// If someone calls fn foo(), since it is not present in our contract the fallback() will be executed