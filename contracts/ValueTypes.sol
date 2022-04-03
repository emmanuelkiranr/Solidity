// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Data types  - values and references
/* values means the data/ variable stores a value eg- boolean
    stores true or false, int stores number like -1,0,1..., address stores address,
    bytes32 will be used when we work with cryptographic hash fn in solidity called
    keccak256 
    Data types of type references don't store a value they store
    the reference to where the actual data is stored eg array is a 
    datatype of type reference, since it stores a reference of where
    the actual array elements are stored */
contract ValueType {
    bool public b = true;
    uint256 public u = 123;
    /*uint = uint256 it ranges from 0 to 2**256 - 1 (commonly used)
             uint16 ranges from 0 to 2**16 - 1
             uint8 ranges from 0 to 2**8 - 1   
             uint goes from uint8 to uint256 in steps of 8
    /*uint or unsigned integer means the number should be 
    greater or equal to zero. No negative num for uint's. Use int 
    to use negative numbers and positive*/
    int256 public i = -123;
    /* int = int256 ranges from -2**255 to 2**255 - 1
             int128 ranges from -2**127 to 2**127 - 1 */

    // To find max and min value of datatype
    int256 public minint = type(int256).min;
    int256 public maxint = type(int256).max;

    // address
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // bytes32
    bytes32 public b32 =
        0x0000000000000000000000000000000000000000000000000000000000000000; // 32 bytes
}
