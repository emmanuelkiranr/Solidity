// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Function modifier - allows to modify code before and / or after function
contract FunctionModifier {
    // Basic
    bool public paused;
    uint256 public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    /**The functions inc() and dec() can be called only if the condition is met ie the contract is 
    not paused. 
    Here the require is repeated in multiple functions. So we create a fn modifier for the require 
    statement requiring that the fn can only be called if the contract is not paused.
    
    modifier <name of fn modifier> {
        // condition
        _; // underscore tells solidity to call the actual fn that this fn modifier wraps
    }
    
    After this, declare the fn modifier inside the fn signature to which the modifier is to be added */

    // Inputs

    modifier cap(uint256 _i) {
        require(_i <= 100, "i >100");
        _;
    }

    function incBy(uint256 _i) external whenNotPaused cap(_i) {
        count += _i;
    }

    /* Sandwich - fn modifier that sandwiches a fn, means some code will be executed inside the fn modifier, the actual fn will be called 
    and afterwards it will execute more code inside the fn modifier. Also we can add more checks in between these codes.*/

    modifier sandwich() {
        // code - 1. executes some code
        count += 5;
        _; // calls the main fn
        // more code - executes more code afterwards
        count *= 3;
    }

    function foo() external sandwich {
        count += 1;
    }
    /* When fn foo is called it first executes the fn modifier sandwich, so it updates count by 5. Then call the main fn which it is attached to
    in this case its foo() so it updates the count by 1 [now count = 6]. After foo() is done executing control is gonna execute more code in the
    fn modifier sandwich, so count is multiplied by 2 [now count = 12] */
}
