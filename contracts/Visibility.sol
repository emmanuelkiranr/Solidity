// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract VisibiilityBase {
    uint private x = 5;
    uint public y = 3;
    uint internal z = 1;

    function privateFunc() private pure returns(uint) {}
    function internalFunc() internal pure returns(uint) {}
    function publicFunc() public pure returns(uint) {}
    function externalFunc() external pure returns(uint) {}

    function example() external view {
        x + y + z;

        privateFunc();
        internalFunc();
        publicFunc();

        // externalFunc() - gives error so use below method if needed
        // this.externalFunc(); - gas inefficient so don't use 
        // instead of directly calling this is making an external call into this contract
        // it is used to call other contract but in this case since the came contract is called it is gas inefficient
    }

}

contract VisibilityChild is VisibiilityBase {
    function example2() external view {
        y + z;

        internalFunc();
        publicFunc();
        
    }
}