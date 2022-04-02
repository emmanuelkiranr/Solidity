// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
/* Both are read-only Functions, View fn reads data that's from the blockchain (ie from
    State and Global variables) whereas pure fn do not read anything from blockchain (it reads the 
    Local variables) */
contract ViewAndPoreFunctions {
    uint public num; 

    /* Since this fn doesnt modify the variable or write anything to the blockchain so its a 
    read only fn. And since it reads the "State" variable num, this is a view fn */
    function viewFunc() external view returns(uint) {
        return num;
    }
    /* Since this fn doesnt modify the variable or write anything to the blockchain so its a 
    read only fn. And since it doesn't read any data from the blockchain like state variables or other
    data from the blockchain. Therefore this is a pure fn */
    function pureFunc() external pure returns(uint) {
        return 1;
    }
    function addTwoNum(uint x) external view returns(uint) {
        return num + x; // since value of num is read from blockchain, this is a view fn
    }

    function addTwoNum(uint x, uint y) external pure returns(uint) {
        return x + y; 
        // since this fn does not read data from state variable, smart contract or blockchain, therefore this is a pure fn
    }

}