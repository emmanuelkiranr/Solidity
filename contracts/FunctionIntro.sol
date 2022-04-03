// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FunctionIntro {
    // input values are passed during compile time
    // uint public a = 15;
    // uint public b = 25;

    // function addTwoNumber() public view returns(uint) {
    //     uint sum = a + b;
    //     return sum;
    // }

    // input values are passed during run time
    function addTwoNumber(uint256 a, uint256 b)
        external
        pure
        returns (uint256)
    {
        uint256 sum = a + b;
        return sum;
    }

    function subTwoNumber(int256 a, int256 b) external pure returns (int256) {
        return a - b;
    }
    /*external means when we deploy the contract we'll be able to call this function
    pure means this is a read-only fn it does not write data to blockchain*/
}
