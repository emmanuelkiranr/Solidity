// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Fns in solidity can
// Return multiple outputs
// Named outputs
// Destructuring Assignments - To capture the output in another fn

contract FunctionOutputs {
    function returnMany() public pure returns (uint256, bool) {
        return (1, true);
    }

    /** public cause we can use this fn in other fns inside this contract
    returns(return types 1, return type 2) inside the body we match the 
    return type. 
    Here we know the return type, but we dont know what they represent so 
    name the outputs [similar to naming variable].
    
    when we have a named output we can implicitly return values, so the 
    return statement can be ommitted. Just simply assign the value to the 
    named outputs inside the fn body - This will save little gas as there is
    1 less copy to do */

    function named() public pure returns (uint256 x, bool b) {
        return (1, true);
    }

    function assigned() public pure returns (uint256 x, bool b) {
        x = 1;
        b = true;
    }

    // Destructuring assignment

    function destructuringAssignments() public pure {
        // (uint256 x, bool b) = returnMany();
        // (, bool _b) = returnMany();
        /**  Inside destructuringAssignments() we call returnMany fn which returns a uint and bool. To capture the ops as a variable inside here.
        To capture multiple outputs and assign variables to it we start with paranthesis (declare the datatype and name of the variables to be 
        captured) and assign this to the fn returnMany()
        If we need just one output out of many outputs then we ommit the unwanted variables, but keep the comma*/
    }
}
