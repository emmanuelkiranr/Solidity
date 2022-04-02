// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForAndWhileLoops {
    function loops() external pure {
        for(uint i = 0; i < 10; i++) {
            // code
            // to skip certain iteration of the code
            if (i == 3) {
                continue;
                // continue means continue with the next iteration of for loop ie i = 4's iteration
            }
            // more code (this part will not be executed when i = 3)
            
            // To exit the for loop in-between (we'll finish the loop when i = 5)
            if (i == 5) {
                break;
            }
        }
    }
    function sumFor(uint _n) external pure returns(uint) {
        uint sum;
        for (uint i = 1; i <= _n; i++) {
            sum += i;
        }
        return sum;        
    }

    function sumWhile(uint _n) external pure returns(uint) {
        uint sum;
        while (_n != 0) {
            sum = sum + _n;
            _n--;
        }
        return sum;       
    }
}