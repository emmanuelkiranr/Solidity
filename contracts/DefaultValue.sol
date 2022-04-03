// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DefaultValue {
    /* State and local variables in solidity have default values*/
    bool public b; //false
    uint256 public u; //0
    int256 public i; //0
    address public addr; //zero address, sequence of 40 zero's followed after 0x 0x0000000000000000000000000000000000000000
    bytes32 public b32; // 32 byte hexadecimal representation of 0's, sequence of 64 zero's followed after 0x  0x0000000000000000000000000000000000000000000000000000000000000000
}
