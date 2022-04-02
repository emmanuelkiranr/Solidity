// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IfElse {
    function num(uint _x) external pure returns(uint){
        if (_x ==1 ) {
            return 1;
        }
        else if (_x == 2) {
            return 2;
        }
        return 3;        
    }

    function ternary(uint _x) external pure returns(bool){
        return _x % 2 ==0 ? true : false;
    }
}